package android.support.v4.provider;

import android.content.ContentUris;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ProviderInfo;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build.VERSION;
import android.os.CancellationSignal;
import android.os.Handler;
import android.provider.BaseColumns;
import android.support.annotation.GuardedBy;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.annotation.VisibleForTesting;
import android.support.v4.content.res.FontResourcesParserCompat;
import android.support.v4.content.res.ResourcesCompat.FontCallback;
import android.support.v4.graphics.TypefaceCompat;
import android.support.v4.graphics.TypefaceCompatUtil;
import android.support.v4.provider.SelfDestructiveThread.ReplyCallback;
import android.support.v4.util.LruCache;
import android.support.v4.util.Preconditions;
import android.support.v4.util.SimpleArrayMap;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

public class FontsContractCompat {
    private static final int BACKGROUND_THREAD_KEEP_ALIVE_DURATION_MS = 10000;
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static final String PARCEL_FONT_RESULTS = "font_results";
    @RestrictTo({Scope.LIBRARY_GROUP})
    static final int RESULT_CODE_PROVIDER_NOT_FOUND = -1;
    @RestrictTo({Scope.LIBRARY_GROUP})
    static final int RESULT_CODE_WRONG_CERTIFICATES = -2;
    private static final String TAG = "FontsContractCompat";
    private static final SelfDestructiveThread sBackgroundThread = new SelfDestructiveThread("fonts", 10, 10000);
    private static final Comparator<byte[]> sByteArrayComparator = new Comparator<byte[]>() {
        public int compare(byte[] bArr, byte[] bArr2) {
            if (bArr.length != bArr2.length) {
                return bArr.length - bArr2.length;
            }
            for (int i = 0; i < bArr.length; i++) {
                if (bArr[i] != bArr2[i]) {
                    return bArr[i] - bArr2[i];
                }
            }
            return 0;
        }
    };
    static final Object sLock = new Object();
    @GuardedBy("sLock")
    static final SimpleArrayMap<String, ArrayList<ReplyCallback<TypefaceResult>>> sPendingReplies = new SimpleArrayMap<>();
    static final LruCache<String, Typeface> sTypefaceCache = new LruCache<>(16);

    public static final class Columns implements BaseColumns {
        public static final String FILE_ID = "file_id";
        public static final String ITALIC = "font_italic";
        public static final String RESULT_CODE = "result_code";
        public static final int RESULT_CODE_FONT_NOT_FOUND = 1;
        public static final int RESULT_CODE_FONT_UNAVAILABLE = 2;
        public static final int RESULT_CODE_MALFORMED_QUERY = 3;
        public static final int RESULT_CODE_OK = 0;
        public static final String TTC_INDEX = "font_ttc_index";
        public static final String VARIATION_SETTINGS = "font_variation_settings";
        public static final String WEIGHT = "font_weight";
    }

    public static class FontFamilyResult {
        public static final int STATUS_OK = 0;
        public static final int STATUS_UNEXPECTED_DATA_PROVIDED = 2;
        public static final int STATUS_WRONG_CERTIFICATES = 1;
        private final FontInfo[] mFonts;
        private final int mStatusCode;

        @RestrictTo({Scope.LIBRARY_GROUP})
        public FontFamilyResult(int i, @Nullable FontInfo[] fontInfoArr) {
            this.mStatusCode = i;
            this.mFonts = fontInfoArr;
        }

        public FontInfo[] getFonts() {
            return this.mFonts;
        }

        public int getStatusCode() {
            return this.mStatusCode;
        }
    }

    public static class FontInfo {
        private final boolean mItalic;
        private final int mResultCode;
        private final int mTtcIndex;
        private final Uri mUri;
        private final int mWeight;

        @RestrictTo({Scope.LIBRARY_GROUP})
        public FontInfo(@NonNull Uri uri, @IntRange(from = 0) int i, @IntRange(from = 1, to = 1000) int i2, boolean z, int i3) {
            this.mUri = (Uri) Preconditions.checkNotNull(uri);
            this.mTtcIndex = i;
            this.mWeight = i2;
            this.mItalic = z;
            this.mResultCode = i3;
        }

        public int getResultCode() {
            return this.mResultCode;
        }

        @IntRange(from = 0)
        public int getTtcIndex() {
            return this.mTtcIndex;
        }

        @NonNull
        public Uri getUri() {
            return this.mUri;
        }

        @IntRange(from = 1, to = 1000)
        public int getWeight() {
            return this.mWeight;
        }

        public boolean isItalic() {
            return this.mItalic;
        }
    }

