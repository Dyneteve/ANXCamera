package android.support.v4.graphics.drawable;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.Intent.ShortcutIconResource;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.ColorInt;
import android.support.annotation.DrawableRes;
import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.annotation.VisibleForTesting;
import android.support.v4.content.ContextCompat;
import android.support.v4.content.res.ResourcesCompat;
import android.support.v4.os.BuildCompat;
import android.support.v4.util.Preconditions;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.Log;
import androidx.versionedparcelable.a;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.Charset;

public class IconCompat extends a {
    private static final float ADAPTIVE_ICON_INSET_FACTOR = 0.25f;
    private static final int AMBIENT_SHADOW_ALPHA = 30;
    private static final float BLUR_FACTOR = 0.010416667f;
    static final Mode DEFAULT_TINT_MODE = Mode.SRC_IN;
    private static final float DEFAULT_VIEW_PORT_SCALE = 0.6666667f;
    private static final String EXTRA_INT1 = "int1";
    private static final String EXTRA_INT2 = "int2";
    private static final String EXTRA_OBJ = "obj";
    private static final String EXTRA_TINT_LIST = "tint_list";
    private static final String EXTRA_TINT_MODE = "tint_mode";
    private static final String EXTRA_TYPE = "type";
    private static final float ICON_DIAMETER_FACTOR = 0.9166667f;
    private static final int KEY_SHADOW_ALPHA = 61;
    private static final float KEY_SHADOW_OFFSET_FACTOR = 0.020833334f;
    private static final String TAG = "IconCompat";
    public static final int TYPE_UNKNOWN = -1;
    @RestrictTo({Scope.LIBRARY})
    public byte[] mData;
    @RestrictTo({Scope.LIBRARY})
    public int mInt1;
    @RestrictTo({Scope.LIBRARY})
    public int mInt2;
    Object mObj1;
    @RestrictTo({Scope.LIBRARY})
    public Parcelable mParcelable;
    @RestrictTo({Scope.LIBRARY})
    public ColorStateList mTintList = null;
    Mode mTintMode = DEFAULT_TINT_MODE;
    @RestrictTo({Scope.LIBRARY})
    public String mTintModeStr;
    @RestrictTo({Scope.LIBRARY})
    public int mType;

    @RestrictTo({Scope.LIBRARY})
    @Retention(RetentionPolicy.SOURCE)
    public @interface IconType {
    }

    @RestrictTo({Scope.LIBRARY})
    public IconCompat() {
    }

    private IconCompat(int i) {
        this.mType = i;
    }

    @Nullable
    public static IconCompat createFromBundle(@NonNull Bundle bundle) {
        int i = bundle.getInt("type");
        IconCompat iconCompat = new IconCompat(i);
        iconCompat.mInt1 = bundle.getInt(EXTRA_INT1);
        iconCompat.mInt2 = bundle.getInt(EXTRA_INT2);
        if (bundle.containsKey(EXTRA_TINT_LIST)) {
            iconCompat.mTintList = (ColorStateList) bundle.getParcelable(EXTRA_TINT_LIST);
        }
        if (bundle.containsKey(EXTRA_TINT_MODE)) {
            iconCompat.mTintMode = Mode.valueOf(bundle.getString(EXTRA_TINT_MODE));
        }
        if (i != -1) {
            switch (i) {
                case 1:
                case 5:
                    break;
                case 2:
                case 4:
                    iconCompat.mObj1 = bundle.getString(EXTRA_OBJ);
                    break;
                case 3:
                    iconCompat.mObj1 = bundle.getByteArray(EXTRA_OBJ);
                    break;
                default:
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown type ");
                    sb.append(i);
                    Log.w(str, sb.toString());
                    return null;
            }
        }
        iconCompat.mObj1 = bundle.getParcelable(EXTRA_OBJ);
        return iconCompat;
    }

