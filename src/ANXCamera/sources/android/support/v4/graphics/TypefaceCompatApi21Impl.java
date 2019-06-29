package android.support.v4.graphics;

import android.content.Context;
import android.graphics.Typeface;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.provider.FontsContractCompat.FontInfo;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@RequiresApi(21)
@RestrictTo({Scope.LIBRARY_GROUP})
class TypefaceCompatApi21Impl extends TypefaceCompatBaseImpl {
    private static final String TAG = "TypefaceCompatApi21Impl";

    TypefaceCompatApi21Impl() {
    }

    private File getFile(ParcelFileDescriptor parcelFileDescriptor) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("/proc/self/fd/");
            sb.append(parcelFileDescriptor.getFd());
            String readlink = Os.readlink(sb.toString());
            if (OsConstants.S_ISREG(Os.stat(readlink).st_mode)) {
                return new File(readlink);
            }
            return null;
        } catch (ErrnoException e) {
            return null;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:42:0x005f, code lost:
        r5 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0060, code lost:
        r7 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x0064, code lost:
        r7 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x0065, code lost:
        r3 = r7;
        r7 = r5;
        r5 = r3;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x005f A[ExcHandler: all (th java.lang.Throwable), Splitter:B:6:0x001a] */
    public Typeface createFromFontInfo(Context context, CancellationSignal cancellationSignal, @NonNull FontInfo[] fontInfoArr, int i) {
        ParcelFileDescriptor openFileDescriptor;
        Throwable th;
        Throwable th2;
        FileInputStream fileInputStream;
        Throwable th3;
        Throwable th4;
        if (fontInfoArr.length < 1) {
            return null;
        }
        FontInfo findBestInfo = findBestInfo(fontInfoArr, i);
        try {
            openFileDescriptor = context.getContentResolver().openFileDescriptor(findBestInfo.getUri(), "r", cancellationSignal);
            try {
                File file = getFile(openFileDescriptor);
                if (file != null) {
                    if (file.canRead()) {
                        Typeface createFromFile = Typeface.createFromFile(file);
                        if (openFileDescriptor != null) {
                            openFileDescriptor.close();
                        }
                        return createFromFile;
                    }
                }
                fileInputStream = new FileInputStream(openFileDescriptor.getFileDescriptor());
                try {
                    Typeface createFromInputStream = super.createFromInputStream(context, fileInputStream);
                    fileInputStream.close();
                    if (openFileDescriptor != null) {
                        openFileDescriptor.close();
                    }
                    return createFromInputStream;
                } catch (Throwable th5) {
                    Throwable th6 = th5;
                    th3 = r5;
                    th4 = th6;
                }
            } catch (Throwable th7) {
            }
        } catch (IOException e) {
            return null;
        }
        if (th3 != null) {
            fileInputStream.close();
        } else {
            fileInputStream.close();
        }
        throw th4;
        throw th2;
        if (openFileDescriptor != null) {
            if (th != null) {
                try {
                    openFileDescriptor.close();
                } catch (Throwable th8) {
                    th.addSuppressed(th8);
                }
            } else {
                openFileDescriptor.close();
            }
        }
        throw th2;
        throw th4;
    }
}
