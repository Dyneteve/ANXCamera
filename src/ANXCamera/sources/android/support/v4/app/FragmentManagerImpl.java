package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.support.v4.app.BackStackRecord.TransitionState;
import android.support.v4.app.Fragment.SavedState;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentManager.OnBackStackChangedListener;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: FragmentManager */
final class FragmentManagerImpl extends FragmentManager implements LayoutInflaterFactory {
    static final Interpolator ACCELERATE_CUBIC = new AccelerateInterpolator(1.5f);
    static final Interpolator ACCELERATE_QUINT = new AccelerateInterpolator(2.5f);
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC = new DecelerateInterpolator(1.5f);
    static final Interpolator DECELERATE_QUINT = new DecelerateInterpolator(2.5f);
    static final boolean HONEYCOMB;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    ArrayList<Fragment> mActive;
    ArrayList<Fragment> mAdded;
    ArrayList<Integer> mAvailBackStackIndices;
    ArrayList<Integer> mAvailIndices;
    ArrayList<BackStackRecord> mBackStack;
    ArrayList<OnBackStackChangedListener> mBackStackChangeListeners;
    ArrayList<BackStackRecord> mBackStackIndices;
    FragmentContainer mContainer;
    FragmentController mController;
    ArrayList<Fragment> mCreatedMenus;
    int mCurState = 0;
    boolean mDestroyed;
    Runnable mExecCommit = new Runnable() {
        public void run() {
            FragmentManagerImpl.this.execPendingActions();
        }
    };
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    FragmentHostCallback mHost;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    Fragment mParent;
    ArrayList<Runnable> mPendingActions;
    SparseArray<Parcelable> mStateArray = null;
    Bundle mStateBundle = null;
    boolean mStateSaved;
    Runnable[] mTmpActions;

    /* compiled from: FragmentManager */
    static class AnimateOnHWLayerIfNeededListener implements AnimationListener {
        private boolean mShouldRunOnHWLayer = false;
        private View mView;

        public AnimateOnHWLayerIfNeededListener(View view, Animation animation) {
            if (view != null && animation != null) {
                this.mView = view;
            }
        }

        @CallSuper
        public void onAnimationEnd(Animation animation) {
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 0, null);
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }

