package android.support.v4.content;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.content.res.XmlResourceParser;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.webkit.MimeTypeMap;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map.Entry;
import org.xmlpull.v1.XmlPullParserException;

public class FileProvider extends ContentProvider {
    private static final String ATTR_NAME = "name";
    private static final String ATTR_PATH = "path";
    private static final String[] COLUMNS = {"_display_name", "_size"};
    private static final File DEVICE_ROOT = new File("/");
    private static final String META_DATA_FILE_PROVIDER_PATHS = "android.support.FILE_PROVIDER_PATHS";
    private static final String TAG_CACHE_PATH = "cache-path";
    private static final String TAG_EXTERNAL = "external-path";
    private static final String TAG_FILES_PATH = "files-path";
    private static final String TAG_ROOT_PATH = "root-path";
    private static HashMap<String, PathStrategy> sCache = new HashMap<>();
    private PathStrategy mStrategy;

    interface PathStrategy {
        File getFileForUri(Uri uri);

        Uri getUriForFile(File file);
    }

    static class SimplePathStrategy implements PathStrategy {
        private final String mAuthority;
        private final HashMap<String, File> mRoots = new HashMap<>();

        public SimplePathStrategy(String str) {
            this.mAuthority = str;
        }

        public void addRoot(String str, File file) {
            if (!TextUtils.isEmpty(str)) {
                try {
                    this.mRoots.put(str, file.getCanonicalFile());
                } catch (IOException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to resolve canonical path for ");
                    sb.append(file);
                    throw new IllegalArgumentException(sb.toString(), e);
                }
            } else {
                throw new IllegalArgumentException("Name must not be empty");
            }
        }

        public File getFileForUri(Uri uri) {
            String encodedPath = uri.getEncodedPath();
            int indexOf = encodedPath.indexOf(47, 1);
            String decode = Uri.decode(encodedPath.substring(1, indexOf));
            String decode2 = Uri.decode(encodedPath.substring(indexOf + 1));
            File file = (File) this.mRoots.get(decode);
            if (file != null) {
                File file2 = new File(file, decode2);
                try {
                    File canonicalFile = file2.getCanonicalFile();
                    if (canonicalFile.getPath().startsWith(file.getPath())) {
                        return canonicalFile;
                    }
                    throw new SecurityException("Resolved path jumped beyond configured root");
                } catch (IOException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to resolve canonical path for ");
                    sb.append(file2);
                    throw new IllegalArgumentException(sb.toString());
                }
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Unable to find configured root for ");
                sb2.append(uri);
                throw new IllegalArgumentException(sb2.toString());
            }
        }

        public Uri getUriForFile(File file) {
            try {
                String canonicalPath = file.getCanonicalPath();
                Entry entry = null;
                for (Entry entry2 : this.mRoots.entrySet()) {
                    String path = ((File) entry2.getValue()).getPath();
                    if (canonicalPath.startsWith(path) && (entry == null || path.length() > ((File) entry.getValue()).getPath().length())) {
                        entry = entry2;
                    }
                }
                if (entry != null) {
                    String path2 = ((File) entry.getValue()).getPath();
                    String substring = path2.endsWith("/") ? canonicalPath.substring(path2.length()) : canonicalPath.substring(path2.length() + 1);
                    StringBuilder sb = new StringBuilder();
                    sb.append(Uri.encode((String) entry.getKey()));
                    sb.append('/');
                    sb.append(Uri.encode(substring, "/"));
                    return new Builder().scheme(ComposerHelper.COMPOSER_CONTENT).authority(this.mAuthority).encodedPath(sb.toString()).build();
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Failed to find configured root that contains ");
                sb2.append(canonicalPath);
                throw new IllegalArgumentException(sb2.toString());
            } catch (IOException e) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Failed to resolve canonical path for ");
                sb3.append(file);
                throw new IllegalArgumentException(sb3.toString());
            }
        }
    }

    private static File buildPath(File file, String... strArr) {
        String[] strArr2;
        File file2 = file;
        for (String str : strArr) {
            if (str != null) {
                file2 = new File(file2, str);
            }
        }
        return file2;
    }

    private static Object[] copyOf(Object[] objArr, int i) {
        Object[] objArr2 = new Object[i];
        System.arraycopy(objArr, 0, objArr2, 0, i);
        return objArr2;
    }

    private static String[] copyOf(String[] strArr, int i) {
        String[] strArr2 = new String[i];
        System.arraycopy(strArr, 0, strArr2, 0, i);
        return strArr2;
    }

    private static PathStrategy getPathStrategy(Context context, String str) {
        PathStrategy pathStrategy;
        synchronized (sCache) {
            pathStrategy = (PathStrategy) sCache.get(str);
            if (pathStrategy == null) {
                try {
                    pathStrategy = parsePathStrategy(context, str);
                    sCache.put(str, pathStrategy);
                } catch (IOException e) {
                    throw new IllegalArgumentException("Failed to parse android.support.FILE_PROVIDER_PATHS meta-data", e);
                } catch (XmlPullParserException e2) {
                    throw new IllegalArgumentException("Failed to parse android.support.FILE_PROVIDER_PATHS meta-data", e2);
                }
            }
        }
        return pathStrategy;
    }

