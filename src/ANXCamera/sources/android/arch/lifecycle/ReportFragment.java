package android.arch.lifecycle;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.arch.lifecycle.Lifecycle.Event;
import android.os.Bundle;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;

@RestrictTo({Scope.LIBRARY_GROUP})
public class ReportFragment extends Fragment {
    private static final String REPORT_FRAGMENT_TAG = "android.arch.lifecycle.LifecycleDispatcher.report_fragment_tag";
    private ActivityInitializationListener mProcessListener;

    interface ActivityInitializationListener {
        void onCreate();

        void onResume();

        void onStart();
    }

    private void dispatch(Event event) {
        Activity activity = getActivity();
        if (activity instanceof LifecycleRegistryOwner) {
            ((LifecycleRegistryOwner) activity).getLifecycle().handleLifecycleEvent(event);
            return;
        }
        if (activity instanceof LifecycleOwner) {
            Lifecycle lifecycle = ((LifecycleOwner) activity).getLifecycle();
            if (lifecycle instanceof LifecycleRegistry) {
                ((LifecycleRegistry) lifecycle).handleLifecycleEvent(event);
            }
        }
    }

    private void dispatchCreate(ActivityInitializationListener activityInitializationListener) {
        if (activityInitializationListener != null) {
            activityInitializationListener.onCreate();
        }
    }

    private void dispatchResume(ActivityInitializationListener activityInitializationListener) {
        if (activityInitializationListener != null) {
            activityInitializationListener.onResume();
        }
    }

    private void dispatchStart(ActivityInitializationListener activityInitializationListener) {
        if (activityInitializationListener != null) {
            activityInitializationListener.onStart();
        }
    }

    static ReportFragment get(Activity activity) {
        return (ReportFragment) activity.getFragmentManager().findFragmentByTag(REPORT_FRAGMENT_TAG);
    }

    public static void injectIfNeededIn(Activity activity) {
        FragmentManager fragmentManager = activity.getFragmentManager();
        if (fragmentManager.findFragmentByTag(REPORT_FRAGMENT_TAG) == null) {
            fragmentManager.beginTransaction().add(new ReportFragment(), REPORT_FRAGMENT_TAG).commit();
            fragmentManager.executePendingTransactions();
        }
    }

    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        dispatchCreate(this.mProcessListener);
        dispatch(Event.ON_CREATE);
    }

    public void onDestroy() {
        super.onDestroy();
        dispatch(Event.ON_DESTROY);
        this.mProcessListener = null;
    }

    public void onPause() {
        super.onPause();
        dispatch(Event.ON_PAUSE);
    }

    public void onResume() {
        super.onResume();
        dispatchResume(this.mProcessListener);
        dispatch(Event.ON_RESUME);
    }

    public void onStart() {
        super.onStart();
        dispatchStart(this.mProcessListener);
        dispatch(Event.ON_START);
    }

    public void onStop() {
        super.onStop();
        dispatch(Event.ON_STOP);
    }

    /* access modifiers changed from: 0000 */
    public void setProcessListener(ActivityInitializationListener activityInitializationListener) {
        this.mProcessListener = activityInitializationListener;
    }
}
