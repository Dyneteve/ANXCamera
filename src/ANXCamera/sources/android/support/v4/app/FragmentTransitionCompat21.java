package android.support.v4.app;

import android.graphics.Rect;
import android.transition.Transition;
import android.transition.Transition.EpicenterCallback;
import android.transition.TransitionManager;
import android.transition.TransitionSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

class FragmentTransitionCompat21 {

    public static class EpicenterView {
        public View epicenter;
    }

    public interface ViewRetriever {
        View getView();
    }

    FragmentTransitionCompat21() {
    }

    public static void addTargets(Object obj, ArrayList<View> arrayList) {
        Transition transition = (Transition) obj;
        int i = 0;
        if (transition instanceof TransitionSet) {
            TransitionSet transitionSet = (TransitionSet) transition;
            int transitionCount = transitionSet.getTransitionCount();
            while (i < transitionCount) {
                addTargets(transitionSet.getTransitionAt(i), arrayList);
                i++;
            }
        } else if (!hasSimpleTarget(transition) && isNullOrEmpty(transition.getTargets())) {
            int size = arrayList.size();
            while (i < size) {
                transition.addTarget((View) arrayList.get(i));
                i++;
            }
        }
    }

    public static void addTransitionTargets(Object obj, Object obj2, View view, ViewRetriever viewRetriever, View view2, EpicenterView epicenterView, Map<String, String> map, ArrayList<View> arrayList, Map<String, View> map2, Map<String, View> map3, ArrayList<View> arrayList2) {
        Object obj3 = obj2;
        View view3 = view2;
        if (obj == null && obj3 == null) {
            EpicenterView epicenterView2 = epicenterView;
            Map<String, View> map4 = map2;
            ArrayList<View> arrayList3 = arrayList2;
            return;
        }
        Transition transition = (Transition) obj;
        if (transition != null) {
            transition.addTarget(view3);
        }
        if (obj3 != null) {
            setSharedElementTargets(obj3, view3, map2, arrayList2);
        } else {
            Map<String, View> map5 = map2;
            ArrayList<View> arrayList4 = arrayList2;
        }
        if (viewRetriever != null) {
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            final View view4 = view;
            final Transition transition2 = transition;
            final View view5 = view3;
            final ViewRetriever viewRetriever2 = viewRetriever;
            final Map<String, String> map6 = map;
            final Map<String, View> map7 = map3;
            AnonymousClass2 r0 = r2;
            final ArrayList<View> arrayList5 = arrayList;
            AnonymousClass2 r2 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view4.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition2 != null) {
                        transition2.removeTarget(view5);
                    }
                    View view = viewRetriever2.getView();
                    if (view != null) {
                        if (!map6.isEmpty()) {
                            FragmentTransitionCompat21.findNamedViews(map7, view);
                            map7.keySet().retainAll(map6.values());
                            for (Entry entry : map6.entrySet()) {
                                View view2 = (View) map7.get((String) entry.getValue());
                                if (view2 != null) {
                                    view2.setTransitionName((String) entry.getKey());
                                }
                            }
                        }
                        if (transition2 != null) {
                            FragmentTransitionCompat21.captureTransitioningViews(arrayList5, view);
                            arrayList5.removeAll(map7.values());
                            arrayList5.add(view5);
                            FragmentTransitionCompat21.addTargets(transition2, arrayList5);
                        }
                    }
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(r0);
        }
        setSharedElementEpicenter(transition, epicenterView);
    }

    public static void beginDelayedTransition(ViewGroup viewGroup, Object obj) {
        TransitionManager.beginDelayedTransition(viewGroup, (Transition) obj);
    }

    private static void bfsAddViewChildren(List<View> list, View view) {
        int size = list.size();
        if (!containedBeforeIndex(list, view, size)) {
            list.add(view);
            for (int i = size; i < list.size(); i++) {
                View view2 = (View) list.get(i);
                if (view2 instanceof ViewGroup) {
                    ViewGroup viewGroup = (ViewGroup) view2;
                    int childCount = viewGroup.getChildCount();
                    for (int i2 = 0; i2 < childCount; i2++) {
                        View childAt = viewGroup.getChildAt(i2);
                        if (!containedBeforeIndex(list, childAt, size)) {
                            list.add(childAt);
                        }
                    }
                }
            }
        }
    }

    public static Object captureExitingViews(Object obj, View view, ArrayList<View> arrayList, Map<String, View> map, View view2) {
        if (obj == null) {
            return obj;
        }
        captureTransitioningViews(arrayList, view);
        if (map != null) {
            arrayList.removeAll(map.values());
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        arrayList.add(view2);
        addTargets((Transition) obj, arrayList);
        return obj;
    }

    /* access modifiers changed from: private */
    public static void captureTransitioningViews(ArrayList<View> arrayList, View view) {
        if (view.getVisibility() != 0) {
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.isTransitionGroup()) {
                arrayList.add(viewGroup);
                return;
            }
            int childCount = viewGroup.getChildCount();
            for (int i = 0; i < childCount; i++) {
                captureTransitioningViews(arrayList, viewGroup.getChildAt(i));
            }
            return;
        }
        arrayList.add(view);
    }

    public static void cleanupTransitions(View view, View view2, Object obj, ArrayList<View> arrayList, Object obj2, ArrayList<View> arrayList2, Object obj3, ArrayList<View> arrayList3, Object obj4, ArrayList<View> arrayList4, Map<String, View> map) {
        Transition transition = (Transition) obj;
        Transition transition2 = (Transition) obj2;
        Transition transition3 = (Transition) obj3;
        Transition transition4 = (Transition) obj4;
        if (transition4 != null) {
            final View view3 = view;
            final Transition transition5 = transition;
            final ArrayList<View> arrayList5 = arrayList;
            final Transition transition6 = transition2;
            final ArrayList<View> arrayList6 = arrayList2;
            final Transition transition7 = transition3;
            final ArrayList<View> arrayList7 = arrayList3;
            final Map<String, View> map2 = map;
            final ArrayList<View> arrayList8 = arrayList4;
            AnonymousClass4 r0 = r1;
            final Transition transition8 = transition4;
            Transition transition9 = transition;
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            final View view4 = view2;
            AnonymousClass4 r1 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view3.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition5 != null) {
                        FragmentTransitionCompat21.removeTargets(transition5, arrayList5);
                    }
                    if (transition6 != null) {
                        FragmentTransitionCompat21.removeTargets(transition6, arrayList6);
                    }
                    if (transition7 != null) {
                        FragmentTransitionCompat21.removeTargets(transition7, arrayList7);
                    }
                    for (Entry entry : map2.entrySet()) {
                        ((View) entry.getValue()).setTransitionName((String) entry.getKey());
                    }
                    int size = arrayList8.size();
                    for (int i = 0; i < size; i++) {
                        transition8.excludeTarget((View) arrayList8.get(i), false);
                    }
                    transition8.excludeTarget(view4, false);
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(r0);
            return;
        }
        Transition transition10 = transition;
    }

    public static Object cloneTransition(Object obj) {
        return obj != null ? ((Transition) obj).clone() : obj;
    }

    private static boolean containedBeforeIndex(List<View> list, View view, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (list.get(i2) == view) {
                return true;
            }
        }
        return false;
    }

    public static void excludeTarget(Object obj, View view, boolean z) {
        ((Transition) obj).excludeTarget(view, z);
    }

    public static void findNamedViews(Map<String, View> map, View view) {
        if (view.getVisibility() == 0) {
            String transitionName = view.getTransitionName();
            if (transitionName != null) {
                map.put(transitionName, view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                int childCount = viewGroup.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    findNamedViews(map, viewGroup.getChildAt(i));
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public static Rect getBoundsOnScreen(View view) {
        Rect rect = new Rect();
        int[] iArr = new int[2];
        view.getLocationOnScreen(iArr);
        rect.set(iArr[0], iArr[1], iArr[0] + view.getWidth(), iArr[1] + view.getHeight());
        return rect;
    }

    public static String getTransitionName(View view) {
        return view.getTransitionName();
    }

    private static boolean hasSimpleTarget(Transition transition) {
        return !isNullOrEmpty(transition.getTargetIds()) || !isNullOrEmpty(transition.getTargetNames()) || !isNullOrEmpty(transition.getTargetTypes());
    }

    private static boolean isNullOrEmpty(List list) {
        return list == null || list.isEmpty();
    }

    public static Object mergeTransitions(Object obj, Object obj2, Object obj3, boolean z) {
        boolean z2 = true;
        Transition transition = (Transition) obj;
        Transition transition2 = (Transition) obj2;
        Transition transition3 = (Transition) obj3;
        if (!(transition == null || transition2 == null)) {
            z2 = z;
        }
        if (z2) {
            TransitionSet transitionSet = new TransitionSet();
            if (transition != null) {
                transitionSet.addTransition(transition);
            }
            if (transition2 != null) {
                transitionSet.addTransition(transition2);
            }
            if (transition3 == null) {
                return transitionSet;
            }
            transitionSet.addTransition(transition3);
            return transitionSet;
        }
        Transition transition4 = null;
        if (transition2 != null && transition != null) {
            transition4 = new TransitionSet().addTransition(transition2).addTransition(transition).setOrdering(1);
        } else if (transition2 != null) {
            transition4 = transition2;
        } else if (transition != null) {
            transition4 = transition;
        }
        if (transition3 == null) {
            return transition4;
        }
        TransitionSet transitionSet2 = new TransitionSet();
        if (transition4 != null) {
            transitionSet2.addTransition(transition4);
        }
        transitionSet2.addTransition(transition3);
        return transitionSet2;
    }

    public static void removeTargets(Object obj, ArrayList<View> arrayList) {
        Transition transition = (Transition) obj;
        if (transition instanceof TransitionSet) {
            TransitionSet transitionSet = (TransitionSet) transition;
            int transitionCount = transitionSet.getTransitionCount();
            for (int i = 0; i < transitionCount; i++) {
                removeTargets(transitionSet.getTransitionAt(i), arrayList);
            }
        } else if (!hasSimpleTarget(transition)) {
            List targets = transition.getTargets();
            if (targets != null && targets.size() == arrayList.size() && targets.containsAll(arrayList)) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    transition.removeTarget((View) arrayList.get(size));
                }
            }
        }
    }

    public static void setEpicenter(Object obj, View view) {
        Transition transition = (Transition) obj;
        final Rect boundsOnScreen = getBoundsOnScreen(view);
        transition.setEpicenterCallback(new EpicenterCallback() {
            public Rect onGetEpicenter(Transition transition) {
                return boundsOnScreen;
            }
        });
    }

    private static void setSharedElementEpicenter(Transition transition, final EpicenterView epicenterView) {
        if (transition != null) {
            transition.setEpicenterCallback(new EpicenterCallback() {
                private Rect mEpicenter;

                public Rect onGetEpicenter(Transition transition) {
                    if (this.mEpicenter == null && epicenterView.epicenter != null) {
                        this.mEpicenter = FragmentTransitionCompat21.getBoundsOnScreen(epicenterView.epicenter);
                    }
                    return this.mEpicenter;
                }
            });
        }
    }

    public static void setSharedElementTargets(Object obj, View view, Map<String, View> map, ArrayList<View> arrayList) {
        TransitionSet transitionSet = (TransitionSet) obj;
        arrayList.clear();
        arrayList.addAll(map.values());
        List targets = transitionSet.getTargets();
        targets.clear();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            bfsAddViewChildren(targets, (View) arrayList.get(i));
        }
        arrayList.add(view);
        addTargets(transitionSet, arrayList);
    }

    public static Object wrapSharedElementTransition(Object obj) {
        if (obj == null) {
            return null;
        }
        Transition transition = (Transition) obj;
        if (transition == null) {
            return null;
        }
        TransitionSet transitionSet = new TransitionSet();
        transitionSet.addTransition(transition);
        return transitionSet;
    }
}
