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

        public AnimateOnHWLayerIfNeededListener(View v, Animation anim) {
            if (v != null && anim != null) {
                this.mView = v;
            }
        }

        @CallSuper
        public void onAnimationStart(Animation animation) {
            this.mShouldRunOnHWLayer = FragmentManagerImpl.shouldRunOnHWLayer(this.mView, animation);
            if (this.mShouldRunOnHWLayer) {
                ViewCompat.setLayerType(this.mView, 2, null);
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

    FragmentManagerImpl() {
    }

    static {
        boolean z = false;
        if (VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
    }

    static boolean modifiesAlpha(Animation anim) {
        if (anim instanceof AlphaAnimation) {
            return true;
        }
        if (anim instanceof AnimationSet) {
            List<Animation> anims = ((AnimationSet) anim).getAnimations();
            for (int i = 0; i < anims.size(); i++) {
                if (anims.get(i) instanceof AlphaAnimation) {
                    return true;
                }
            }
        }
        return false;
    }

    static boolean shouldRunOnHWLayer(View v, Animation anim) {
        return VERSION.SDK_INT >= 16 && ViewCompat.getLayerType(v) == 0 && ViewCompat.hasOverlappingRendering(v) && modifiesAlpha(anim);
    }

    private void throwException(RuntimeException ex) {
        Log.e(TAG, ex.getMessage());
        Log.e(TAG, "Activity state:");
        PrintWriter pw = new PrintWriter(new LogWriter(TAG));
        if (this.mHost != null) {
            try {
                this.mHost.onDump("  ", null, pw, new String[0]);
            } catch (Exception e) {
                Log.e(TAG, "Failed dumping state", e);
            }
        } else {
            try {
                dump("  ", null, pw, new String[0]);
            } catch (Exception e2) {
                Log.e(TAG, "Failed dumping state", e2);
            }
        }
        throw ex;
    }

    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    public boolean executePendingTransactions() {
        return execPendingActions();
    }

    public void popBackStack() {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, -1, 0);
            }
        }, false);
    }

    public boolean popBackStackImmediate() {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), null, -1, 0);
    }

    public void popBackStack(final String name, final int flags) {
        enqueueAction(new Runnable() {
            public void run() {
                FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), name, -1, flags);
            }
        }, false);
    }

    public boolean popBackStackImmediate(String name, int flags) {
        checkStateLoss();
        executePendingTransactions();
        return popBackStackState(this.mHost.getHandler(), name, -1, flags);
    }

    public void popBackStack(final int id, final int flags) {
        if (id >= 0) {
            enqueueAction(new Runnable() {
                public void run() {
                    FragmentManagerImpl.this.popBackStackState(FragmentManagerImpl.this.mHost.getHandler(), null, id, flags);
                }
            }, false);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Bad id: ");
        sb.append(id);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean popBackStackImmediate(int id, int flags) {
        checkStateLoss();
        executePendingTransactions();
        if (id >= 0) {
            return popBackStackState(this.mHost.getHandler(), null, id, flags);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Bad id: ");
        sb.append(id);
        throw new IllegalArgumentException(sb.toString());
    }

    public int getBackStackEntryCount() {
        if (this.mBackStack != null) {
            return this.mBackStack.size();
        }
        return 0;
    }

    public BackStackEntry getBackStackEntryAt(int index) {
        return (BackStackEntry) this.mBackStack.get(index);
    }

    public void addOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList<>();
        }
        this.mBackStackChangeListeners.add(listener);
    }

    public void removeOnBackStackChangedListener(OnBackStackChangedListener listener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(listener);
        }
    }

    public void putFragment(Bundle bundle, String key, Fragment fragment) {
        if (fragment.mIndex < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("Fragment ");
            sb.append(fragment);
            sb.append(" is not currently in the FragmentManager");
            throwException(new IllegalStateException(sb.toString()));
        }
        bundle.putInt(key, fragment.mIndex);
    }

    public Fragment getFragment(Bundle bundle, String key) {
        int index = bundle.getInt(key, -1);
        if (index == -1) {
            return null;
        }
        if (index >= this.mActive.size()) {
            StringBuilder sb = new StringBuilder();
            sb.append("Fragment no longer exists for key ");
            sb.append(key);
            sb.append(": index ");
            sb.append(index);
            throwException(new IllegalStateException(sb.toString()));
        }
        Fragment f = (Fragment) this.mActive.get(index);
        if (f == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Fragment no longer exists for key ");
            sb2.append(key);
            sb2.append(": index ");
            sb2.append(index);
            throwException(new IllegalStateException(sb2.toString()));
        }
        return f;
    }

    public List<Fragment> getFragments() {
        return this.mActive;
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
        Bundle result = saveFragmentBasicState(fragment);
        if (result != null) {
            savedState = new SavedState(result);
        }
        return savedState;
    }

    public boolean isDestroyed() {
        return this.mDestroyed;
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

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        StringBuilder sb = new StringBuilder();
        sb.append(prefix);
        sb.append("    ");
        String innerPrefix = sb.toString();
        if (this.mActive != null) {
            int N = this.mActive.size();
            if (N > 0) {
                writer.print(prefix);
                writer.print("Active Fragments in ");
                writer.print(Integer.toHexString(System.identityHashCode(this)));
                writer.println(":");
                for (int i = 0; i < N; i++) {
                    Fragment f = (Fragment) this.mActive.get(i);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i);
                    writer.print(": ");
                    writer.println(f);
                    if (f != null) {
                        f.dump(innerPrefix, fd, writer, args);
                    }
                }
            }
        }
        if (this.mAdded != null) {
            int N2 = this.mAdded.size();
            if (N2 > 0) {
                writer.print(prefix);
                writer.println("Added Fragments:");
                for (int i2 = 0; i2 < N2; i2++) {
                    Fragment f2 = (Fragment) this.mAdded.get(i2);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i2);
                    writer.print(": ");
                    writer.println(f2.toString());
                }
            }
        }
        if (this.mCreatedMenus != null) {
            int N3 = this.mCreatedMenus.size();
            if (N3 > 0) {
                writer.print(prefix);
                writer.println("Fragments Created Menus:");
                for (int i3 = 0; i3 < N3; i3++) {
                    Fragment f3 = (Fragment) this.mCreatedMenus.get(i3);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i3);
                    writer.print(": ");
                    writer.println(f3.toString());
                }
            }
        }
        if (this.mBackStack != null) {
            int N4 = this.mBackStack.size();
            if (N4 > 0) {
                writer.print(prefix);
                writer.println("Back Stack:");
                for (int i4 = 0; i4 < N4; i4++) {
                    BackStackRecord bs = (BackStackRecord) this.mBackStack.get(i4);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i4);
                    writer.print(": ");
                    writer.println(bs.toString());
                    bs.dump(innerPrefix, fd, writer, args);
                }
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null) {
                int N5 = this.mBackStackIndices.size();
                if (N5 > 0) {
                    writer.print(prefix);
                    writer.println("Back Stack Indices:");
                    for (int i5 = 0; i5 < N5; i5++) {
                        BackStackRecord bs2 = (BackStackRecord) this.mBackStackIndices.get(i5);
                        writer.print(prefix);
                        writer.print("  #");
                        writer.print(i5);
                        writer.print(": ");
                        writer.println(bs2);
                    }
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                writer.print(prefix);
                writer.print("mAvailBackStackIndices: ");
                writer.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null) {
            int N6 = this.mPendingActions.size();
            if (N6 > 0) {
                writer.print(prefix);
                writer.println("Pending Actions:");
                for (int i6 = 0; i6 < N6; i6++) {
                    Runnable r = (Runnable) this.mPendingActions.get(i6);
                    writer.print(prefix);
                    writer.print("  #");
                    writer.print(i6);
                    writer.print(": ");
                    writer.println(r);
                }
            }
        }
        writer.print(prefix);
        writer.println("FragmentManager misc state:");
        writer.print(prefix);
        writer.print("  mHost=");
        writer.println(this.mHost);
        writer.print(prefix);
        writer.print("  mContainer=");
        writer.println(this.mContainer);
        if (this.mParent != null) {
            writer.print(prefix);
            writer.print("  mParent=");
            writer.println(this.mParent);
        }
        writer.print(prefix);
        writer.print("  mCurState=");
        writer.print(this.mCurState);
        writer.print(" mStateSaved=");
        writer.print(this.mStateSaved);
        writer.print(" mDestroyed=");
        writer.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            writer.print(prefix);
            writer.print("  mNeedMenuInvalidate=");
            writer.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            writer.print(prefix);
            writer.print("  mNoTransactionsBecause=");
            writer.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices != null && this.mAvailIndices.size() > 0) {
            writer.print(prefix);
            writer.print("  mAvailIndices: ");
            writer.println(Arrays.toString(this.mAvailIndices.toArray()));
        }
    }

    static Animation makeOpenCloseAnimation(Context context, float startScale, float endScale, float startAlpha, float endAlpha) {
        AnimationSet set = new AnimationSet(false);
        ScaleAnimation scale = new ScaleAnimation(startScale, endScale, startScale, endScale, 1, 0.5f, 1, 0.5f);
        scale.setInterpolator(DECELERATE_QUINT);
        scale.setDuration(220);
        set.addAnimation(scale);
        AlphaAnimation alpha = new AlphaAnimation(startAlpha, endAlpha);
        alpha.setInterpolator(DECELERATE_CUBIC);
        alpha.setDuration(220);
        set.addAnimation(alpha);
        return set;
    }

    static Animation makeFadeAnimation(Context context, float start, float end) {
        AlphaAnimation anim = new AlphaAnimation(start, end);
        anim.setInterpolator(DECELERATE_CUBIC);
        anim.setDuration(220);
        return anim;
    }

    /* access modifiers changed from: 0000 */
    public Animation loadAnimation(Fragment fragment, int transit, boolean enter, int transitionStyle) {
        Animation animObj = fragment.onCreateAnimation(transit, enter, fragment.mNextAnim);
        if (animObj != null) {
            return animObj;
        }
        if (fragment.mNextAnim != 0) {
            Animation anim = AnimationUtils.loadAnimation(this.mHost.getContext(), fragment.mNextAnim);
            if (anim != null) {
                return anim;
            }
        }
        if (transit == 0) {
            return null;
        }
        int styleIndex = transitToStyleIndex(transit, enter);
        if (styleIndex < 0) {
            return null;
        }
        switch (styleIndex) {
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
                if (transitionStyle == 0 && this.mHost.onHasWindowAnimations()) {
                    transitionStyle = this.mHost.onGetWindowAnimations();
                }
                return transitionStyle == 0 ? null : null;
        }
    }

    public void performPendingDeferredStart(Fragment f) {
        if (f.mDeferStart) {
            if (this.mExecutingActions) {
                this.mHavePendingDeferredStart = true;
                return;
            }
            f.mDeferStart = false;
            moveToState(f, this.mCurState, 0, 0, false);
        }
    }

    private void setHWLayerAnimListenerIfAlpha(View v, Animation anim) {
        if (!(v == null || anim == null || !shouldRunOnHWLayer(v, anim))) {
            anim.setAnimationListener(new AnimateOnHWLayerIfNeededListener(v, anim));
        }
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
    public void moveToState(Fragment f, int newState, int transit, int transitionStyle, boolean keepActive) {
        int newState2;
        Fragment fragment = f;
        int i = transit;
        int i2 = transitionStyle;
        if (!fragment.mAdded || fragment.mDetached) {
            newState2 = newState;
            if (newState2 > 1) {
                newState2 = 1;
            }
        } else {
            newState2 = newState;
        }
        if (fragment.mRemoving && newState2 > fragment.mState) {
            newState2 = fragment.mState;
        }
        if (fragment.mDeferStart && fragment.mState < 4 && newState2 > 3) {
            newState2 = 3;
        }
        int newState3 = newState2;
        if (fragment.mState >= newState3) {
            if (fragment.mState > newState3) {
                switch (fragment.mState) {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        if (newState3 < 5) {
                            if (DEBUG) {
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("movefrom RESUMED: ");
                                sb.append(fragment);
                                Log.v(str, sb.toString());
                            }
                            f.performPause();
                            fragment.mResumed = false;
                            break;
                        }
                        break;
                }
            }
        } else if (!fragment.mFromLayout || fragment.mInLayout) {
            if (fragment.mAnimatingAway != null) {
                fragment.mAnimatingAway = null;
                moveToState(fragment, fragment.mStateAfterAnimating, 0, 0, true);
            }
            switch (fragment.mState) {
                case 0:
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("moveto CREATED: ");
                        sb2.append(fragment);
                        Log.v(str2, sb2.toString());
                    }
                    if (fragment.mSavedFragmentState != null) {
                        fragment.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                        fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                        fragment.mTarget = getFragment(fragment.mSavedFragmentState, TARGET_STATE_TAG);
                        if (fragment.mTarget != null) {
                            fragment.mTargetRequestCode = fragment.mSavedFragmentState.getInt(TARGET_REQUEST_CODE_STATE_TAG, 0);
                        }
                        fragment.mUserVisibleHint = fragment.mSavedFragmentState.getBoolean(USER_VISIBLE_HINT_TAG, true);
                        if (!fragment.mUserVisibleHint) {
                            fragment.mDeferStart = true;
                            if (newState3 > 3) {
                                newState3 = 3;
                            }
                        }
                    }
                    fragment.mHost = this.mHost;
                    fragment.mParentFragment = this.mParent;
                    fragment.mFragmentManager = this.mParent != null ? this.mParent.mChildFragmentManager : this.mHost.getFragmentManagerImpl();
                    fragment.mCalled = false;
                    fragment.onAttach(this.mHost.getContext());
                    if (fragment.mCalled) {
                        if (fragment.mParentFragment == null) {
                            this.mHost.onAttachFragment(fragment);
                        }
                        if (!fragment.mRetaining) {
                            fragment.performCreate(fragment.mSavedFragmentState);
                        }
                        fragment.mRetaining = false;
                        if (fragment.mFromLayout) {
                            fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), null, fragment.mSavedFragmentState);
                            if (fragment.mView == null) {
                                fragment.mInnerView = null;
                                break;
                            } else {
                                fragment.mInnerView = fragment.mView;
                                if (VERSION.SDK_INT >= 11) {
                                    ViewCompat.setSaveFromParentEnabled(fragment.mView, false);
                                } else {
                                    fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                                }
                                if (fragment.mHidden) {
                                    fragment.mView.setVisibility(8);
                                }
                                fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                                break;
                            }
                        }
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Fragment ");
                        sb3.append(fragment);
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
        fragment.mState = newState3;
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(Fragment f) {
        moveToState(f, this.mCurState, 0, 0, false);
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(int newState, boolean always) {
        moveToState(newState, 0, 0, always);
    }

    /* access modifiers changed from: 0000 */
    public void moveToState(int newState, int transit, int transitStyle, boolean always) {
        if (this.mHost == null && newState != 0) {
            throw new IllegalStateException("No host");
        } else if (always || this.mCurState != newState) {
            this.mCurState = newState;
            if (this.mActive != null) {
                boolean loadersRunning = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment f = (Fragment) this.mActive.get(i);
                    if (f != null) {
                        moveToState(f, newState, transit, transitStyle, false);
                        if (f.mLoaderManager != null) {
                            loadersRunning |= f.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                if (!loadersRunning) {
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
    public void startPendingDeferredFragments() {
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    performPendingDeferredStart(f);
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void makeActive(Fragment f) {
        if (f.mIndex < 0) {
            if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
                if (this.mActive == null) {
                    this.mActive = new ArrayList<>();
                }
                f.setIndex(this.mActive.size(), this.mParent);
                this.mActive.add(f);
            } else {
                f.setIndex(((Integer) this.mAvailIndices.remove(this.mAvailIndices.size() - 1)).intValue(), this.mParent);
                this.mActive.set(f.mIndex, f);
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Allocated fragment index ");
                sb.append(f);
                Log.v(str, sb.toString());
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void makeInactive(Fragment f) {
        if (f.mIndex >= 0) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Freeing fragment index ");
                sb.append(f);
                Log.v(str, sb.toString());
            }
            this.mActive.set(f.mIndex, null);
            if (this.mAvailIndices == null) {
                this.mAvailIndices = new ArrayList<>();
            }
            this.mAvailIndices.add(Integer.valueOf(f.mIndex));
            this.mHost.inactivateFragment(f.mWho);
            f.initState();
        }
    }

    public void addFragment(Fragment fragment, boolean moveToStateNow) {
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
            if (moveToStateNow) {
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

    public void removeFragment(Fragment fragment, int transition, int transitionStyle) {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("remove: ");
            sb.append(fragment);
            sb.append(" nesting=");
            sb.append(fragment.mBackStackNesting);
            Log.v(str, sb.toString());
        }
        boolean inactive = !fragment.isInBackStack();
        if (!fragment.mDetached || inactive) {
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
            moveToState(fragment, inactive ? 0 : 1, transition, transitionStyle, false);
        }
    }

    public void hideFragment(Fragment fragment, int transition, int transitionStyle) {
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
                Animation anim = loadAnimation(fragment, transition, false, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(8);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(true);
        }
    }

    public void showFragment(Fragment fragment, int transition, int transitionStyle) {
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
                Animation anim = loadAnimation(fragment, transition, true, transitionStyle);
                if (anim != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, anim);
                    fragment.mView.startAnimation(anim);
                }
                fragment.mView.setVisibility(0);
            }
            if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.onHiddenChanged(false);
        }
    }

    public void detachFragment(Fragment fragment, int transition, int transitionStyle) {
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
                moveToState(fragment, 1, transition, transitionStyle, false);
            }
        }
    }

    public void attachFragment(Fragment fragment, int transition, int transitionStyle) {
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
                    moveToState(fragment, this.mCurState, transition, transitionStyle, false);
                    return;
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Fragment already added: ");
                sb3.append(fragment);
                throw new IllegalStateException(sb3.toString());
            }
        }
    }

    public Fragment findFragmentById(int id) {
        if (this.mAdded != null) {
            for (int i = this.mAdded.size() - 1; i >= 0; i--) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.mFragmentId == id) {
                    return f;
                }
            }
        }
        if (this.mActive != null) {
            for (int i2 = this.mActive.size() - 1; i2 >= 0; i2--) {
                Fragment f2 = (Fragment) this.mActive.get(i2);
                if (f2 != null && f2.mFragmentId == id) {
                    return f2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByTag(String tag) {
        if (!(this.mAdded == null || tag == null)) {
            for (int i = this.mAdded.size() - 1; i >= 0; i--) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && tag.equals(f.mTag)) {
                    return f;
                }
            }
        }
        if (!(this.mActive == null || tag == null)) {
            for (int i2 = this.mActive.size() - 1; i2 >= 0; i2--) {
                Fragment f2 = (Fragment) this.mActive.get(i2);
                if (f2 != null && tag.equals(f2.mTag)) {
                    return f2;
                }
            }
        }
        return null;
    }

    public Fragment findFragmentByWho(String who) {
        if (!(this.mActive == null || who == null)) {
            for (int i = this.mActive.size() - 1; i >= 0; i--) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null) {
                    Fragment findFragmentByWho = f.findFragmentByWho(who);
                    Fragment f2 = findFragmentByWho;
                    if (findFragmentByWho != null) {
                        return f2;
                    }
                }
            }
        }
        return null;
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

    public void enqueueAction(Runnable action, boolean allowStateLoss) {
        if (!allowStateLoss) {
            checkStateLoss();
        }
        synchronized (this) {
            if (this.mDestroyed || this.mHost == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList<>();
            }
            this.mPendingActions.add(action);
            if (this.mPendingActions.size() == 1) {
                this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                this.mHost.getHandler().post(this.mExecCommit);
            }
        }
    }

    public int allocBackStackIndex(BackStackRecord bse) {
        synchronized (this) {
            if (this.mAvailBackStackIndices != null) {
                if (this.mAvailBackStackIndices.size() > 0) {
                    int index = ((Integer) this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1)).intValue();
                    if (DEBUG) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Adding back stack index ");
                        sb.append(index);
                        sb.append(" with ");
                        sb.append(bse);
                        Log.v(str, sb.toString());
                    }
                    this.mBackStackIndices.set(index, bse);
                    return index;
                }
            }
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int index2 = this.mBackStackIndices.size();
            if (DEBUG) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Setting back stack index ");
                sb2.append(index2);
                sb2.append(" to ");
                sb2.append(bse);
                Log.v(str2, sb2.toString());
            }
            this.mBackStackIndices.add(bse);
            return index2;
        }
    }

    public void setBackStackIndex(int index, BackStackRecord bse) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int N = this.mBackStackIndices.size();
            if (index < N) {
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Setting back stack index ");
                    sb.append(index);
                    sb.append(" to ");
                    sb.append(bse);
                    Log.v(str, sb.toString());
                }
                this.mBackStackIndices.set(index, bse);
            } else {
                while (N < index) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList<>();
                    }
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Adding available back stack index ");
                        sb2.append(N);
                        Log.v(str2, sb2.toString());
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(N));
                    N++;
                }
                if (DEBUG) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Adding back stack index ");
                    sb3.append(index);
                    sb3.append(" with ");
                    sb3.append(bse);
                    Log.v(str3, sb3.toString());
                }
                this.mBackStackIndices.add(bse);
            }
        }
    }

    public void freeBackStackIndex(int index) {
        synchronized (this) {
            this.mBackStackIndices.set(index, null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList<>();
            }
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Freeing back stack index ");
                sb.append(index);
                Log.v(str, sb.toString());
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(index));
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
            boolean didSomething = false;
            while (true) {
                synchronized (this) {
                    if (this.mPendingActions != null) {
                        if (this.mPendingActions.size() == 0) {
                            break;
                        }
                        int numActions = this.mPendingActions.size();
                        if (this.mTmpActions == null || this.mTmpActions.length < numActions) {
                            this.mTmpActions = new Runnable[numActions];
                        }
                        this.mPendingActions.toArray(this.mTmpActions);
                        this.mPendingActions.clear();
                        this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                    }
                }
                this.mExecutingActions = false;
                didSomething = true;
            }
            if (this.mHavePendingDeferredStart != 0) {
                boolean loadersRunning = false;
                for (int i = 0; i < this.mActive.size(); i++) {
                    Fragment f = (Fragment) this.mActive.get(i);
                    if (!(f == null || f.mLoaderManager == null)) {
                        loadersRunning |= f.mLoaderManager.hasRunningLoaders();
                    }
                }
                if (!loadersRunning) {
                    this.mHavePendingDeferredStart = false;
                    startPendingDeferredFragments();
                }
            }
            return didSomething;
        } else {
            throw new IllegalStateException("Must be called from main thread of process");
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
    public void addBackStackState(BackStackRecord state) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList<>();
        }
        this.mBackStack.add(state);
        reportBackStackChanged();
    }

    /* access modifiers changed from: 0000 */
    public boolean popBackStackState(Handler handler, String name, int id, int flags) {
        String str = name;
        int i = id;
        if (this.mBackStack == null) {
            return false;
        }
        if (str == null && i < 0 && (flags & 1) == 0) {
            int last = this.mBackStack.size() - 1;
            if (last < 0) {
                return false;
            }
            BackStackRecord bss = (BackStackRecord) this.mBackStack.remove(last);
            SparseArray<Fragment> firstOutFragments = new SparseArray<>();
            SparseArray<Fragment> lastInFragments = new SparseArray<>();
            bss.calculateBackFragments(firstOutFragments, lastInFragments);
            bss.popFromBackStack(true, null, firstOutFragments, lastInFragments);
            reportBackStackChanged();
        } else {
            int index = -1;
            if (str != null || i >= 0) {
                int index2 = this.mBackStack.size() - 1;
                while (index >= 0) {
                    BackStackRecord bss2 = (BackStackRecord) this.mBackStack.get(index);
                    if ((str != null && str.equals(bss2.getName())) || (i >= 0 && i == bss2.mIndex)) {
                        break;
                    }
                    index2 = index - 1;
                }
                if (index < 0) {
                    return false;
                }
                if ((flags & 1) != 0) {
                    index--;
                    while (index >= 0) {
                        BackStackRecord bss3 = (BackStackRecord) this.mBackStack.get(index);
                        if ((str == null || !str.equals(bss3.getName())) && (i < 0 || i != bss3.mIndex)) {
                            break;
                        }
                        index--;
                    }
                }
            }
            if (index == this.mBackStack.size() - 1) {
                return false;
            }
            ArrayList<BackStackRecord> states = new ArrayList<>();
            for (int i2 = this.mBackStack.size() - 1; i2 > index; i2--) {
                states.add(this.mBackStack.remove(i2));
            }
            int LAST = states.size() - 1;
            SparseArray<Fragment> firstOutFragments2 = new SparseArray<>();
            SparseArray<Fragment> lastInFragments2 = new SparseArray<>();
            for (int i3 = 0; i3 <= LAST; i3++) {
                ((BackStackRecord) states.get(i3)).calculateBackFragments(firstOutFragments2, lastInFragments2);
            }
            TransitionState state = null;
            int i4 = 0;
            while (i4 <= LAST) {
                if (DEBUG) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Popping back stack state: ");
                    sb.append(states.get(i4));
                    Log.v(str2, sb.toString());
                }
                state = ((BackStackRecord) states.get(i4)).popFromBackStack(i4 == LAST, state, firstOutFragments2, lastInFragments2);
                i4++;
            }
            reportBackStackChanged();
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public ArrayList<Fragment> retainNonConfig() {
        ArrayList<Fragment> fragments;
        ArrayList<Fragment> fragments2 = null;
        if (this.mActive != null) {
            for (int i = 0; i < this.mActive.size(); i++) {
                Fragment f = (Fragment) this.mActive.get(i);
                if (f != null && f.mRetainInstance) {
                    if (fragments2 == null) {
                        fragments2 = new ArrayList<>();
                    }
                    fragments2.add(f);
                    f.mRetaining = true;
                    f.mTargetIndex = f.mTarget != null ? f.mTarget.mIndex : -1;
                    if (DEBUG) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("retainNonConfig: keeping retained ");
                        sb.append(f);
                        Log.v(str, sb.toString());
                    }
                }
            }
        }
        return fragments;
    }

    /* access modifiers changed from: 0000 */
    public void saveFragmentViewState(Fragment f) {
        if (f.mInnerView != null) {
            if (this.mStateArray == null) {
                this.mStateArray = new SparseArray<>();
            } else {
                this.mStateArray.clear();
            }
            f.mInnerView.saveHierarchyState(this.mStateArray);
            if (this.mStateArray.size() > 0) {
                f.mSavedViewState = this.mStateArray;
                this.mStateArray = null;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public Bundle saveFragmentBasicState(Fragment f) {
        Bundle result = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        f.performSaveInstanceState(this.mStateBundle);
        if (!this.mStateBundle.isEmpty()) {
            result = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (f.mView != null) {
            saveFragmentViewState(f);
        }
        if (f.mSavedViewState != null) {
            if (result == null) {
                result = new Bundle();
            }
            result.putSparseParcelableArray(VIEW_STATE_TAG, f.mSavedViewState);
        }
        if (!f.mUserVisibleHint) {
            if (result == null) {
                result = new Bundle();
            }
            result.putBoolean(USER_VISIBLE_HINT_TAG, f.mUserVisibleHint);
        }
        return result;
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
        int N = this.mActive.size();
        FragmentState[] active = new FragmentState[N];
        boolean haveFragments = false;
        for (int i = 0; i < N; i++) {
            Fragment f = (Fragment) this.mActive.get(i);
            if (f != null) {
                if (f.mIndex < 0) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failure saving state: active ");
                    sb.append(f);
                    sb.append(" has cleared index: ");
                    sb.append(f.mIndex);
                    throwException(new IllegalStateException(sb.toString()));
                }
                haveFragments = true;
                FragmentState fs = new FragmentState(f);
                active[i] = fs;
                if (f.mState <= 0 || fs.mSavedFragmentState != null) {
                    fs.mSavedFragmentState = f.mSavedFragmentState;
                } else {
                    fs.mSavedFragmentState = saveFragmentBasicState(f);
                    if (f.mTarget != null) {
                        if (f.mTarget.mIndex < 0) {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Failure saving state: ");
                            sb2.append(f);
                            sb2.append(" has target not in fragment manager: ");
                            sb2.append(f.mTarget);
                            throwException(new IllegalStateException(sb2.toString()));
                        }
                        if (fs.mSavedFragmentState == null) {
                            fs.mSavedFragmentState = new Bundle();
                        }
                        putFragment(fs.mSavedFragmentState, TARGET_STATE_TAG, f.mTarget);
                        if (f.mTargetRequestCode != 0) {
                            fs.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, f.mTargetRequestCode);
                        }
                    }
                }
                if (DEBUG) {
                    String str = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Saved state of ");
                    sb3.append(f);
                    sb3.append(": ");
                    sb3.append(fs.mSavedFragmentState);
                    Log.v(str, sb3.toString());
                }
            }
        }
        if (!haveFragments) {
            if (DEBUG) {
                Log.v(TAG, "saveAllState: no fragments!");
            }
            return null;
        }
        int[] added = null;
        BackStackState[] backStack = null;
        if (this.mAdded != null) {
            int N2 = this.mAdded.size();
            if (N2 > 0) {
                added = new int[N2];
                for (int i2 = 0; i2 < N2; i2++) {
                    added[i2] = ((Fragment) this.mAdded.get(i2)).mIndex;
                    if (added[i2] < 0) {
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Failure saving state: active ");
                        sb4.append(this.mAdded.get(i2));
                        sb4.append(" has cleared index: ");
                        sb4.append(added[i2]);
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
            int N3 = this.mBackStack.size();
            if (N3 > 0) {
                backStack = new BackStackState[N3];
                for (int i3 = 0; i3 < N3; i3++) {
                    backStack[i3] = new BackStackState((BackStackRecord) this.mBackStack.get(i3));
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
        FragmentManagerState fms = new FragmentManagerState();
        fms.mActive = active;
        fms.mAdded = added;
        fms.mBackStack = backStack;
        return fms;
    }

    /* access modifiers changed from: 0000 */
    public void restoreAllState(Parcelable state, List<Fragment> nonConfig) {
        if (state != null) {
            FragmentManagerState fms = (FragmentManagerState) state;
            if (fms.mActive != null) {
                if (nonConfig != null) {
                    for (int i = 0; i < nonConfig.size(); i++) {
                        Fragment f = (Fragment) nonConfig.get(i);
                        if (DEBUG) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("restoreAllState: re-attaching retained ");
                            sb.append(f);
                            Log.v(str, sb.toString());
                        }
                        FragmentState fs = fms.mActive[f.mIndex];
                        fs.mInstance = f;
                        f.mSavedViewState = null;
                        f.mBackStackNesting = 0;
                        f.mInLayout = false;
                        f.mAdded = false;
                        f.mTarget = null;
                        if (fs.mSavedFragmentState != null) {
                            fs.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                            f.mSavedViewState = fs.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                            f.mSavedFragmentState = fs.mSavedFragmentState;
                        }
                    }
                }
                this.mActive = new ArrayList<>(fms.mActive.length);
                if (this.mAvailIndices != null) {
                    this.mAvailIndices.clear();
                }
                for (int i2 = 0; i2 < fms.mActive.length; i2++) {
                    FragmentState fs2 = fms.mActive[i2];
                    if (fs2 != null) {
                        Fragment f2 = fs2.instantiate(this.mHost, this.mParent);
                        if (DEBUG) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("restoreAllState: active #");
                            sb2.append(i2);
                            sb2.append(": ");
                            sb2.append(f2);
                            Log.v(str2, sb2.toString());
                        }
                        this.mActive.add(f2);
                        fs2.mInstance = null;
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
                if (nonConfig != null) {
                    for (int i3 = 0; i3 < nonConfig.size(); i3++) {
                        Fragment f3 = (Fragment) nonConfig.get(i3);
                        if (f3.mTargetIndex >= 0) {
                            if (f3.mTargetIndex < this.mActive.size()) {
                                f3.mTarget = (Fragment) this.mActive.get(f3.mTargetIndex);
                            } else {
                                String str4 = TAG;
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("Re-attaching retained fragment ");
                                sb4.append(f3);
                                sb4.append(" target no longer exists: ");
                                sb4.append(f3.mTargetIndex);
                                Log.w(str4, sb4.toString());
                                f3.mTarget = null;
                            }
                        }
                    }
                }
                if (fms.mAdded != null) {
                    this.mAdded = new ArrayList<>(fms.mAdded.length);
                    int i4 = 0;
                    while (i4 < fms.mAdded.length) {
                        Fragment f4 = (Fragment) this.mActive.get(fms.mAdded[i4]);
                        if (f4 == null) {
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("No instantiated fragment for index #");
                            sb5.append(fms.mAdded[i4]);
                            throwException(new IllegalStateException(sb5.toString()));
                        }
                        f4.mAdded = true;
                        if (DEBUG) {
                            String str5 = TAG;
                            StringBuilder sb6 = new StringBuilder();
                            sb6.append("restoreAllState: added #");
                            sb6.append(i4);
                            sb6.append(": ");
                            sb6.append(f4);
                            Log.v(str5, sb6.toString());
                        }
                        if (!this.mAdded.contains(f4)) {
                            this.mAdded.add(f4);
                            i4++;
                        } else {
                            throw new IllegalStateException("Already added!");
                        }
                    }
                } else {
                    this.mAdded = null;
                }
                if (fms.mBackStack != null) {
                    this.mBackStack = new ArrayList<>(fms.mBackStack.length);
                    for (int i5 = 0; i5 < fms.mBackStack.length; i5++) {
                        BackStackRecord bse = fms.mBackStack[i5].instantiate(this);
                        if (DEBUG) {
                            String str6 = TAG;
                            StringBuilder sb7 = new StringBuilder();
                            sb7.append("restoreAllState: back stack #");
                            sb7.append(i5);
                            sb7.append(" (index ");
                            sb7.append(bse.mIndex);
                            sb7.append("): ");
                            sb7.append(bse);
                            Log.v(str6, sb7.toString());
                            bse.dump("  ", new PrintWriter(new LogWriter(TAG)), false);
                        }
                        this.mBackStack.add(bse);
                        if (bse.mIndex >= 0) {
                            setBackStackIndex(bse.mIndex, bse);
                        }
                    }
                } else {
                    this.mBackStack = null;
                }
            }
        }
    }

    public void attachController(FragmentHostCallback host, FragmentContainer container, Fragment parent) {
        if (this.mHost == null) {
            this.mHost = host;
            this.mContainer = container;
            this.mParent = parent;
            return;
        }
        throw new IllegalStateException("Already attached");
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        moveToState(1, false);
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        moveToState(2, false);
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        moveToState(4, false);
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        moveToState(5, false);
    }

    public void dispatchPause() {
        moveToState(4, false);
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        moveToState(3, false);
    }

    public void dispatchReallyStop() {
        moveToState(2, false);
    }

    public void dispatchDestroyView() {
        moveToState(1, false);
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        moveToState(0, false);
        this.mHost = null;
        this.mContainer = null;
        this.mParent = null;
    }

    public void dispatchConfigurationChanged(Configuration newConfig) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performConfigurationChanged(newConfig);
                }
            }
        }
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performLowMemory();
                }
            }
        }
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        ArrayList<Fragment> newMenus;
        boolean show = false;
        ArrayList<Fragment> newMenus2 = null;
        int i = 0;
        if (this.mAdded != null) {
            boolean show2 = false;
            for (int i2 = 0; i2 < this.mAdded.size(); i2++) {
                Fragment f = (Fragment) this.mAdded.get(i2);
                if (f != null && f.performCreateOptionsMenu(menu, inflater)) {
                    show2 = true;
                    if (newMenus2 == null) {
                        newMenus2 = new ArrayList<>();
                    }
                    newMenus2.add(f);
                }
            }
            show = show2;
        }
        if (this.mCreatedMenus != null) {
            while (true) {
                int i3 = i;
                if (i3 >= this.mCreatedMenus.size()) {
                    break;
                }
                Fragment f2 = (Fragment) this.mCreatedMenus.get(i3);
                if (newMenus == null || !newMenus.contains(f2)) {
                    f2.onDestroyOptionsMenu();
                }
                i = i3 + 1;
            }
        }
        this.mCreatedMenus = newMenus;
        return show;
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean show;
        boolean show2 = false;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performPrepareOptionsMenu(menu)) {
                    show2 = true;
                }
            }
        }
        return show;
    }

    public boolean dispatchOptionsItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performOptionsItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean dispatchContextItemSelected(MenuItem item) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null && f.performContextItemSelected(item)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment f = (Fragment) this.mAdded.get(i);
                if (f != null) {
                    f.performOptionsMenuClosed(menu);
                }
            }
        }
    }

    public static int reverseTransit(int transit) {
        if (transit == 4097) {
            return 8194;
        }
        if (transit == 4099) {
            return 4099;
        }
        if (transit != 8194) {
            return 0;
        }
        return 4097;
    }

    public static int transitToStyleIndex(int transit, boolean enter) {
        if (transit == 4097) {
            return enter ? 1 : 2;
        } else if (transit == 4099) {
            return enter ? 5 : 6;
        } else if (transit != 8194) {
            return -1;
        } else {
            return enter ? 3 : 4;
        }
    }

    public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
        Fragment fragment;
        Fragment fragment2;
        Context context2 = context;
        AttributeSet attributeSet = attrs;
        Fragment fragment3 = null;
        if (!"fragment".equals(name)) {
            return null;
        }
        String fname = attributeSet.getAttributeValue(null, "class");
        TypedArray a = context2.obtainStyledAttributes(attributeSet, FragmentTag.Fragment);
        int i = 0;
        if (fname == null) {
            fname = a.getString(0);
        }
        String fname2 = fname;
        int id = a.getResourceId(1, -1);
        String tag = a.getString(2);
        a.recycle();
        if (!Fragment.isSupportFragmentClass(this.mHost.getContext(), fname2)) {
            return null;
        }
        if (parent != null) {
            i = parent.getId();
        }
        int containerId = i;
        if (containerId == -1 && id == -1 && tag == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(attrs.getPositionDescription());
            sb.append(": Must specify unique android:id, android:tag, or have a parent with an id for ");
            sb.append(fname2);
            throw new IllegalArgumentException(sb.toString());
        }
        if (id != -1) {
            fragment3 = findFragmentById(id);
        }
        if (fragment3 == null && tag != null) {
            fragment3 = findFragmentByTag(tag);
        }
        if (fragment3 == null && containerId != -1) {
            fragment3 = findFragmentById(containerId);
        }
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onCreateView: id=0x");
            sb2.append(Integer.toHexString(id));
            sb2.append(" fname=");
            sb2.append(fname2);
            sb2.append(" existing=");
            sb2.append(fragment3);
            Log.v(str, sb2.toString());
        }
        if (fragment3 == null) {
            Fragment fragment4 = Fragment.instantiate(context2, fname2);
            fragment4.mFromLayout = true;
            fragment4.mFragmentId = id != 0 ? id : containerId;
            fragment4.mContainerId = containerId;
            fragment4.mTag = tag;
            fragment4.mInLayout = true;
            fragment4.mFragmentManager = this;
            fragment4.onInflate(this.mHost.getContext(), attributeSet, fragment4.mSavedFragmentState);
            addFragment(fragment4, true);
            fragment = fragment4;
        } else if (!fragment3.mInLayout) {
            fragment3.mInLayout = true;
            if (!fragment3.mRetaining) {
                fragment3.onInflate(this.mHost.getContext(), attributeSet, fragment3.mSavedFragmentState);
            }
            fragment = fragment3;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(attrs.getPositionDescription());
            sb3.append(": Duplicate id 0x");
            sb3.append(Integer.toHexString(id));
            sb3.append(", tag ");
            sb3.append(tag);
            sb3.append(", or parent id 0x");
            sb3.append(Integer.toHexString(containerId));
            sb3.append(" with another fragment for ");
            sb3.append(fname2);
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
            if (id != 0) {
                fragment2.mView.setId(id);
            }
            if (fragment2.mView.getTag() == null) {
                fragment2.mView.setTag(tag);
            }
            return fragment2.mView;
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append("Fragment ");
        sb4.append(fname2);
        sb4.append(" did not create a view.");
        throw new IllegalStateException(sb4.toString());
    }

    /* access modifiers changed from: 0000 */
    public LayoutInflaterFactory getLayoutInflaterFactory() {
        return this;
    }
}
