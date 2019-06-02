package android.support.v4.app;

import android.os.Build.VERSION;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentTransitionCompat21.EpicenterView;
import android.support.v4.app.FragmentTransitionCompat21.ViewRetriever;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

final class BackStackRecord extends FragmentTransaction implements BackStackEntry, Runnable {
    static final int OP_ADD = 1;
    static final int OP_ATTACH = 7;
    static final int OP_DETACH = 6;
    static final int OP_HIDE = 4;
    static final int OP_NULL = 0;
    static final int OP_REMOVE = 3;
    static final int OP_REPLACE = 2;
    static final int OP_SHOW = 5;
    static final boolean SUPPORTS_TRANSITIONS = (VERSION.SDK_INT >= 21);
    static final String TAG = "FragmentManager";
    boolean mAddToBackStack;
    boolean mAllowAddToBackStack = true;
    int mBreadCrumbShortTitleRes;
    CharSequence mBreadCrumbShortTitleText;
    int mBreadCrumbTitleRes;
    CharSequence mBreadCrumbTitleText;
    boolean mCommitted;
    int mEnterAnim;
    int mExitAnim;
    Op mHead;
    int mIndex = -1;
    final FragmentManagerImpl mManager;
    String mName;
    int mNumOp;
    int mPopEnterAnim;
    int mPopExitAnim;
    ArrayList<String> mSharedElementSourceNames;
    ArrayList<String> mSharedElementTargetNames;
    Op mTail;
    int mTransition;
    int mTransitionStyle;

    static final class Op {
        int cmd;
        int enterAnim;
        int exitAnim;
        Fragment fragment;
        Op next;
        int popEnterAnim;
        int popExitAnim;
        Op prev;
        ArrayList<Fragment> removed;

        Op() {
        }
    }

    public class TransitionState {
        public EpicenterView enteringEpicenterView = new EpicenterView();
        public ArrayList<View> hiddenFragmentViews = new ArrayList<>();
        public ArrayMap<String, String> nameOverrides = new ArrayMap<>();
        public View nonExistentView;

        public TransitionState() {
        }
    }

    public BackStackRecord(FragmentManagerImpl fragmentManagerImpl) {
        this.mManager = fragmentManagerImpl;
    }

