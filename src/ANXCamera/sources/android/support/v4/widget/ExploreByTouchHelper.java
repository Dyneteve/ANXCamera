package android.support.v4.widget;

import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.SparseArrayCompat;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewParentCompat;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v4.widget.FocusStrategy.BoundsAdapter;
import android.support.v4.widget.FocusStrategy.CollectionAdapter;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import java.util.ArrayList;
import java.util.List;

public abstract class ExploreByTouchHelper extends AccessibilityDelegateCompat {
    private static final String DEFAULT_CLASS_NAME = "android.view.View";
    public static final int HOST_ID = -1;
    public static final int INVALID_ID = Integer.MIN_VALUE;
    private static final Rect INVALID_PARENT_BOUNDS = new Rect(Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE);
    private static final BoundsAdapter<AccessibilityNodeInfoCompat> NODE_ADAPTER = new BoundsAdapter<AccessibilityNodeInfoCompat>() {
        public void obtainBounds(AccessibilityNodeInfoCompat accessibilityNodeInfoCompat, Rect rect) {
            accessibilityNodeInfoCompat.getBoundsInParent(rect);
        }
    };
    private static final CollectionAdapter<SparseArrayCompat<AccessibilityNodeInfoCompat>, AccessibilityNodeInfoCompat> SPARSE_VALUES_ADAPTER = new CollectionAdapter<SparseArrayCompat<AccessibilityNodeInfoCompat>, AccessibilityNodeInfoCompat>() {
        public AccessibilityNodeInfoCompat get(SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat, int i) {
            return (AccessibilityNodeInfoCompat) sparseArrayCompat.valueAt(i);
        }

        public int size(SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat) {
            return sparseArrayCompat.size();
        }
    };
    /* access modifiers changed from: private */
    public int mAccessibilityFocusedVirtualViewId = Integer.MIN_VALUE;
    private final View mHost;
    private int mHoveredVirtualViewId = Integer.MIN_VALUE;
    /* access modifiers changed from: private */
    public int mKeyboardFocusedVirtualViewId = Integer.MIN_VALUE;
    private final AccessibilityManager mManager;
    private MyNodeProvider mNodeProvider;
    private final int[] mTempGlobalRect = new int[2];
    private final Rect mTempParentRect = new Rect();
    private final Rect mTempScreenRect = new Rect();
    private final Rect mTempVisibleRect = new Rect();

    private class MyNodeProvider extends AccessibilityNodeProviderCompat {
        MyNodeProvider() {
        }

        public AccessibilityNodeInfoCompat createAccessibilityNodeInfo(int i) {
            return AccessibilityNodeInfoCompat.obtain(ExploreByTouchHelper.this.obtainAccessibilityNodeInfo(i));
        }

        public AccessibilityNodeInfoCompat findFocus(int i) {
            int access$000 = i == 2 ? ExploreByTouchHelper.this.mAccessibilityFocusedVirtualViewId : ExploreByTouchHelper.this.mKeyboardFocusedVirtualViewId;
            if (access$000 == Integer.MIN_VALUE) {
                return null;
            }
            return createAccessibilityNodeInfo(access$000);
        }

        public boolean performAction(int i, int i2, Bundle bundle) {
            return ExploreByTouchHelper.this.performAction(i, i2, bundle);
        }
    }

