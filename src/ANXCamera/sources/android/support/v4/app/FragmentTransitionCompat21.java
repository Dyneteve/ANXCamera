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

    public static String getTransitionName(View view) {
        return view.getTransitionName();
    }

    public static Object cloneTransition(Object transition) {
        if (transition != null) {
            return ((Transition) transition).clone();
        }
        return transition;
    }

    public static Object captureExitingViews(Object exitTransition, View root, ArrayList<View> viewList, Map<String, View> namedViews, View nonExistentView) {
        if (exitTransition == null) {
            return exitTransition;
        }
        captureTransitioningViews(viewList, root);
        if (namedViews != null) {
            viewList.removeAll(namedViews.values());
        }
        if (viewList.isEmpty()) {
            return null;
        }
        viewList.add(nonExistentView);
        addTargets((Transition) exitTransition, viewList);
        return exitTransition;
    }

    public static void excludeTarget(Object transitionObject, View view, boolean exclude) {
        ((Transition) transitionObject).excludeTarget(view, exclude);
    }

    public static void beginDelayedTransition(ViewGroup sceneRoot, Object transitionObject) {
        TransitionManager.beginDelayedTransition(sceneRoot, (Transition) transitionObject);
    }

    public static void setEpicenter(Object transitionObject, View view) {
        Transition transition = (Transition) transitionObject;
        final Rect epicenter = getBoundsOnScreen(view);
        transition.setEpicenterCallback(new EpicenterCallback() {
            public Rect onGetEpicenter(Transition transition) {
                return epicenter;
            }
        });
    }

    public static Object wrapSharedElementTransition(Object transitionObj) {
        if (transitionObj == null) {
            return null;
        }
        Transition transition = (Transition) transitionObj;
        if (transition == null) {
            return null;
        }
        TransitionSet transitionSet = new TransitionSet();
        transitionSet.addTransition(transition);
        return transitionSet;
    }

    public static void addTransitionTargets(Object enterTransitionObject, Object sharedElementTransitionObject, View container, ViewRetriever inFragment, View nonExistentView, EpicenterView epicenterView, Map<String, String> nameOverrides, ArrayList<View> enteringViews, Map<String, View> namedViews, Map<String, View> renamedViews, ArrayList<View> sharedElementTargets) {
        Object obj = sharedElementTransitionObject;
        View view = nonExistentView;
        if (enterTransitionObject == null && obj == null) {
            EpicenterView epicenterView2 = epicenterView;
            Map<String, View> map = namedViews;
            ArrayList<View> arrayList = sharedElementTargets;
            return;
        }
        Transition enterTransition = (Transition) enterTransitionObject;
        if (enterTransition != null) {
            enterTransition.addTarget(view);
        }
        if (obj != null) {
            setSharedElementTargets(obj, view, namedViews, sharedElementTargets);
        } else {
            Map<String, View> map2 = namedViews;
            ArrayList<View> arrayList2 = sharedElementTargets;
        }
        if (inFragment != null) {
            ViewTreeObserver viewTreeObserver = container.getViewTreeObserver();
            final View view2 = container;
            final Transition transition = enterTransition;
            final View view3 = view;
            final ViewRetriever viewRetriever = inFragment;
            final Map<String, String> map3 = nameOverrides;
            final Map<String, View> map4 = renamedViews;
            AnonymousClass2 r0 = r2;
            final ArrayList<View> arrayList3 = enteringViews;
            AnonymousClass2 r2 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view2.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition != null) {
                        transition.removeTarget(view3);
                    }
                    View fragmentView = viewRetriever.getView();
                    if (fragmentView != null) {
                        if (!map3.isEmpty()) {
                            FragmentTransitionCompat21.findNamedViews(map4, fragmentView);
                            map4.keySet().retainAll(map3.values());
                            for (Entry<String, String> entry : map3.entrySet()) {
                                View view = (View) map4.get((String) entry.getValue());
                                if (view != null) {
                                    view.setTransitionName((String) entry.getKey());
                                }
                            }
                        }
                        if (transition != null) {
                            FragmentTransitionCompat21.captureTransitioningViews(arrayList3, fragmentView);
                            arrayList3.removeAll(map4.values());
                            arrayList3.add(view3);
                            FragmentTransitionCompat21.addTargets(transition, arrayList3);
                        }
                    }
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(r0);
        }
        setSharedElementEpicenter(enterTransition, epicenterView);
    }

    public static Object mergeTransitions(Object enterTransitionObject, Object exitTransitionObject, Object sharedElementTransitionObject, boolean allowOverlap) {
        boolean overlap = true;
        Transition enterTransition = (Transition) enterTransitionObject;
        Transition exitTransition = (Transition) exitTransitionObject;
        Transition sharedElementTransition = (Transition) sharedElementTransitionObject;
        if (!(enterTransition == null || exitTransition == null)) {
            overlap = allowOverlap;
        }
        if (overlap) {
            TransitionSet transitionSet = new TransitionSet();
            if (enterTransition != null) {
                transitionSet.addTransition(enterTransition);
            }
            if (exitTransition != null) {
                transitionSet.addTransition(exitTransition);
            }
            if (sharedElementTransition == null) {
                return transitionSet;
            }
            transitionSet.addTransition(sharedElementTransition);
            return transitionSet;
        }
        Transition staggered = null;
        if (exitTransition != null && enterTransition != null) {
            staggered = new TransitionSet().addTransition(exitTransition).addTransition(enterTransition).setOrdering(1);
        } else if (exitTransition != null) {
            staggered = exitTransition;
        } else if (enterTransition != null) {
            staggered = enterTransition;
        }
        if (sharedElementTransition == null) {
            return staggered;
        }
        TransitionSet together = new TransitionSet();
        if (staggered != null) {
            together.addTransition(staggered);
        }
        together.addTransition(sharedElementTransition);
        return together;
    }

    public static void setSharedElementTargets(Object transitionObj, View nonExistentView, Map<String, View> namedViews, ArrayList<View> sharedElementTargets) {
        TransitionSet transition = (TransitionSet) transitionObj;
        sharedElementTargets.clear();
        sharedElementTargets.addAll(namedViews.values());
        List<View> views = transition.getTargets();
        views.clear();
        int count = sharedElementTargets.size();
        for (int i = 0; i < count; i++) {
            bfsAddViewChildren(views, (View) sharedElementTargets.get(i));
        }
        sharedElementTargets.add(nonExistentView);
        addTargets(transition, sharedElementTargets);
    }

    private static void bfsAddViewChildren(List<View> views, View startView) {
        int startIndex = views.size();
        if (!containedBeforeIndex(views, startView, startIndex)) {
            views.add(startView);
            for (int index = startIndex; index < views.size(); index++) {
                View view = (View) views.get(index);
                if (view instanceof ViewGroup) {
                    ViewGroup viewGroup = (ViewGroup) view;
                    int childCount = viewGroup.getChildCount();
                    for (int childIndex = 0; childIndex < childCount; childIndex++) {
                        View child = viewGroup.getChildAt(childIndex);
                        if (!containedBeforeIndex(views, child, startIndex)) {
                            views.add(child);
                        }
                    }
                }
            }
        }
    }

    private static boolean containedBeforeIndex(List<View> views, View view, int maxIndex) {
        for (int i = 0; i < maxIndex; i++) {
            if (views.get(i) == view) {
                return true;
            }
        }
        return false;
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

    /* access modifiers changed from: private */
    public static Rect getBoundsOnScreen(View view) {
        Rect epicenter = new Rect();
        int[] loc = new int[2];
        view.getLocationOnScreen(loc);
        epicenter.set(loc[0], loc[1], loc[0] + view.getWidth(), loc[1] + view.getHeight());
        return epicenter;
    }

    /* access modifiers changed from: private */
    public static void captureTransitioningViews(ArrayList<View> transitioningViews, View view) {
        if (view.getVisibility() != 0) {
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            if (viewGroup.isTransitionGroup()) {
                transitioningViews.add(viewGroup);
                return;
            }
            int count = viewGroup.getChildCount();
            for (int i = 0; i < count; i++) {
                captureTransitioningViews(transitioningViews, viewGroup.getChildAt(i));
            }
            return;
        }
        transitioningViews.add(view);
    }

    public static void findNamedViews(Map<String, View> namedViews, View view) {
        if (view.getVisibility() == 0) {
            String transitionName = view.getTransitionName();
            if (transitionName != null) {
                namedViews.put(transitionName, view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                int count = viewGroup.getChildCount();
                for (int i = 0; i < count; i++) {
                    findNamedViews(namedViews, viewGroup.getChildAt(i));
                }
            }
        }
    }

    public static void cleanupTransitions(View sceneRoot, View nonExistentView, Object enterTransitionObject, ArrayList<View> enteringViews, Object exitTransitionObject, ArrayList<View> exitingViews, Object sharedElementTransitionObject, ArrayList<View> sharedElementTargets, Object overallTransitionObject, ArrayList<View> hiddenViews, Map<String, View> renamedViews) {
        Transition enterTransition = (Transition) enterTransitionObject;
        Transition exitTransition = (Transition) exitTransitionObject;
        Transition sharedElementTransition = (Transition) sharedElementTransitionObject;
        Transition overallTransition = (Transition) overallTransitionObject;
        if (overallTransition != null) {
            final View view = sceneRoot;
            final Transition transition = enterTransition;
            final ArrayList<View> arrayList = enteringViews;
            final Transition transition2 = exitTransition;
            final ArrayList<View> arrayList2 = exitingViews;
            final Transition transition3 = sharedElementTransition;
            final ArrayList<View> arrayList3 = sharedElementTargets;
            final Map<String, View> map = renamedViews;
            final ArrayList<View> arrayList4 = hiddenViews;
            AnonymousClass4 r0 = r1;
            final Transition transition4 = overallTransition;
            Transition transition5 = enterTransition;
            ViewTreeObserver viewTreeObserver = sceneRoot.getViewTreeObserver();
            final View view2 = nonExistentView;
            AnonymousClass4 r1 = new OnPreDrawListener() {
                public boolean onPreDraw() {
                    view.getViewTreeObserver().removeOnPreDrawListener(this);
                    if (transition != null) {
                        FragmentTransitionCompat21.removeTargets(transition, arrayList);
                    }
                    if (transition2 != null) {
                        FragmentTransitionCompat21.removeTargets(transition2, arrayList2);
                    }
                    if (transition3 != null) {
                        FragmentTransitionCompat21.removeTargets(transition3, arrayList3);
                    }
                    for (Entry<String, View> entry : map.entrySet()) {
                        ((View) entry.getValue()).setTransitionName((String) entry.getKey());
                    }
                    int numViews = arrayList4.size();
                    for (int i = 0; i < numViews; i++) {
                        transition4.excludeTarget((View) arrayList4.get(i), false);
                    }
                    transition4.excludeTarget(view2, false);
                    return true;
                }
            };
            viewTreeObserver.addOnPreDrawListener(r0);
            return;
        }
    }

    public static void removeTargets(Object transitionObject, ArrayList<View> views) {
        Transition transition = (Transition) transitionObject;
        if (transition instanceof TransitionSet) {
            TransitionSet set = (TransitionSet) transition;
            int numTransitions = set.getTransitionCount();
            for (int i = 0; i < numTransitions; i++) {
                removeTargets(set.getTransitionAt(i), views);
            }
        } else if (!hasSimpleTarget(transition)) {
            List<View> targets = transition.getTargets();
            if (targets != null && targets.size() == views.size() && targets.containsAll(views)) {
                for (int i2 = views.size() - 1; i2 >= 0; i2--) {
                    transition.removeTarget((View) views.get(i2));
                }
            }
        }
    }

    public static void addTargets(Object transitionObject, ArrayList<View> views) {
        Transition transition = (Transition) transitionObject;
        int i = 0;
        if (transition instanceof TransitionSet) {
            TransitionSet set = (TransitionSet) transition;
            int numTransitions = set.getTransitionCount();
            while (i < numTransitions) {
                addTargets(set.getTransitionAt(i), views);
                i++;
            }
        } else if (!hasSimpleTarget(transition) && isNullOrEmpty(transition.getTargets())) {
            int numViews = views.size();
            while (i < numViews) {
                transition.addTarget((View) views.get(i));
                i++;
            }
        }
    }

    private static boolean hasSimpleTarget(Transition transition) {
        return !isNullOrEmpty(transition.getTargetIds()) || !isNullOrEmpty(transition.getTargetNames()) || !isNullOrEmpty(transition.getTargetTypes());
    }

    private static boolean isNullOrEmpty(List list) {
        return list == null || list.isEmpty();
    }
}