    public static class FontRequestCallback {
        public static final int FAIL_REASON_FONT_LOAD_ERROR = -3;
        public static final int FAIL_REASON_FONT_NOT_FOUND = 1;
        public static final int FAIL_REASON_FONT_UNAVAILABLE = 2;
        public static final int FAIL_REASON_MALFORMED_QUERY = 3;
        public static final int FAIL_REASON_PROVIDER_NOT_FOUND = -1;
        public static final int FAIL_REASON_SECURITY_VIOLATION = -4;
        public static final int FAIL_REASON_WRONG_CERTIFICATES = -2;
        @RestrictTo({Scope.LIBRARY_GROUP})
        public static final int RESULT_OK = 0;

        @RestrictTo({Scope.LIBRARY_GROUP})
        @Retention(RetentionPolicy.SOURCE)
        public @interface FontRequestFailReason {
        }

        public void onTypefaceRequestFailed(int i) {
        }

        public void onTypefaceRetrieved(Typeface typeface) {
        }
    }

    private static final class TypefaceResult {
        final int mResult;
        final Typeface mTypeface;

        TypefaceResult(@Nullable Typeface typeface, int i) {
            this.mTypeface = typeface;
            this.mResult = i;
        }
    }

    private FontsContractCompat() {
    }

    @Nullable
    public static Typeface buildTypeface(@NonNull Context context, @Nullable CancellationSignal cancellationSignal, @NonNull FontInfo[] fontInfoArr) {
        return TypefaceCompat.createFromFontInfo(context, cancellationSignal, fontInfoArr, 0);
    }

    private static List<byte[]> convertToByteArrayList(Signature[] signatureArr) {
        ArrayList arrayList = new ArrayList();
        for (Signature byteArray : signatureArr) {
            arrayList.add(byteArray.toByteArray());
        }
        return arrayList;
    }

    private static boolean equalsByteArrayList(List<byte[]> list, List<byte[]> list2) {
        if (list.size() != list2.size()) {
            return false;
        }
        for (int i = 0; i < list.size(); i++) {
            if (!Arrays.equals((byte[]) list.get(i), (byte[]) list2.get(i))) {
                return false;
            }
        }
        return true;
    }

    @NonNull
    public static FontFamilyResult fetchFonts(@NonNull Context context, @Nullable CancellationSignal cancellationSignal, @NonNull FontRequest fontRequest) throws NameNotFoundException {
        ProviderInfo provider = getProvider(context.getPackageManager(), fontRequest, context.getResources());
        return provider == null ? new FontFamilyResult(1, null) : new FontFamilyResult(0, getFontFromProvider(context, fontRequest, provider.authority, cancellationSignal));
    }

    private static List<List<byte[]>> getCertificates(FontRequest fontRequest, Resources resources) {
        return fontRequest.getCertificates() != null ? fontRequest.getCertificates() : FontResourcesParserCompat.readCerts(resources, fontRequest.getCertificatesArrayResId());
    }

