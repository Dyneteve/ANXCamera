package com.arcsoft.camera.utils;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.location.Location;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Video;
import android.provider.MediaStore.Video.Thumbnails;
import com.android.camera.storage.Storage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* compiled from: MediaManager */
public class g {
    private static g X = null;
    public static final String a = e(t);
    private static final String[] ah = {"max(_id) as newId", "_data", "_size", "datetaken", a.e, "bucket_id", "mime_type", "date_modified", "media_type", "resolution", "tags", "width", "height", "orientation", "duration"};
    public static final Uri b = Files.getContentUri("external");
    public static final int c = 1;
    public static final int d = 3;
    public static final int e = 0;
    public static final int f = 1;
    public static final int g = 2;
    public static final int h = 3;
    public static final int i = 4;
    public static final int j = 5;
    public static final int k = 6;
    public static final int l = 7;
    public static final int m = 8;
    public static final int n = 9;
    public static final int o = 10;
    public static final int p = 11;
    public static final int q = 12;
    public static final int r = 13;
    public static final int s = 14;
    private static String t;
    private Context Z = null;
    private ContentResolver aa = null;
    private final String ab = "image/jpeg";
    private final String ac = "image/gif";
    private final String ad = "video/3gpp";
    private final String ae = "video/mp4";
    private final String[] af = {"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "duration", "resolution"};
    private final String[] ag = {"_id", "bucket_id", "bucket_display_name", "_data", "_display_name", "width", "height", "_size", "mime_type", "datetaken", "date_modified", "date_added", "latitude", "longitude", "orientation"};

    /* compiled from: MediaManager */
    private static final class a {
        public static final String a = "_id";
        public static final String b = "_data";
        public static final String c = "_size";
        public static final String d = "datetaken";
        public static final String e;
        public static final String f = "bucket_id";
        public static final String g = "mime_type";
        public static final String h = "date_modified";
        public static final String i = "latitude";
        public static final String j = "longitude";
        public static final String k = "orientation";
        public static final String l = "media_type";
        public static final String m = "duration";
        public static final String n = "resolution";
        public static final String o = "tags";
        public static final String p = "width";
        public static final String q = "height";
        public static final String r = "title";
        public static final String s = "_display_name";

        static {
            StringBuilder sb = new StringBuilder();
            sb.append("case media_type when 1 then \"");
            sb.append(Media.EXTERNAL_CONTENT_URI);
            sb.append("\" else \"");
            sb.append(Video.Media.EXTERNAL_CONTENT_URI);
            sb.append("\" end");
            e = sb.toString();
        }

        private a() {
        }
    }

    /* compiled from: MediaManager */
    public static class b {
        /* access modifiers changed from: private */
        public boolean a;
        /* access modifiers changed from: private */
        public Uri b;
        /* access modifiers changed from: private */
        public long c;
        /* access modifiers changed from: private */
        public long d;
        /* access modifiers changed from: private */
        public String e;
        /* access modifiers changed from: private */
        public String f;
        /* access modifiers changed from: private */
        public String g;
        /* access modifiers changed from: private */
        public int h;
        /* access modifiers changed from: private */
        public int i;
        /* access modifiers changed from: private */
        public long j;
        /* access modifiers changed from: private */
        public String k;
        /* access modifiers changed from: private */
        public String l;
        /* access modifiers changed from: private */
        public String m;
        /* access modifiers changed from: private */
        public String n;
        /* access modifiers changed from: private */
        public double o;
        /* access modifiers changed from: private */
        public double p;
        /* access modifiers changed from: private */
        public int q;
        /* access modifiers changed from: private */
        public long r;
        /* access modifiers changed from: private */
        public String s;
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(Environment.getExternalStorageDirectory().toString());
        sb.append("/DCIM/WideSelfie/");
        t = sb.toString();
    }

    private g(Context context) {
        this.Z = context;
        this.aa = this.Z.getContentResolver();
    }

    public static Cursor a(ContentResolver contentResolver) {
        String[] strArr = {String.valueOf(1), String.valueOf(3), a};
        return contentResolver.query(b, ah, "(media_type=? or media_type=?) and bucket_id=? ", strArr, "_id DESC");
    }

    private static Uri a(Cursor cursor) {
        return ContentUris.withAppendedId(Uri.parse(cursor.getString(4)), cursor.getLong(0));
    }

    public static g a(Context context) {
        if (X == null) {
            synchronized (g.class) {
                if (X == null) {
                    X = new g(context);
                }
            }
        }
        return X;
    }

    private b b(Cursor cursor, boolean z) {
        if (cursor == null || cursor.getCount() <= 0) {
            return null;
        }
        b bVar = new b();
        bVar.a = z;
        if (z) {
            bVar.c = cursor.getLong(e.b(this.af, "_id"));
            bVar.b = ContentUris.withAppendedId(Video.Media.EXTERNAL_CONTENT_URI, bVar.c);
            bVar.d = (long) cursor.getInt(e.b(this.af, "bucket_id"));
            bVar.e = cursor.getString(e.b(this.af, "bucket_display_name"));
            bVar.f = cursor.getString(e.b(this.af, "_data"));
            bVar.g = cursor.getString(e.b(this.af, "_display_name"));
            bVar.h = cursor.getInt(e.b(this.af, "width"));
            bVar.i = cursor.getInt(e.b(this.af, "height"));
            bVar.j = cursor.getLong(e.b(this.af, "_size"));
            bVar.k = cursor.getString(e.b(this.af, "mime_type"));
            bVar.l = cursor.getString(e.b(this.af, "datetaken"));
            bVar.m = cursor.getString(e.b(this.af, "date_modified"));
            bVar.n = cursor.getString(e.b(this.af, "date_added"));
            bVar.o = cursor.getDouble(e.b(this.af, "latitude"));
            bVar.p = cursor.getDouble(e.b(this.af, "longitude"));
            bVar.r = cursor.getLong(e.b(this.af, "duration"));
            bVar.s = cursor.getString(e.b(this.af, "resolution"));
        } else {
            bVar.c = cursor.getLong(e.b(this.ag, "_id"));
            bVar.b = ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, bVar.c);
            bVar.d = (long) cursor.getInt(e.b(this.ag, "bucket_id"));
            bVar.e = cursor.getString(e.b(this.ag, "bucket_display_name"));
            bVar.f = cursor.getString(e.b(this.ag, "_data"));
            bVar.g = cursor.getString(e.b(this.ag, "_display_name"));
            bVar.h = cursor.getInt(e.b(this.ag, "width"));
            bVar.i = cursor.getInt(e.b(this.ag, "height"));
            bVar.j = cursor.getLong(e.b(this.ag, "_size"));
            bVar.k = cursor.getString(e.b(this.ag, "mime_type"));
            bVar.l = cursor.getString(e.b(this.ag, "datetaken"));
            bVar.m = cursor.getString(e.b(this.ag, "date_modified"));
            bVar.n = cursor.getString(e.b(this.ag, "date_added"));
            bVar.o = cursor.getDouble(e.b(this.ag, "latitude"));
            bVar.p = cursor.getDouble(e.b(this.ag, "longitude"));
            bVar.q = cursor.getInt(e.b(this.ag, "orientation"));
        }
        return bVar;
    }