    public ExploreByTouchHelper(@NonNull View view) {
        if (view != null) {
            this.mHost = view;
            this.mManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
            view.setFocusable(true);
            if (ViewCompat.getImportantForAccessibility(view) == 0) {
                ViewCompat.setImportantForAccessibility(view, 1);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("View may not be null");
    }

    private boolean clearAccessibilityFocus(int i) {
        if (this.mAccessibilityFocusedVirtualViewId != i) {
            return false;
        }
        this.mAccessibilityFocusedVirtualViewId = Integer.MIN_VALUE;
        this.mHost.invalidate();
        sendEventForVirtualView(i, 65536);
        return true;
    }

    private boolean clickKeyboardFocusedVirtualView() {
        return this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE && onPerformActionForVirtualView(this.mKeyboardFocusedVirtualViewId, 16, null);
    }

    private AccessibilityEvent createEvent(int i, int i2) {
        return i != -1 ? createEventForChild(i, i2) : createEventForHost(i2);
    }

    private AccessibilityEvent createEventForChild(int i, int i2) {
        AccessibilityEvent obtain = AccessibilityEvent.obtain(i2);
        AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo = obtainAccessibilityNodeInfo(i);
        obtain.getText().add(obtainAccessibilityNodeInfo.getText());
        obtain.setContentDescription(obtainAccessibilityNodeInfo.getContentDescription());
        obtain.setScrollable(obtainAccessibilityNodeInfo.isScrollable());
        obtain.setPassword(obtainAccessibilityNodeInfo.isPassword());
        obtain.setEnabled(obtainAccessibilityNodeInfo.isEnabled());
        obtain.setChecked(obtainAccessibilityNodeInfo.isChecked());
        onPopulateEventForVirtualView(i, obtain);
        if (!obtain.getText().isEmpty() || obtain.getContentDescription() != null) {
            obtain.setClassName(obtainAccessibilityNodeInfo.getClassName());
            AccessibilityRecordCompat.setSource(obtain, this.mHost, i);
            obtain.setPackageName(this.mHost.getContext().getPackageName());
            return obtain;
        }
        throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
    }

    private AccessibilityEvent createEventForHost(int i) {
        AccessibilityEvent obtain = AccessibilityEvent.obtain(i);
        this.mHost.onInitializeAccessibilityEvent(obtain);
        return obtain;
    }

    @NonNull
    private AccessibilityNodeInfoCompat createNodeForChild(int i) {
        AccessibilityNodeInfoCompat obtain = AccessibilityNodeInfoCompat.obtain();
        obtain.setEnabled(true);
        obtain.setFocusable(true);
        obtain.setClassName(DEFAULT_CLASS_NAME);
        obtain.setBoundsInParent(INVALID_PARENT_BOUNDS);
        obtain.setBoundsInScreen(INVALID_PARENT_BOUNDS);
        obtain.setParent(this.mHost);
        onPopulateNodeForVirtualView(i, obtain);
        if (obtain.getText() == null && obtain.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        obtain.getBoundsInParent(this.mTempParentRect);
        if (!this.mTempParentRect.equals(INVALID_PARENT_BOUNDS)) {
            int actions = obtain.getActions();
            if ((actions & 64) != 0) {
                throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
            } else if ((actions & 128) == 0) {
                obtain.setPackageName(this.mHost.getContext().getPackageName());
                obtain.setSource(this.mHost, i);
                if (this.mAccessibilityFocusedVirtualViewId == i) {
                    obtain.setAccessibilityFocused(true);
                    obtain.addAction(128);
                } else {
                    obtain.setAccessibilityFocused(false);
                    obtain.addAction(64);
                }
                boolean z = this.mKeyboardFocusedVirtualViewId == i;
                if (z) {
                    obtain.addAction(2);
                } else if (obtain.isFocusable()) {
                    obtain.addAction(1);
                }
                obtain.setFocused(z);
                this.mHost.getLocationOnScreen(this.mTempGlobalRect);
                obtain.getBoundsInScreen(this.mTempScreenRect);
                if (this.mTempScreenRect.equals(INVALID_PARENT_BOUNDS)) {
                    obtain.getBoundsInParent(this.mTempScreenRect);
                    if (obtain.mParentVirtualDescendantId != -1) {
                        AccessibilityNodeInfoCompat obtain2 = AccessibilityNodeInfoCompat.obtain();
                        for (int i2 = obtain.mParentVirtualDescendantId; i2 != -1; i2 = obtain2.mParentVirtualDescendantId) {
                            obtain2.setParent(this.mHost, -1);
                            obtain2.setBoundsInParent(INVALID_PARENT_BOUNDS);
                            onPopulateNodeForVirtualView(i2, obtain2);
                            obtain2.getBoundsInParent(this.mTempParentRect);
                            this.mTempScreenRect.offset(this.mTempParentRect.left, this.mTempParentRect.top);
                        }
                        obtain2.recycle();
                    }
                    this.mTempScreenRect.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
                }
                if (this.mHost.getLocalVisibleRect(this.mTempVisibleRect)) {
                    this.mTempVisibleRect.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
                    if (this.mTempScreenRect.intersect(this.mTempVisibleRect)) {
                        obtain.setBoundsInScreen(this.mTempScreenRect);
                        if (isVisibleToUser(this.mTempScreenRect)) {
                            obtain.setVisibleToUser(true);
                        }
                    }
                }
                return obtain;
            } else {
                throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
            }
        } else {
            throw new RuntimeException("Callbacks must set parent bounds in populateNodeForVirtualViewId()");
        }
    }

    @NonNull
    private AccessibilityNodeInfoCompat createNodeForHost() {
        AccessibilityNodeInfoCompat obtain = AccessibilityNodeInfoCompat.obtain(this.mHost);
        ViewCompat.onInitializeAccessibilityNodeInfo(this.mHost, obtain);
        ArrayList arrayList = new ArrayList();
        getVisibleVirtualViews(arrayList);
        if (obtain.getChildCount() <= 0 || arrayList.size() <= 0) {
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                obtain.addChild(this.mHost, ((Integer) arrayList.get(i)).intValue());
            }
            return obtain;
        }
        throw new RuntimeException("Views cannot have both real and virtual children");
    }

    private SparseArrayCompat<AccessibilityNodeInfoCompat> getAllNodes() {
        ArrayList arrayList = new ArrayList();
        getVisibleVirtualViews(arrayList);
        SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat = new SparseArrayCompat<>();
        for (int i = 0; i < arrayList.size(); i++) {
            sparseArrayCompat.put(i, createNodeForChild(i));
        }
        return sparseArrayCompat;
    }

    private void getBoundsInParent(int i, Rect rect) {
        obtainAccessibilityNodeInfo(i).getBoundsInParent(rect);
    }

    private static Rect guessPreviouslyFocusedRect(@NonNull View view, int i, @NonNull Rect rect) {
        int width = view.getWidth();
        int height = view.getHeight();
        if (i == 17) {
            rect.set(width, 0, width, height);
        } else if (i == 33) {
            rect.set(0, height, width, height);
        } else if (i == 66) {
            rect.set(-1, 0, -1, height);
        } else if (i == 130) {
            rect.set(0, -1, width, -1);
        } else {
            throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return rect;
    }

    private boolean isVisibleToUser(Rect rect) {
        boolean z = false;
        if (rect == null || rect.isEmpty() || this.mHost.getWindowVisibility() != 0) {
            return false;
        }
        ViewParent parent = this.mHost.getParent();
        while (parent instanceof View) {
            View view = (View) parent;
            if (view.getAlpha() <= 0.0f || view.getVisibility() != 0) {
                return false;
            }
            parent = view.getParent();
        }
        if (parent != null) {
            z = true;
        }
        return z;
    }

    private static int keyToDirection(int i) {
        switch (i) {
            case 19:
                return 33;
            case 21:
                return 17;
            case 22:
                return 66;
            default:
                return 130;
        }
    }

    private boolean moveFocus(int i, @Nullable Rect rect) {
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat;
        SparseArrayCompat allNodes = getAllNodes();
        int i2 = this.mKeyboardFocusedVirtualViewId;
        int i3 = Integer.MIN_VALUE;
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat2 = i2 == Integer.MIN_VALUE ? null : (AccessibilityNodeInfoCompat) allNodes.get(i2);
        if (i == 17 || i == 33 || i == 66 || i == 130) {
            Rect rect2 = new Rect();
            if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
                getBoundsInParent(this.mKeyboardFocusedVirtualViewId, rect2);
            } else if (rect != null) {
                rect2.set(rect);
            } else {
                guessPreviouslyFocusedRect(this.mHost, i, rect2);
            }
            accessibilityNodeInfoCompat = (AccessibilityNodeInfoCompat) FocusStrategy.findNextFocusInAbsoluteDirection(allNodes, SPARSE_VALUES_ADAPTER, NODE_ADAPTER, accessibilityNodeInfoCompat2, rect2, i);
        } else {
            switch (i) {
                case 1:
                case 2:
                    accessibilityNodeInfoCompat = (AccessibilityNodeInfoCompat) FocusStrategy.findNextFocusInRelativeDirection(allNodes, SPARSE_VALUES_ADAPTER, NODE_ADAPTER, accessibilityNodeInfoCompat2, i, ViewCompat.getLayoutDirection(this.mHost) == 1, false);
                    break;
                default:
                    throw new IllegalArgumentException("direction must be one of {FOCUS_FORWARD, FOCUS_BACKWARD, FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
            }
        }
        if (accessibilityNodeInfoCompat != null) {
            i3 = allNodes.keyAt(allNodes.indexOfValue(accessibilityNodeInfoCompat));
        }
        return requestKeyboardFocusForVirtualView(i3);
    }

    private boolean performActionForChild(int i, int i2, Bundle bundle) {
        if (i2 == 64) {
            return requestAccessibilityFocus(i);
        }
        if (i2 == 128) {
            return clearAccessibilityFocus(i);
        }
        switch (i2) {
            case 1:
                return requestKeyboardFocusForVirtualView(i);
            case 2:
                return clearKeyboardFocusForVirtualView(i);
            default:
                return onPerformActionForVirtualView(i, i2, bundle);
        }
    }

    private boolean performActionForHost(int i, Bundle bundle) {
        return ViewCompat.performAccessibilityAction(this.mHost, i, bundle);
    }

    private boolean requestAccessibilityFocus(int i) {
        if (!this.mManager.isEnabled() || !this.mManager.isTouchExplorationEnabled() || this.mAccessibilityFocusedVirtualViewId == i) {
            return false;
        }
        if (this.mAccessibilityFocusedVirtualViewId != Integer.MIN_VALUE) {
            clearAccessibilityFocus(this.mAccessibilityFocusedVirtualViewId);
        }
        this.mAccessibilityFocusedVirtualViewId = i;
        this.mHost.invalidate();
        sendEventForVirtualView(i, 32768);
        return true;
    }

    private void updateHoveredVirtualView(int i) {
        if (this.mHoveredVirtualViewId != i) {
            int i2 = this.mHoveredVirtualViewId;
            this.mHoveredVirtualViewId = i;
            sendEventForVirtualView(i, 128);
            sendEventForVirtualView(i2, 256);
        }
    }

    public final boolean clearKeyboardFocusForVirtualView(int i) {
        if (this.mKeyboardFocusedVirtualViewId != i) {
            return false;
        }
        this.mKeyboardFocusedVirtualViewId = Integer.MIN_VALUE;
        onVirtualViewKeyboardFocusChanged(i, false);
        sendEventForVirtualView(i, 8);
        return true;
    }

    public final boolean dispatchHoverEvent(@NonNull MotionEvent motionEvent) {
        boolean z = false;
        if (!this.mManager.isEnabled() || !this.mManager.isTouchExplorationEnabled()) {
            return false;
        }
        int action = motionEvent.getAction();
        if (action != 7) {
            switch (action) {
                case 9:
                    break;
                case 10:
                    if (this.mHoveredVirtualViewId == Integer.MIN_VALUE) {
                        return false;
                    }
                    updateHoveredVirtualView(Integer.MIN_VALUE);
                    return true;
                default:
                    return false;
            }
        }
        int virtualViewAt = getVirtualViewAt(motionEvent.getX(), motionEvent.getY());
        updateHoveredVirtualView(virtualViewAt);
        if (virtualViewAt != Integer.MIN_VALUE) {
            z = true;
        }
        return z;
    }

    public final boolean dispatchKeyEvent(@NonNull KeyEvent keyEvent) {
        int i = 0;
        if (keyEvent.getAction() == 1) {
            return false;
        }
        int keyCode = keyEvent.getKeyCode();
        if (keyCode != 61) {
            if (keyCode != 66) {
                switch (keyCode) {
                    case 19:
                    case 20:
                    case 21:
                    case 22:
                        if (!keyEvent.hasNoModifiers()) {
                            return false;
                        }
                        int keyToDirection = keyToDirection(keyCode);
                        int repeatCount = keyEvent.getRepeatCount() + 1;
                        boolean z = false;
                        while (i < repeatCount && moveFocus(keyToDirection, null)) {
                            i++;
                            z = true;
                        }
                        return z;
                    case 23:
                        break;
                    default:
                        return false;
                }
            }
            if (!keyEvent.hasNoModifiers() || keyEvent.getRepeatCount() != 0) {
                return false;
            }
            clickKeyboardFocusedVirtualView();
            return true;
        } else if (keyEvent.hasNoModifiers()) {
            return moveFocus(2, null);
        } else {
            if (keyEvent.hasModifiers(1)) {
                return moveFocus(1, null);
            }
            return false;
        }
    }

    public final int getAccessibilityFocusedVirtualViewId() {
        return this.mAccessibilityFocusedVirtualViewId;
    }

    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(View view) {
        if (this.mNodeProvider == null) {
            this.mNodeProvider = new MyNodeProvider();
        }
        return this.mNodeProvider;
    }

    @Deprecated
    public int getFocusedVirtualView() {
        return getAccessibilityFocusedVirtualViewId();
    }

    public final int getKeyboardFocusedVirtualViewId() {
        return this.mKeyboardFocusedVirtualViewId;
    }

    /* access modifiers changed from: protected */
    public abstract int getVirtualViewAt(float f, float f2);

    /* access modifiers changed from: protected */
    public abstract void getVisibleVirtualViews(List<Integer> list);

    public final void invalidateRoot() {
        invalidateVirtualView(-1, 1);
    }

    public final void invalidateVirtualView(int i) {
        invalidateVirtualView(i, 0);
    }

    public final void invalidateVirtualView(int i, int i2) {
        if (i != Integer.MIN_VALUE && this.mManager.isEnabled()) {
            ViewParent parent = this.mHost.getParent();
            if (parent != null) {
                AccessibilityEvent createEvent = createEvent(i, 2048);
                AccessibilityEventCompat.setContentChangeTypes(createEvent, i2);
                ViewParentCompat.requestSendAccessibilityEvent(parent, this.mHost, createEvent);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo(int i) {
        return i == -1 ? createNodeForHost() : createNodeForChild(i);
    }

    public final void onFocusChanged(boolean z, int i, @Nullable Rect rect) {
        if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
            clearKeyboardFocusForVirtualView(this.mKeyboardFocusedVirtualViewId);
        }
        if (z) {
            moveFocus(i, rect);
        }
    }

    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(view, accessibilityEvent);
        onPopulateEventForHost(accessibilityEvent);
    }

    public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
        super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
        onPopulateNodeForHost(accessibilityNodeInfoCompat);
    }

    /* access modifiers changed from: protected */
    public abstract boolean onPerformActionForVirtualView(int i, int i2, @Nullable Bundle bundle);

    /* access modifiers changed from: protected */
    public void onPopulateEventForHost(@NonNull AccessibilityEvent accessibilityEvent) {
    }

    /* access modifiers changed from: protected */
    public void onPopulateEventForVirtualView(int i, @NonNull AccessibilityEvent accessibilityEvent) {
    }

    /* access modifiers changed from: protected */
    public void onPopulateNodeForHost(@NonNull AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
    }

    /* access modifiers changed from: protected */
    public abstract void onPopulateNodeForVirtualView(int i, @NonNull AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    /* access modifiers changed from: protected */
    public void onVirtualViewKeyboardFocusChanged(int i, boolean z) {
    }

    /* access modifiers changed from: 0000 */
    public boolean performAction(int i, int i2, Bundle bundle) {
        return i != -1 ? performActionForChild(i, i2, bundle) : performActionForHost(i2, bundle);
    }

    public final boolean requestKeyboardFocusForVirtualView(int i) {
        if ((!this.mHost.isFocused() && !this.mHost.requestFocus()) || this.mKeyboardFocusedVirtualViewId == i) {
            return false;
        }
        if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
            clearKeyboardFocusForVirtualView(this.mKeyboardFocusedVirtualViewId);
        }
        this.mKeyboardFocusedVirtualViewId = i;
        onVirtualViewKeyboardFocusChanged(i, true);
        sendEventForVirtualView(i, 8);
        return true;
    }

    public final boolean sendEventForVirtualView(int i, int i2) {
        if (i == Integer.MIN_VALUE || !this.mManager.isEnabled()) {
            return false;
        }
        ViewParent parent = this.mHost.getParent();
        if (parent == null) {
            return false;
        }
        return ViewParentCompat.requestSendAccessibilityEvent(parent, this.mHost, createEvent(i, i2));
    }
}
