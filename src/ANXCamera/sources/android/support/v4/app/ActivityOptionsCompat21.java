package android.support.v4.app;

import android.app.Activity;
import android.app.ActivityOptions;
import android.os.Bundle;
import android.util.Pair;
import android.view.View;

class ActivityOptionsCompat21 {
    private final ActivityOptions mActivityOptions;

    private ActivityOptionsCompat21(ActivityOptions activityOptions) {
        this.mActivityOptions = activityOptions;
    }

    public static ActivityOptionsCompat21 makeSceneTransitionAnimation(Activity activity, View view, String str) {
        return new ActivityOptionsCompat21(ActivityOptions.makeSceneTransitionAnimation(activity, view, str));
    }

    public static ActivityOptionsCompat21 makeSceneTransitionAnimation(Activity activity, View[] viewArr, String[] strArr) {
        Pair[] pairArr = null;
        if (viewArr != null) {
            pairArr = new Pair[viewArr.length];
            for (int i = 0; i < pairArr.length; i++) {
                pairArr[i] = Pair.create(viewArr[i], strArr[i]);
            }
        }
        return new ActivityOptionsCompat21(ActivityOptions.makeSceneTransitionAnimation(activity, pairArr));
    }

    public Bundle toBundle() {
        return this.mActivityOptions.toBundle();
    }

    public void update(ActivityOptionsCompat21 activityOptionsCompat21) {
        this.mActivityOptions.update(activityOptionsCompat21.mActivityOptions);
    }
}