    public static Uri getUriForFile(Context context, String str, File file) {
        return getPathStrategy(context, str).getUriForFile(file);
    }

    private static int modeToMode(String str) {
        if ("r".equals(str)) {
            return WideSelfieEngine.MPAF_RGB_BASE;
        }
        if ("w".equals(str) || "wt".equals(str)) {
            return 738197504;
        }
        if ("wa".equals(str)) {
            return 704643072;
        }
        if ("rw".equals(str)) {
            return 939524096;
        }
        if ("rwt".equals(str)) {
            return 1006632960;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Invalid mode: ");
        sb.append(str);
        throw new IllegalArgumentException(sb.toString());
    }

    private static PathStrategy parsePathStrategy(Context context, String str) throws IOException, XmlPullParserException {
        SimplePathStrategy simplePathStrategy = new SimplePathStrategy(str);
        XmlResourceParser loadXmlMetaData = context.getPackageManager().resolveContentProvider(str, 128).loadXmlMetaData(context.getPackageManager(), META_DATA_FILE_PROVIDER_PATHS);
        if (loadXmlMetaData != null) {
            while (true) {
                int next = loadXmlMetaData.next();
                int i = next;
                if (next == 1) {
                    return simplePathStrategy;
                }
                if (i == 2) {
                    String name = loadXmlMetaData.getName();
                    String attributeValue = loadXmlMetaData.getAttributeValue(null, ATTR_NAME);
                    String attributeValue2 = loadXmlMetaData.getAttributeValue(null, "path");
                    File file = null;
                    if (TAG_ROOT_PATH.equals(name)) {
                        file = buildPath(DEVICE_ROOT, attributeValue2);
                    } else if (TAG_FILES_PATH.equals(name)) {
                        file = buildPath(context.getFilesDir(), attributeValue2);
                    } else if (TAG_CACHE_PATH.equals(name)) {
                        file = buildPath(context.getCacheDir(), attributeValue2);
                    } else if (TAG_EXTERNAL.equals(name)) {
                        file = buildPath(Environment.getExternalStorageDirectory(), attributeValue2);
                    }
                    if (file != null) {
                        simplePathStrategy.addRoot(attributeValue, file);
                    }
                }
            }
        } else {
            throw new IllegalArgumentException("Missing android.support.FILE_PROVIDER_PATHS meta-data");
        }
    }

    public void attachInfo(Context context, ProviderInfo providerInfo) {
        super.attachInfo(context, providerInfo);
        if (providerInfo.exported) {
            throw new SecurityException("Provider must not be exported");
        } else if (providerInfo.grantUriPermissions) {
            this.mStrategy = getPathStrategy(context, providerInfo.authority);
        } else {
            throw new SecurityException("Provider must grant uri permissions");
        }
    }

    public int delete(Uri uri, String str, String[] strArr) {
        return this.mStrategy.getFileForUri(uri).delete() ? 1 : 0;
    }

    public String getType(Uri uri) {
        File fileForUri = this.mStrategy.getFileForUri(uri);
        int lastIndexOf = fileForUri.getName().lastIndexOf(46);
        if (lastIndexOf >= 0) {
            String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileForUri.getName().substring(lastIndexOf + 1));
            if (mimeTypeFromExtension != null) {
                return mimeTypeFromExtension;
            }
        }
        return "application/octet-stream";
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        throw new UnsupportedOperationException("No external inserts");
    }

    public boolean onCreate() {
        return true;
    }

    public ParcelFileDescriptor openFile(Uri uri, String str) throws FileNotFoundException {
        return ParcelFileDescriptor.open(this.mStrategy.getFileForUri(uri), modeToMode(str));
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        String[] strArr3;
        int i;
        File fileForUri = this.mStrategy.getFileForUri(uri);
        String[] strArr4 = strArr == null ? COLUMNS : strArr;
        String[] strArr5 = new String[strArr4.length];
        Object[] objArr = new Object[strArr4.length];
        int i2 = 0;
        for (String str3 : strArr4) {
            if ("_display_name".equals(str3)) {
                strArr5[i2] = "_display_name";
                i = i2 + 1;
                objArr[i2] = fileForUri.getName();
            } else if ("_size".equals(str3)) {
                strArr5[i2] = "_size";
                i = i2 + 1;
                objArr[i2] = Long.valueOf(fileForUri.length());
            }
            i2 = i;
        }
        String[] copyOf = copyOf(strArr5, i2);
        Object[] copyOf2 = copyOf(objArr, i2);
        MatrixCursor matrixCursor = new MatrixCursor(copyOf, 1);
        matrixCursor.addRow(copyOf2);
        return matrixCursor;
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        throw new UnsupportedOperationException("No external updates");
    }
}