    private static String e(String str) {
        return String.valueOf(str.substring(0, str.lastIndexOf("/")).toLowerCase().hashCode());
    }

    private String h(String str) {
        String substring = str.substring(str.lastIndexOf(46));
        return (Storage.JPEG_SUFFIX.equalsIgnoreCase(substring) || ".jpeg".equalsIgnoreCase(substring)) ? "image/jpeg" : ".gif".equalsIgnoreCase(substring) ? "image/gif" : (".3gp".equalsIgnoreCase(substring) || ".3gpp".equalsIgnoreCase(substring)) ? "video/3gpp" : ".mp4".equalsIgnoreCase(substring) ? "video/mp4" : "";
    }

    public Bitmap a(String str, float f2) {
        if (str == null) {
            str = a();
        }
        if (str == null) {
            return null;
        }
        Options options = new Options();
        options.inJustDecodeBounds = false;
        int i2 = (int) (((float) options.outHeight) / f2);
        if (i2 <= 0) {
            i2 = 1;
        }
        options.inSampleSize = i2;
        return BitmapFactory.decodeFile(str, options);
    }

    public Bitmap a(String str, Options options) {
        b j2 = j(str);
        if (j2 == null) {
            int i2 = 20;
            while (i2 > 0) {
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e2) {
                    e2.printStackTrace();
                }
                b j3 = j(str);
                if (j3 != null) {
                    j2 = j3;
                } else {
                    i2--;
                }
            }
            return null;
        }
        return j2.a ? Thumbnails.getThumbnail(this.aa, j2.c, 3, options) : Images.Thumbnails.getThumbnail(this.aa, j2.c, 3, options);
    }

    public Uri a(String str, int i2, int i3) {
        return a(str, i2, i3, null, 0);
    }

    public Uri a(String str, int i2, int i3, int i4) {
        return a(str, i2, i3, null, i4);
    }

    public Uri a(String str, int i2, int i3, Location location) {
        return a(str, i2, i3, location, 0);
    }

    public Uri a(String str, int i2, int i3, Location location, int i4) {
        a.isVideoFile(str);
        String h2 = h(str);
        File file = new File(str);
        String name = file.getName();
        String substring = name.substring(0, name.lastIndexOf("."));
        ContentValues contentValues = new ContentValues();
        contentValues.put("_data", file.getPath());
        contentValues.put("_display_name", name);
        contentValues.put("title", substring);
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        contentValues.put("_size", Long.valueOf(file.length()));
        contentValues.put("mime_type", h2);
        contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        contentValues.put("orientation", Integer.valueOf(i4));
        Uri insert = this.aa.insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        String str2 = "android.hardware.action.NEW_PICTURE";
        if (VERSION.SDK_INT >= 14) {
            this.Z.sendBroadcast(new Intent(str2, insert));
        }
        return insert;
    }

    public String a() {
        String str;
        Cursor a2 = a(this.aa);
        if (a2 == null || a2.getCount() <= 0) {
            str = null;
        } else {
            a2.moveToFirst();
            str = a2.getString(1);
        }
        if (a2 != null) {
            a2.close();
        }
        return str;
    }

    public List<b> a(String str, boolean z) {
        Cursor cursor;
        if (str == null) {
            return Collections.emptyList();
        }
        if (str.endsWith(File.separator)) {
            str = str.substring(0, str.length() - 1);
        }
        int lastIndexOf = str.lastIndexOf(File.separator);
        if (-1 != lastIndexOf) {
            str = str.substring(lastIndexOf + 1);
        }
        if (z) {
            String[] strArr = {str};
            cursor = this.aa.query(Video.Media.EXTERNAL_CONTENT_URI, this.af, "bucket_display_name=?", strArr, "_id ASC");
        } else {
            String[] strArr2 = {str};
            cursor = this.aa.query(Media.EXTERNAL_CONTENT_URI, this.ag, "bucket_display_name=?", strArr2, "_id ASC");
        }
        ArrayList arrayList = null;
        if (cursor != null && cursor.getCount() > 0) {
            arrayList = new ArrayList();
            cursor.moveToFirst();
            while (!cursor.isAfterLast()) {
                arrayList.add(b(cursor, z));
                cursor.moveToNext();
            }
        }
        if (cursor != null) {
            cursor.close();
        }
        return arrayList;
    }

    public boolean b(String str) {
        b j2 = j(str);
        return j2 != null && this.aa.delete(j2.b, null, null) > 0;
    }

    public Uri f() {
        Uri uri;
        Cursor a2 = a(this.aa);
        if (a2 == null || a2.getCount() <= 0) {
            uri = null;
        } else {
            a2.moveToFirst();
            uri = a(a2);
        }
        if (a2 != null) {
            a2.close();
        }
        return uri;
    }

    public b j(String str) {
        Cursor cursor;
        b bVar = null;
        if (str == null) {
            return null;
        }
        boolean isVideoFile = a.isVideoFile(str);
        if (isVideoFile) {
            String[] strArr = {str};
            cursor = this.aa.query(Video.Media.EXTERNAL_CONTENT_URI, this.af, "_data=?", strArr, "_id DESC");
        } else {
            String[] strArr2 = {str};
            cursor = this.aa.query(Media.EXTERNAL_CONTENT_URI, this.ag, "_data=?", strArr2, "_id DESC");
        }
        if (cursor != null && cursor.getCount() > 0) {
            cursor.moveToFirst();
            bVar = b(cursor, isVideoFile);
        }
        if (cursor != null) {
            cursor.close();
        }
        return bVar;
    }

    public boolean j(String str, String str2) {
        String str3;
        b j2 = j(str);
        if (j2 == null) {
            return false;
        }
        int lastIndexOf = str2.lastIndexOf(File.separator);
        if (-1 != lastIndexOf) {
            str2 = str2.substring(lastIndexOf + 1);
        }
        int lastIndexOf2 = str2.lastIndexOf(".");
        if (-1 != lastIndexOf2) {
            String str4 = str2;
            str2 = str2.substring(0, lastIndexOf2);
            str3 = str4;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(".");
            sb.append(a.getExtension(str));
            str3 = sb.toString();
        }
        ContentValues contentValues = new ContentValues();
        if (j2.a) {
            contentValues.put("_display_name", str3);
            contentValues.put("title", str2);
        } else {
            contentValues.put("_display_name", str3);
            contentValues.put("title", str2);
        }
        return this.aa.update(j2.b, contentValues, null, null) > 0;
    }

    public int k(String str) {
        int i2 = 0;
        try {
            int attributeInt = new ExifInterface(str).getAttributeInt("Orientation", 1);
            if (attributeInt == 3) {
                i2 = 180;
            } else if (attributeInt == 6) {
                i2 = 90;
            } else if (attributeInt == 8) {
                i2 = 270;
            }
            return i2;
        } catch (IOException e2) {
            e2.printStackTrace();
            return 0;
        }
    }
}
