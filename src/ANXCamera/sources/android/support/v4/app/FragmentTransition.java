package android.support.v4.app;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v4.util.ArrayMap;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

class FragmentTransition {
    private static final int[] INVERSE_OPS = {0, 3, 0, 1, 5, 4, 7, 6, 9, 8};
    private static final FragmentTransitionImpl PLATFORM_IMPL = (VERSION.SDK_INT >= 21 ? new FragmentTransitionCompat21() : null);
    private static final FragmentTransitionImpl SUPPORT_IMPL = resolveSupportImpl();

    static class FragmentContainerTransition {
        public Fragment firstOut;
        public boolean firstOutIsPop;
        public BackStackRecord firstOutTransaction;
        public Fragment lastIn;
        public boolean lastInIsPop;
        public BackStackRecord lastInTransaction;

        FragmentContainerTransition() {
        }
    }

    private FragmentTransition() {
    }

    private static void addSharedElementsWithMatchingNames(ArrayList<View> arrayList, ArrayMap<String, View> arrayMap, Collection<String> collection) {
        for (int size = arrayMap.size() - 1; size >= 0; size--) {
            View view = (View) arrayMap.valueAt(size);
            if (collection.contains(ViewCompat.getTransitionName(view))) {
                arrayList.add(view);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:51:0x008d, code lost:
        r13 = r1;
        r1 = false;
        r12 = true;
     */
    private static void addToFirstInLastOut(BackStackRecord backStackRecord, Op op, SparseArray<FragmentContainerTransition> sparseArray, boolean z, boolean z2) {
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        BackStackRecord backStackRecord2 = backStackRecord;
        Op op2 = op;
        SparseArray<FragmentContainerTransition> sparseArray2 = sparseArray;
        boolean z8 = z;
        Fragment fragment = op2.fragment;
        if (fragment != null) {
            int i = fragment.mContainerId;
            if (i != 0) {
                int i2 = z8 ? INVERSE_OPS[op2.cmd] : op2.cmd;
                boolean z9 = false;
                if (i2 != 1) {
                    switch (i2) {
                        case 3:
                        case 6:
                            if (!z2 ? !(!fragment.mAdded || fragment.mHidden) : !(fragment.mAdded || fragment.mView == null || fragment.mView.getVisibility() != 0 || fragment.mPostponedAlpha < 0.0f)) {
                                z7 = true;
                                break;
                            } else {
                                z7 = false;
                                break;
                            }
                            break;
                        case 4:
                            if (!z2 ? !(!fragment.mAdded || fragment.mHidden) : !(!fragment.mHiddenChanged || !fragment.mAdded || !fragment.mHidden)) {
                                z7 = true;
                                break;
                            } else {
                                z7 = false;
                                break;
                            }
                            break;
                        case 5:
                            if (z2) {
                                if (fragment.mHiddenChanged && !fragment.mHidden && fragment.mAdded) {
                                    z6 = true;
                                    break;
                                } else {
                                    z6 = false;
                                    break;
                                }
                            } else {
                                z6 = fragment.mHidden;
                                break;
                            }
                            break;
                        case 7:
                            break;
                        default:
                            z5 = false;
                            z4 = false;
                            z3 = false;
                            break;
                    }
                }
                z6 = z2 ? fragment.mIsNewlyAdded : !fragment.mAdded && !fragment.mHidden;
                z4 = false;
                z3 = false;
                z9 = z6;
                z5 = true;
                FragmentContainerTransition fragmentContainerTransition = (FragmentContainerTransition) sparseArray2.get(i);
                if (z9) {
                    fragmentContainerTransition = ensureContainer(fragmentContainerTransition, sparseArray2, i);
                    fragmentContainerTransition.lastIn = fragment;
                    fragmentContainerTransition.lastInIsPop = z8;
                    fragmentContainerTransition.lastInTransaction = backStackRecord2;
                }
                FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
                if (!z2 && z5) {
                    if (fragmentContainerTransition2 != null && fragmentContainerTransition2.firstOut == fragment) {
                        fragmentContainerTransition2.firstOut = null;
                    }
                    FragmentManagerImpl fragmentManagerImpl = backStackRecord2.mManager;
                    if (fragment.mState < 1 && fragmentManagerImpl.mCurState >= 1 && !backStackRecord2.mReorderingAllowed) {
                        fragmentManagerImpl.makeActive(fragment);
                        fragmentManagerImpl.moveToState(fragment, 1, 0, 0, false);
                    }
                }
                if (z3 && (fragmentContainerTransition2 == null || fragmentContainerTransition2.firstOut == null)) {
                    fragmentContainerTransition2 = ensureContainer(fragmentContainerTransition2, sparseArray2, i);
                    fragmentContainerTransition2.firstOut = fragment;
                    fragmentContainerTransition2.firstOutIsPop = z8;
                    fragmentContainerTransition2.firstOutTransaction = backStackRecord2;
                }
                if (!z2 && z4 && fragmentContainerTransition2 != null && fragmentContainerTransition2.lastIn == fragment) {
                    fragmentContainerTransition2.lastIn = null;
                }
            }
        }
    }

    public static void calculateFragments(BackStackRecord backStackRecord, SparseArray<FragmentContainerTransition> sparseArray, boolean z) {
        int size = backStackRecord.mOps.size();
        for (int i = 0; i < size; i++) {
            addToFirstInLastOut(backStackRecord, (Op) backStackRecord.mOps.get(i), sparseArray, false, z);
        }
    }

    private static ArrayMap<String, String> calculateNameOverrides(int i, ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i2, int i3) {
        ArrayList<String> arrayList3;
        ArrayList arrayList4;
        ArrayMap<String, String> arrayMap = new ArrayMap<>();
        for (int i4 = i3 - 1; i4 >= i2; i4--) {
            BackStackRecord backStackRecord = (BackStackRecord) arrayList.get(i4);
            if (backStackRecord.interactsWith(i)) {
                boolean booleanValue = ((Boolean) arrayList2.get(i4)).booleanValue();
                if (backStackRecord.mSharedElementSourceNames != null) {
                    int size = backStackRecord.mSharedElementSourceNames.size();
                    if (booleanValue) {
                        arrayList3 = backStackRecord.mSharedElementSourceNames;
                        arrayList4 = backStackRecord.mSharedElementTargetNames;
                    } else {
                        ArrayList arrayList5 = backStackRecord.mSharedElementSourceNames;
                        arrayList3 = backStackRecord.mSharedElementTargetNames;
                        arrayList4 = arrayList5;
                    }
                    for (int i5 = 0; i5 < size; i5++) {
                        String str = (String) arrayList4.get(i5);
                        String str2 = (String) arrayList3.get(i5);
                        String str3 = (String) arrayMap.remove(str2);
                        if (str3 != null) {
                            arrayMap.put(str, str3);
                        } else {
                            arrayMap.put(str, str2);
                        }
                    }
                }
            }
        }
        return arrayMap;
    }

    public static void calculatePopFragments(BackStackRecord backStackRecord, SparseArray<FragmentContainerTransition> sparseArray, boolean z) {
        if (backStackRecord.mManager.mContainer.onHasView()) {
            for (int size = backStackRecord.mOps.size() - 1; size >= 0; size--) {
                addToFirstInLastOut(backStackRecord, (Op) backStackRecord.mOps.get(size), sparseArray, true, z);
            }
        }
    }

    /* access modifiers changed from: private */
    public static void callSharedElementStartEnd(Fragment fragment, Fragment fragment2, boolean z, ArrayMap<String, View> arrayMap, boolean z2) {
        SharedElementCallback enterTransitionCallback = z ? fragment2.getEnterTransitionCallback() : fragment.getEnterTransitionCallback();
        if (enterTransitionCallback != null) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            int size = arrayMap == null ? 0 : arrayMap.size();
            for (int i = 0; i < size; i++) {
                arrayList2.add(arrayMap.keyAt(i));
                arrayList.add(arrayMap.valueAt(i));
            }
            if (z2) {
                enterTransitionCallback.onSharedElementStart(arrayList2, arrayList, null);
            } else {
                enterTransitionCallback.onSharedElementEnd(arrayList2, arrayList, null);
            }
        }
    }

    private static boolean canHandleAll(FragmentTransitionImpl fragmentTransitionImpl, List<Object> list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (!fragmentTransitionImpl.canHandle(list.get(i))) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: private */
    public static ArrayMap<String, View> captureInSharedElements(FragmentTransitionImpl fragmentTransitionImpl, ArrayMap<String, String> arrayMap, Object obj, FragmentContainerTransition fragmentContainerTransition) {
        SharedElementCallback sharedElementCallback;
        ArrayList<String> arrayList;
        Fragment fragment = fragmentContainerTransition.lastIn;
        View view = fragment.getView();
        if (arrayMap.isEmpty() || obj == null || view == null) {
            arrayMap.clear();
            return null;
        }
        ArrayMap<String, View> arrayMap2 = new ArrayMap<>();
        fragmentTransitionImpl.findNamedViews(arrayMap2, view);
        BackStackRecord backStackRecord = fragmentContainerTransition.lastInTransaction;
        if (fragmentContainerTransition.lastInIsPop) {
            sharedElementCallback = fragment.getExitTransitionCallback();
            arrayList = backStackRecord.mSharedElementSourceNames;
        } else {
            sharedElementCallback = fragment.getEnterTransitionCallback();
            arrayList = backStackRecord.mSharedElementTargetNames;
        }
        if (arrayList != null) {
            arrayMap2.retainAll(arrayList);
            arrayMap2.retainAll(arrayMap.values());
        }
        if (sharedElementCallback != null) {
            sharedElementCallback.onMapSharedElements(arrayList, arrayMap2);
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                View view2 = (View) arrayMap2.get(str);
                if (view2 == null) {
                    String findKeyForValue = findKeyForValue(arrayMap, str);
                    if (findKeyForValue != null) {
                        arrayMap.remove(findKeyForValue);
                    }
                } else if (!str.equals(ViewCompat.getTransitionName(view2))) {
                    String findKeyForValue2 = findKeyForValue(arrayMap, str);
                    if (findKeyForValue2 != null) {
                        arrayMap.put(findKeyForValue2, ViewCompat.getTransitionName(view2));
                    }
                }
            }
        } else {
            retainValues(arrayMap, arrayMap2);
        }
        return arrayMap2;
    }

    private static ArrayMap<String, View> captureOutSharedElements(FragmentTransitionImpl fragmentTransitionImpl, ArrayMap<String, String> arrayMap, Object obj, FragmentContainerTransition fragmentContainerTransition) {
        SharedElementCallback sharedElementCallback;
        ArrayList<String> arrayList;
        if (arrayMap.isEmpty() || obj == null) {
            arrayMap.clear();
            return null;
        }
        Fragment fragment = fragmentContainerTransition.firstOut;
        ArrayMap<String, View> arrayMap2 = new ArrayMap<>();
        fragmentTransitionImpl.findNamedViews(arrayMap2, fragment.getView());
        BackStackRecord backStackRecord = fragmentContainerTransition.firstOutTransaction;
        if (fragmentContainerTransition.firstOutIsPop) {
            sharedElementCallback = fragment.getEnterTransitionCallback();
            arrayList = backStackRecord.mSharedElementTargetNames;
        } else {
            sharedElementCallback = fragment.getExitTransitionCallback();
            arrayList = backStackRecord.mSharedElementSourceNames;
        }
        arrayMap2.retainAll(arrayList);
        if (sharedElementCallback != null) {
            sharedElementCallback.onMapSharedElements(arrayList, arrayMap2);
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                String str = (String) arrayList.get(size);
                View view = (View) arrayMap2.get(str);
                if (view == null) {
                    arrayMap.remove(str);
                } else if (!str.equals(ViewCompat.getTransitionName(view))) {
                    arrayMap.put(ViewCompat.getTransitionName(view), (String) arrayMap.remove(str));
                }
            }
        } else {
            arrayMap.retainAll(arrayMap2.keySet());
        }
        return arrayMap2;
    }

    private static FragmentTransitionImpl chooseImpl(Fragment fragment, Fragment fragment2) {
        ArrayList arrayList = new ArrayList();
        if (fragment != null) {
            Object exitTransition = fragment.getExitTransition();
            if (exitTransition != null) {
                arrayList.add(exitTransition);
            }
            Object returnTransition = fragment.getReturnTransition();
            if (returnTransition != null) {
                arrayList.add(returnTransition);
            }
            Object sharedElementReturnTransition = fragment.getSharedElementReturnTransition();
            if (sharedElementReturnTransition != null) {
                arrayList.add(sharedElementReturnTransition);
            }
        }
        if (fragment2 != null) {
            Object enterTransition = fragment2.getEnterTransition();
            if (enterTransition != null) {
                arrayList.add(enterTransition);
            }
            Object reenterTransition = fragment2.getReenterTransition();
            if (reenterTransition != null) {
                arrayList.add(reenterTransition);
            }
            Object sharedElementEnterTransition = fragment2.getSharedElementEnterTransition();
            if (sharedElementEnterTransition != null) {
                arrayList.add(sharedElementEnterTransition);
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        if (PLATFORM_IMPL != null && canHandleAll(PLATFORM_IMPL, arrayList)) {
            return PLATFORM_IMPL;
        }
        if (SUPPORT_IMPL != null && canHandleAll(SUPPORT_IMPL, arrayList)) {
            return SUPPORT_IMPL;
        }
        if (PLATFORM_IMPL == null && SUPPORT_IMPL == null) {
            return null;
        }
        throw new IllegalArgumentException("Invalid Transition types");
    }

    /* access modifiers changed from: private */
    public static ArrayList<View> configureEnteringExitingViews(FragmentTransitionImpl fragmentTransitionImpl, Object obj, Fragment fragment, ArrayList<View> arrayList, View view) {
        if (obj == null) {
            return null;
        }
        ArrayList<View> arrayList2 = new ArrayList<>();
        View view2 = fragment.getView();
        if (view2 != null) {
            fragmentTransitionImpl.captureTransitioningViews(arrayList2, view2);
        }
        if (arrayList != null) {
            arrayList2.removeAll(arrayList);
        }
        if (arrayList2.isEmpty()) {
            return arrayList2;
        }
        arrayList2.add(view);
        fragmentTransitionImpl.addTargets(obj, arrayList2);
        return arrayList2;
    }

    private static Object configureSharedElementsOrdered(FragmentTransitionImpl fragmentTransitionImpl, ViewGroup viewGroup, View view, ArrayMap<String, String> arrayMap, FragmentContainerTransition fragmentContainerTransition, ArrayList<View> arrayList, ArrayList<View> arrayList2, Object obj, Object obj2) {
        Object obj3;
        Rect rect;
        FragmentTransitionImpl fragmentTransitionImpl2 = fragmentTransitionImpl;
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        final ArrayList<View> arrayList3 = arrayList;
        final Object obj4 = obj;
        Fragment fragment = fragmentContainerTransition2.lastIn;
        Fragment fragment2 = fragmentContainerTransition2.firstOut;
        if (fragment == null || fragment2 == null) {
            return null;
        }
        boolean z = fragmentContainerTransition2.lastInIsPop;
        Object sharedElementTransition = arrayMap.isEmpty() ? null : getSharedElementTransition(fragmentTransitionImpl2, fragment, fragment2, z);
        ArrayMap<String, String> arrayMap2 = arrayMap;
        ArrayMap captureOutSharedElements = captureOutSharedElements(fragmentTransitionImpl2, arrayMap2, sharedElementTransition, fragmentContainerTransition2);
        if (arrayMap.isEmpty()) {
            obj3 = null;
        } else {
            arrayList3.addAll(captureOutSharedElements.values());
            obj3 = sharedElementTransition;
        }
        if (obj4 == null && obj2 == null && obj3 == null) {
            return null;
        }
        callSharedElementStartEnd(fragment, fragment2, z, captureOutSharedElements, true);
        if (obj3 != null) {
            rect = new Rect();
            fragmentTransitionImpl2.setSharedElementTargets(obj3, view, arrayList3);
            setOutEpicenter(fragmentTransitionImpl2, obj3, obj2, captureOutSharedElements, fragmentContainerTransition2.firstOutIsPop, fragmentContainerTransition2.firstOutTransaction);
            if (obj4 != null) {
                fragmentTransitionImpl2.setEpicenter(obj4, rect);
            }
        } else {
            rect = null;
        }
        final FragmentTransitionImpl fragmentTransitionImpl3 = fragmentTransitionImpl2;
        final ArrayMap<String, String> arrayMap3 = arrayMap2;
        final Object obj5 = obj3;
        final FragmentContainerTransition fragmentContainerTransition3 = fragmentContainerTransition2;
        AnonymousClass4 r13 = r0;
        final ArrayList<View> arrayList4 = arrayList2;
        final View view2 = view;
        final Fragment fragment3 = fragment;
        final Fragment fragment4 = fragment2;
        final boolean z2 = z;
        final Rect rect2 = rect;
        AnonymousClass4 r0 = new Runnable() {
            public void run() {
                ArrayMap access$300 = FragmentTransition.captureInSharedElements(fragmentTransitionImpl3, arrayMap3, obj5, fragmentContainerTransition3);
                if (access$300 != null) {
                    arrayList4.addAll(access$300.values());
                    arrayList4.add(view2);
                }
                FragmentTransition.callSharedElementStartEnd(fragment3, fragment4, z2, access$300, false);
                if (obj5 != null) {
                    fragmentTransitionImpl3.swapSharedElementTargets(obj5, arrayList3, arrayList4);
                    View access$400 = FragmentTransition.getInEpicenterView(access$300, fragmentContainerTransition3, obj4, z2);
                    if (access$400 != null) {
                        fragmentTransitionImpl3.getBoundsOnScreen(access$400, rect2);
                    }
                }
            }
        };
        OneShotPreDrawListener.add(viewGroup, r13);
        return obj3;
    }

    private static Object configureSharedElementsReordered(FragmentTransitionImpl fragmentTransitionImpl, ViewGroup viewGroup, View view, ArrayMap<String, String> arrayMap, FragmentContainerTransition fragmentContainerTransition, ArrayList<View> arrayList, ArrayList<View> arrayList2, Object obj, Object obj2) {
        Object obj3;
        final Rect rect;
        final View view2;
        final FragmentTransitionImpl fragmentTransitionImpl2 = fragmentTransitionImpl;
        View view3 = view;
        ArrayMap<String, String> arrayMap2 = arrayMap;
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        ArrayList<View> arrayList3 = arrayList;
        ArrayList<View> arrayList4 = arrayList2;
        Object obj4 = obj;
        Fragment fragment = fragmentContainerTransition2.lastIn;
        Fragment fragment2 = fragmentContainerTransition2.firstOut;
        if (fragment != null) {
            fragment.getView().setVisibility(0);
        }
        if (fragment == null || fragment2 == null) {
            return null;
        }
        boolean z = fragmentContainerTransition2.lastInIsPop;
        Object sharedElementTransition = arrayMap.isEmpty() ? null : getSharedElementTransition(fragmentTransitionImpl2, fragment, fragment2, z);
        ArrayMap captureOutSharedElements = captureOutSharedElements(fragmentTransitionImpl2, arrayMap2, sharedElementTransition, fragmentContainerTransition2);
        ArrayMap captureInSharedElements = captureInSharedElements(fragmentTransitionImpl2, arrayMap2, sharedElementTransition, fragmentContainerTransition2);
        if (arrayMap.isEmpty()) {
            if (captureOutSharedElements != null) {
                captureOutSharedElements.clear();
            }
            if (captureInSharedElements != null) {
                captureInSharedElements.clear();
            }
            obj3 = null;
        } else {
            addSharedElementsWithMatchingNames(arrayList3, captureOutSharedElements, arrayMap.keySet());
            addSharedElementsWithMatchingNames(arrayList4, captureInSharedElements, arrayMap.values());
            obj3 = sharedElementTransition;
        }
        if (obj4 == null && obj2 == null && obj3 == null) {
            return null;
        }
        callSharedElementStartEnd(fragment, fragment2, z, captureOutSharedElements, true);
        if (obj3 != null) {
            arrayList4.add(view3);
            fragmentTransitionImpl2.setSharedElementTargets(obj3, view3, arrayList3);
            setOutEpicenter(fragmentTransitionImpl2, obj3, obj2, captureOutSharedElements, fragmentContainerTransition2.firstOutIsPop, fragmentContainerTransition2.firstOutTransaction);
            Rect rect2 = new Rect();
            View inEpicenterView = getInEpicenterView(captureInSharedElements, fragmentContainerTransition2, obj4, z);
            if (inEpicenterView != null) {
                fragmentTransitionImpl2.setEpicenter(obj4, rect2);
            }
            rect = rect2;
            view2 = inEpicenterView;
        } else {
            view2 = null;
            rect = null;
        }
        final Fragment fragment3 = fragment;
        final Fragment fragment4 = fragment2;
        final boolean z2 = z;
        final ArrayMap arrayMap3 = captureInSharedElements;
        AnonymousClass3 r0 = new Runnable() {
            public void run() {
                FragmentTransition.callSharedElementStartEnd(fragment3, fragment4, z2, arrayMap3, false);
                if (view2 != null) {
                    fragmentTransitionImpl2.getBoundsOnScreen(view2, rect);
                }
            }
        };
        OneShotPreDrawListener.add(viewGroup, r0);
        return obj3;
    }

    private static void configureTransitionsOrdered(FragmentManagerImpl fragmentManagerImpl, int i, FragmentContainerTransition fragmentContainerTransition, View view, ArrayMap<String, String> arrayMap) {
        Object obj;
        FragmentManagerImpl fragmentManagerImpl2 = fragmentManagerImpl;
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        View view2 = view;
        ArrayMap<String, String> arrayMap2 = arrayMap;
        ViewGroup viewGroup = fragmentManagerImpl2.mContainer.onHasView() ? (ViewGroup) fragmentManagerImpl2.mContainer.onFindViewById(i) : null;
        if (viewGroup != null) {
            Fragment fragment = fragmentContainerTransition2.lastIn;
            Fragment fragment2 = fragmentContainerTransition2.firstOut;
            FragmentTransitionImpl chooseImpl = chooseImpl(fragment2, fragment);
            if (chooseImpl != null) {
                boolean z = fragmentContainerTransition2.lastInIsPop;
                boolean z2 = fragmentContainerTransition2.firstOutIsPop;
                Object enterTransition = getEnterTransition(chooseImpl, fragment, z);
                Object exitTransition = getExitTransition(chooseImpl, fragment2, z2);
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = arrayList;
                Object obj2 = exitTransition;
                Object obj3 = enterTransition;
                FragmentTransitionImpl fragmentTransitionImpl = chooseImpl;
                Object configureSharedElementsOrdered = configureSharedElementsOrdered(chooseImpl, viewGroup, view2, arrayMap2, fragmentContainerTransition2, arrayList, arrayList2, enterTransition, obj2);
                Object obj4 = obj3;
                if (obj4 == null && configureSharedElementsOrdered == null) {
                    obj = obj2;
                    if (obj == null) {
                        return;
                    }
                } else {
                    obj = obj2;
                }
                ArrayList configureEnteringExitingViews = configureEnteringExitingViews(fragmentTransitionImpl, obj, fragment2, arrayList3, view2);
                Object obj5 = (configureEnteringExitingViews == null || configureEnteringExitingViews.isEmpty()) ? null : obj;
                fragmentTransitionImpl.addTarget(obj4, view2);
                Object mergeTransitions = mergeTransitions(fragmentTransitionImpl, obj4, obj5, configureSharedElementsOrdered, fragment, fragmentContainerTransition2.lastInIsPop);
                if (mergeTransitions != null) {
                    ArrayList arrayList4 = new ArrayList();
                    FragmentTransitionImpl fragmentTransitionImpl2 = fragmentTransitionImpl;
                    ArrayList arrayList5 = arrayList4;
                    fragmentTransitionImpl2.scheduleRemoveTargets(mergeTransitions, obj4, arrayList4, obj5, configureEnteringExitingViews, configureSharedElementsOrdered, arrayList2);
                    scheduleTargetChange(fragmentTransitionImpl2, viewGroup, fragment, view2, arrayList2, obj4, arrayList5, obj5, configureEnteringExitingViews);
                    ArrayList arrayList6 = arrayList2;
                    fragmentTransitionImpl.setNameOverridesOrdered(viewGroup, arrayList6, arrayMap2);
                    fragmentTransitionImpl.beginDelayedTransition(viewGroup, mergeTransitions);
                    fragmentTransitionImpl.scheduleNameReset(viewGroup, arrayList6, arrayMap2);
                }
            }
        }
    }

    private static void configureTransitionsReordered(FragmentManagerImpl fragmentManagerImpl, int i, FragmentContainerTransition fragmentContainerTransition, View view, ArrayMap<String, String> arrayMap) {
        Object obj;
        FragmentManagerImpl fragmentManagerImpl2 = fragmentManagerImpl;
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        View view2 = view;
        ViewGroup viewGroup = fragmentManagerImpl2.mContainer.onHasView() ? (ViewGroup) fragmentManagerImpl2.mContainer.onFindViewById(i) : null;
        if (viewGroup != null) {
            Fragment fragment = fragmentContainerTransition2.lastIn;
            Fragment fragment2 = fragmentContainerTransition2.firstOut;
            FragmentTransitionImpl chooseImpl = chooseImpl(fragment2, fragment);
            if (chooseImpl != null) {
                boolean z = fragmentContainerTransition2.lastInIsPop;
                boolean z2 = fragmentContainerTransition2.firstOutIsPop;
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                Object enterTransition = getEnterTransition(chooseImpl, fragment, z);
                Object exitTransition = getExitTransition(chooseImpl, fragment2, z2);
                Object obj2 = enterTransition;
                ViewGroup viewGroup2 = viewGroup;
                ArrayList arrayList3 = arrayList2;
                Object configureSharedElementsReordered = configureSharedElementsReordered(chooseImpl, viewGroup, view2, arrayMap, fragmentContainerTransition2, arrayList2, arrayList, enterTransition, exitTransition);
                Object obj3 = obj2;
                if (obj3 == null && configureSharedElementsReordered == null) {
                    obj = exitTransition;
                    if (obj == null) {
                        return;
                    }
                } else {
                    obj = exitTransition;
                }
                ArrayList configureEnteringExitingViews = configureEnteringExitingViews(chooseImpl, obj, fragment2, arrayList3, view2);
                ArrayList configureEnteringExitingViews2 = configureEnteringExitingViews(chooseImpl, obj3, fragment, arrayList, view2);
                setViewVisibility(configureEnteringExitingViews2, 4);
                Fragment fragment3 = fragment;
                ArrayList arrayList4 = configureEnteringExitingViews;
                Object mergeTransitions = mergeTransitions(chooseImpl, obj3, obj, configureSharedElementsReordered, fragment3, z);
                if (mergeTransitions != null) {
                    replaceHide(chooseImpl, obj, fragment2, arrayList4);
                    ArrayList prepareSetNameOverridesReordered = chooseImpl.prepareSetNameOverridesReordered(arrayList);
                    chooseImpl.scheduleRemoveTargets(mergeTransitions, obj3, configureEnteringExitingViews2, obj, arrayList4, configureSharedElementsReordered, arrayList);
                    ViewGroup viewGroup3 = viewGroup2;
                    chooseImpl.beginDelayedTransition(viewGroup3, mergeTransitions);
                    chooseImpl.setNameOverridesReordered(viewGroup3, arrayList3, arrayList, prepareSetNameOverridesReordered, arrayMap);
                    setViewVisibility(configureEnteringExitingViews2, 0);
                    chooseImpl.swapSharedElementTargets(configureSharedElementsReordered, arrayList3, arrayList);
                }
            }
        }
    }

    private static FragmentContainerTransition ensureContainer(FragmentContainerTransition fragmentContainerTransition, SparseArray<FragmentContainerTransition> sparseArray, int i) {
        if (fragmentContainerTransition != null) {
            return fragmentContainerTransition;
        }
        FragmentContainerTransition fragmentContainerTransition2 = new FragmentContainerTransition();
        sparseArray.put(i, fragmentContainerTransition2);
        return fragmentContainerTransition2;
    }

    private static String findKeyForValue(ArrayMap<String, String> arrayMap, String str) {
        int size = arrayMap.size();
        for (int i = 0; i < size; i++) {
            if (str.equals(arrayMap.valueAt(i))) {
                return (String) arrayMap.keyAt(i);
            }
        }
        return null;
    }

    private static Object getEnterTransition(FragmentTransitionImpl fragmentTransitionImpl, Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return fragmentTransitionImpl.cloneTransition(z ? fragment.getReenterTransition() : fragment.getEnterTransition());
    }

    private static Object getExitTransition(FragmentTransitionImpl fragmentTransitionImpl, Fragment fragment, boolean z) {
        if (fragment == null) {
            return null;
        }
        return fragmentTransitionImpl.cloneTransition(z ? fragment.getReturnTransition() : fragment.getExitTransition());
    }

    /* access modifiers changed from: private */
    public static View getInEpicenterView(ArrayMap<String, View> arrayMap, FragmentContainerTransition fragmentContainerTransition, Object obj, boolean z) {
        BackStackRecord backStackRecord = fragmentContainerTransition.lastInTransaction;
        if (obj == null || arrayMap == null || backStackRecord.mSharedElementSourceNames == null || backStackRecord.mSharedElementSourceNames.isEmpty()) {
            return null;
        }
        return (View) arrayMap.get(z ? (String) backStackRecord.mSharedElementSourceNames.get(0) : (String) backStackRecord.mSharedElementTargetNames.get(0));
    }

    private static Object getSharedElementTransition(FragmentTransitionImpl fragmentTransitionImpl, Fragment fragment, Fragment fragment2, boolean z) {
        if (fragment == null || fragment2 == null) {
            return null;
        }
        return fragmentTransitionImpl.wrapTransitionInSet(fragmentTransitionImpl.cloneTransition(z ? fragment2.getSharedElementReturnTransition() : fragment.getSharedElementEnterTransition()));
    }

    private static Object mergeTransitions(FragmentTransitionImpl fragmentTransitionImpl, Object obj, Object obj2, Object obj3, Fragment fragment, boolean z) {
        boolean z2 = (obj == null || obj2 == null || fragment == null) ? true : z ? fragment.getAllowReturnTransitionOverlap() : fragment.getAllowEnterTransitionOverlap();
        return z2 ? fragmentTransitionImpl.mergeTransitionsTogether(obj2, obj, obj3) : fragmentTransitionImpl.mergeTransitionsInSequence(obj2, obj, obj3);
    }

    private static void replaceHide(FragmentTransitionImpl fragmentTransitionImpl, Object obj, Fragment fragment, final ArrayList<View> arrayList) {
        if (fragment != null && obj != null && fragment.mAdded && fragment.mHidden && fragment.mHiddenChanged) {
            fragment.setHideReplaced(true);
            fragmentTransitionImpl.scheduleHideFragmentView(obj, fragment.getView(), arrayList);
            OneShotPreDrawListener.add(fragment.mContainer, new Runnable() {
                public void run() {
                    FragmentTransition.setViewVisibility(arrayList, 4);
                }
            });
        }
    }

    private static FragmentTransitionImpl resolveSupportImpl() {
        try {
            return (FragmentTransitionImpl) Class.forName("android.support.transition.FragmentTransitionSupport").getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
        } catch (Exception e) {
            return null;
        }
    }

    private static void retainValues(ArrayMap<String, String> arrayMap, ArrayMap<String, View> arrayMap2) {
        for (int size = arrayMap.size() - 1; size >= 0; size--) {
            if (!arrayMap2.containsKey((String) arrayMap.valueAt(size))) {
                arrayMap.removeAt(size);
            }
        }
    }

    private static void scheduleTargetChange(FragmentTransitionImpl fragmentTransitionImpl, ViewGroup viewGroup, Fragment fragment, View view, ArrayList<View> arrayList, Object obj, ArrayList<View> arrayList2, Object obj2, ArrayList<View> arrayList3) {
        final Object obj3 = obj;
        final FragmentTransitionImpl fragmentTransitionImpl2 = fragmentTransitionImpl;
        final View view2 = view;
        final Fragment fragment2 = fragment;
        final ArrayList<View> arrayList4 = arrayList;
        final ArrayList<View> arrayList5 = arrayList2;
        final ArrayList<View> arrayList6 = arrayList3;
        final Object obj4 = obj2;
        AnonymousClass2 r0 = new Runnable() {
            public void run() {
                if (obj3 != null) {
                    fragmentTransitionImpl2.removeTarget(obj3, view2);
                    arrayList5.addAll(FragmentTransition.configureEnteringExitingViews(fragmentTransitionImpl2, obj3, fragment2, arrayList4, view2));
                }
                if (arrayList6 != null) {
                    if (obj4 != null) {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(view2);
                        fragmentTransitionImpl2.replaceTargets(obj4, arrayList6, arrayList);
                    }
                    arrayList6.clear();
                    arrayList6.add(view2);
                }
            }
        };
        OneShotPreDrawListener.add(viewGroup, r0);
    }

    private static void setOutEpicenter(FragmentTransitionImpl fragmentTransitionImpl, Object obj, Object obj2, ArrayMap<String, View> arrayMap, boolean z, BackStackRecord backStackRecord) {
        if (backStackRecord.mSharedElementSourceNames != null && !backStackRecord.mSharedElementSourceNames.isEmpty()) {
            View view = (View) arrayMap.get(z ? (String) backStackRecord.mSharedElementTargetNames.get(0) : (String) backStackRecord.mSharedElementSourceNames.get(0));
            fragmentTransitionImpl.setEpicenter(obj, view);
            if (obj2 != null) {
                fragmentTransitionImpl.setEpicenter(obj2, view);
            }
        }
    }

    /* access modifiers changed from: private */
    public static void setViewVisibility(ArrayList<View> arrayList, int i) {
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((View) arrayList.get(size)).setVisibility(i);
            }
        }
    }

    static void startTransitions(FragmentManagerImpl fragmentManagerImpl, ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i, int i2, boolean z) {
        if (fragmentManagerImpl.mCurState >= 1) {
            SparseArray sparseArray = new SparseArray();
            for (int i3 = i; i3 < i2; i3++) {
                BackStackRecord backStackRecord = (BackStackRecord) arrayList.get(i3);
                if (((Boolean) arrayList2.get(i3)).booleanValue()) {
                    calculatePopFragments(backStackRecord, sparseArray, z);
                } else {
                    calculateFragments(backStackRecord, sparseArray, z);
                }
            }
            if (sparseArray.size() != 0) {
                View view = new View(fragmentManagerImpl.mHost.getContext());
                int size = sparseArray.size();
                for (int i4 = 0; i4 < size; i4++) {
                    int keyAt = sparseArray.keyAt(i4);
                    ArrayMap calculateNameOverrides = calculateNameOverrides(keyAt, arrayList, arrayList2, i, i2);
                    FragmentContainerTransition fragmentContainerTransition = (FragmentContainerTransition) sparseArray.valueAt(i4);
                    if (z) {
                        configureTransitionsReordered(fragmentManagerImpl, keyAt, fragmentContainerTransition, view, calculateNameOverrides);
                    } else {
                        configureTransitionsOrdered(fragmentManagerImpl, keyAt, fragmentContainerTransition, view, calculateNameOverrides);
                    }
                }
            }
        }
    }

    static boolean supportsTransition() {
        return (PLATFORM_IMPL == null && SUPPORT_IMPL == null) ? false : true;
    }
}
