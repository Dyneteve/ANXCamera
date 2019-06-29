package com.android.camera.sticker;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.android.camera.log.Log;
import com.sensetime.stmobile.STMobileAuthentificationNative;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class STLicenseUtils {
    private static final String LICENSE_NAME = "SenseME.lic";
    private static final String PREF_ACTIVATE_CODE = "activate_code";
    private static final String PREF_ACTIVATE_CODE_FILE = "activate_code_file";
    private static final String TAG = "STLicenseUtils";

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0052 A[SYNTHETIC, Splitter:B:26:0x0052] */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x005c A[SYNTHETIC, Splitter:B:31:0x005c] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x0109 A[SYNTHETIC, Splitter:B:60:0x0109] */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0113 A[SYNTHETIC, Splitter:B:65:0x0113] */
    public static boolean checkLicense(Context context) {
        InputStreamReader inputStreamReader;
        BufferedReader bufferedReader;
        StringBuilder sb = new StringBuilder();
        BufferedReader bufferedReader2 = null;
        try {
            inputStreamReader = new InputStreamReader(context.getResources().getAssets().open(LICENSE_NAME));
            try {
                bufferedReader = new BufferedReader(inputStreamReader);
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine != null) {
                            sb.append(readLine);
                            sb.append("\n");
                        } else {
                            try {
                                break;
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    } catch (IOException e2) {
                        e = e2;
                        try {
                            e.printStackTrace();
                            if (inputStreamReader != null) {
                            }
                            if (bufferedReader != null) {
                            }
                            if (sb.toString().length() == 0) {
                            }
                        } catch (Throwable th) {
                            th = th;
                            bufferedReader2 = bufferedReader;
                            if (inputStreamReader != null) {
                                try {
                                    inputStreamReader.close();
                                } catch (IOException e3) {
                                    e3.printStackTrace();
                                }
                            }
                            if (bufferedReader2 != null) {
                                try {
                                    bufferedReader2.close();
                                } catch (IOException e4) {
                                    e4.printStackTrace();
                                }
                            }
                            throw th;
                        }
                    }
                }
                inputStreamReader.close();
            } catch (IOException e5) {
                e = e5;
                bufferedReader = null;
            } catch (Throwable th2) {
                th = th2;
                if (inputStreamReader != null) {
                }
                if (bufferedReader2 != null) {
                }
                throw th;
            }
            try {
                bufferedReader.close();
            } catch (IOException e6) {
                e6.printStackTrace();
            }
        } catch (IOException e7) {
            e = e7;
            inputStreamReader = null;
            bufferedReader = null;
            e.printStackTrace();
            if (inputStreamReader != null) {
                try {
                    inputStreamReader.close();
                } catch (IOException e8) {
                    e8.printStackTrace();
                }
            }
            if (bufferedReader != null) {
                bufferedReader.close();
            }
            if (sb.toString().length() == 0) {
            }
        } catch (Throwable th3) {
            th = th3;
            inputStreamReader = null;
            if (inputStreamReader != null) {
            }
            if (bufferedReader2 != null) {
            }
            throw th;
        }
        if (sb.toString().length() == 0) {
            Log.e(TAG, "read license data error");
            return false;
        }
        String sb2 = sb.toString();
        SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences(PREF_ACTIVATE_CODE_FILE, 0);
        String string = sharedPreferences.getString(PREF_ACTIVATE_CODE, null);
        Integer valueOf = Integer.valueOf(-1);
        if (string == null || STMobileAuthentificationNative.checkActiveCodeFromBuffer(sb2, sb2.length(), string) != 0) {
            String str = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("activeCode: ");
            sb3.append(string == null);
            Log.e(str, sb3.toString());
            String generateActiveCodeFromBuffer = STMobileAuthentificationNative.generateActiveCodeFromBuffer(sb2, sb2.length());
            if (generateActiveCodeFromBuffer == null || generateActiveCodeFromBuffer.length() == 0) {
                String str2 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("generate license error: ");
                sb4.append(valueOf);
                Log.e(str2, sb4.toString());
                return false;
            }
            Editor edit = sharedPreferences.edit();
            edit.putString(PREF_ACTIVATE_CODE, generateActiveCodeFromBuffer);
            edit.commit();
            return true;
        }
        String str3 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("activeCode: ");
        sb5.append(string);
        Log.e(str3, sb5.toString());
        return true;
    }
}