        @CallSuper
        public void onAnimationStart(Animation animation) {
            this.mShouldRunOnHWLayer = FragmentManagerImpl.shouldRunOnHWLayer(this.mView, animation);
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 2, null);
            }
        }
    }

    /* compiled from: FragmentManager */
    static class FragmentTag {
        public static final int[] Fragment = {16842755, 16842960, 16842961};
        public static final int Fragment_id = 1;
        public static final int Fragment_name = 0;
        public static final int Fragment_tag = 2;

        FragmentTag() {
        }
    }

    static {
        boolean z = false;
        if (VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
    }

    FragmentManagerImpl() {
    }

    private void checkStateLoss() {
        if (this.mStateSaved) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        } else if (this.mNoTransactionsBecause != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Can not perform this action inside of ");
            sb.append(this.mNoTransactionsBecause);
            throw new IllegalStateException(sb.toString());
        }
    }

    static Animation makeFadeAnimation(Context context, float f, float f2) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(f, f2);
        alphaAnimation.setInterpolator(DECELERATE_CUBIC);
        alphaAnimation.setDuration(220);
        return alphaAnimation;
    }

    static Animation makeOpenCloseAnimation(Context context, float f, float f2, float f3, float f4) {
        AnimationSet animationSet = new AnimationSet(false);
        ScaleAnimation scaleAnimation = new ScaleAnimation(f, f2, f, f2, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setInterpolator(DECELERATE_QUINT);
        scaleAnimation.setDuration(220);
        animationSet.addAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(f3, f4);
        alphaAnimation.setInterpolator(DECELERATE_CUBIC);
        alphaAnimation.setDuration(220);
        animationSet.addAnimation(alphaAnimation);
        return animationSet;
    }

    static boolean modifiesAlpha(Animation animation) {
        if (animation instanceof AlphaAnimation) {
            return true;
        }
        if (animation instanceof AnimationSet) {
            List animations = ((AnimationSet) animation).getAnimations();
            for (int i = 0; i < animations.size(); i++) {
                if (animations.get(i) instanceof AlphaAnimation) {
                    return true;
                }
            }
        }
        return false;
    }

    public static int reverseTransit(int i) {
        if (i == 4097) {
            return 8194;
        }
        if (i != 4099) {
            return i != 8194 ? 0 : 4097;
        }
        return 4099;
    }

    private void setHWLayerAnimListenerIfAlpha(View view, Animation animation) {
        if (!(view == null || animation == null || !shouldRunOnHWLayer(view, animation))) {
            animation.setAnimationListener(new AnimateOnHWLayerIfNeededListener(view, animation));
        }
    }

    static boolean shouldRunOnHWLayer(View view, Animation animation) {
        return VERSION.SDK_INT >= 16 && ViewCompat.getLayerType(view) == 0 && ViewCompat.hasOverlappingRendering(view) && modifiesAlpha(animation);
    }

    private void throwException(RuntimeException runtimeException) {
        Log.e(TAG, runtimeException.getMessage());
        Log.e(TAG, "Activity state:");
        PrintWriter printWriter = new PrintWriter(new LogWriter(TAG));
        if (this.mHost != null) {
            try {
                this.mHost.onDump("  ", null, printWriter, new String[0]);
            } catch (Exception e) {
                Log.e(TAG, "Failed dumping state", e);
            }
        } else {
            try {
                dump("  ", null, printWriter, new String[0]);
            } catch (Exception e2) {
                Log.e(TAG, "Failed dumping state", e2);
            }
        }
        throw runtimeException;
    }

    public static int transitToStyleIndex(int i, boolean z) {
        if (i == 4097) {
            return z ? 1 : 2;
        } else if (i == 4099) {
            return z ? 5 : 6;
        } else if (i != 8194) {
            return -1;
        } else {
            return z ? 3 : 4;
        }
    }

    /* access modifiers changed from: 0000 */
    public void addBackStackState(BackStackRecord backStackRecord) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList<>();
        }
        this.mBackStack.add(backStackRecord);
        reportBackStackChanged();
    }

    public void addFragment(Fragment fragment, boolean z) {
        if (this.mAdded == null) {
            this.mAdded = new ArrayList<>();
        }
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("add: ");
            sb.append(fragment);
            Log.v(str, sb.toString());
        }
        makeActive(fragment);
        if (fragment.mDetached) {
            return;
        }
        if (!this.mAdded.contains(fragment)) {
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            if (z) {
                moveToState(fragment);
                return;
            }
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Fragment already added: ");
        sb2.append(fragment);
        throw new IllegalStateException(sb2.toString());
    }

    public void addOnBackStackChangedListener(OnBackStackChangedListener onBackStackChangedListener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList<>();
        }
        this.mBackStackChangeListeners.add(onBackStackChangedListener);
    }

    public int allocBackStackIndex(BackStackRecord backStackRecord) {
        synchronized (this) {
            if (this.mAvailBackStackIndices != null) {
                if (this.mAvailBackStackIndices.size() > 0) {
                    int intValue = ((Integer) this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1)).intValue();
                    if (DEBUG) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Adding back stack index ");
                        sb.append(intValue);
                        sb.append(" with ");
                        sb.append(backStackRecord);
                        Log.v(str, sb.toString());
                    }
                    this.mBackStackIndices.set(intValue, backStackRecord);
                    return intValue;
                }
            }
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int size = this.mBackStackIndices.size();
            if (DEBUG) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Setting back stack index ");
                sb2.append(size);
                sb2.append(" to ");
                sb2.append(backStackRecord);
                Log.v(str2, sb2.toString());
            }
            this.mBackStackIndices.add(backStackRecord);
            return size;
        }
    }

    public void attachController(FragmentHostCallback fragmentHostCallback, FragmentContainer fragmentContainer, Fragment fragment) {
        if (this.mHost == null) {
            this.mHost = fragmentHostCallback;
            this.mContainer = fragmentContainer;
            this.mParent = fragment;
            return;
        }
        throw new IllegalStateException("Already attached");
    }

    public void attachFragment(Fragment fragment, int i, int i2) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("attach: ");
            sb.append(fragment);
            Log.v(str, sb.toString());
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (!fragment.mAdded) {
                if (this.mAdded == null) {
                    this.mAdded = new ArrayList<>();
                }
                if (!this.mAdded.contains(fragment)) {
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("add from attach: ");
                        sb2.append(fragment);
                        Log.v(str2, sb2.toString());
                    }
                    this.mAdded.add(fragment);
                    fragment.mAdded = true;
                    if (fragment.mHasMenu && fragment.mMenuVisible) {
                        this.mNeedMenuInvalidate = true;
                    }
                    moveToState(fragment, this.mCurState, i, i2, false);
                    return;
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Fragment already added: ");
                sb3.append(fragment);
                throw new IllegalStateException(sb3.toString());
            }
        }
    }

    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    public void detachFragment(Fragment fragment, int i, int i2) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("detach: ");
            sb.append(fragment);
            Log.v(str, sb.toString());
        }
        if (!fragment.mDetached) {
            fragment.mDetached = true;
            if (fragment.mAdded) {
                if (this.mAdded != null) {
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("remove from detach: ");
                        sb2.append(fragment);
                        Log.v(str2, sb2.toString());
                    }
                    this.mAdded.remove(fragment);
                }
                if (fragment.mHasMenu && fragment.mMenuVisible) {
                    this.mNeedMenuInvalidate = true;
                }
                fragment.mAdded = false;
                moveToState(fragment, 1, i, i2, false);
            }
        }
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchConfigurationChanged(Configuration configuration) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performConfigurationChanged(configuration);
                }
            }
        }
    }

    public boolean dispatchContextItemSelected(MenuItem menuItem) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null && fragment.performContextItemSelected(menuItem)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        moveToState(1, false);
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        ArrayList<Fragment> arrayList;
        boolean z = false;
        ArrayList<Fragment> arrayList2 = null;
        int i = 0;
        if (this.mAdded != null) {
            boolean z2 = false;
            for (int i2 = 0; i2 < this.mAdded.size(); i2++) {
                Fragment fragment = (Fragment) this.mAdded.get(i2);
                if (fragment != null && fragment.performCreateOptionsMenu(menu, menuInflater)) {
                    z2 = true;
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList<>();
                    }
                    arrayList2.add(fragment);
                }
            }
            z = z2;
        }
        if (this.mCreatedMenus != null) {
            while (true) {
                int i3 = i;
                if (i3 >= this.mCreatedMenus.size()) {
                    break;
                }
                Fragment fragment2 = (Fragment) this.mCreatedMenus.get(i3);
                if (arrayList == null || !arrayList.contains(fragment2)) {
                    fragment2.onDestroyOptionsMenu();
                }
                i = i3 + 1;
            }
        }
        this.mCreatedMenus = arrayList;
        return z;
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        this.mHost = null;
        this.mContainer = null;
        this.mParent = null;
    }

    public void dispatchDestroyView() {
        moveToState(1, false);
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performLowMemory();
                }
            }
        }
    }

    public boolean dispatchOptionsItemSelected(MenuItem menuItem) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null && fragment.performOptionsItemSelected(menuItem)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performOptionsMenuClosed(menu);
                }
            }
        }
    }

    public void dispatchPause() {
        moveToState(4, false);
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean z;
        boolean z2 = false;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = (Fragment) this.mAdded.get(i);
                if (fragment != null && fragment.performPrepareOptionsMenu(menu)) {
                    z2 = true;
                }
            }
        }
        return z;
    }

    public void dispatchReallyStop() {
        moveToState(2, false);
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        moveToState(3, false);
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("    ");
        String sb2 = sb.toString();
        if (this.mActive != null) {
            int size = this.mActive.size();
            if (size > 0) {
                printWriter.print(str);
                printWriter.print("Active Fragments in ");
                printWriter.print(Integer.toHexString(System.identityHashCode(this)));
                printWriter.println(":");
                for (int i = 0; i < size; i++) {
                    Fragment fragment = (Fragment) this.mActive.get(i);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i);
                    printWriter.print(": ");
                    printWriter.println(fragment);
                    if (fragment != null) {
                        fragment.dump(sb2, fileDescriptor, printWriter, strArr);
                    }
                }
            }
        }
        if (this.mAdded != null) {
            int size2 = this.mAdded.size();
            if (size2 > 0) {
                printWriter.print(str);
                printWriter.println("Added Fragments:");
                for (int i2 = 0; i2 < size2; i2++) {
                    Fragment fragment2 = (Fragment) this.mAdded.get(i2);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i2);
                    printWriter.print(": ");
                    printWriter.println(fragment2.toString());
                }
            }
        }
        if (this.mCreatedMenus != null) {
            int size3 = this.mCreatedMenus.size();
            if (size3 > 0) {
                printWriter.print(str);
                printWriter.println("Fragments Created Menus:");
                for (int i3 = 0; i3 < size3; i3++) {
                    Fragment fragment3 = (Fragment) this.mCreatedMenus.get(i3);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i3);
                    printWriter.print(": ");
                    printWriter.println(fragment3.toString());
                }
            }
        }
        if (this.mBackStack != null) {
            int size4 = this.mBackStack.size();
            if (size4 > 0) {
                printWriter.print(str);
                printWriter.println("Back Stack:");
                for (int i4 = 0; i4 < size4; i4++) {
                    BackStackRecord backStackRecord = (BackStackRecord) this.mBackStack.get(i4);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i4);
                    printWriter.print(": ");
                    printWriter.println(backStackRecord.toString());
                    backStackRecord.dump(sb2, fileDescriptor, printWriter, strArr);
                }
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null) {
                int size5 = this.mBackStackIndices.size();
                if (size5 > 0) {
                    printWriter.print(str);
                    printWriter.println("Back Stack Indices:");
                    for (int i5 = 0; i5 < size5; i5++) {
                        BackStackRecord backStackRecord2 = (BackStackRecord) this.mBackStackIndices.get(i5);
                        printWriter.print(str);
                        printWriter.print("  #");
                        printWriter.print(i5);
                        printWriter.print(": ");
                        printWriter.println(backStackRecord2);
                    }
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                printWriter.print(str);
                printWriter.print("mAvailBackStackIndices: ");
                printWriter.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null) {
            int size6 = this.mPendingActions.size();
            if (size6 > 0) {
                printWriter.print(str);
                printWriter.println("Pending Actions:");
                for (int i6 = 0; i6 < size6; i6++) {
                    Runnable runnable = (Runnable) this.mPendingActions.get(i6);
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i6);
                    printWriter.print(": ");
                    printWriter.println(runnable);
                }
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mHost=");
        printWriter.println(this.mHost);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.mContainer);
        if (this.mParent != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.mParent);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.mCurState);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.mStateSaved);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            printWriter.print(str);
            printWriter.print("  mNoTransactionsBecause=");
            printWriter.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
            printWriter.print(str);
            printWriter.print("  mAvailIndices: ");
            printWriter.println(Arrays.toString(this.mAvailIndices.toArray()));
        }
    }

    public void enqueueAction(Runnable runnable, boolean z) {
        if (!z) {
            checkStateLoss();
        }
        synchronized (this) {
            if (this.mDestroyed || this.mHost == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList<>();
            }
            this.mPendingActions.add(runnable);
            if (this.mPendingActions.size() == 1) {
                this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                this.mHost.getHandler().post(this.mExecCommit);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0051, code lost:
        r6.mExecutingActions = true;
        r3 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0055, code lost:
        if (r3 >= r2) goto L_0x0066;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0057, code lost:
        r6.mTmpActions[r3].run();
        r6.mTmpActions[r3] = null;
        r3 = r3 + 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean execPendingActions() {
        if (this.mExecutingActions) {
            throw new IllegalStateException("Recursive entry to executePendingTransactions");
        } else if (Looper.myLooper() == this.mHost.getHandler().getLooper()) {
            boolean z = false;
            while (true) {
                synchronized (this) {
                    if (this.mPendingActions != null) {
                        if (this.mPendingActions.size() == 0) {
                            break;
                        }
                        int size = this.mPendingActions.size();
                        if (this.mTmpActions == null || this.mTmpActions.length < size) {
                            this.mTmpActions = new Runnable[size];
                        }
                        this.mPendingActions.toArray(this.mTmpActions);
                        this.mPendingActions.clear();
                        this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                    }
                }
                this.mExecutingActions = false;
                z = true;
            }
            if (this.mHavePendingDeferredStart) {
                boolean z2 = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment fragment = (Fragment) this.mActive.get(i);
                    if (!(fragment == null || fragment.mLoaderManager == null)) {
                        z2 |= fragment.mLoaderManager.hasRunningLoaders();
                    }
                }
                if (!z2) {
                    this.mHavePendingDeferredStart = false;
                    startPendingDeferredFragments();
                }
            }
            return z;
        } else {
            throw new IllegalStateException("Must be called from main thread of process");
        }
    }

    public boolean executePendingTransactions() {
        return execPendingActions();
    }

    public Fragment findFragmentById(int i) {
        if (this.mAdded != null) {
            for (int size = this.mAdded.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.mAdded.get(size);
                if (fragment != null && fragment.mFragmentId == i) {
                    return fragment;
                }
            }
        }
        if (this.mActive != null) {
            for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = (Fragment) this.mActive.get(size2);
                if (fragment2 != null && fragment2.mFragmentId == i) {
                    return fragment2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByTag(String str) {
        if (!(this.mAdded == null || str == null)) {
            for (int size = this.mAdded.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.mAdded.get(size);
                if (fragment != null && str.equals(fragment.mTag)) {
                    return fragment;
                }
            }
        }
        if (!(this.mActive == null || str == null)) {
            for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = (Fragment) this.mActive.get(size2);
                if (fragment2 != null && str.equals(fragment2.mTag)) {
                    return fragment2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByWho(String str) {
        if (!(this.mActive == null || str == null)) {
            for (int size = this.mActive.size() - 1; size >= 0; size--) {
                Fragment fragment = (Fragment) this.mActive.get(size);
                if (fragment != null) {
                    Fragment findFragmentByWho = fragment.findFragmentByWho(str);
                    Fragment fragment2 = findFragmentByWho;
                    if (findFragmentByWho != null) {
                        return fragment2;
                    }
                }
            }
        }
        return null;
    }

    public void freeBackStackIndex(int i) {
        synchronized (this) {
            this.mBackStackIndices.set(i, null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList<>();
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Freeing back stack index ");
                sb.append(i);
                Log.v(str, sb.toString());
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(i));
        }
    }

    public BackStackEntry getBackStackEntryAt(int i) {
        return (BackStackEntry) this.mBackStack.get(i);
    }

    public int getBackStackEntryCount() {
        if (this.mBackStack != null) {
            return this.mBackStack.size();
        }
        return 0;
    }

    public Fragment getFragment(Bundle bundle, String str) {
        int i = bundle.getInt(str, -1);
        if (i == -1) {
            return null;
        }
        if (i >= this.mActive.size()) {
            StringBuilder sb = new StringBuilder();
            sb.append("Fragment no longer exists for key ");
            sb.append(str);
            sb.append(": index ");
            sb.append(i);
            throwException(new IllegalStateException(sb.toString()));
        }
        Fragment fragment = (Fragment) this.mActive.get(i);
        if (fragment == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Fragment no longer exists for key ");
            sb2.append(str);
            sb2.append(": index ");
            sb2.append(i);
            throwException(new IllegalStateException(sb2.toString()));
        }
        return fragment;
    }

    public List<Fragment> getFragments() {
        return this.mActive;
    }

    /* access modifiers changed from: 0000 */
    public LayoutInflaterFactory getLayoutInflaterFactory() {
        return this;
    }

    public void hideFragment(Fragment fragment, int i, int i2) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("hide: ");
            sb.append(fragment);
            Log.v(str, sb.toString());
        }
        if (!fragment.mHidden) {
            fragment.mHidden = true;
            if (fragment.mView != null) {
                Animation loadAnimation = loadAnimation(fragment, i, false, i2);
                if (loadAnimation != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, loadAnimation);
                    fragment.mView.startAnimation(loadAnimation);
                }
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(true);
        }
    }

    public boolean isDestroyed() {
        return this.mDestroyed;
    }

    /* access modifiers changed from: 0000 */
    public Animation loadAnimation(Fragment fragment, int i, boolean z, int i2) {
        Animation onCreateAnimation = fragment.onCreateAnimation(i, z, fragment.mNextAnim);
        if (onCreateAnimation != null) {
            return onCreateAnimation;
        }
        if (fragment.mNextAnim != 0) {
            Animation loadAnimation = AnimationUtils.loadAnimation(this.mHost.getContext(), fragment.mNextAnim);
            if (loadAnimation != null) {
                return loadAnimation;
            }
        }
        if (i == 0) {
            return null;
        }
        int transitToStyleIndex = transitToStyleIndex(i, z);
        if (transitToStyleIndex < 0) {
            return null;
        }
        switch (transitToStyleIndex) {
            case 1:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.125f, 1.0f, 0.0f, 1.0f);
            case 2:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 0.975f, 1.0f, 0.0f);
            case 3:
                return makeOpenCloseAnimation(this.mHost.getContext(), 0.975f, 1.0f, 0.0f, 1.0f);
            case 4:
                return makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 1.075f, 1.0f, 0.0f);
            case 5:
                return makeFadeAnimation(this.mHost.getContext(), 0.0f, 1.0f);
            case 6:
                return makeFadeAnimation(this.mHost.getContext(), 1.0f, 0.0f);
            default:
                if (i2 == 0 && this.mHost.onHasWindowAnimations()) {
                    i2 = this.mHost.onGetWindowAnimations();
                }
                return i2 == 0 ? null : null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void makeActive(Fragment fragment) {
        if (fragment.mIndex < 0) {
            if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
                if (this.mActive == null) {
                    this.mActive = new ArrayList<>();
                }
                fragment.setIndex(this.mActive.size(), this.mParent);
                this.mActive.add(fragment);
            } else {
                fragment.setIndex(((Integer) this.mAvailIndices.remove(this.mAvailIndices.size() - 1)).intValue(), this.mParent);
                this.mActive.set(fragment.mIndex, fragment);
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Allocated fragment index ");
                sb.append(fragment);
                Log.v(str, sb.toString());
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void makeInactive(Fragment fragment) {
        if (fragment.mIndex >= 0) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Freeing fragment index ");
                sb.append(fragment);
                Log.v(str, sb.toString());
            }
            this.mActive.set(fragment.mIndex, null);
            if (this.mAvailIndices == null) {
                this.mAvailIndices = new ArrayList<>();
            }
            this.mAvailIndices.add(Integer.valueOf(fragment.mIndex));
            this.mHost.inactivateFragment(fragment.mWho);
            fragment.initState();
        }
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(int i, int i2, int i3, boolean z) {
        if (this.mHost == null && i != 0) {
            throw new IllegalStateException("No host");
        } else if (z || this.mCurState != i) {
            this.mCurState = i;
            if (this.mActive != null) {
                boolean z2 = false;
                for (int i4 = 0; i4 < this.mActive.size(); i4++) {
                    Fragment fragment = (Fragment) this.mActive.get(i4);
                    if (fragment != null) {
                        moveToState(fragment, i, i2, i3, false);
                        if (fragment.mLoaderManager != null) {
                            z2 |= fragment.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                if (!z2) {
                    startPendingDeferredFragments();
                }
                if (this.mNeedMenuInvalidate && this.mHost != null && this.mCurState == 5) {
                    this.mHost.onSupportInvalidateOptionsMenu();
                    this.mNeedMenuInvalidate = false;
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(int i, boolean z) {
        moveToState(i, 0, 0, z);
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(Fragment fragment) {
        moveToState(fragment, this.mCurState, 0, 0, false);
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:100:0x0205, code lost:
        r7.restoreViewState(r7.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:101:0x020a, code lost:
        r7.mSavedFragmentState = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:102:0x020c, code lost:
        if (r13 <= 3) goto L_0x022b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:104:0x0210, code lost:
        if (DEBUG == false) goto L_0x0228;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:105:0x0212, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("moveto STARTED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:106:0x0228, code lost:
        r18.performStart();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:108:0x022c, code lost:
        if (r13 <= 4) goto L_0x03ba;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:110:0x0230, code lost:
        if (DEBUG == false) goto L_0x0248;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:111:0x0232, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("moveto RESUMED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:112:0x0248, code lost:
        r7.mResumed = true;
        r18.performResume();
        r7.mSavedFragmentState = null;
        r7.mSavedViewState = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:126:0x029d, code lost:
        if (r13 >= 4) goto L_0x02bc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:128:0x02a1, code lost:
        if (DEBUG == false) goto L_0x02b9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:129:0x02a3, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("movefrom STARTED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:130:0x02b9, code lost:
        r18.performStop();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:131:0x02bc, code lost:
        if (r13 >= 3) goto L_0x02db;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:133:0x02c0, code lost:
        if (DEBUG == false) goto L_0x02d8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:134:0x02c2, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("movefrom STOPPED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:135:0x02d8, code lost:
        r18.performReallyStop();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:137:0x02dc, code lost:
        if (r13 >= 2) goto L_0x0348;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:139:0x02e0, code lost:
        if (DEBUG == false) goto L_0x02f8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:140:0x02e2, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("movefrom ACTIVITY_CREATED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:142:0x02fa, code lost:
        if (r7.mView == null) goto L_0x030b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:144:0x0302, code lost:
        if (r6.mHost.onShouldSaveFragmentState(r7) == false) goto L_0x030b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:146:0x0306, code lost:
        if (r7.mSavedViewState != null) goto L_0x030b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:147:0x0308, code lost:
        saveFragmentViewState(r18);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:0x030b, code lost:
        r18.performDestroyView();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:149:0x0310, code lost:
        if (r7.mView == null) goto L_0x0342;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:151:0x0314, code lost:
        if (r7.mContainer == null) goto L_0x0342;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:152:0x0316, code lost:
        r0 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:153:0x0319, code lost:
        if (r6.mCurState <= 0) goto L_0x0323;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:155:0x031d, code lost:
        if (r6.mDestroyed != false) goto L_0x0323;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:156:0x031f, code lost:
        r0 = loadAnimation(r7, r8, false, r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:157:0x0323, code lost:
        if (r0 == null) goto L_0x033b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:158:0x0325, code lost:
        r1 = r7;
        r7.mAnimatingAway = r7.mView;
        r7.mStateAfterAnimating = r13;
        r0.setAnimationListener(new android.support.v4.app.FragmentManagerImpl.AnonymousClass5(r6, r7.mView, r0));
        r7.mView.startAnimation(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:159:0x033b, code lost:
        r7.mContainer.removeView(r7.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:160:0x0342, code lost:
        r7.mContainer = null;
        r7.mView = null;
        r7.mInnerView = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:161:0x0348, code lost:
        if (r13 >= 1) goto L_0x03ba;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:163:0x034c, code lost:
        if (r6.mDestroyed == false) goto L_0x0359;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:165:0x0350, code lost:
        if (r7.mAnimatingAway == null) goto L_0x0359;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:166:0x0352, code lost:
        r0 = r7.mAnimatingAway;
        r7.mAnimatingAway = null;
        r0.clearAnimation();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:168:0x035b, code lost:
        if (r7.mAnimatingAway == null) goto L_0x0361;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:169:0x035d, code lost:
        r7.mStateAfterAnimating = r13;
        r13 = 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:171:0x0363, code lost:
        if (DEBUG == false) goto L_0x037b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:172:0x0365, code lost:
        r0 = TAG;
        r1 = new java.lang.StringBuilder();
        r1.append("movefrom CREATED: ");
        r1.append(r7);
        android.util.Log.v(r0, r1.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:174:0x037d, code lost:
        if (r7.mRetaining != false) goto L_0x0382;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:175:0x037f, code lost:
        r18.performDestroy();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:176:0x0382, code lost:
        r7.mCalled = false;
        r18.onDetach();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:177:0x0389, code lost:
        if (r7.mCalled == false) goto L_0x039e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:178:0x038b, code lost:
        if (r22 != false) goto L_0x03ba;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:180:0x038f, code lost:
        if (r7.mRetaining != false) goto L_0x0395;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:181:0x0391, code lost:
        makeInactive(r18);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:182:0x0395, code lost:
        r7.mHost = null;
        r7.mParentFragment = null;
        r7.mFragmentManager = null;
        r7.mChildFragmentManager = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:183:0x039e, code lost:
        r2 = new java.lang.StringBuilder();
        r2.append("Fragment ");
        r2.append(r7);
        r2.append(" did not call through to super.onDetach()");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:184:0x03b9, code lost:
        throw new android.support.v4.app.SuperNotCalledException(r2.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0139, code lost:
        if (r13 <= 1) goto L_0x020c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x013d, code lost:
        if (DEBUG == false) goto L_0x0155;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x013f, code lost:
        r0 = TAG;
        r3 = new java.lang.StringBuilder();
        r3.append("moveto ACTIVITY_CREATED: ");
        r3.append(r7);
        android.util.Log.v(r0, r3.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0157, code lost:
        if (r7.mFromLayout != false) goto L_0x01fc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0159, code lost:
        r0 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x015c, code lost:
        if (r7.mContainerId == 0) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x015e, code lost:
        r0 = (android.view.ViewGroup) r6.mContainer.onFindViewById(r7.mContainerId);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x0169, code lost:
        if (r0 != null) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x016d, code lost:
        if (r7.mRestored != false) goto L_0x01a8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x016f, code lost:
        r4 = new java.lang.StringBuilder();
        r4.append("No view found for id 0x");
        r4.append(java.lang.Integer.toHexString(r7.mContainerId));
        r4.append(" (");
        r4.append(r18.getResources().getResourceName(r7.mContainerId));
        r4.append(") for fragment ");
        r4.append(r7);
        throwException(new java.lang.IllegalArgumentException(r4.toString()));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x01a8, code lost:
        r7.mContainer = r0;
        r7.mView = r7.performCreateView(r7.getLayoutInflater(r7.mSavedFragmentState), r0, r7.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x01ba, code lost:
        if (r7.mView == null) goto L_0x01fa;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x01bc, code lost:
        r7.mInnerView = r7.mView;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x01c2, code lost:
        if (android.os.Build.VERSION.SDK_INT < 11) goto L_0x01ca;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x01c4, code lost:
        android.support.v4.view.ViewCompat.setSaveFromParentEnabled(r7.mView, false);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x01ca, code lost:
        r7.mView = android.support.v4.app.NoSaveStateFrameLayout.wrap(r7.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x01d2, code lost:
        if (r0 == null) goto L_0x01e9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:89:0x01d4, code lost:
        r2 = loadAnimation(r7, r8, true, r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:90:0x01d8, code lost:
        if (r2 == null) goto L_0x01e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x01da, code lost:
        setHWLayerAnimListenerIfAlpha(r7.mView, r2);
        r7.mView.startAnimation(r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:92:0x01e4, code lost:
        r0.addView(r7.mView);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x01eb, code lost:
        if (r7.mHidden == false) goto L_0x01f2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:0x01ed, code lost:
        r7.mView.setVisibility(8);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:0x01f2, code lost:
        r7.onViewCreated(r7.mView, r7.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:97:0x01fa, code lost:
        r7.mInnerView = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:98:0x01fc, code lost:
        r7.performActivityCreated(r7.mSavedFragmentState);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:99:0x0203, code lost:
        if (r7.mView == null) goto L_0x020a;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void moveToState(Fragment fragment, int i, int i2, int i3, boolean z) {
        int i4;
        Fragment fragment2 = fragment;
        int i5 = i2;
        int i6 = i3;
        if (!fragment2.mAdded || fragment2.mDetached) {
            i4 = i;
            if (i4 > 1) {
                i4 = 1;
            }
        } else {
            i4 = i;
        }
        if (fragment2.mRemoving && i4 > fragment2.mState) {
            i4 = fragment2.mState;
        }
        if (fragment2.mDeferStart && fragment2.mState < 4 && i4 > 3) {
            i4 = 3;
        }
        int i7 = i4;
        if (fragment2.mState >= i7) {
            if (fragment2.mState > i7) {
                switch (fragment2.mState) {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        if (i7 < 5) {
                            if (DEBUG) {
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("movefrom RESUMED: ");
                                sb.append(fragment2);
                                Log.v(str, sb.toString());
                            }
                            fragment.performPause();
                            fragment2.mResumed = false;
                            break;
                        }
                        break;
                }
            }
        } else if (!fragment2.mFromLayout || fragment2.mInLayout) {
            if (fragment2.mAnimatingAway != null) {
                fragment2.mAnimatingAway = null;
                moveToState(fragment2, fragment2.mStateAfterAnimating, 0, 0, true);
            }
            switch (fragment2.mState) {
                case 0:
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("moveto CREATED: ");
                        sb2.append(fragment2);
                        Log.v(str2, sb2.toString());
                    }
                    if (fragment2.mSavedFragmentState != null) {
                        fragment2.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                        fragment2.mSavedViewState = fragment2.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                        fragment2.mTarget = getFragment(fragment2.mSavedFragmentState, TARGET_STATE_TAG);
                        if (fragment2.mTarget != null) {
                            fragment2.mTargetRequestCode = fragment2.mSavedFragmentState.getInt(TARGET_REQUEST_CODE_STATE_TAG, 0);
                        }
                        fragment2.mUserVisibleHint = fragment2.mSavedFragmentState.getBoolean(USER_VISIBLE_HINT_TAG, true);
                        if (!fragment2.mUserVisibleHint) {
                            fragment2.mDeferStart = true;
                            if (i7 > 3) {
                                i7 = 3;
                            }
                        }
                    }
                    fragment2.mHost = this.mHost;
                    fragment2.mParentFragment = this.mParent;
                    fragment2.mFragmentManager = this.mParent != null ? this.mParent.mChildFragmentManager : this.mHost.getFragmentManagerImpl();
                    fragment2.mCalled = false;
                    fragment2.onAttach(this.mHost.getContext());
                    if (fragment2.mCalled) {
                        if (fragment2.mParentFragment == null) {
                            this.mHost.onAttachFragment(fragment2);
                        }
                        if (!fragment2.mRetaining) {
                            fragment2.performCreate(fragment2.mSavedFragmentState);
                        }
                        fragment2.mRetaining = false;
                        if (fragment2.mFromLayout) {
                            fragment2.mView = fragment2.performCreateView(fragment2.getLayoutInflater(fragment2.mSavedFragmentState), null, fragment2.mSavedFragmentState);
                            if (fragment2.mView == null) {
                                fragment2.mInnerView = null;
                                break;
                            } else {
                                fragment2.mInnerView = fragment2.mView;
                                if (VERSION.SDK_INT >= 11) {
                                    ViewCompat.setSaveFromParentEnabled(fragment2.mView, false);
                                } else {
                                    fragment2.mView = NoSaveStateFrameLayout.wrap(fragment2.mView);
                                }
                                if (fragment2.mHidden) {
                                    fragment2.mView.setVisibility(8);
                                }
                                fragment2.onViewCreated(fragment2.mView, fragment2.mSavedFragmentState);
                                break;
                            }
                        }
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Fragment ");
                        sb3.append(fragment2);
                        sb3.append(" did not call through to super.onAttach()");
                        throw new SuperNotCalledException(sb3.toString());
                    }
                    break;
                case 1:
                    break;
                case 2:
                case 3:
                    break;
                case 4:
                    break;
            }
        } else {
            return;
        }
        fragment2.mState = i7;
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        Fragment fragment;
        Fragment fragment2;
        Context context2 = context;
        AttributeSet attributeSet2 = attributeSet;
        Fragment fragment3 = null;
        if (!"fragment".equals(str)) {
            return null;
        }
        String attributeValue = attributeSet2.getAttributeValue(null, "class");
        TypedArray obtainStyledAttributes = context2.obtainStyledAttributes(attributeSet2, FragmentTag.Fragment);
        int i = 0;
        if (attributeValue == null) {
            attributeValue = obtainStyledAttributes.getString(0);
        }
        String str2 = attributeValue;
        int resourceId = obtainStyledAttributes.getResourceId(1, -1);
        String string = obtainStyledAttributes.getString(2);
        obtainStyledAttributes.recycle();
        if (!Fragment.isSupportFragmentClass(this.mHost.getContext(), str2)) {
            return null;
        }
        if (view != null) {
            i = view.getId();
        }
        int i2 = i;
        if (i2 == -1 && resourceId == -1 && string == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(attributeSet.getPositionDescription());
            sb.append(": Must specify unique android:id, android:tag, or have a parent with an id for ");
            sb.append(str2);
            throw new IllegalArgumentException(sb.toString());
        }
        if (resourceId != -1) {
            fragment3 = findFragmentById(resourceId);
        }
        if (fragment3 == null && string != null) {
            fragment3 = findFragmentByTag(string);
        }
        if (fragment3 == null && i2 != -1) {
            fragment3 = findFragmentById(i2);
        }
        if (DEBUG) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onCreateView: id=0x");
            sb2.append(Integer.toHexString(resourceId));
            sb2.append(" fname=");
            sb2.append(str2);
            sb2.append(" existing=");
            sb2.append(fragment3);
            Log.v(str3, sb2.toString());
        }
        if (fragment3 == null) {
            Fragment instantiate = Fragment.instantiate(context2, str2);
            instantiate.mFromLayout = true;
            instantiate.mFragmentId = resourceId != 0 ? resourceId : i2;
            instantiate.mContainerId = i2;
            instantiate.mTag = string;
            instantiate.mInLayout = true;
            instantiate.mFragmentManager = this;
            instantiate.onInflate(this.mHost.getContext(), attributeSet2, instantiate.mSavedFragmentState);
            addFragment(instantiate, true);
            fragment = instantiate;
        } else if (!fragment3.mInLayout) {
            fragment3.mInLayout = true;
            if (!fragment3.mRetaining) {
                fragment3.onInflate(this.mHost.getContext(), attributeSet2, fragment3.mSavedFragmentState);
            }
            fragment = fragment3;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(attributeSet.getPositionDescription());
            sb3.append(": Duplicate id 0x");
            sb3.append(Integer.toHexString(resourceId));
            sb3.append(", tag ");
            sb3.append(string);
            sb3.append(", or parent id 0x");
            sb3.append(Integer.toHexString(i2));
            sb3.append(" with another fragment for ");
            sb3.append(str2);
            throw new IllegalArgumentException(sb3.toString());
        }
        if (this.mCurState >= 1 || !fragment.mFromLayout) {
            fragment2 = fragment;
            moveToState(fragment2);
        } else {
            fragment2 = fragment;
            moveToState(fragment, 1, 0, 0, false);
        }
        if (fragment2.mView != null) {
            if (resourceId != 0) {
                fragment2.mView.setId(resourceId);
            }
            if (fragment2.mView.getTag() == null) {
                fragment2.mView.setTag(string);
            }
            return fragment2.mView;
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append("Fragment ");
        sb4.append(str2);
        sb4.append(" did not create a view.");
        throw new IllegalStateException(sb4.toString());
    }

    public void performPendingDeferredStart(Fragment fragment) {
        if (fragment.mDeferStart) {
            if (this.mExecutingActions) {
                this.mHavePendingDeferredStart = true;
                return;
            }
            fragment.mDeferStart = false;
            moveToState(fragment, this.mCurState, 0, 0, false);
        }
    }

    public void popBackStack() {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, -1, 0);
            }
        }, false);
    }

    public void popBackStack(final int i, final int i2) {
        if (i >= 0) {
            enqueueAction(new Runnable() {
                public void run() {
                    FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, i, i2);
                }
            }, false);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Bad id: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public void popBackStack(final String str, final int i) {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), str, -1, i);
            }
        }, false);
    }

    public boolean popBackStackImmediate() {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), null, -1, 0);
    }

    public boolean popBackStackImmediate(int i, int i2) {
        checkStateLoss();
        executePendingTransactions();
        if (i >= 0) {
            return popBackStackState(this.mHost.getHandler(), null, i, i2);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Bad id: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean popBackStackImmediate(String str, int i) {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), str, -1, i);
    }

    /* access modifiers changed from: 0000 */
    public boolean popBackStackState(Handler handler, String str, int i, int i2) {
        String str2 = str;
        int i3 = i;
        if (this.mBackStack == null) {
            return false;
        }
        if (str2 == null && i3 < 0 && (i2 & 1) == 0) {
            int size = this.mBackStack.size() - 1;
            if (size < 0) {
                return false;
            }
            BackStackRecord backStackRecord = (BackStackRecord) this.mBackStack.remove(size);
            SparseArray sparseArray = new SparseArray();
            SparseArray sparseArray2 = new SparseArray();
            backStackRecord.calculateBackFragments(sparseArray, sparseArray2);
            backStackRecord.popFromBackStack(true, null, sparseArray, sparseArray2);
            reportBackStackChanged();
        } else {
            int i4 = -1;
            if (str2 != null || i3 >= 0) {
                int size2 = this.mBackStack.size() - 1;
                while (i4 >= 0) {
                    BackStackRecord backStackRecord2 = (BackStackRecord) this.mBackStack.get(i4);
                    if ((str2 != null && str2.equals(backStackRecord2.getName())) || (i3 >= 0 && i3 == backStackRecord2.mIndex)) {
                        break;
                    }
                    size2 = i4 - 1;
                }
                if (i4 < 0) {
                    return false;
                }
                if ((i2 & 1) != 0) {
                    i4--;
                    while (i4 >= 0) {
                        BackStackRecord backStackRecord3 = (BackStackRecord) this.mBackStack.get(i4);
                        if ((str2 == null || !str2.equals(backStackRecord3.getName())) && (i3 < 0 || i3 != backStackRecord3.mIndex)) {
                            break;
                        }
                        i4--;
                    }
                }
            }
            if (i4 == this.mBackStack.size() - 1) {
                return false;
            }
            ArrayList arrayList = new ArrayList();
            for (int size3 = this.mBackStack.size() - 1; size3 > i4; size3--) {
                arrayList.add(this.mBackStack.remove(size3));
            }
            int size4 = arrayList.size() - 1;
            SparseArray sparseArray3 = new SparseArray();
            SparseArray sparseArray4 = new SparseArray();
            for (int i5 = 0; i5 <= size4; i5++) {
                ((BackStackRecord) arrayList.get(i5)).calculateBackFragments(sparseArray3, sparseArray4);
            }
            TransitionState transitionState = null;
            int i6 = 0;
            while (i6 <= size4) {
                if (DEBUG) {
                    String str3 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Popping back stack state: ");
                    sb.append(arrayList.get(i6));
                    Log.v(str3, sb.toString());
                }
                transitionState = ((BackStackRecord) arrayList.get(i6)).popFromBackStack(i6 == size4, transitionState, sparseArray3, sparseArray4);
                i6++;
            }
            reportBackStackChanged();
        }
        return true;
    }

    public void putFragment(Bundle bundle, String str, Fragment fragment) {
        if (fragment.mIndex < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("Fragment ");
            sb.append(fragment);
            sb.append(" is not currently in the FragmentManager");
            throwException(new IllegalStateException(sb.toString()));
        }
        bundle.putInt(str, fragment.mIndex);
    }

    public void removeFragment(Fragment fragment, int i, int i2) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("remove: ");
            sb.append(fragment);
            sb.append(" nesting=");
            sb.append(fragment.mBackStackNesting);
            Log.v(str, sb.toString());
        }
        boolean z = !fragment.isInBackStack();
        if (!fragment.mDetached || z) {
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
            moveToState(fragment, z ? 0 : 1, i, i2, false);
        }
    }

    public void removeOnBackStackChangedListener(OnBackStackChangedListener onBackStackChangedListener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(onBackStackChangedListener);
        }
    }

    /* access modifiers changed from: 0000 */
    public void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                ((OnBackStackChangedListener) this.mBackStackChangeListeners.get(i)).onBackStackChanged();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void restoreAllState(Parcelable parcelable, List<Fragment> list) {
        if (parcelable != null) {
            FragmentManagerState fragmentManagerState = (FragmentManagerState) parcelable;
            if (fragmentManagerState.mActive != null) {
                if (list != null) {
                    for (int i = 0; i < list.size(); i++) {
                        Fragment fragment = (Fragment) list.get(i);
                        if (DEBUG) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("restoreAllState: re-attaching retained ");
                            sb.append(fragment);
                            Log.v(str, sb.toString());
                        }
                        FragmentState fragmentState = fragmentManagerState.mActive[fragment.mIndex];
                        fragmentState.mInstance = fragment;
                        fragment.mSavedViewState = null;
                        fragment.mBackStackNesting = 0;
                        fragment.mInLayout = false;
                        fragment.mAdded = false;
                        fragment.mTarget = null;
                        if (fragmentState.mSavedFragmentState != null) {
                            fragmentState.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                            fragment.mSavedViewState = fragmentState.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                            fragment.mSavedFragmentState = fragmentState.mSavedFragmentState;
                        }
                    }
                }
                this.mActive = new ArrayList<>(fragmentManagerState.mActive.length);
                if (this.mAvailIndices != null) {
                    this.mAvailIndices.clear();
                }
                for (int i2 = 0; i2 < fragmentManagerState.mActive.length; i2++) {
                    FragmentState fragmentState2 = fragmentManagerState.mActive[i2];
                    if (fragmentState2 != null) {
                        Fragment instantiate = fragmentState2.instantiate(this.mHost, this.mParent);
                        if (DEBUG) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("restoreAllState: active #");
                            sb2.append(i2);
                            sb2.append(": ");
                            sb2.append(instantiate);
                            Log.v(str2, sb2.toString());
                        }
                        this.mActive.add(instantiate);
                        fragmentState2.mInstance = null;
                    } else {
                        this.mActive.add(null);
                        if (this.mAvailIndices == null) {
                            this.mAvailIndices = new ArrayList<>();
                        }
                        if (DEBUG) {
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("restoreAllState: avail #");
                            sb3.append(i2);
                            Log.v(str3, sb3.toString());
                        }
                        this.mAvailIndices.add(Integer.valueOf(i2));
                    }
                }
                if (list != null) {
                    for (int i3 = 0; i3 < list.size(); i3++) {
                        Fragment fragment2 = (Fragment) list.get(i3);
                        if (fragment2.mTargetIndex >= 0) {
                            if (fragment2.mTargetIndex < this.mActive.size()) {
                                fragment2.mTarget = (Fragment) this.mActive.get(fragment2.mTargetIndex);
                            } else {
                                String str4 = TAG;
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("Re-attaching retained fragment ");
                                sb4.append(fragment2);
                                sb4.append(" target no longer exists: ");
                                sb4.append(fragment2.mTargetIndex);
                                Log.w(str4, sb4.toString());
                                fragment2.mTarget = null;
                            }
                        }
                    }
                }
                if (fragmentManagerState.mAdded != null) {
                    this.mAdded = new ArrayList<>(fragmentManagerState.mAdded.length);
                    int i4 = 0;
                    while (i4 < fragmentManagerState.mAdded.length) {
                        Fragment fragment3 = (Fragment) this.mActive.get(fragmentManagerState.mAdded[i4]);
                        if (fragment3 == null) {
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("No instantiated fragment for index #");
                            sb5.append(fragmentManagerState.mAdded[i4]);
                            throwException(new IllegalStateException(sb5.toString()));
                        }
                        fragment3.mAdded = true;
                        if (DEBUG) {
                            String str5 = TAG;
                            StringBuilder sb6 = new StringBuilder();
                            sb6.append("restoreAllState: added #");
                            sb6.append(i4);
                            sb6.append(": ");
                            sb6.append(fragment3);
                            Log.v(str5, sb6.toString());
                        }
                        if (!this.mAdded.contains(fragment3)) {
                            this.mAdded.add(fragment3);
                            i4++;
                        } else {
                            throw new IllegalStateException("Already added!");
                        }
                    }
                } else {
                    this.mAdded = null;
                }
                if (fragmentManagerState.mBackStack != null) {
                    this.mBackStack = new ArrayList<>(fragmentManagerState.mBackStack.length);
                    for (int i5 = 0; i5 < fragmentManagerState.mBackStack.length; i5++) {
                        BackStackRecord instantiate2 = fragmentManagerState.mBackStack[i5].instantiate(this);
                        if (DEBUG) {
                            String str6 = TAG;
                            StringBuilder sb7 = new StringBuilder();
                            sb7.append("restoreAllState: back stack #");
                            sb7.append(i5);
                            sb7.append(" (index ");
                            sb7.append(instantiate2.mIndex);
                            sb7.append("): ");
                            sb7.append(instantiate2);
                            Log.v(str6, sb7.toString());
                            instantiate2.dump("  ", new PrintWriter(new LogWriter(TAG)), false);
                        }
                        this.mBackStack.add(instantiate2);
                        if (instantiate2.mIndex >= 0) {
                            setBackStackIndex(instantiate2.mIndex, instantiate2);
                        }
                    }
                } else {
                    this.mBackStack = null;
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public ArrayList<Fragment> retainNonConfig() {
        ArrayList<Fragment> arrayList;
        ArrayList<Fragment> arrayList2 = null;
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment fragment = (Fragment) this.mActive.get(i);
                if (fragment != null && fragment.mRetainInstance) {
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList<>();
                    }
                    arrayList2.add(fragment);
                    fragment.mRetaining = true;
                    fragment.mTargetIndex = fragment.mTarget != null ? fragment.mTarget.mIndex : -1;
                    if (DEBUG) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("retainNonConfig: keeping retained ");
                        sb.append(fragment);
                        Log.v(str, sb.toString());
                    }
                }
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: 0000 */
    public Parcelable saveAllState() {
        execPendingActions();
        if (HONEYCOMB) {
            this.mStateSaved = true;
        }
        if (this.mActive == null || this.mActive.size() <= 0) {
            return null;
        }
        int size = this.mActive.size();
        FragmentState[] fragmentStateArr = new FragmentState[size];
        boolean z = false;
        for (int i = 0; i < size; i++) {
            Fragment fragment = (Fragment) this.mActive.get(i);
            if (fragment != null) {
                if (fragment.mIndex < 0) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failure saving state: active ");
                    sb.append(fragment);
                    sb.append(" has cleared index: ");
                    sb.append(fragment.mIndex);
                    throwException(new IllegalStateException(sb.toString()));
                }
                z = true;
                FragmentState fragmentState = new FragmentState(fragment);
                fragmentStateArr[i] = fragmentState;
                if (fragment.mState <= 0 || fragmentState.mSavedFragmentState != null) {
                    fragmentState.mSavedFragmentState = fragment.mSavedFragmentState;
                } else {
                    fragmentState.mSavedFragmentState = saveFragmentBasicState(fragment);
                    if (fragment.mTarget != null) {
                        if (fragment.mTarget.mIndex < 0) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Failure saving state: ");
                            sb2.append(fragment);
                            sb2.append(" has target not in fragment manager: ");
                            sb2.append(fragment.mTarget);
                            throwException(new IllegalStateException(sb2.toString()));
                        }
                        if (fragmentState.mSavedFragmentState == null) {
                            fragmentState.mSavedFragmentState = new Bundle();
                        }
                        putFragment(fragmentState.mSavedFragmentState, TARGET_STATE_TAG, fragment.mTarget);
                        if (fragment.mTargetRequestCode != 0) {
                            fragmentState.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, fragment.mTargetRequestCode);
                        }
                    }
                }
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Saved state of ");
                    sb3.append(fragment);
                    sb3.append(": ");
                    sb3.append(fragmentState.mSavedFragmentState);
                    Log.v(str, sb3.toString());
                }
            }
        }
        if (!z) {
            if (DEBUG) {
                Log.v(TAG, "saveAllState: no fragments!");
            }
            return null;
        }
        int[] iArr = null;
        BackStackState[] backStackStateArr = null;
        if (this.mAdded != null) {
            int size2 = this.mAdded.size();
            if (size2 > 0) {
                iArr = new int[size2];
                for (int i2 = 0; i2 < size2; i2++) {
                    iArr[i2] = ((Fragment) this.mAdded.get(i2)).mIndex;
                    if (iArr[i2] < 0) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Failure saving state: active ");
                        sb4.append(this.mAdded.get(i2));
                        sb4.append(" has cleared index: ");
                        sb4.append(iArr[i2]);
                        throwException(new IllegalStateException(sb4.toString()));
                    }
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("saveAllState: adding fragment #");
                        sb5.append(i2);
                        sb5.append(": ");
                        sb5.append(this.mAdded.get(i2));
                        Log.v(str2, sb5.toString());
                    }
                }
            }
        }
        if (this.mBackStack != null) {
            int size3 = this.mBackStack.size();
            if (size3 > 0) {
                backStackStateArr = new BackStackState[size3];
                for (int i3 = 0; i3 < size3; i3++) {
                    backStackStateArr[i3] = new BackStackState((BackStackRecord) this.mBackStack.get(i3));
                    if (DEBUG) {
                        String str3 = TAG;
                        StringBuilder sb6 = new StringBuilder();
                        sb6.append("saveAllState: adding back stack #");
                        sb6.append(i3);
                        sb6.append(": ");
                        sb6.append(this.mBackStack.get(i3));
                        Log.v(str3, sb6.toString());
                    }
                }
            }
        }
        FragmentManagerState fragmentManagerState = new FragmentManagerState();
        fragmentManagerState.mActive = fragmentStateArr;
        fragmentManagerState.mAdded = iArr;
        fragmentManagerState.mBackStack = backStackStateArr;
        return fragmentManagerState;
    }

    /* access modifiers changed from: 0000 */
    public Bundle saveFragmentBasicState(Fragment fragment) {
        Bundle bundle = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        fragment.performSaveInstanceState(this.mStateBundle);
        if (!this.mStateBundle.isEmpty()) {
            bundle = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (fragment.mView != null) {
            saveFragmentViewState(fragment);
        }
        if (fragment.mSavedViewState != null) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putSparseParcelableArray(VIEW_STATE_TAG, fragment.mSavedViewState);
        }
        if (!fragment.mUserVisibleHint) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putBoolean(USER_VISIBLE_HINT_TAG, fragment.mUserVisibleHint);
        }
        return bundle;
    }

    public SavedState saveFragmentInstanceState(Fragment fragment) {
        if (fragment.mIndex < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("Fragment ");
            sb.append(fragment);
            sb.append(" is not currently in the FragmentManager");
            throwException(new IllegalStateException(sb.toString()));
        }
        SavedState savedState = null;
        if (fragment.mState <= 0) {
            return null;
        }
        Bundle saveFragmentBasicState = saveFragmentBasicState(fragment);
        if (saveFragmentBasicState != null) {
            savedState = new SavedState(saveFragmentBasicState);
        }
        return savedState;
    }

    /* access modifiers changed from: 0000 */
    public void saveFragmentViewState(Fragment fragment) {
        if (fragment.mInnerView != null) {
            if (this.mStateArray == null) {
                this.mStateArray = new SparseArray<>();
            } else {
                this.mStateArray.clear();
            }
            fragment.mInnerView.saveHierarchyState(this.mStateArray);
            if (this.mStateArray.size() > 0) {
                fragment.mSavedViewState = this.mStateArray;
                this.mStateArray = null;
            }
        }
    }

    public void setBackStackIndex(int i, BackStackRecord backStackRecord) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int size = this.mBackStackIndices.size();
            if (i < size) {
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Setting back stack index ");
                    sb.append(i);
                    sb.append(" to ");
                    sb.append(backStackRecord);
                    Log.v(str, sb.toString());
                }
                this.mBackStackIndices.set(i, backStackRecord);
            } else {
                while (size < i) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList<>();
                    }
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Adding available back stack index ");
                        sb2.append(size);
                        Log.v(str2, sb2.toString());
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(size));
                    size++;
                }
                if (DEBUG) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Adding back stack index ");
                    sb3.append(i);
                    sb3.append(" with ");
                    sb3.append(backStackRecord);
                    Log.v(str3, sb3.toString());
                }
                this.mBackStackIndices.add(backStackRecord);
            }
        }
    }

    public void showFragment(Fragment fragment, int i, int i2) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("show: ");
            sb.append(fragment);
            Log.v(str, sb.toString());
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            if (fragment.mView != null) {
                Animation loadAnimation = loadAnimation(fragment, i, true, i2);
                if (loadAnimation != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, loadAnimation);
                    fragment.mView.startAnimation(loadAnimation);
                }
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(false);
        }
    }

    /* access modifiers changed from: 0000 */
    public void startPendingDeferredFragments() {
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment fragment = (Fragment) this.mActive.get(i);
                if (fragment != null) {
                    performPendingDeferredStart(fragment);
                }
            }
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        if (this.mParent != null) {
            DebugUtils.buildShortClassTag(this.mParent, sb);
        } else {
            DebugUtils.buildShortClassTag(this.mHost, sb);
        }
        sb.append("}}");
        return sb.toString();
    }
}