    private TransitionState beginTransition(SparseArray<Fragment> sparseArray, SparseArray<Fragment> sparseArray2, boolean z) {
        TransitionState transitionState = new TransitionState();
        transitionState.nonExistentView = new View(this.mManager.mHost.getContext());
        boolean z2 = false;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= sparseArray.size()) {
                break;
            }
            if (configureTransitions(sparseArray.keyAt(i2), transitionState, z, sparseArray, sparseArray2)) {
                z2 = true;
            }
            i = i2 + 1;
        }
        for (int i3 = 0; i3 < sparseArray2.size(); i3++) {
            int keyAt = sparseArray2.keyAt(i3);
            if (sparseArray.get(keyAt) == null && configureTransitions(keyAt, transitionState, z, sparseArray, sparseArray2)) {
                z2 = true;
            }
        }
        if (!z2) {
            return null;
        }
        return transitionState;
    }

    private void calculateFragments(SparseArray<Fragment> sparseArray, SparseArray<Fragment> sparseArray2) {
        Fragment fragment;
        if (this.mManager.mContainer.onHasView()) {
            for (Op op = this.mHead; op != null; op = op.next) {
                switch (op.cmd) {
                    case 1:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                    case 2:
                        Fragment fragment2 = op.fragment;
                        if (this.mManager.mAdded != null) {
                            for (int i = 0; i < this.mManager.mAdded.size(); i++) {
                                Fragment fragment3 = (Fragment) this.mManager.mAdded.get(i);
                                if (fragment2 == null || fragment3.mContainerId == fragment2.mContainerId) {
                                    if (fragment3 == fragment2) {
                                        fragment2 = null;
                                    } else {
                                        setFirstOut(sparseArray, fragment3);
                                    }
                                }
                            }
                        }
                        setLastIn(sparseArray2, fragment);
                        break;
                    case 3:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 4:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 5:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                    case 6:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 7:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void callSharedElementEnd(TransitionState transitionState, Fragment fragment, Fragment fragment2, boolean z, ArrayMap<String, View> arrayMap) {
        SharedElementCallback sharedElementCallback = z ? fragment2.mEnterTransitionCallback : fragment.mEnterTransitionCallback;
        if (sharedElementCallback != null) {
            sharedElementCallback.onSharedElementEnd(new ArrayList(arrayMap.keySet()), new ArrayList(arrayMap.values()), null);
        }
    }

    private static Object captureExitingViews(Object obj, Fragment fragment, ArrayList<View> arrayList, ArrayMap<String, View> arrayMap, View view) {
        return obj != null ? FragmentTransitionCompat21.captureExitingViews(obj, fragment.getView(), arrayList, arrayMap, view) : obj;
    }

    private boolean configureTransitions(int i, TransitionState transitionState, boolean z, SparseArray<Fragment> sparseArray, SparseArray<Fragment> sparseArray2) {
        Fragment fragment;
        Object obj;
        Object obj2;
        ArrayMap arrayMap;
        Object obj3;
        boolean z2;
        boolean z3;
        Object obj4;
        Object obj5;
        int i2 = i;
        TransitionState transitionState2 = transitionState;
        boolean z4 = z;
        ViewGroup viewGroup = (ViewGroup) this.mManager.mContainer.onFindViewById(i2);
        if (viewGroup == null) {
            return false;
        }
        final Fragment fragment2 = (Fragment) sparseArray2.get(i2);
        Fragment fragment3 = (Fragment) sparseArray.get(i2);
        Object enterTransition = getEnterTransition(fragment2, z4);
        Object sharedElementTransition = getSharedElementTransition(fragment2, fragment3, z4);
        Object exitTransition = getExitTransition(fragment3, z4);
        ArrayList arrayList = new ArrayList();
        if (sharedElementTransition != null) {
            ArrayMap remapSharedElements = remapSharedElements(transitionState2, fragment3, z4);
            if (remapSharedElements.isEmpty()) {
                obj3 = null;
                arrayMap = null;
                obj = exitTransition;
                obj2 = enterTransition;
                fragment = fragment3;
            } else {
                SharedElementCallback sharedElementCallback = z4 ? fragment3.mEnterTransitionCallback : fragment2.mEnterTransitionCallback;
                if (sharedElementCallback != null) {
                    obj5 = exitTransition;
                    sharedElementCallback.onSharedElementStart(new ArrayList(remapSharedElements.keySet()), new ArrayList(remapSharedElements.values()), null);
                } else {
                    obj5 = exitTransition;
                }
                SharedElementCallback sharedElementCallback2 = sharedElementCallback;
                ArrayMap arrayMap2 = remapSharedElements;
                obj = obj5;
                obj2 = enterTransition;
                fragment = fragment3;
                prepareSharedElementTransition(transitionState2, viewGroup, sharedElementTransition, fragment2, fragment3, z4, arrayList);
                obj3 = sharedElementTransition;
                arrayMap = arrayMap2;
            }
        } else {
            obj = exitTransition;
            obj2 = enterTransition;
            fragment = fragment3;
            arrayMap = null;
            obj3 = sharedElementTransition;
        }
        if (obj2 == null && obj3 == null && obj == null) {
            return false;
        }
        ArrayList arrayList2 = new ArrayList();
        Fragment fragment4 = fragment;
        Object captureExitingViews = captureExitingViews(obj, fragment4, arrayList2, arrayMap, transitionState2.nonExistentView);
        if (this.mSharedElementTargetNames != null && arrayMap != null) {
            View view = (View) arrayMap.get(this.mSharedElementTargetNames.get(0));
            if (view != null) {
                if (captureExitingViews != null) {
                    FragmentTransitionCompat21.setEpicenter(captureExitingViews, view);
                }
                if (obj3 != null) {
                    FragmentTransitionCompat21.setEpicenter(obj3, view);
                }
            }
        }
        Fragment fragment5 = fragment2;
        AnonymousClass1 r15 = new ViewRetriever() {
            public View getView() {
                return fragment2.getView();
            }
        };
        ArrayList arrayList3 = new ArrayList();
        ArrayMap arrayMap3 = new ArrayMap();
        boolean z5 = true;
        if (fragment5 != null) {
            z5 = z4 ? fragment5.getAllowReturnTransitionOverlap() : fragment5.getAllowEnterTransitionOverlap();
        }
        Object mergeTransitions = FragmentTransitionCompat21.mergeTransitions(obj2, captureExitingViews, obj3, z5);
        if (mergeTransitions != null) {
            Fragment fragment6 = fragment4;
            boolean z6 = z5;
            obj4 = mergeTransitions;
            Fragment fragment7 = fragment5;
            z2 = false;
            ViewGroup viewGroup2 = viewGroup;
            FragmentTransitionCompat21.addTransitionTargets(obj2, obj3, viewGroup, r15, transitionState2.nonExistentView, transitionState2.enteringEpicenterView, transitionState2.nameOverrides, arrayList3, arrayMap, arrayMap3, arrayList);
            Object obj6 = obj2;
            ViewGroup viewGroup3 = viewGroup2;
            int i3 = i;
            excludeHiddenFragmentsAfterEnter(viewGroup3, transitionState2, i3, obj4);
            z3 = true;
            FragmentTransitionCompat21.excludeTarget(obj4, transitionState2.nonExistentView, true);
            excludeHiddenFragments(transitionState2, i3, obj4);
            FragmentTransitionCompat21.beginDelayedTransition(viewGroup3, obj4);
            FragmentTransitionCompat21.cleanupTransitions(viewGroup3, transitionState2.nonExistentView, obj6, arrayList3, captureExitingViews, arrayList2, obj3, arrayList, obj4, transitionState2.hiddenFragmentViews, arrayMap3);
        } else {
            Fragment fragment8 = fragment4;
            boolean z7 = z5;
            Object obj7 = obj2;
            obj4 = mergeTransitions;
            Fragment fragment9 = fragment5;
            ViewGroup viewGroup4 = viewGroup;
            int i4 = i;
            z3 = true;
            z2 = false;
        }
        if (obj4 == null) {
            z3 = z2;
        }
        return z3;
    }

    private void doAddOp(int i, Fragment fragment, String str, int i2) {
        fragment.mFragmentManager = this.mManager;
        if (str != null) {
            if (fragment.mTag == null || str.equals(fragment.mTag)) {
                fragment.mTag = str;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Can't change tag of fragment ");
                sb.append(fragment);
                sb.append(": was ");
                sb.append(fragment.mTag);
                sb.append(" now ");
                sb.append(str);
                throw new IllegalStateException(sb.toString());
            }
        }
        if (i != 0) {
            if (fragment.mFragmentId == 0 || fragment.mFragmentId == i) {
                fragment.mFragmentId = i;
                fragment.mContainerId = i;
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Can't change container ID of fragment ");
                sb2.append(fragment);
                sb2.append(": was ");
                sb2.append(fragment.mFragmentId);
                sb2.append(" now ");
                sb2.append(i);
                throw new IllegalStateException(sb2.toString());
            }
        }
        Op op = new Op();
        op.cmd = i2;
        op.fragment = fragment;
        addOp(op);
    }

    /* access modifiers changed from: private */
    public void excludeHiddenFragments(TransitionState transitionState, int i, Object obj) {
        if (this.mManager.mAdded != null) {
            for (int i2 = 0; i2 < this.mManager.mAdded.size(); i2++) {
                Fragment fragment = (Fragment) this.mManager.mAdded.get(i2);
                if (!(fragment.mView == null || fragment.mContainer == null || fragment.mContainerId != i)) {
                    if (!fragment.mHidden) {
                        FragmentTransitionCompat21.excludeTarget(obj, fragment.mView, false);
                        transitionState.hiddenFragmentViews.remove(fragment.mView);
                    } else if (!transitionState.hiddenFragmentViews.contains(fragment.mView)) {
                        FragmentTransitionCompat21.excludeTarget(obj, fragment.mView, true);
                        transitionState.hiddenFragmentViews.add(fragment.mView);
                    }
                }
            }
        }
    }

    private void excludeHiddenFragmentsAfterEnter(View view, TransitionState transitionState, int i, Object obj) {
        ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
        final View view2 = view;
        final TransitionState transitionState2 = transitionState;
        final int i2 = i;
        final Object obj2 = obj;
        AnonymousClass3 r1 = new OnPreDrawListener() {
            public boolean onPreDraw() {
                view2.getViewTreeObserver().removeOnPreDrawListener(this);
                BackStackRecord.this.excludeHiddenFragments(transitionState2, i2, obj2);
                return true;
            }
        };
        viewTreeObserver.addOnPreDrawListener(r1);
    }

    private static Object getEnterTransition(Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return FragmentTransitionCompat21.cloneTransition(z ? fragment.getReenterTransition() : fragment.getEnterTransition());
    }

    private static Object getExitTransition(Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return FragmentTransitionCompat21.cloneTransition(z ? fragment.getReturnTransition() : fragment.getExitTransition());
    }

    private static Object getSharedElementTransition(Fragment fragment, Fragment fragment2, boolean z) {
        if (fragment == null || fragment2 == null) {
            return null;
        }
        return FragmentTransitionCompat21.wrapSharedElementTransition(z ? fragment2.getSharedElementReturnTransition() : fragment.getSharedElementEnterTransition());
    }

    private ArrayMap<String, View> mapEnteringSharedElements(TransitionState transitionState, Fragment fragment, boolean z) {
        ArrayMap<String, View> arrayMap = new ArrayMap<>();
        View view = fragment.getView();
        if (view == null || this.mSharedElementSourceNames == null) {
            return arrayMap;
        }
        FragmentTransitionCompat21.findNamedViews(arrayMap, view);
        if (z) {
            return remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, arrayMap);
        }
        arrayMap.retainAll(this.mSharedElementTargetNames);
        return arrayMap;
    }

    /* access modifiers changed from: private */
    public ArrayMap<String, View> mapSharedElementsIn(TransitionState transitionState, boolean z, Fragment fragment) {
        ArrayMap<String, View> mapEnteringSharedElements = mapEnteringSharedElements(transitionState, fragment, z);
        if (z) {
            if (fragment.mExitTransitionCallback != null) {
                fragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, mapEnteringSharedElements);
            }
            setBackNameOverrides(transitionState, mapEnteringSharedElements, true);
        } else {
            if (fragment.mEnterTransitionCallback != null) {
                fragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, mapEnteringSharedElements);
            }
            setNameOverrides(transitionState, mapEnteringSharedElements, true);
        }
        return mapEnteringSharedElements;
    }

    private void prepareSharedElementTransition(TransitionState transitionState, View view, Object obj, Fragment fragment, Fragment fragment2, boolean z, ArrayList<View> arrayList) {
        ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
        final View view2 = view;
        final Object obj2 = obj;
        final ArrayList<View> arrayList2 = arrayList;
        final TransitionState transitionState2 = transitionState;
        final boolean z2 = z;
        final Fragment fragment3 = fragment;
        final Fragment fragment4 = fragment2;
        AnonymousClass2 r1 = new OnPreDrawListener() {
            public boolean onPreDraw() {
                view2.getViewTreeObserver().removeOnPreDrawListener(this);
                if (obj2 != null) {
                    FragmentTransitionCompat21.removeTargets(obj2, arrayList2);
                    arrayList2.clear();
                    ArrayMap access$000 = BackStackRecord.this.mapSharedElementsIn(transitionState2, z2, fragment3);
                    FragmentTransitionCompat21.setSharedElementTargets(obj2, transitionState2.nonExistentView, access$000, arrayList2);
                    BackStackRecord.this.setEpicenterIn(access$000, transitionState2);
                    BackStackRecord.this.callSharedElementEnd(transitionState2, fragment3, fragment4, z2, access$000);
                }
                return true;
            }
        };
        viewTreeObserver.addOnPreDrawListener(r1);
    }

    private static ArrayMap<String, View> remapNames(ArrayList<String> arrayList, ArrayList<String> arrayList2, ArrayMap<String, View> arrayMap) {
        if (arrayMap.isEmpty()) {
            return arrayMap;
        }
        ArrayMap<String, View> arrayMap2 = new ArrayMap<>();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            View view = (View) arrayMap.get(arrayList.get(i));
            if (view != null) {
                arrayMap2.put(arrayList2.get(i), view);
            }
        }
        return arrayMap2;
    }

    private ArrayMap<String, View> remapSharedElements(TransitionState transitionState, Fragment fragment, boolean z) {
        ArrayMap<String, View> arrayMap = new ArrayMap<>();
        if (this.mSharedElementSourceNames != null) {
            FragmentTransitionCompat21.findNamedViews(arrayMap, fragment.getView());
            if (z) {
                arrayMap.retainAll(this.mSharedElementTargetNames);
            } else {
                arrayMap = remapNames(this.mSharedElementSourceNames, this.mSharedElementTargetNames, arrayMap);
            }
        }
        if (z) {
            if (fragment.mEnterTransitionCallback != null) {
                fragment.mEnterTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, arrayMap);
            }
            setBackNameOverrides(transitionState, arrayMap, false);
        } else {
            if (fragment.mExitTransitionCallback != null) {
                fragment.mExitTransitionCallback.onMapSharedElements(this.mSharedElementTargetNames, arrayMap);
            }
            setNameOverrides(transitionState, arrayMap, false);
        }
        return arrayMap;
    }

    private void setBackNameOverrides(TransitionState transitionState, ArrayMap<String, View> arrayMap, boolean z) {
        int size = this.mSharedElementTargetNames == null ? 0 : this.mSharedElementTargetNames.size();
        for (int i = 0; i < size; i++) {
            String str = (String) this.mSharedElementSourceNames.get(i);
            View view = (View) arrayMap.get((String) this.mSharedElementTargetNames.get(i));
            if (view != null) {
                String transitionName = FragmentTransitionCompat21.getTransitionName(view);
                if (z) {
                    setNameOverride(transitionState.nameOverrides, str, transitionName);
                } else {
                    setNameOverride(transitionState.nameOverrides, transitionName, str);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void setEpicenterIn(ArrayMap<String, View> arrayMap, TransitionState transitionState) {
        if (this.mSharedElementTargetNames != null && !arrayMap.isEmpty()) {
            View view = (View) arrayMap.get(this.mSharedElementTargetNames.get(0));
            if (view != null) {
                transitionState.enteringEpicenterView.epicenter = view;
            }
        }
    }

    private static void setFirstOut(SparseArray<Fragment> sparseArray, Fragment fragment) {
        if (fragment != null) {
            int i = fragment.mContainerId;
            if (i != 0 && !fragment.isHidden() && fragment.isAdded() && fragment.getView() != null && sparseArray.get(i) == null) {
                sparseArray.put(i, fragment);
            }
        }
    }

    private void setLastIn(SparseArray<Fragment> sparseArray, Fragment fragment) {
        if (fragment != null) {
            int i = fragment.mContainerId;
            if (i != 0) {
                sparseArray.put(i, fragment);
            }
        }
    }

    private static void setNameOverride(ArrayMap<String, String> arrayMap, String str, String str2) {
        if (!(str == null || str2 == null)) {
            for (int i = 0; i < arrayMap.size(); i++) {
                if (str.equals(arrayMap.valueAt(i))) {
                    arrayMap.setValueAt(i, str2);
                    return;
                }
            }
            arrayMap.put(str, str2);
        }
    }

    private void setNameOverrides(TransitionState transitionState, ArrayMap<String, View> arrayMap, boolean z) {
        int size = arrayMap.size();
        for (int i = 0; i < size; i++) {
            String str = (String) arrayMap.keyAt(i);
            String transitionName = FragmentTransitionCompat21.getTransitionName((View) arrayMap.valueAt(i));
            if (z) {
                setNameOverride(transitionState.nameOverrides, str, transitionName);
            } else {
                setNameOverride(transitionState.nameOverrides, transitionName, str);
            }
        }
    }

    private static void setNameOverrides(TransitionState transitionState, ArrayList<String> arrayList, ArrayList<String> arrayList2) {
        if (arrayList != null) {
            for (int i = 0; i < arrayList.size(); i++) {
                setNameOverride(transitionState.nameOverrides, (String) arrayList.get(i), (String) arrayList2.get(i));
            }
        }
    }

    public FragmentTransaction add(int i, Fragment fragment) {
        doAddOp(i, fragment, null, 1);
        return this;
    }

    public FragmentTransaction add(int i, Fragment fragment, String str) {
        doAddOp(i, fragment, str, 1);
        return this;
    }

    public FragmentTransaction add(Fragment fragment, String str) {
        doAddOp(0, fragment, str, 1);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void addOp(Op op) {
        if (this.mHead == null) {
            this.mTail = op;
            this.mHead = op;
        } else {
            op.prev = this.mTail;
            this.mTail.next = op;
            this.mTail = op;
        }
        op.enterAnim = this.mEnterAnim;
        op.exitAnim = this.mExitAnim;
        op.popEnterAnim = this.mPopEnterAnim;
        op.popExitAnim = this.mPopExitAnim;
        this.mNumOp++;
    }

    public FragmentTransaction addSharedElement(View view, String str) {
        if (SUPPORTS_TRANSITIONS) {
            String transitionName = FragmentTransitionCompat21.getTransitionName(view);
            if (transitionName != null) {
                if (this.mSharedElementSourceNames == null) {
                    this.mSharedElementSourceNames = new ArrayList<>();
                    this.mSharedElementTargetNames = new ArrayList<>();
                }
                this.mSharedElementSourceNames.add(transitionName);
                this.mSharedElementTargetNames.add(str);
            } else {
                throw new IllegalArgumentException("Unique transitionNames are required for all sharedElements");
            }
        }
        return this;
    }

    public FragmentTransaction addToBackStack(String str) {
        if (this.mAllowAddToBackStack) {
            this.mAddToBackStack = true;
            this.mName = str;
            return this;
        }
        throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }

    public FragmentTransaction attach(Fragment fragment) {
        Op op = new Op();
        op.cmd = 7;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void bumpBackStackNesting(int i) {
        if (this.mAddToBackStack) {
            if (FragmentManagerImpl.DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Bump nesting in ");
                sb.append(this);
                sb.append(" by ");
                sb.append(i);
                Log.v(str, sb.toString());
            }
            Op op = this.mHead;
            while (op != null) {
                if (op.fragment != null) {
                    op.fragment.mBackStackNesting += i;
                    if (FragmentManagerImpl.DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Bump nesting of ");
                        sb2.append(op.fragment);
                        sb2.append(" to ");
                        sb2.append(op.fragment.mBackStackNesting);
                        Log.v(str2, sb2.toString());
                    }
                }
                if (op.removed != null) {
                    for (int size = op.removed.size() - 1; size >= 0; size--) {
                        Fragment fragment = (Fragment) op.removed.get(size);
                        fragment.mBackStackNesting += i;
                        if (FragmentManagerImpl.DEBUG) {
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Bump nesting of ");
                            sb3.append(fragment);
                            sb3.append(" to ");
                            sb3.append(fragment.mBackStackNesting);
                            Log.v(str3, sb3.toString());
                        }
                    }
                }
                op = op.next;
            }
        }
    }

    public void calculateBackFragments(SparseArray<Fragment> sparseArray, SparseArray<Fragment> sparseArray2) {
        if (this.mManager.mContainer.onHasView()) {
            for (Op op = this.mHead; op != null; op = op.next) {
                switch (op.cmd) {
                    case 1:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 2:
                        if (op.removed != null) {
                            for (int size = op.removed.size() - 1; size >= 0; size--) {
                                setLastIn(sparseArray2, (Fragment) op.removed.get(size));
                            }
                        }
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 3:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                    case 4:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                    case 5:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                    case 6:
                        setLastIn(sparseArray2, op.fragment);
                        break;
                    case 7:
                        setFirstOut(sparseArray, op.fragment);
                        break;
                }
            }
        }
    }

    public int commit() {
        return commitInternal(false);
    }

    public int commitAllowingStateLoss() {
        return commitInternal(true);
    }

    /* access modifiers changed from: 0000 */
    public int commitInternal(boolean z) {
        if (!this.mCommitted) {
            if (FragmentManagerImpl.DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Commit: ");
                sb.append(this);
                Log.v(str, sb.toString());
                dump("  ", null, new PrintWriter(new LogWriter(TAG)), null);
            }
            this.mCommitted = true;
            if (this.mAddToBackStack) {
                this.mIndex = this.mManager.allocBackStackIndex(this);
            } else {
                this.mIndex = -1;
            }
            this.mManager.enqueueAction(this, z);
            return this.mIndex;
        }
        throw new IllegalStateException("commit already called");
    }

    public FragmentTransaction detach(Fragment fragment) {
        Op op = new Op();
        op.cmd = 6;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction disallowAddToBackStack() {
        if (!this.mAddToBackStack) {
            this.mAllowAddToBackStack = false;
            return this;
        }
        throw new IllegalStateException("This transaction is already being added to the back stack");
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        dump(str, printWriter, true);
    }

    public void dump(String str, PrintWriter printWriter, boolean z) {
        String str2;
        if (z) {
            printWriter.print(str);
            printWriter.print("mName=");
            printWriter.print(this.mName);
            printWriter.print(" mIndex=");
            printWriter.print(this.mIndex);
            printWriter.print(" mCommitted=");
            printWriter.println(this.mCommitted);
            if (this.mTransition != 0) {
                printWriter.print(str);
                printWriter.print("mTransition=#");
                printWriter.print(Integer.toHexString(this.mTransition));
                printWriter.print(" mTransitionStyle=#");
                printWriter.println(Integer.toHexString(this.mTransitionStyle));
            }
            if (!(this.mEnterAnim == 0 && this.mExitAnim == 0)) {
                printWriter.print(str);
                printWriter.print("mEnterAnim=#");
                printWriter.print(Integer.toHexString(this.mEnterAnim));
                printWriter.print(" mExitAnim=#");
                printWriter.println(Integer.toHexString(this.mExitAnim));
            }
            if (!(this.mPopEnterAnim == 0 && this.mPopExitAnim == 0)) {
                printWriter.print(str);
                printWriter.print("mPopEnterAnim=#");
                printWriter.print(Integer.toHexString(this.mPopEnterAnim));
                printWriter.print(" mPopExitAnim=#");
                printWriter.println(Integer.toHexString(this.mPopExitAnim));
            }
            if (!(this.mBreadCrumbTitleRes == 0 && this.mBreadCrumbTitleText == null)) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbTitleRes=#");
                printWriter.print(Integer.toHexString(this.mBreadCrumbTitleRes));
                printWriter.print(" mBreadCrumbTitleText=");
                printWriter.println(this.mBreadCrumbTitleText);
            }
            if (!(this.mBreadCrumbShortTitleRes == 0 && this.mBreadCrumbShortTitleText == null)) {
                printWriter.print(str);
                printWriter.print("mBreadCrumbShortTitleRes=#");
                printWriter.print(Integer.toHexString(this.mBreadCrumbShortTitleRes));
                printWriter.print(" mBreadCrumbShortTitleText=");
                printWriter.println(this.mBreadCrumbShortTitleText);
            }
        }
        if (this.mHead != null) {
            printWriter.print(str);
            printWriter.println("Operations:");
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("    ");
            String sb2 = sb.toString();
            Op op = this.mHead;
            int i = 0;
            while (op != null) {
                switch (op.cmd) {
                    case 0:
                        str2 = "NULL";
                        break;
                    case 1:
                        str2 = "ADD";
                        break;
                    case 2:
                        str2 = "REPLACE";
                        break;
                    case 3:
                        str2 = "REMOVE";
                        break;
                    case 4:
                        str2 = "HIDE";
                        break;
                    case 5:
                        str2 = "SHOW";
                        break;
                    case 6:
                        str2 = "DETACH";
                        break;
                    case 7:
                        str2 = "ATTACH";
                        break;
                    default:
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("cmd=");
                        sb3.append(op.cmd);
                        str2 = sb3.toString();
                        break;
                }
                printWriter.print(str);
                printWriter.print("  Op #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.print(str2);
                printWriter.print(" ");
                printWriter.println(op.fragment);
                if (z) {
                    if (!(op.enterAnim == 0 && op.exitAnim == 0)) {
                        printWriter.print(str);
                        printWriter.print("enterAnim=#");
                        printWriter.print(Integer.toHexString(op.enterAnim));
                        printWriter.print(" exitAnim=#");
                        printWriter.println(Integer.toHexString(op.exitAnim));
                    }
                    if (!(op.popEnterAnim == 0 && op.popExitAnim == 0)) {
                        printWriter.print(str);
                        printWriter.print("popEnterAnim=#");
                        printWriter.print(Integer.toHexString(op.popEnterAnim));
                        printWriter.print(" popExitAnim=#");
                        printWriter.println(Integer.toHexString(op.popExitAnim));
                    }
                }
                if (op.removed != null && op.removed.size() > 0) {
                    for (int i2 = 0; i2 < op.removed.size(); i2++) {
                        printWriter.print(sb2);
                        if (op.removed.size() == 1) {
                            printWriter.print("Removed: ");
                        } else {
                            if (i2 == 0) {
                                printWriter.println("Removed:");
                            }
                            printWriter.print(sb2);
                            printWriter.print("  #");
                            printWriter.print(i2);
                            printWriter.print(": ");
                        }
                        printWriter.println(op.removed.get(i2));
                    }
                }
                op = op.next;
                i++;
            }
        }
    }

    public CharSequence getBreadCrumbShortTitle() {
        return this.mBreadCrumbShortTitleRes != 0 ? this.mManager.mHost.getContext().getText(this.mBreadCrumbShortTitleRes) : this.mBreadCrumbShortTitleText;
    }

    public int getBreadCrumbShortTitleRes() {
        return this.mBreadCrumbShortTitleRes;
    }

    public CharSequence getBreadCrumbTitle() {
        return this.mBreadCrumbTitleRes != 0 ? this.mManager.mHost.getContext().getText(this.mBreadCrumbTitleRes) : this.mBreadCrumbTitleText;
    }

    public int getBreadCrumbTitleRes() {
        return this.mBreadCrumbTitleRes;
    }

    public int getId() {
        return this.mIndex;
    }

    public String getName() {
        return this.mName;
    }

    public int getTransition() {
        return this.mTransition;
    }

    public int getTransitionStyle() {
        return this.mTransitionStyle;
    }

    public FragmentTransaction hide(Fragment fragment) {
        Op op = new Op();
        op.cmd = 4;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public boolean isAddToBackStackAllowed() {
        return this.mAllowAddToBackStack;
    }

    public boolean isEmpty() {
        return this.mNumOp == 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0065  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x006b  */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x006d  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0126  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x0138  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public TransitionState popFromBackStack(boolean z, TransitionState transitionState, SparseArray<Fragment> sparseArray, SparseArray<Fragment> sparseArray2) {
        Op op;
        TransitionState transitionState2 = transitionState;
        if (FragmentManagerImpl.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("popFromBackStack: ");
            sb.append(this);
            Log.v(str, sb.toString());
            dump("  ", null, new PrintWriter(new LogWriter(TAG)), null);
        }
        if (SUPPORTS_TRANSITIONS) {
            if (transitionState2 != null) {
                SparseArray<Fragment> sparseArray3 = sparseArray;
                SparseArray<Fragment> sparseArray4 = sparseArray2;
                if (!z) {
                    setNameOverrides(transitionState2, this.mSharedElementTargetNames, this.mSharedElementSourceNames);
                }
            } else if (!(sparseArray.size() == 0 && sparseArray2.size() == 0)) {
                transitionState2 = beginTransition(sparseArray, sparseArray2, true);
            }
            bumpBackStackNesting(-1);
            int i = transitionState2 == null ? 0 : this.mTransitionStyle;
            int i2 = transitionState2 == null ? 0 : this.mTransition;
            op = this.mTail;
            while (op != null) {
                int i3 = transitionState2 != null ? 0 : op.popEnterAnim;
                int i4 = transitionState2 != null ? 0 : op.popExitAnim;
                switch (op.cmd) {
                    case 1:
                        Fragment fragment = op.fragment;
                        fragment.mNextAnim = i4;
                        this.mManager.removeFragment(fragment, FragmentManagerImpl.reverseTransit(i2), i);
                        break;
                    case 2:
                        Fragment fragment2 = op.fragment;
                        if (fragment2 != null) {
                            fragment2.mNextAnim = i4;
                            this.mManager.removeFragment(fragment2, FragmentManagerImpl.reverseTransit(i2), i);
                        }
                        if (op.removed == null) {
                            break;
                        } else {
                            for (int i5 = 0; i5 < op.removed.size(); i5++) {
                                Fragment fragment3 = (Fragment) op.removed.get(i5);
                                fragment3.mNextAnim = i3;
                                this.mManager.addFragment(fragment3, false);
                            }
                            break;
                        }
                    case 3:
                        Fragment fragment4 = op.fragment;
                        fragment4.mNextAnim = i3;
                        this.mManager.addFragment(fragment4, false);
                        break;
                    case 4:
                        Fragment fragment5 = op.fragment;
                        fragment5.mNextAnim = i3;
                        this.mManager.showFragment(fragment5, FragmentManagerImpl.reverseTransit(i2), i);
                        break;
                    case 5:
                        Fragment fragment6 = op.fragment;
                        fragment6.mNextAnim = i4;
                        this.mManager.hideFragment(fragment6, FragmentManagerImpl.reverseTransit(i2), i);
                        break;
                    case 6:
                        Fragment fragment7 = op.fragment;
                        fragment7.mNextAnim = i3;
                        this.mManager.attachFragment(fragment7, FragmentManagerImpl.reverseTransit(i2), i);
                        break;
                    case 7:
                        Fragment fragment8 = op.fragment;
                        fragment8.mNextAnim = i3;
                        this.mManager.detachFragment(fragment8, FragmentManagerImpl.reverseTransit(i2), i);
                        break;
                    default:
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Unknown cmd: ");
                        sb2.append(op.cmd);
                        throw new IllegalArgumentException(sb2.toString());
                }
                op = op.prev;
            }
            if (z) {
                this.mManager.moveToState(this.mManager.mCurState, FragmentManagerImpl.reverseTransit(i2), i, true);
                transitionState2 = null;
            }
            if (this.mIndex >= 0) {
                this.mManager.freeBackStackIndex(this.mIndex);
                this.mIndex = -1;
            }
            return transitionState2;
        }
        SparseArray<Fragment> sparseArray5 = sparseArray;
        SparseArray<Fragment> sparseArray6 = sparseArray2;
        bumpBackStackNesting(-1);
        if (transitionState2 == null) {
        }
        if (transitionState2 == null) {
        }
        op = this.mTail;
        while (op != null) {
        }
        if (z) {
        }
        if (this.mIndex >= 0) {
        }
        return transitionState2;
    }

    public FragmentTransaction remove(Fragment fragment) {
        Op op = new Op();
        op.cmd = 3;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public FragmentTransaction replace(int i, Fragment fragment) {
        return replace(i, fragment, null);
    }

    public FragmentTransaction replace(int i, Fragment fragment, String str) {
        if (i != 0) {
            doAddOp(i, fragment, str, 2);
            return this;
        }
        throw new IllegalArgumentException("Must use non-zero containerViewId");
    }

    /* JADX WARNING: type inference failed for: r6v0 */
    /* JADX WARNING: type inference failed for: r6v1, types: [boolean] */
    /* JADX WARNING: type inference failed for: r9v1, types: [int] */
    /* JADX WARNING: type inference failed for: r10v0, types: [int] */
    /* JADX WARNING: type inference failed for: r6v6 */
    /* JADX WARNING: type inference failed for: r6v7 */
    /* JADX WARNING: type inference failed for: r6v8 */
    /* JADX WARNING: type inference failed for: r11v5 */
    /* JADX WARNING: type inference failed for: r11v6, types: [int] */
    /* JADX WARNING: type inference failed for: r11v7, types: [int] */
    /* JADX WARNING: type inference failed for: r10v1, types: [int] */
    /* JADX WARNING: type inference failed for: r10v2 */
    /* JADX WARNING: type inference failed for: r9v2, types: [int] */
    /* JADX WARNING: type inference failed for: r9v3 */
    /* JADX WARNING: type inference failed for: r6v14 */
    /* JADX WARNING: type inference failed for: r6v15 */
    /* JADX WARNING: type inference failed for: r6v16 */
    /* JADX WARNING: type inference failed for: r6v17 */
    /* JADX WARNING: type inference failed for: r6v18 */
    /* JADX WARNING: type inference failed for: r11v13 */
    /* JADX WARNING: type inference failed for: r10v3 */
    /* JADX WARNING: type inference failed for: r9v4 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r6v6
  assigns: []
  uses: []
  mth insns count: 162
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 10 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void run() {
        ? r6;
        Fragment fragment;
        if (FragmentManagerImpl.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Run: ");
            sb.append(this);
            Log.v(str, sb.toString());
        }
        if (!this.mAddToBackStack || this.mIndex >= 0) {
            bumpBackStackNesting(1);
            TransitionState transitionState = null;
            ? r62 = 0;
            if (SUPPORTS_TRANSITIONS) {
                SparseArray sparseArray = new SparseArray();
                SparseArray sparseArray2 = new SparseArray();
                calculateFragments(sparseArray, sparseArray2);
                transitionState = beginTransition(sparseArray, sparseArray2, false);
            }
            int i = transitionState != null ? 0 : this.mTransitionStyle;
            int i2 = transitionState != null ? 0 : this.mTransition;
            Op op = this.mHead;
            ? r63 = r62;
            while (op != null) {
                ? r9 = transitionState != null ? r6 : op.enterAnim;
                ? r10 = transitionState != null ? r6 : op.exitAnim;
                switch (op.cmd) {
                    case 1:
                        Fragment fragment2 = op.fragment;
                        fragment2.mNextAnim = r9;
                        this.mManager.addFragment(fragment2, r6);
                        r6 = r6;
                        break;
                    case 2:
                        Fragment fragment3 = op.fragment;
                        int i3 = fragment3.mContainerId;
                        if (this.mManager.mAdded != null) {
                            fragment = fragment3;
                            for (? r11 = r6; r11 < this.mManager.mAdded.size(); r11++) {
                                Fragment fragment4 = (Fragment) this.mManager.mAdded.get(r11);
                                if (FragmentManagerImpl.DEBUG) {
                                    String str2 = TAG;
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("OP_REPLACE: adding=");
                                    sb2.append(fragment);
                                    sb2.append(" old=");
                                    sb2.append(fragment4);
                                    Log.v(str2, sb2.toString());
                                }
                                if (fragment4.mContainerId == i3) {
                                    if (fragment4 == fragment) {
                                        fragment = null;
                                        op.fragment = null;
                                    } else {
                                        if (op.removed == null) {
                                            op.removed = new ArrayList<>();
                                        }
                                        op.removed.add(fragment4);
                                        fragment4.mNextAnim = r10;
                                        if (this.mAddToBackStack) {
                                            fragment4.mBackStackNesting++;
                                            if (FragmentManagerImpl.DEBUG) {
                                                String str3 = TAG;
                                                StringBuilder sb3 = new StringBuilder();
                                                sb3.append("Bump nesting of ");
                                                sb3.append(fragment4);
                                                sb3.append(" to ");
                                                sb3.append(fragment4.mBackStackNesting);
                                                Log.v(str3, sb3.toString());
                                            }
                                        }
                                        this.mManager.removeFragment(fragment4, i2, i);
                                    }
                                }
                            }
                        } else {
                            fragment = fragment3;
                        }
                        if (fragment == null) {
                            r6 = 0;
                            break;
                        } else {
                            fragment.mNextAnim = r9;
                            ? r64 = 0;
                            this.mManager.addFragment(fragment, false);
                            r6 = r64;
                            break;
                        }
                    case 3:
                        Fragment fragment5 = op.fragment;
                        fragment5.mNextAnim = r10;
                        this.mManager.removeFragment(fragment5, i2, i);
                        break;
                    case 4:
                        Fragment fragment6 = op.fragment;
                        fragment6.mNextAnim = r10;
                        this.mManager.hideFragment(fragment6, i2, i);
                        break;
                    case 5:
                        Fragment fragment7 = op.fragment;
                        fragment7.mNextAnim = r9;
                        this.mManager.showFragment(fragment7, i2, i);
                        break;
                    case 6:
                        Fragment fragment8 = op.fragment;
                        fragment8.mNextAnim = r10;
                        this.mManager.detachFragment(fragment8, i2, i);
                        break;
                    case 7:
                        Fragment fragment9 = op.fragment;
                        fragment9.mNextAnim = r9;
                        this.mManager.attachFragment(fragment9, i2, i);
                        break;
                    default:
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("Unknown cmd: ");
                        sb4.append(op.cmd);
                        throw new IllegalArgumentException(sb4.toString());
                }
                op = op.next;
                r63 = r6;
            }
            this.mManager.moveToState(this.mManager.mCurState, i2, i, true);
            if (this.mAddToBackStack) {
                this.mManager.addBackStackState(this);
                return;
            }
            return;
        }
        throw new IllegalStateException("addToBackStack() called after commit()");
    }

    public FragmentTransaction setBreadCrumbShortTitle(int i) {
        this.mBreadCrumbShortTitleRes = i;
        this.mBreadCrumbShortTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbShortTitle(CharSequence charSequence) {
        this.mBreadCrumbShortTitleRes = 0;
        this.mBreadCrumbShortTitleText = charSequence;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(int i) {
        this.mBreadCrumbTitleRes = i;
        this.mBreadCrumbTitleText = null;
        return this;
    }

    public FragmentTransaction setBreadCrumbTitle(CharSequence charSequence) {
        this.mBreadCrumbTitleRes = 0;
        this.mBreadCrumbTitleText = charSequence;
        return this;
    }

    public FragmentTransaction setCustomAnimations(int i, int i2) {
        return setCustomAnimations(i, i2, 0, 0);
    }

    public FragmentTransaction setCustomAnimations(int i, int i2, int i3, int i4) {
        this.mEnterAnim = i;
        this.mExitAnim = i2;
        this.mPopEnterAnim = i3;
        this.mPopExitAnim = i4;
        return this;
    }

    public FragmentTransaction setTransition(int i) {
        this.mTransition = i;
        return this;
    }

    public FragmentTransaction setTransitionStyle(int i) {
        this.mTransitionStyle = i;
        return this;
    }

    public FragmentTransaction show(Fragment fragment) {
        Op op = new Op();
        op.cmd = 5;
        op.fragment = fragment;
        addOp(op);
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("BackStackEntry{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        if (this.mIndex >= 0) {
            sb.append(" #");
            sb.append(this.mIndex);
        }
        if (this.mName != null) {
            sb.append(" ");
            sb.append(this.mName);
        }
        sb.append("}");
        return sb.toString();
    }
}
