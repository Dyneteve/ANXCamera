package android.support.v4.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.util.Log;
import java.util.ArrayList;

@RequiresApi(21)
class TreeDocumentFile extends DocumentFile {
    private Context mContext;
    private Uri mUri;

    TreeDocumentFile(@Nullable DocumentFile documentFile, Context context, Uri uri) {
        super(documentFile);
        this.mContext = context;
        this.mUri = uri;
    }

    private static void closeQuietly(@Nullable AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                autoCloseable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception e2) {
            }
        }
    }

    @Nullable
    private static Uri createFile(Context context, Uri uri, String str, String str2) {
        try {
            return DocumentsContract.createDocument(context.getContentResolver(), uri, str, str2);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean canRead() {
        return DocumentsContractApi19.canRead(this.mContext, this.mUri);
    }

    public boolean canWrite() {
        return DocumentsContractApi19.canWrite(this.mContext, this.mUri);
    }

    @Nullable
    public DocumentFile createDirectory(String str) {
        Uri createFile = createFile(this.mContext, this.mUri, "vnd.android.document/directory", str);
        if (createFile != null) {
            return new TreeDocumentFile(this, this.mContext, createFile);
        }
        return null;
    }

    @Nullable
    public DocumentFile createFile(String str, String str2) {
        Uri createFile = createFile(this.mContext, this.mUri, str, str2);
        if (createFile != null) {
            return new TreeDocumentFile(this, this.mContext, createFile);
        }
        return null;
    }

    public boolean delete() {
        try {
            return DocumentsContract.deleteDocument(this.mContext.getContentResolver(), this.mUri);
        } catch (Exception e) {
            return false;
        }
    }

    public boolean exists() {
        return DocumentsContractApi19.exists(this.mContext, this.mUri);
    }

    @Nullable
    public String getName() {
        return DocumentsContractApi19.getName(this.mContext, this.mUri);
    }

    @Nullable
    public String getType() {
        return DocumentsContractApi19.getType(this.mContext, this.mUri);
    }

    public Uri getUri() {
        return this.mUri;
    }

    public boolean isDirectory() {
        return DocumentsContractApi19.isDirectory(this.mContext, this.mUri);
    }

    public boolean isFile() {
        return DocumentsContractApi19.isFile(this.mContext, this.mUri);
    }

    public boolean isVirtual() {
        return DocumentsContractApi19.isVirtual(this.mContext, this.mUri);
    }

    public long lastModified() {
        return DocumentsContractApi19.lastModified(this.mContext, this.mUri);
    }

    public long length() {
        return DocumentsContractApi19.length(this.mContext, this.mUri);
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0074 A[LOOP:1: B:19:0x0071->B:21:0x0074, LOOP_END] */
    public DocumentFile[] listFiles() {
        Uri[] uriArr;
        ContentResolver contentResolver = this.mContext.getContentResolver();
        Uri buildChildDocumentsUriUsingTree = DocumentsContract.buildChildDocumentsUriUsingTree(this.mUri, DocumentsContract.getDocumentId(this.mUri));
        ArrayList arrayList = new ArrayList();
        Cursor cursor = null;
        try {
            Cursor query = contentResolver.query(buildChildDocumentsUriUsingTree, new String[]{"document_id"}, null, null, null);
            while (query.moveToNext()) {
                try {
                    arrayList.add(DocumentsContract.buildDocumentUriUsingTree(this.mUri, query.getString(0)));
                } catch (Exception e) {
                    e = e;
                    cursor = query;
                    String str = "DocumentFile";
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Failed query: ");
                        sb.append(e);
                        Log.w(str, sb.toString());
                        closeQuietly(cursor);
                        uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
                        DocumentFile[] documentFileArr = new DocumentFile[uriArr.length];
                        while (r7 < uriArr.length) {
                        }
                        return documentFileArr;
                    } catch (Throwable th) {
                        th = th;
                        closeQuietly(cursor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = query;
                    closeQuietly(cursor);
                    throw th;
                }
            }
            closeQuietly(query);
        } catch (Exception e2) {
            e = e2;
            String str2 = "DocumentFile";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str2, sb2.toString());
            closeQuietly(cursor);
            uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
            DocumentFile[] documentFileArr2 = new DocumentFile[uriArr.length];
            while (r7 < uriArr.length) {
            }
            return documentFileArr2;
        }
        uriArr = (Uri[]) arrayList.toArray(new Uri[arrayList.size()]);
        DocumentFile[] documentFileArr22 = new DocumentFile[uriArr.length];
        for (int i = 0; i < uriArr.length; i++) {
            documentFileArr22[i] = new TreeDocumentFile(this, this.mContext, uriArr[i]);
        }
        return documentFileArr22;
    }

    public boolean renameTo(String str) {
        try {
            Uri renameDocument = DocumentsContract.renameDocument(this.mContext.getContentResolver(), this.mUri, str);
            if (renameDocument == null) {
                return false;
            }
            this.mUri = renameDocument;
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
