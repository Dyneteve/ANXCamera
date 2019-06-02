package com.arcsoft.avatar.provider;

import android.content.UriMatcher;
import android.net.Uri;

public class AvatarProfile {
    public static final String AUTHORITY = "com.arcsoft.content.provider.avatar.content.provider";
    public static final Uri AVATAR_URI = Uri.parse("content://com.arcsoft.content.provider.avatar.content.provider/avatar_db");
    public static final String CONFIG_PATH = "config_path";
    public static final String DATABASE_NAME = "_arc_avatar.db";
    public static final int DATABASE_VERSION = 2;
    public static final int ID_AVATAR_DB = 1;
    public static final String SQL_CREATE_TABLE_AVATAR_DB = "CREATE TABLE avatar_db (_id integer primary key autoincrement,thumbnail BLOB,config_path TEXT);";
    public static final String SQL_DROP_TABLE_AVATAR_DB = "DROP TABLE IF EXISTS avatar_db";
    public static final String TABLE_NAME = "avatar_db";
    public static final String THUMBNAIL = "thumbnail";
    public static final String _ID = "_id";
    protected static final String a = "content://com.arcsoft.content.provider.avatar.content.provider/";
    public static final UriMatcher sUriMatcher = new UriMatcher(-1);

    static {
        sUriMatcher.addURI(AUTHORITY, TABLE_NAME, 1);
    }
}
