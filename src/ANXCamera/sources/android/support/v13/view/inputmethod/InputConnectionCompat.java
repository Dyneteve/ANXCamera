package android.support.v13.view.inputmethod;

import android.content.ClipDescription;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputContentInfo;

public final class InputConnectionCompat {
    private static final String COMMIT_CONTENT_ACTION = "android.support.v13.view.inputmethod.InputConnectionCompat.COMMIT_CONTENT";
    private static final String COMMIT_CONTENT_CONTENT_URI_KEY = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_URI";
    private static final String COMMIT_CONTENT_DESCRIPTION_KEY = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_DESCRIPTION";
    private static final String COMMIT_CONTENT_FLAGS_KEY = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_FLAGS";
    private static final String COMMIT_CONTENT_LINK_URI_KEY = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_LINK_URI";
    private static final String COMMIT_CONTENT_OPTS_KEY = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_OPTS";
    private static final String COMMIT_CONTENT_RESULT_RECEIVER = "android.support.v13.view.inputmethod.InputConnectionCompat.CONTENT_RESULT_RECEIVER";
    public static final int INPUT_CONTENT_GRANT_READ_URI_PERMISSION = 1;

    public interface OnCommitContentListener {
        boolean onCommitContent(InputContentInfoCompat inputContentInfoCompat, int i, Bundle bundle);
    }

    public static boolean commitContent(@NonNull InputConnection inputConnection, @NonNull EditorInfo editorInfo, @NonNull InputContentInfoCompat inputContentInfoCompat, int i, @Nullable Bundle bundle) {
        boolean z;
        ClipDescription description = inputContentInfoCompat.getDescription();
        String[] contentMimeTypes = EditorInfoCompat.getContentMimeTypes(editorInfo);
        int length = contentMimeTypes.length;
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                z = false;
                break;
            } else if (description.hasMimeType(contentMimeTypes[i2])) {
                z = true;
                break;
            } else {
                i2++;
            }
        }
        if (!z) {
            return false;
        }
        if (VERSION.SDK_INT >= 25) {
            return inputConnection.commitContent((InputContentInfo) inputContentInfoCompat.unwrap(), i, bundle);
        }
        Bundle bundle2 = new Bundle();
        bundle2.putParcelable(COMMIT_CONTENT_CONTENT_URI_KEY, inputContentInfoCompat.getContentUri());
        bundle2.putParcelable(COMMIT_CONTENT_DESCRIPTION_KEY, inputContentInfoCompat.getDescription());
        bundle2.putParcelable(COMMIT_CONTENT_LINK_URI_KEY, inputContentInfoCompat.getLinkUri());
        bundle2.putInt(COMMIT_CONTENT_FLAGS_KEY, i);
        bundle2.putParcelable(COMMIT_CONTENT_OPTS_KEY, bundle);
        return inputConnection.performPrivateCommand(COMMIT_CONTENT_ACTION, bundle2);
    }

    @NonNull
    public static InputConnection createWrapper(@NonNull InputConnection inputConnection, @NonNull EditorInfo editorInfo, @NonNull final OnCommitContentListener onCommitContentListener) {
        if (inputConnection == null) {
            throw new IllegalArgumentException("inputConnection must be non-null");
        } else if (editorInfo == null) {
            throw new IllegalArgumentException("editorInfo must be non-null");
        } else if (onCommitContentListener != null) {
            return VERSION.SDK_INT >= 25 ? new InputConnectionWrapper(inputConnection, false) {
                public boolean commitContent(InputContentInfo inputContentInfo, int i, Bundle bundle) {
                    if (onCommitContentListener.onCommitContent(InputContentInfoCompat.wrap(inputContentInfo), i, bundle)) {
                        return true;
                    }
                    return super.commitContent(inputContentInfo, i, bundle);
                }
            } : EditorInfoCompat.getContentMimeTypes(editorInfo).length == 0 ? inputConnection : new InputConnectionWrapper(inputConnection, false) {
                public boolean performPrivateCommand(String str, Bundle bundle) {
                    if (InputConnectionCompat.handlePerformPrivateCommand(str, bundle, onCommitContentListener)) {
                        return true;
                    }
                    return super.performPrivateCommand(str, bundle);
                }
            };
        } else {
            throw new IllegalArgumentException("onCommitContentListener must be non-null");
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0053  */
    static boolean handlePerformPrivateCommand(@Nullable String str, @NonNull Bundle bundle, @NonNull OnCommitContentListener onCommitContentListener) {
        ResultReceiver resultReceiver;
        if (!TextUtils.equals(COMMIT_CONTENT_ACTION, str) || bundle == null) {
            return false;
        }
        try {
            resultReceiver = (ResultReceiver) bundle.getParcelable(COMMIT_CONTENT_RESULT_RECEIVER);
            try {
                Uri uri = (Uri) bundle.getParcelable(COMMIT_CONTENT_CONTENT_URI_KEY);
                ClipDescription clipDescription = (ClipDescription) bundle.getParcelable(COMMIT_CONTENT_DESCRIPTION_KEY);
                Uri uri2 = (Uri) bundle.getParcelable(COMMIT_CONTENT_LINK_URI_KEY);
                boolean onCommitContent = onCommitContentListener.onCommitContent(new InputContentInfoCompat(uri, clipDescription, uri2), bundle.getInt(COMMIT_CONTENT_FLAGS_KEY), (Bundle) bundle.getParcelable(COMMIT_CONTENT_OPTS_KEY));
                if (resultReceiver != null) {
                    resultReceiver.send(onCommitContent ? 1 : 0, null);
                }
                return onCommitContent;
            } catch (Throwable th) {
                th = th;
                if (resultReceiver != null) {
                    resultReceiver.send(0, null);
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            resultReceiver = null;
            if (resultReceiver != null) {
            }
            throw th;
        }
    }
}
