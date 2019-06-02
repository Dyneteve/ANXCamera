package android.support.v13.app;

import android.app.Fragment;

class FragmentCompat23 {
    FragmentCompat23() {
    }

    public static void requestPermissions(Fragment fragment, String[] strArr, int i) {
        fragment.requestPermissions(strArr, i);
    }

    public static boolean shouldShowRequestPermissionRationale(Fragment fragment, String str) {
        return fragment.shouldShowRequestPermissionRationale(str);
    }
}
