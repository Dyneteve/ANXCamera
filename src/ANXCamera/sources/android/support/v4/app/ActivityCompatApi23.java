package android.support.v4.app;

import android.app.Activity;

/* compiled from: ActivityCompat23 */
class ActivityCompatApi23 {

    /* compiled from: ActivityCompat23 */
    public interface RequestPermissionsRequestCodeValidator {
        void validateRequestPermissionsRequestCode(int i);
    }

    ActivityCompatApi23() {
    }

    public static void requestPermissions(Activity activity, String[] strArr, int i) {
        if (activity instanceof RequestPermissionsRequestCodeValidator) {
            ((RequestPermissionsRequestCodeValidator) activity).validateRequestPermissionsRequestCode(i);
        }
        activity.requestPermissions(strArr, i);
    }

    public static boolean shouldShowRequestPermissionRationale(Activity activity, String str) {
        return activity.shouldShowRequestPermissionRationale(str);
    }
}
