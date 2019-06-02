package miui.util;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import miui.os.Build;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class FeatureParser {
    private static final String ASSET_DIR = "device_features/";
    private static final String SYSTEM_DIR = "/system/etc/device_features";
    private static final String TAG = "FeatureParser";
    private static final String TAG_BOOL = "bool";
    private static final String TAG_FLOAT = "float";
    private static final String TAG_INTEGER = "integer";
    private static final String TAG_INTEGER_ARRAY = "integer-array";
    private static final String TAG_ITEM = "item";
    private static final String TAG_STRING = "string";
    private static final String TAG_STRING_ARRAY = "string-array";
    public static final int TYPE_BOOL = 1;
    public static final int TYPE_FLOAT = 6;
    public static final int TYPE_INTEGER = 2;
    public static final int TYPE_INTEGER_ARRAY = 5;
    public static final int TYPE_STRING = 3;
    public static final int TYPE_STRING_ARRAY = 4;
    private static HashMap<String, Boolean> sBooleanMap = new HashMap<>();
    private static HashMap<String, Float> sFloatMap = new HashMap<>();
    private static HashMap<String, ArrayList<Integer>> sIntArrMap = new HashMap<>();
    private static HashMap<String, Integer> sIntMap = new HashMap<>();
    private static HashMap<String, ArrayList<String>> sStrArrMap = new HashMap<>();
    private static HashMap<String, String> sStrMap = new HashMap<>();

    static {
        read();
    }

    public static boolean getBoolean(String str, boolean z) {
        Boolean bool = (Boolean) sBooleanMap.get(str);
        return bool != null ? bool.booleanValue() : z;
    }

    public static Float getFloat(String str, float f) {
        Float f2 = (Float) sFloatMap.get(str);
        return Float.valueOf(f2 != null ? f2.floatValue() : f);
    }

    public static int[] getIntArray(String str) {
        ArrayList arrayList = (ArrayList) sIntArrMap.get(str);
        if (arrayList == null) {
            return null;
        }
        int size = arrayList.size();
        int[] iArr = new int[size];
        for (int i = 0; i < size; i++) {
            iArr[i] = ((Integer) arrayList.get(i)).intValue();
        }
        return iArr;
    }

    public static int getInteger(String str, int i) {
        Integer num = (Integer) sIntMap.get(str);
        return num != null ? num.intValue() : i;
    }

    public static String getString(String str) {
        return (String) sStrMap.get(str);
    }

    public static String[] getStringArray(String str) {
        ArrayList arrayList = (ArrayList) sStrArrMap.get(str);
        if (arrayList != null) {
            return (String[]) arrayList.toArray(new String[0]);
        }
        return null;
    }

    public static boolean hasFeature(String str, int i) {
        switch (i) {
            case 1:
                return sBooleanMap.containsKey(str);
            case 2:
                return sIntMap.containsKey(str);
            case 3:
                return sStrMap.containsKey(str);
            case 4:
                return sStrArrMap.containsKey(str);
            case 5:
                return sIntArrMap.containsKey(str);
            case 6:
                return sFloatMap.containsKey(str);
            default:
                return false;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:74:0x01b3, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x01b4, code lost:
        if (r1 != null) goto L_0x01b6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:?, code lost:
        r1.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:?, code lost:
        r1.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x01c6, code lost:
        r1.close();
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x01b3 A[ExcHandler:  FINALLY, PHI: r1 
  PHI: (r1v3 java.io.InputStream) = (r1v0 java.io.InputStream), (r1v0 java.io.InputStream), (r1v5 java.io.InputStream), (r1v0 java.io.InputStream), (r1v0 java.io.InputStream) binds: [B:1:0x0005, B:12:0x003d, B:29:0x00bb, B:17:0x005f, B:13:?] A[DONT_GENERATE, DONT_INLINE], Splitter:B:12:0x003d] */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01bc A[ExcHandler: XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), PHI: r1 
  PHI: (r1v2 java.io.InputStream) = (r1v0 java.io.InputStream), (r1v0 java.io.InputStream), (r1v5 java.io.InputStream), (r1v0 java.io.InputStream), (r1v0 java.io.InputStream) binds: [B:1:0x0005, B:12:0x003d, B:29:0x00bb, B:17:0x005f, B:13:?] A[DONT_GENERATE, DONT_INLINE], Splitter:B:1:0x0005] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void read() {
        ArrayList arrayList = null;
        boolean z = null;
        String str = null;
        try {
            z = "cancro".equals(Build.DEVICE);
            if (!z) {
                StringBuilder sb = new StringBuilder();
                sb.append(Build.DEVICE);
                sb.append(".xml");
                str = sb.toString();
            } else if (Build.MODEL.startsWith("MI 3")) {
                str = "cancro_MI3.xml";
            } else if (Build.MODEL.startsWith("MI 4")) {
                str = "cancro_MI4.xml";
            }
            AssetManager assets = Resources.getSystem().getAssets();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(ASSET_DIR);
            sb2.append(str);
            z = assets.open(sb2.toString());
        } catch (IOException e) {
            String str2 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("can't find ");
            sb3.append(str);
            sb3.append(" in assets/");
            sb3.append(ASSET_DIR);
            sb3.append(",it may be in ");
            sb3.append(SYSTEM_DIR);
            Log.i(str2, sb3.toString());
        } catch (XmlPullParserException e2) {
        } finally {
        }
        if (z == null) {
            File file = new File(SYSTEM_DIR, str);
            z = file.exists();
            if (z) {
                z = new FileInputStream(file);
            } else {
                String str3 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("both assets/device_features/ and /system/etc/device_features don't exist ");
                sb4.append(str);
                Log.e(str3, sb4.toString());
                if (z != null) {
                    try {
                        z.close();
                    } catch (IOException e3) {
                    }
                }
                return;
            }
        }
        XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
        newPullParser.setInput(z, "UTF-8");
        Object obj = null;
        ArrayList arrayList2 = null;
        for (int eventType = newPullParser.getEventType(); 1 != eventType; eventType = newPullParser.next()) {
            switch (eventType) {
                case 2:
                    String name = newPullParser.getName();
                    if (newPullParser.getAttributeCount() > 0) {
                        obj = newPullParser.getAttributeValue(0);
                    }
                    if (!TAG_INTEGER_ARRAY.equals(name)) {
                        if (!TAG_STRING_ARRAY.equals(name)) {
                            if (!TAG_BOOL.equals(name)) {
                                if (!TAG_INTEGER.equals(name)) {
                                    if (!TAG_STRING.equals(name)) {
                                        if (!TAG_FLOAT.equals(name)) {
                                            if (TAG_ITEM.equals(name)) {
                                                if (arrayList2 == null) {
                                                    if (arrayList != null) {
                                                        arrayList.add(newPullParser.nextText());
                                                        break;
                                                    }
                                                } else {
                                                    arrayList2.add(Integer.valueOf(newPullParser.nextText()));
                                                    break;
                                                }
                                            }
                                        } else {
                                            sFloatMap.put(obj, Float.valueOf(Float.parseFloat(newPullParser.nextText())));
                                            break;
                                        }
                                    } else {
                                        sStrMap.put(obj, newPullParser.nextText());
                                        break;
                                    }
                                } else {
                                    sIntMap.put(obj, Integer.valueOf(newPullParser.nextText()));
                                    break;
                                }
                            } else {
                                sBooleanMap.put(obj, Boolean.valueOf(newPullParser.nextText()));
                                break;
                            }
                        } else {
                            arrayList = new ArrayList();
                            break;
                        }
                    } else {
                        arrayList2 = new ArrayList();
                        break;
                    }
                    break;
                case 3:
                    String name2 = newPullParser.getName();
                    if (!TAG_INTEGER_ARRAY.equals(name2)) {
                        if (TAG_STRING_ARRAY.equals(name2)) {
                            sStrArrMap.put(obj, arrayList);
                            arrayList = null;
                            break;
                        }
                    } else {
                        sIntArrMap.put(obj, arrayList2);
                        arrayList2 = null;
                        break;
                    }
                    break;
            }
        }
        if (z != null) {
            try {
                z.close();
            } catch (IOException e4) {
            }
        }
        return;
    }
}