    @Nullable
    @RequiresApi(23)
    public static IconCompat createFromIcon(@NonNull Icon icon) {
        Preconditions.checkNotNull(icon);
        int type = getType(icon);
        if (type == 2) {
            return createWithResource(getResPackage(icon), getResId(icon));
        }
        if (type == 4) {
            return createWithContentUri(getUri(icon));
        }
        IconCompat iconCompat = new IconCompat(-1);
        iconCompat.mObj1 = icon;
        return iconCompat;
    }

    @VisibleForTesting
    static Bitmap createLegacyIconFromAdaptiveIcon(Bitmap bitmap, boolean z) {
        int min = (int) (DEFAULT_VIEW_PORT_SCALE * ((float) Math.min(bitmap.getWidth(), bitmap.getHeight())));
        Bitmap createBitmap = Bitmap.createBitmap(min, min, Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        Paint paint = new Paint(3);
        float f = (float) min;
        float f2 = 0.5f * f;
        float f3 = ICON_DIAMETER_FACTOR * f2;
        if (z) {
            float f4 = BLUR_FACTOR * f;
            paint.setColor(0);
            paint.setShadowLayer(f4, 0.0f, KEY_SHADOW_OFFSET_FACTOR * f, 1023410176);
            canvas.drawCircle(f2, f2, f3, paint);
            paint.setShadowLayer(f4, 0.0f, 0.0f, 503316480);
            canvas.drawCircle(f2, f2, f3, paint);
            paint.clearShadowLayer();
        }
        paint.setColor(ViewCompat.MEASURED_STATE_MASK);
        BitmapShader bitmapShader = new BitmapShader(bitmap, TileMode.CLAMP, TileMode.CLAMP);
        Matrix matrix = new Matrix();
        matrix.setTranslate((float) ((-(bitmap.getWidth() - min)) / 2), (float) ((-(bitmap.getHeight() - min)) / 2));
        bitmapShader.setLocalMatrix(matrix);
        paint.setShader(bitmapShader);
        canvas.drawCircle(f2, f2, f3, paint);
        canvas.setBitmap(null);
        return createBitmap;
    }

    public static IconCompat createWithAdaptiveBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            IconCompat iconCompat = new IconCompat(5);
            iconCompat.mObj1 = bitmap;
            return iconCompat;
        }
        throw new IllegalArgumentException("Bitmap must not be null.");
    }

    public static IconCompat createWithBitmap(Bitmap bitmap) {
        if (bitmap != null) {
            IconCompat iconCompat = new IconCompat(1);
            iconCompat.mObj1 = bitmap;
            return iconCompat;
        }
        throw new IllegalArgumentException("Bitmap must not be null.");
    }

    public static IconCompat createWithContentUri(Uri uri) {
        if (uri != null) {
            return createWithContentUri(uri.toString());
        }
        throw new IllegalArgumentException("Uri must not be null.");
    }

    public static IconCompat createWithContentUri(String str) {
        if (str != null) {
            IconCompat iconCompat = new IconCompat(4);
            iconCompat.mObj1 = str;
            return iconCompat;
        }
        throw new IllegalArgumentException("Uri must not be null.");
    }

    public static IconCompat createWithData(byte[] bArr, int i, int i2) {
        if (bArr != null) {
            IconCompat iconCompat = new IconCompat(3);
            iconCompat.mObj1 = bArr;
            iconCompat.mInt1 = i;
            iconCompat.mInt2 = i2;
            return iconCompat;
        }
        throw new IllegalArgumentException("Data must not be null.");
    }

    public static IconCompat createWithResource(Context context, @DrawableRes int i) {
        if (context != null) {
            IconCompat iconCompat = new IconCompat(2);
            iconCompat.mInt1 = i;
            iconCompat.mObj1 = context.getPackageName();
            return iconCompat;
        }
        throw new IllegalArgumentException("Context must not be null.");
    }

    @RestrictTo({Scope.LIBRARY})
    public static IconCompat createWithResource(String str, @DrawableRes int i) {
        if (str != null) {
            IconCompat iconCompat = new IconCompat(2);
            iconCompat.mInt1 = i;
            iconCompat.mObj1 = str;
            return iconCompat;
        }
        throw new IllegalArgumentException("Package must not be null.");
    }

    @RequiresApi(23)
    @DrawableRes
    @IdRes
    public static int getResId(@NonNull Icon icon) {
        if (BuildCompat.isAtLeastP()) {
            return icon.getResId();
        }
        try {
            return ((Integer) icon.getClass().getMethod("getResId", new Class[0]).invoke(icon, new Object[0])).intValue();
        } catch (IllegalAccessException e) {
            Log.e(TAG, "Unable to get icon resource", e);
            return 0;
        } catch (InvocationTargetException e2) {
            Log.e(TAG, "Unable to get icon resource", e2);
            return 0;
        } catch (NoSuchMethodException e3) {
            Log.e(TAG, "Unable to get icon resource", e3);
            return 0;
        }
    }

    @Nullable
    @RequiresApi(23)
    public static String getResPackage(@NonNull Icon icon) {
        if (BuildCompat.isAtLeastP()) {
            return icon.getResPackage();
        }
        try {
            return (String) icon.getClass().getMethod("getResPackage", new Class[0]).invoke(icon, new Object[0]);
        } catch (IllegalAccessException e) {
            Log.e(TAG, "Unable to get icon package", e);
            return null;
        } catch (InvocationTargetException e2) {
            Log.e(TAG, "Unable to get icon package", e2);
            return null;
        } catch (NoSuchMethodException e3) {
            Log.e(TAG, "Unable to get icon package", e3);
            return null;
        }
    }

    @RequiresApi(23)
    public static int getType(@NonNull Icon icon) {
        if (BuildCompat.isAtLeastP()) {
            return icon.getType();
        }
        try {
            return ((Integer) icon.getClass().getMethod("getType", new Class[0]).invoke(icon, new Object[0])).intValue();
        } catch (IllegalAccessException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Unable to get icon type ");
            sb.append(icon);
            Log.e(str, sb.toString(), e);
            return -1;
        } catch (InvocationTargetException e2) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Unable to get icon type ");
            sb2.append(icon);
            Log.e(str2, sb2.toString(), e2);
            return -1;
        } catch (NoSuchMethodException e3) {
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Unable to get icon type ");
            sb3.append(icon);
            Log.e(str3, sb3.toString(), e3);
            return -1;
        }
    }

    @Nullable
    @RequiresApi(23)
    public static Uri getUri(@NonNull Icon icon) {
        if (BuildCompat.isAtLeastP()) {
            return icon.getUri();
        }
        try {
            return (Uri) icon.getClass().getMethod("getUri", new Class[0]).invoke(icon, new Object[0]);
        } catch (IllegalAccessException e) {
            Log.e(TAG, "Unable to get icon uri", e);
            return null;
        } catch (InvocationTargetException e2) {
            Log.e(TAG, "Unable to get icon uri", e2);
            return null;
        } catch (NoSuchMethodException e3) {
            Log.e(TAG, "Unable to get icon uri", e3);
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0084  */
    private Drawable loadDrawableInner(Context context) {
        Resources resources;
        InputStream inputStream;
        switch (this.mType) {
            case 1:
                return new BitmapDrawable(context.getResources(), (Bitmap) this.mObj1);
            case 2:
                String str = (String) this.mObj1;
                if (TextUtils.isEmpty(str)) {
                    str = context.getPackageName();
                }
                if (!"android".equals(str)) {
                    PackageManager packageManager = context.getPackageManager();
                    try {
                        ApplicationInfo applicationInfo = packageManager.getApplicationInfo(str, 8192);
                        if (applicationInfo != null) {
                            resources = packageManager.getResourcesForApplication(applicationInfo);
                        }
                    } catch (NameNotFoundException e) {
                        Log.e(TAG, String.format("Unable to find pkg=%s for icon %s", new Object[]{str, this}), e);
                        break;
                    }
                } else {
                    resources = Resources.getSystem();
                }
                try {
                    return ResourcesCompat.getDrawable(resources, this.mInt1, context.getTheme());
                } catch (RuntimeException e2) {
                    Log.e(TAG, String.format("Unable to load resource 0x%08x from pkg=%s", new Object[]{Integer.valueOf(this.mInt1), this.mObj1}), e2);
                    break;
                }
            case 3:
                return new BitmapDrawable(context.getResources(), BitmapFactory.decodeByteArray((byte[]) this.mObj1, this.mInt1, this.mInt2));
            case 4:
                Uri parse = Uri.parse((String) this.mObj1);
                String scheme = parse.getScheme();
                if (ComposerHelper.COMPOSER_CONTENT.equals(scheme) || ComposerHelper.COMPOSER_PATH.equals(scheme)) {
                    try {
                        inputStream = context.getContentResolver().openInputStream(parse);
                    } catch (Exception e3) {
                        String str2 = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Unable to load image from URI: ");
                        sb.append(parse);
                        Log.w(str2, sb.toString(), e3);
                        inputStream = null;
                        if (inputStream != null) {
                        }
                        return null;
                    }
                } else {
                    try {
                        inputStream = new FileInputStream(new File((String) this.mObj1));
                    } catch (FileNotFoundException e4) {
                        String str3 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Unable to load image from path: ");
                        sb2.append(parse);
                        Log.w(str3, sb2.toString(), e4);
                    }
                }
                if (inputStream != null) {
                    return new BitmapDrawable(context.getResources(), BitmapFactory.decodeStream(inputStream));
                }
                break;
            case 5:
                return new BitmapDrawable(context.getResources(), createLegacyIconFromAdaptiveIcon((Bitmap) this.mObj1, false));
        }
        return null;
    }

    private static String typeToString(int i) {
        switch (i) {
            case 1:
                return "BITMAP";
            case 2:
                return "RESOURCE";
            case 3:
                return "DATA";
            case 4:
                return "URI";
            case 5:
                return "BITMAP_MASKABLE";
            default:
                return "UNKNOWN";
        }
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    public void addToShortcutIntent(@NonNull Intent intent, @Nullable Drawable drawable, @NonNull Context context) {
        Bitmap bitmap;
        int i = this.mType;
        if (i != 5) {
            switch (i) {
                case 1:
                    bitmap = (Bitmap) this.mObj1;
                    if (drawable != null) {
                        bitmap = bitmap.copy(bitmap.getConfig(), true);
                        break;
                    }
                    break;
                case 2:
                    try {
                        Context createPackageContext = context.createPackageContext((String) this.mObj1, 0);
                        if (drawable == null) {
                            intent.putExtra("android.intent.extra.shortcut.ICON_RESOURCE", ShortcutIconResource.fromContext(createPackageContext, this.mInt1));
                            return;
                        }
                        Drawable drawable2 = ContextCompat.getDrawable(createPackageContext, this.mInt1);
                        if (drawable2.getIntrinsicWidth() > 0) {
                            if (drawable2.getIntrinsicHeight() > 0) {
                                bitmap = Bitmap.createBitmap(drawable2.getIntrinsicWidth(), drawable2.getIntrinsicHeight(), Config.ARGB_8888);
                                drawable2.setBounds(0, 0, bitmap.getWidth(), bitmap.getHeight());
                                drawable2.draw(new Canvas(bitmap));
                                break;
                            }
                        }
                        int launcherLargeIconSize = ((ActivityManager) createPackageContext.getSystemService("activity")).getLauncherLargeIconSize();
                        bitmap = Bitmap.createBitmap(launcherLargeIconSize, launcherLargeIconSize, Config.ARGB_8888);
                        drawable2.setBounds(0, 0, bitmap.getWidth(), bitmap.getHeight());
                        drawable2.draw(new Canvas(bitmap));
                    } catch (NameNotFoundException e) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Can't find package ");
                        sb.append(this.mObj1);
                        throw new IllegalArgumentException(sb.toString(), e);
                    }
                default:
                    throw new IllegalArgumentException("Icon type not supported for intent shortcuts");
            }
        } else {
            bitmap = createLegacyIconFromAdaptiveIcon((Bitmap) this.mObj1, true);
        }
        if (drawable != null) {
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            drawable.setBounds(width / 2, height / 2, width, height);
            drawable.draw(new Canvas(bitmap));
        }
        intent.putExtra("android.intent.extra.shortcut.ICON", bitmap);
    }

    @IdRes
    public int getResId() {
        if (this.mType == -1 && VERSION.SDK_INT >= 23) {
            return getResId((Icon) this.mObj1);
        }
        if (this.mType == 2) {
            return this.mInt1;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("called getResId() on ");
        sb.append(this);
        throw new IllegalStateException(sb.toString());
    }

    @NonNull
    public String getResPackage() {
        if (this.mType == -1 && VERSION.SDK_INT >= 23) {
            return getResPackage((Icon) this.mObj1);
        }
        if (this.mType == 2) {
            return (String) this.mObj1;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("called getResPackage() on ");
        sb.append(this);
        throw new IllegalStateException(sb.toString());
    }

    public int getType() {
        return (this.mType != -1 || VERSION.SDK_INT < 23) ? this.mType : getType((Icon) this.mObj1);
    }

    @NonNull
    public Uri getUri() {
        return (this.mType != -1 || VERSION.SDK_INT < 23) ? Uri.parse((String) this.mObj1) : getUri((Icon) this.mObj1);
    }

    public Drawable loadDrawable(Context context) {
        if (VERSION.SDK_INT >= 23) {
            return toIcon().loadDrawable(context);
        }
        Drawable loadDrawableInner = loadDrawableInner(context);
        if (!(loadDrawableInner == null || (this.mTintList == null && this.mTintMode == DEFAULT_TINT_MODE))) {
            loadDrawableInner.mutate();
            DrawableCompat.setTintList(loadDrawableInner, this.mTintList);
            DrawableCompat.setTintMode(loadDrawableInner, this.mTintMode);
        }
        return loadDrawableInner;
    }

    public void onPostParceling() {
        this.mTintMode = Mode.valueOf(this.mTintModeStr);
        int i = this.mType;
        if (i != -1) {
            switch (i) {
                case 1:
                case 5:
                    if (this.mParcelable != null) {
                        this.mObj1 = this.mParcelable;
                        return;
                    }
                    this.mObj1 = this.mData;
                    this.mType = 3;
                    this.mInt1 = 0;
                    this.mInt2 = this.mData.length;
                    return;
                case 2:
                    this.mObj1 = new String(this.mData, Charset.forName("UTF-16"));
                    return;
                case 3:
                    this.mObj1 = this.mData;
                    return;
                case 4:
                    this.mObj1 = Uri.parse(new String(this.mData, Charset.forName("UTF-16")));
                    return;
                default:
                    return;
            }
        } else if (this.mParcelable != null) {
            this.mObj1 = this.mParcelable;
        } else {
            throw new IllegalArgumentException("Invalid icon");
        }
    }

    public void onPreParceling(boolean z) {
        this.mTintModeStr = this.mTintMode.name();
        int i = this.mType;
        if (i != -1) {
            switch (i) {
                case 1:
                case 5:
                    if (z) {
                        Bitmap bitmap = (Bitmap) this.mObj1;
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        bitmap.compress(CompressFormat.PNG, 90, byteArrayOutputStream);
                        this.mData = byteArrayOutputStream.toByteArray();
                        return;
                    }
                    this.mParcelable = (Parcelable) this.mObj1;
                    return;
                case 2:
                    this.mData = ((String) this.mObj1).getBytes(Charset.forName("UTF-16"));
                    return;
                case 3:
                    this.mData = (byte[]) this.mObj1;
                    return;
                case 4:
                    this.mData = this.mObj1.toString().getBytes(Charset.forName("UTF-16"));
                    return;
                default:
                    return;
            }
        } else if (!z) {
            this.mParcelable = (Parcelable) this.mObj1;
        } else {
            throw new IllegalArgumentException("Can't serialize Icon created with IconCompat#createFromIcon");
        }
    }

    public IconCompat setTint(@ColorInt int i) {
        return setTintList(ColorStateList.valueOf(i));
    }

    public IconCompat setTintList(ColorStateList colorStateList) {
        this.mTintList = colorStateList;
        return this;
    }

    public IconCompat setTintMode(Mode mode) {
        this.mTintMode = mode;
        return this;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        int i = this.mType;
        if (i != -1) {
            switch (i) {
                case 1:
                case 5:
                    bundle.putParcelable(EXTRA_OBJ, (Bitmap) this.mObj1);
                    break;
                case 2:
                case 4:
                    bundle.putString(EXTRA_OBJ, (String) this.mObj1);
                    break;
                case 3:
                    bundle.putByteArray(EXTRA_OBJ, (byte[]) this.mObj1);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid icon");
            }
        } else {
            bundle.putParcelable(EXTRA_OBJ, (Parcelable) this.mObj1);
        }
        bundle.putInt("type", this.mType);
        bundle.putInt(EXTRA_INT1, this.mInt1);
        bundle.putInt(EXTRA_INT2, this.mInt2);
        if (this.mTintList != null) {
            bundle.putParcelable(EXTRA_TINT_LIST, this.mTintList);
        }
        if (this.mTintMode != DEFAULT_TINT_MODE) {
            bundle.putString(EXTRA_TINT_MODE, this.mTintMode.name());
        }
        return bundle;
    }

    @RequiresApi(23)
    public Icon toIcon() {
        Icon icon;
        int i = this.mType;
        if (i == -1) {
            return (Icon) this.mObj1;
        }
        switch (i) {
            case 1:
                icon = Icon.createWithBitmap((Bitmap) this.mObj1);
                break;
            case 2:
                icon = Icon.createWithResource((String) this.mObj1, this.mInt1);
                break;
            case 3:
                icon = Icon.createWithData((byte[]) this.mObj1, this.mInt1, this.mInt2);
                break;
            case 4:
                icon = Icon.createWithContentUri((String) this.mObj1);
                break;
            case 5:
                if (VERSION.SDK_INT < 26) {
                    icon = Icon.createWithBitmap(createLegacyIconFromAdaptiveIcon((Bitmap) this.mObj1, false));
                    break;
                } else {
                    icon = Icon.createWithAdaptiveBitmap((Bitmap) this.mObj1);
                    break;
                }
            default:
                throw new IllegalArgumentException("Unknown type");
        }
        if (this.mTintList != null) {
            icon.setTintList(this.mTintList);
        }
        if (this.mTintMode != DEFAULT_TINT_MODE) {
            icon.setTintMode(this.mTintMode);
        }
        return icon;
    }

    public String toString() {
        if (this.mType == -1) {
            return String.valueOf(this.mObj1);
        }
        StringBuilder sb = new StringBuilder("Icon(typ=");
        sb.append(typeToString(this.mType));
        switch (this.mType) {
            case 1:
            case 5:
                sb.append(" size=");
                sb.append(((Bitmap) this.mObj1).getWidth());
                sb.append("x");
                sb.append(((Bitmap) this.mObj1).getHeight());
                break;
            case 2:
                sb.append(" pkg=");
                sb.append(getResPackage());
                sb.append(" id=");
                sb.append(String.format("0x%08x", new Object[]{Integer.valueOf(getResId())}));
                break;
            case 3:
                sb.append(" len=");
                sb.append(this.mInt1);
                if (this.mInt2 != 0) {
                    sb.append(" off=");
                    sb.append(this.mInt2);
                    break;
                }
                break;
            case 4:
                sb.append(" uri=");
                sb.append(this.mObj1);
                break;
        }
        if (this.mTintList != null) {
            sb.append(" tint=");
            sb.append(this.mTintList);
        }
        if (this.mTintMode != DEFAULT_TINT_MODE) {
            sb.append(" mode=");
            sb.append(this.mTintMode);
        }
        sb.append(")");
        return sb.toString();
    }
}
