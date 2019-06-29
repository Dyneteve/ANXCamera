package com.android.camera.preferences;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.TypedValue;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ListPreference extends CameraPreference {
    private static final String TAG = "ListPreference";
    private final CharSequence[] mDefaultValues;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private final boolean mHasPopup;
    private final String mKey;
    private String mValue;

    public ListPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ListPreference, 0, 0);
        this.mKey = (String) Util.checkNotNull(obtainStyledAttributes.getString(0));
        String string = obtainStyledAttributes.getString(4);
        this.mHasPopup = string == null ? false : Boolean.valueOf(string).booleanValue();
        TypedValue peekValue = obtainStyledAttributes.peekValue(1);
        if (peekValue == null || peekValue.type != 1) {
            this.mDefaultValues = new CharSequence[1];
            this.mDefaultValues[0] = obtainStyledAttributes.getString(1);
        } else {
            this.mDefaultValues = obtainStyledAttributes.getTextArray(1);
        }
        setEntries(obtainStyledAttributes.getTextArray(3));
        setEntryValues(obtainStyledAttributes.getTextArray(2));
        obtainStyledAttributes.recycle();
    }

    public void filterUnsupported(List<String> list) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int length = this.mEntryValues.length;
        for (int i = 0; i < length; i++) {
            if (list.indexOf(this.mEntryValues[i].toString()) >= 0) {
                arrayList.add(this.mEntries[i]);
                arrayList2.add(this.mEntryValues[i]);
            }
        }
        int size = arrayList.size();
        this.mEntries = (CharSequence[]) arrayList.toArray(new CharSequence[size]);
        this.mEntryValues = (CharSequence[]) arrayList2.toArray(new CharSequence[size]);
    }

    public void filterValue() {
        if (findIndexOfValue(getValue()) < 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("filterValue index < 0, value=");
            sb.append(getValue());
            Log.e(str, sb.toString());
            print();
            setValueIndex(0);
        }
    }

    public int findIndexOfValue(String str) {
        int length = this.mEntryValues.length;
        for (int i = 0; i < length; i++) {
            if (Util.equals(this.mEntryValues[i], str)) {
                return i;
            }
        }
        return -1;
    }

    public String findSupportedDefaultValue() {
        for (int i = 0; i < this.mDefaultValues.length; i++) {
            for (CharSequence equals : this.mEntryValues) {
                if (equals.equals(this.mDefaultValues[i])) {
                    return this.mDefaultValues[i].toString();
                }
            }
        }
        return null;
    }

    public CharSequence[] getEntries() {
        return this.mEntries;
    }

    public String getEntry() {
        int findIndexOfValue = findIndexOfValue(getValue());
        if (findIndexOfValue < 0) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getEntry index=");
            sb.append(findIndexOfValue);
            Log.e(str, sb.toString());
            print();
            setValue(findSupportedDefaultValue());
            findIndexOfValue = findIndexOfValue(getValue());
        }
        return this.mEntries[findIndexOfValue].toString();
    }

    public CharSequence[] getEntryValues() {
        return this.mEntryValues;
    }

    public String getKey() {
        return this.mKey;
    }

    public String getValue() {
        this.mValue = getSharedPreferences().getString(this.mKey, findSupportedDefaultValue());
        return this.mValue;
    }

    public boolean hasPopup() {
        return this.mHasPopup;
    }

    public boolean isDefaultValue() {
        String findSupportedDefaultValue = findSupportedDefaultValue();
        this.mValue = getSharedPreferences().getString(this.mKey, findSupportedDefaultValue);
        return Objects.equals(findSupportedDefaultValue, this.mValue);
    }

    /* access modifiers changed from: protected */
    public void persistStringValue(String str) {
        Editor edit = getSharedPreferences().edit();
        edit.putString(this.mKey, str);
        edit.apply();
    }

    public void print() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Preference key=");
        sb.append(getKey());
        sb.append(". value=");
        sb.append(getValue());
        Log.v(str, sb.toString());
        for (int i = 0; i < this.mEntryValues.length; i++) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("entryValues[");
            sb2.append(i);
            sb2.append("]=");
            sb2.append(this.mEntryValues[i]);
            Log.v(str2, sb2.toString());
        }
        for (int i2 = 0; i2 < this.mEntries.length; i2++) {
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("mEntries[");
            sb3.append(i2);
            sb3.append("]=");
            sb3.append(this.mEntries[i2]);
            Log.v(str3, sb3.toString());
        }
        for (int i3 = 0; i3 < this.mDefaultValues.length; i3++) {
            String str4 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("mDefaultValues[");
            sb4.append(i3);
            sb4.append("]=");
            sb4.append(this.mDefaultValues[i3]);
            Log.v(str4, sb4.toString());
        }
    }

    public void setEntries(CharSequence[] charSequenceArr) {
        if (charSequenceArr == null) {
            charSequenceArr = new CharSequence[0];
        }
        this.mEntries = charSequenceArr;
    }

    public void setEntryValues(int i) {
        setEntryValues(this.mContext.getResources().getTextArray(i));
    }

    public void setEntryValues(CharSequence[] charSequenceArr) {
        if (charSequenceArr == null) {
            charSequenceArr = new CharSequence[0];
        }
        this.mEntryValues = charSequenceArr;
    }

    public void setValue(String str) {
        if (findIndexOfValue(str) >= 0) {
            this.mValue = str;
            persistStringValue(str);
            return;
        }
        throw new IllegalArgumentException();
    }

    public void setValueIndex(int i) {
        setValue(this.mEntryValues[i].toString());
    }
}
