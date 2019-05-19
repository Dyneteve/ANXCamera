package com.android.camera.preferences;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Xml;
import android.view.InflateException;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.HashMap;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class PreferenceInflater {
    private static final Class<?>[] CTOR_SIGNATURE = {Context.class, AttributeSet.class};
    private static final String PACKAGE_NAME = PreferenceInflater.class.getPackage().getName();
    private static final HashMap<String, Constructor<?>> sConstructorMap = new HashMap<>();
    private Context mContext;

    public PreferenceInflater(Context context) {
        this.mContext = context;
    }

    private CameraPreference inflate(XmlPullParser xmlPullParser) {
        AttributeSet asAttributeSet = Xml.asAttributeSet(xmlPullParser);
        ArrayList arrayList = new ArrayList();
        Object[] objArr = {this.mContext, asAttributeSet};
        try {
            int next = xmlPullParser.next();
            while (next != 1) {
                if (next == 2) {
                    CameraPreference newPreference = newPreference(xmlPullParser.getName(), objArr);
                    int depth = xmlPullParser.getDepth();
                    if (depth > arrayList.size()) {
                        arrayList.add(newPreference);
                    } else {
                        arrayList.set(depth - 1, newPreference);
                    }
                    if (depth > 1) {
                        ((PreferenceGroup) arrayList.get(depth - 2)).addChild(newPreference);
                    }
                }
                next = xmlPullParser.next();
            }
            if (arrayList.size() != 0) {
                return (CameraPreference) arrayList.get(0);
            }
            throw new InflateException("No root element found");
        } catch (XmlPullParserException e) {
            throw new InflateException(e);
        } catch (IOException e2) {
            throw new InflateException(xmlPullParser.getPositionDescription(), e2);
        }
    }

    private CameraPreference newPreference(String str, Object[] objArr) {
        StringBuilder sb = new StringBuilder();
        sb.append(PACKAGE_NAME);
        sb.append(".");
        sb.append(str);
        String sb2 = sb.toString();
        Constructor constructor = (Constructor) sConstructorMap.get(sb2);
        if (constructor == null) {
            try {
                constructor = this.mContext.getClassLoader().loadClass(sb2).getConstructor(CTOR_SIGNATURE);
                sConstructorMap.put(sb2, constructor);
            } catch (NoSuchMethodException e) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Error inflating class ");
                sb3.append(sb2);
                throw new InflateException(sb3.toString(), e);
            } catch (ClassNotFoundException e2) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("No such class: ");
                sb4.append(sb2);
                throw new InflateException(sb4.toString(), e2);
            } catch (Exception e3) {
                StringBuilder sb5 = new StringBuilder();
                sb5.append("While create instance of");
                sb5.append(sb2);
                throw new InflateException(sb5.toString(), e3);
            }
        }
        return (CameraPreference) constructor.newInstance(objArr);
    }

    public CameraPreference inflate(int i) {
        return inflate((XmlPullParser) this.mContext.getResources().getXml(i));
    }
}