    /* JADX INFO: finally extract failed */
    @VisibleForTesting
    @NonNull
    static FontInfo[] getFontFromProvider(Context context, FontRequest fontRequest, String str, CancellationSignal cancellationSignal) {
        String str2 = str;
        ArrayList arrayList = new ArrayList();
        Uri build = new Builder().scheme(ComposerHelper.COMPOSER_CONTENT).authority(str2).build();
        Uri build2 = new Builder().scheme(ComposerHelper.COMPOSER_CONTENT).authority(str2).appendPath(ComposerHelper.COMPOSER_PATH).build();
        Cursor cursor = null;
        try {
            Cursor query = VERSION.SDK_INT > 16 ? context.getContentResolver().query(build, new String[]{"_id", Columns.FILE_ID, Columns.TTC_INDEX, Columns.VARIATION_SETTINGS, Columns.WEIGHT, Columns.ITALIC, Columns.RESULT_CODE}, "query = ?", new String[]{fontRequest.getQuery()}, null, cancellationSignal) : context.getContentResolver().query(build, new String[]{"_id", Columns.FILE_ID, Columns.TTC_INDEX, Columns.VARIATION_SETTINGS, Columns.WEIGHT, Columns.ITALIC, Columns.RESULT_CODE}, "query = ?", new String[]{fontRequest.getQuery()}, null);
            if (query != null && query.getCount() > 0) {
                int columnIndex = query.getColumnIndex(Columns.RESULT_CODE);
                ArrayList arrayList2 = new ArrayList();
                int columnIndex2 = query.getColumnIndex("_id");
                int columnIndex3 = query.getColumnIndex(Columns.FILE_ID);
                int columnIndex4 = query.getColumnIndex(Columns.TTC_INDEX);
                int columnIndex5 = query.getColumnIndex(Columns.WEIGHT);
                int columnIndex6 = query.getColumnIndex(Columns.ITALIC);
                while (query.moveToNext()) {
                    int i = columnIndex != -1 ? query.getInt(columnIndex) : 0;
                    FontInfo fontInfo = new FontInfo(columnIndex3 == -1 ? ContentUris.withAppendedId(build, query.getLong(columnIndex2)) : ContentUris.withAppendedId(build2, query.getLong(columnIndex3)), columnIndex4 != -1 ? query.getInt(columnIndex4) : 0, columnIndex5 != -1 ? query.getInt(columnIndex5) : MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME, columnIndex6 != -1 && query.getInt(columnIndex6) == 1, i);
                    arrayList2.add(fontInfo);
                }
                arrayList = arrayList2;
            }
            if (query != null) {
                query.close();
            }
            return (FontInfo[]) arrayList.toArray(new FontInfo[0]);
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    @NonNull
    static TypefaceResult getFontInternal(Context context, FontRequest fontRequest, int i) {
        try {
            FontFamilyResult fetchFonts = fetchFonts(context, null, fontRequest);
            int i2 = -3;
            if (fetchFonts.getStatusCode() == 0) {
                Typeface createFromFontInfo = TypefaceCompat.createFromFontInfo(context, null, fetchFonts.getFonts(), i);
                if (createFromFontInfo != null) {
                    i2 = 0;
                }
                return new TypefaceResult(createFromFontInfo, i2);
            }
            if (fetchFonts.getStatusCode() == 1) {
                i2 = -2;
            }
            return new TypefaceResult(null, i2);
        } catch (NameNotFoundException e) {
            return new TypefaceResult(null, -1);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:34:0x007c, code lost:
        return null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x008d, code lost:
        sBackgroundThread.postAndReply(r1, new android.support.v4.provider.FontsContractCompat.AnonymousClass3());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0097, code lost:
        return null;
     */
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static Typeface getFontSync(final Context context, final FontRequest fontRequest, @Nullable final FontCallback fontCallback, @Nullable final Handler handler, boolean z, int i, final int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append(fontRequest.getIdentifier());
        sb.append("-");
        sb.append(i2);
        final String sb2 = sb.toString();
        Typeface typeface = (Typeface) sTypefaceCache.get(sb2);
        if (typeface != null) {
            if (fontCallback != null) {
                fontCallback.onFontRetrieved(typeface);
            }
            return typeface;
        } else if (!z || i != -1) {
            AnonymousClass1 r1 = new Callable<TypefaceResult>() {
                public TypefaceResult call() throws Exception {
                    TypefaceResult fontInternal = FontsContractCompat.getFontInternal(context, fontRequest, i2);
                    if (fontInternal.mTypeface != null) {
                        FontsContractCompat.sTypefaceCache.put(sb2, fontInternal.mTypeface);
                    }
                    return fontInternal;
                }
            };
            if (z) {
                try {
                    return ((TypefaceResult) sBackgroundThread.postAndWait(r1, i)).mTypeface;
                } catch (InterruptedException e) {
                    return null;
                }
            } else {
                Object r3 = fontCallback == null ? null : new ReplyCallback<TypefaceResult>() {
                    public void onReply(TypefaceResult typefaceResult) {
                        if (typefaceResult == null) {
                            fontCallback.callbackFailAsync(1, handler);
                        } else if (typefaceResult.mResult == 0) {
                            fontCallback.callbackSuccessAsync(typefaceResult.mTypeface, handler);
                        } else {
                            fontCallback.callbackFailAsync(typefaceResult.mResult, handler);
                        }
                    }
                };
                synchronized (sLock) {
                    if (sPendingReplies.containsKey(sb2)) {
                        if (r3 != null) {
                            ((ArrayList) sPendingReplies.get(sb2)).add(r3);
                        }
                    } else if (r3 != null) {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(r3);
                        sPendingReplies.put(sb2, arrayList);
                    }
                }
            }
        } else {
            TypefaceResult fontInternal = getFontInternal(context, fontRequest, i2);
            if (fontCallback != null) {
                if (fontInternal.mResult == 0) {
                    fontCallback.callbackSuccessAsync(fontInternal.mTypeface, handler);
                } else {
                    fontCallback.callbackFailAsync(fontInternal.mResult, handler);
                }
            }
            return fontInternal.mTypeface;
        }
    }

    @VisibleForTesting
    @RestrictTo({Scope.LIBRARY_GROUP})
    @Nullable
    public static ProviderInfo getProvider(@NonNull PackageManager packageManager, @NonNull FontRequest fontRequest, @Nullable Resources resources) throws NameNotFoundException {
        String providerAuthority = fontRequest.getProviderAuthority();
        ProviderInfo resolveContentProvider = packageManager.resolveContentProvider(providerAuthority, 0);
        if (resolveContentProvider == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("No package found for authority: ");
            sb.append(providerAuthority);
            throw new NameNotFoundException(sb.toString());
        } else if (resolveContentProvider.packageName.equals(fontRequest.getProviderPackage())) {
            List convertToByteArrayList = convertToByteArrayList(packageManager.getPackageInfo(resolveContentProvider.packageName, 64).signatures);
            Collections.sort(convertToByteArrayList, sByteArrayComparator);
            List certificates = getCertificates(fontRequest, resources);
            for (int i = 0; i < certificates.size(); i++) {
                ArrayList arrayList = new ArrayList((Collection) certificates.get(i));
                Collections.sort(arrayList, sByteArrayComparator);
                if (equalsByteArrayList(convertToByteArrayList, arrayList)) {
                    return resolveContentProvider;
                }
            }
            return null;
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Found content provider ");
            sb2.append(providerAuthority);
            sb2.append(", but package was not ");
            sb2.append(fontRequest.getProviderPackage());
            throw new NameNotFoundException(sb2.toString());
        }
    }

    @RequiresApi(19)
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static Map<Uri, ByteBuffer> prepareFontData(Context context, FontInfo[] fontInfoArr, CancellationSignal cancellationSignal) {
        HashMap hashMap = new HashMap();
        for (FontInfo fontInfo : fontInfoArr) {
            if (fontInfo.getResultCode() == 0) {
                Uri uri = fontInfo.getUri();
                if (!hashMap.containsKey(uri)) {
                    hashMap.put(uri, TypefaceCompatUtil.mmap(context, cancellationSignal, uri));
                }
            }
        }
        return Collections.unmodifiableMap(hashMap);
    }

    public static void requestFont(@NonNull final Context context, @NonNull final FontRequest fontRequest, @NonNull final FontRequestCallback fontRequestCallback, @NonNull Handler handler) {
        final Handler handler2 = new Handler();
        handler.post(new Runnable() {
            public void run() {
                try {
                    FontFamilyResult fetchFonts = FontsContractCompat.fetchFonts(context, null, fontRequest);
                    if (fetchFonts.getStatusCode() != 0) {
                        switch (fetchFonts.getStatusCode()) {
                            case 1:
                                handler2.post(new Runnable() {
                                    public void run() {
                                        fontRequestCallback.onTypefaceRequestFailed(-2);
                                    }
                                });
                                return;
                            case 2:
                                handler2.post(new Runnable() {
                                    public void run() {
                                        fontRequestCallback.onTypefaceRequestFailed(-3);
                                    }
                                });
                                return;
                            default:
                                handler2.post(new Runnable() {
                                    public void run() {
                                        fontRequestCallback.onTypefaceRequestFailed(-3);
                                    }
                                });
                                return;
                        }
                    } else {
                        FontInfo[] fonts = fetchFonts.getFonts();
                        if (fonts == null || fonts.length == 0) {
                            handler2.post(new Runnable() {
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(1);
                                }
                            });
                            return;
                        }
                        for (FontInfo fontInfo : fonts) {
                            if (fontInfo.getResultCode() != 0) {
                                final int resultCode = fontInfo.getResultCode();
                                if (resultCode < 0) {
                                    handler2.post(new Runnable() {
                                        public void run() {
                                            fontRequestCallback.onTypefaceRequestFailed(-3);
                                        }
                                    });
                                } else {
                                    handler2.post(new Runnable() {
                                        public void run() {
                                            fontRequestCallback.onTypefaceRequestFailed(resultCode);
                                        }
                                    });
                                }
                                return;
                            }
                        }
                        final Typeface buildTypeface = FontsContractCompat.buildTypeface(context, null, fonts);
                        if (buildTypeface == null) {
                            handler2.post(new Runnable() {
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(-3);
                                }
                            });
                        } else {
                            handler2.post(new Runnable() {
                                public void run() {
                                    fontRequestCallback.onTypefaceRetrieved(buildTypeface);
                                }
                            });
                        }
                    }
                } catch (NameNotFoundException e) {
                    handler2.post(new Runnable() {
                        public void run() {
                            fontRequestCallback.onTypefaceRequestFailed(-1);
                        }
                    });
                }
            }
        });
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    public static void resetCache() {
        sTypefaceCache.evictAll();
    }
}
