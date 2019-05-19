package com.ss.android.vesdk.runtime.persistence;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.annotation.NonNull;
import java.util.Map;

public class VESP {
    private Editor editor;
    private SharedPreferences sharedPreferences;

    private enum VESPSingleton {
        INSTANCE;
        
        private VESP mInstance;

        public VESP getInstance() {
            return this.mInstance;
        }
    }

    private VESP() {
    }

    public static VESP getInstance() {
        return VESPSingleton.INSTANCE.getInstance();
    }

    public void clear() {
        this.editor.clear();
        this.editor.commit();
    }

    public boolean contain(@NonNull String str) {
        return this.sharedPreferences.contains(str);
    }

    public Object get(@NonNull String str, @NonNull Object obj) {
        return obj instanceof String ? this.sharedPreferences.getString(str, (String) obj) : obj instanceof Integer ? Integer.valueOf(this.sharedPreferences.getInt(str, ((Integer) obj).intValue())) : obj instanceof Boolean ? Boolean.valueOf(this.sharedPreferences.getBoolean(str, ((Boolean) obj).booleanValue())) : obj instanceof Float ? Float.valueOf(this.sharedPreferences.getFloat(str, ((Float) obj).floatValue())) : obj instanceof Long ? Long.valueOf(this.sharedPreferences.getLong(str, ((Long) obj).longValue())) : this.sharedPreferences.getString(str, null);
    }

    public Map<String, ?> getAll() {
        return this.sharedPreferences.getAll();
    }

    public void init(Context context) {
        this.sharedPreferences = context.getSharedPreferences(context.getPackageName(), 0);
        this.editor = this.sharedPreferences.edit();
    }

    public void put(@NonNull String str, @NonNull Object obj) {
        if (obj instanceof String) {
            this.editor.putString(str, (String) obj);
        } else if (obj instanceof Integer) {
            this.editor.putInt(str, ((Integer) obj).intValue());
        } else if (obj instanceof Boolean) {
            this.editor.putBoolean(str, ((Boolean) obj).booleanValue());
        } else if (obj instanceof Float) {
            this.editor.putFloat(str, ((Float) obj).floatValue());
        } else if (obj instanceof Long) {
            this.editor.putLong(str, ((Long) obj).longValue());
        } else {
            this.editor.putString(str, obj.toString());
        }
        this.editor.commit();
    }

    public void remove(@NonNull String str) {
        this.editor.remove(str);
        this.editor.commit();
    }
}
