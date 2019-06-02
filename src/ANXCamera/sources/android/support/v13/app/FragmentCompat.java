package android.support.v13.app;

import android.app.Activity;
import android.app.Fragment;
import android.content.pm.PackageManager;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import java.util.Arrays;

public class FragmentCompat {
    static final FragmentCompatImpl IMPL;

    static class BaseFragmentCompatImpl implements FragmentCompatImpl {
        BaseFragmentCompatImpl() {
        }

        public void requestPermissions(final Fragment fragment, final String[] strArr, final int i) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                public void run() {
                    int[] iArr = new int[strArr.length];
                    Activity activity = fragment.getActivity();
                    if (activity != null) {
                        PackageManager packageManager = activity.getPackageManager();
                        String packageName = activity.getPackageName();
                        int length = strArr.length;
                        for (int i = 0; i < length; i++) {
                            iArr[i] = packageManager.checkPermission(strArr[i], packageName);
                        }
                    } else {
                        Arrays.fill(iArr, -1);
                    }
                    ((OnRequestPermissionsResultCallback) fragment).onRequestPermissionsResult(i, strArr, iArr);
                }
            });
        }

        public void setMenuVisibility(Fragment fragment, boolean z) {
        }

        public void setUserVisibleHint(Fragment fragment, boolean z) {
        }

        public boolean shouldShowRequestPermissionRationale(Fragment fragment, String str) {
            return false;
        }
    }

    interface FragmentCompatImpl {
        void requestPermissions(Fragment fragment, String[] strArr, int i);

        void setMenuVisibility(Fragment fragment, boolean z);

        void setUserVisibleHint(Fragment fragment, boolean z);

        boolean shouldShowRequestPermissionRationale(Fragment fragment, String str);
    }

    static class ICSFragmentCompatImpl extends BaseFragmentCompatImpl {
        ICSFragmentCompatImpl() {
        }

        public void setMenuVisibility(Fragment fragment, boolean z) {
            FragmentCompatICS.setMenuVisibility(fragment, z);
        }
    }

    static class ICSMR1FragmentCompatImpl extends ICSFragmentCompatImpl {
        ICSMR1FragmentCompatImpl() {
        }

        public void setUserVisibleHint(Fragment fragment, boolean z) {
            FragmentCompatICSMR1.setUserVisibleHint(fragment, z);
        }
    }

    static class MncFragmentCompatImpl extends ICSMR1FragmentCompatImpl {
        MncFragmentCompatImpl() {
        }

        public void requestPermissions(Fragment fragment, String[] strArr, int i) {
            FragmentCompat23.requestPermissions(fragment, strArr, i);
        }

        public boolean shouldShowRequestPermissionRationale(Fragment fragment, String str) {
            return FragmentCompat23.shouldShowRequestPermissionRationale(fragment, str);
        }
    }

    public interface OnRequestPermissionsResultCallback {
        void onRequestPermissionsResult(int i, @NonNull String[] strArr, @NonNull int[] iArr);
    }

    static {
        if (VERSION.SDK_INT >= 23) {
            IMPL = new MncFragmentCompatImpl();
        } else if (VERSION.SDK_INT >= 15) {
            IMPL = new ICSMR1FragmentCompatImpl();
        } else if (VERSION.SDK_INT >= 14) {
            IMPL = new ICSFragmentCompatImpl();
        } else {
            IMPL = new BaseFragmentCompatImpl();
        }
    }

    public static void requestPermissions(@NonNull Fragment fragment, @NonNull String[] strArr, int i) {
        IMPL.requestPermissions(fragment, strArr, i);
    }

    public static void setMenuVisibility(Fragment fragment, boolean z) {
        IMPL.setMenuVisibility(fragment, z);
    }

    public static void setUserVisibleHint(Fragment fragment, boolean z) {
        IMPL.setUserVisibleHint(fragment, z);
    }

    public static boolean shouldShowRequestPermissionRationale(@NonNull Fragment fragment, @NonNull String str) {
        return IMPL.shouldShowRequestPermissionRationale(fragment, str);
    }
}
