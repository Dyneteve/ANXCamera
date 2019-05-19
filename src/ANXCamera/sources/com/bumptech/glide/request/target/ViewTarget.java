package com.bumptech.glide.request.target;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import android.view.WindowManager;
import com.bumptech.glide.request.c;
import com.bumptech.glide.util.i;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class ViewTarget<T extends View, Z> extends b<Z> {
    private static final String TAG = "ViewTarget";
    private static boolean pl;
    @Nullable
    private static Integer pm;
    private final SizeDeterminer pn;
    @Nullable
    private OnAttachStateChangeListener po;
    private boolean pp;
    private boolean pq;
    protected final T view;

    @VisibleForTesting
    static final class SizeDeterminer {
        @Nullable
        @VisibleForTesting
        static Integer maxDisplayLength;
        private static final int ps = 0;
        private final List<m> gv = new ArrayList();
        boolean pt;
        @Nullable
        private a pu;
        private final View view;

        private static final class a implements OnPreDrawListener {
            private final WeakReference<SizeDeterminer> pv;

            a(@NonNull SizeDeterminer sizeDeterminer) {
                this.pv = new WeakReference<>(sizeDeterminer);
            }

            public boolean onPreDraw() {
                if (Log.isLoggable(ViewTarget.TAG, 2)) {
                    String str = ViewTarget.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("OnGlobalLayoutListener called attachStateListener=");
                    sb.append(this);
                    Log.v(str, sb.toString());
                }
                SizeDeterminer sizeDeterminer = (SizeDeterminer) this.pv.get();
                if (sizeDeterminer != null) {
                    sizeDeterminer.ez();
                }
                return true;
            }
        }

        SizeDeterminer(@NonNull View view2) {
            this.view = view2;
        }

        private boolean V(int i) {
            return i > 0 || i == Integer.MIN_VALUE;
        }

        private int b(int i, int i2, int i3) {
            int i4 = i2 - i3;
            if (i4 > 0) {
                return i4;
            }
            if (this.pt && this.view.isLayoutRequested()) {
                return 0;
            }
            int i5 = i - i3;
            if (i5 > 0) {
                return i5;
            }
            if (this.view.isLayoutRequested() || i2 != -2) {
                return 0;
            }
            if (Log.isLoggable(ViewTarget.TAG, 4)) {
                Log.i(ViewTarget.TAG, "Glide treats LayoutParams.WRAP_CONTENT as a request for an image the size of this device's screen dimensions. If you want to load the original image and are ok with the corresponding memory cost and OOMs (depending on the input size), use .override(Target.SIZE_ORIGINAL). Otherwise, use LayoutParams.MATCH_PARENT, set layout_width and layout_height to fixed dimension, or use .override() with fixed dimensions.");
            }
            return l(this.view.getContext());
        }

        private int eB() {
            int paddingTop = this.view.getPaddingTop() + this.view.getPaddingBottom();
            LayoutParams layoutParams = this.view.getLayoutParams();
            return b(this.view.getHeight(), layoutParams != null ? layoutParams.height : 0, paddingTop);
        }

        private int eC() {
            int paddingLeft = this.view.getPaddingLeft() + this.view.getPaddingRight();
            LayoutParams layoutParams = this.view.getLayoutParams();
            return b(this.view.getWidth(), layoutParams != null ? layoutParams.width : 0, paddingLeft);
        }

        private static int l(@NonNull Context context) {
            if (maxDisplayLength == null) {
                Display defaultDisplay = ((WindowManager) i.checkNotNull((WindowManager) context.getSystemService("window"))).getDefaultDisplay();
                Point point = new Point();
                defaultDisplay.getSize(point);
                maxDisplayLength = Integer.valueOf(Math.max(point.x, point.y));
            }
            return maxDisplayLength.intValue();
        }

        private void q(int i, int i2) {
            Iterator it = new ArrayList(this.gv).iterator();
            while (it.hasNext()) {
                ((m) it.next()).p(i, i2);
            }
        }

        private boolean r(int i, int i2) {
            return V(i) && V(i2);
        }

        /* access modifiers changed from: 0000 */
        public void a(@NonNull m mVar) {
            int eC = eC();
            int eB = eB();
            if (r(eC, eB)) {
                mVar.p(eC, eB);
                return;
            }
            if (!this.gv.contains(mVar)) {
                this.gv.add(mVar);
            }
            if (this.pu == null) {
                ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
                this.pu = new a(this);
                viewTreeObserver.addOnPreDrawListener(this.pu);
            }
        }

        /* access modifiers changed from: 0000 */
        public void b(@NonNull m mVar) {
            this.gv.remove(mVar);
        }

        /* access modifiers changed from: 0000 */
        public void eA() {
            ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this.pu);
            }
            this.pu = null;
            this.gv.clear();
        }

        /* access modifiers changed from: 0000 */
        public void ez() {
            if (!this.gv.isEmpty()) {
                int eC = eC();
                int eB = eB();
                if (r(eC, eB)) {
                    q(eC, eB);
                    eA();
                }
            }
        }
    }

    public ViewTarget(@NonNull T t) {
        this.view = (View) i.checkNotNull(t);
        this.pn = new SizeDeterminer(t);
    }

    @Deprecated
    public ViewTarget(@NonNull T t, boolean z) {
        this(t);
        if (z) {
            ew();
        }
    }

    public static void U(int i) {
        if (pm != null || pl) {
            throw new IllegalArgumentException("You cannot set the tag id more than once or change the tag id after the first request has been made");
        }
        pm = Integer.valueOf(i);
    }

    private void ex() {
        if (this.po != null && !this.pq) {
            this.view.addOnAttachStateChangeListener(this.po);
            this.pq = true;
        }
    }

    private void ey() {
        if (this.po != null && this.pq) {
            this.view.removeOnAttachStateChangeListener(this.po);
            this.pq = false;
        }
    }

    @Nullable
    private Object getTag() {
        return pm == null ? this.view.getTag() : this.view.getTag(pm.intValue());
    }

    private void setTag(@Nullable Object obj) {
        if (pm == null) {
            pl = true;
            this.view.setTag(obj);
            return;
        }
        this.view.setTag(pm.intValue(), obj);
    }

    @CallSuper
    public void a(@NonNull m mVar) {
        this.pn.a(mVar);
    }

    @CallSuper
    public void b(@NonNull m mVar) {
        this.pn.b(mVar);
    }

    @CallSuper
    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        this.pn.eA();
        if (!this.pp) {
            ey();
        }
    }

    @Nullable
    public c dp() {
        Object tag = getTag();
        if (tag == null) {
            return null;
        }
        if (tag instanceof c) {
            return (c) tag;
        }
        throw new IllegalArgumentException("You must not call setTag() on a view Glide is targeting");
    }

    @CallSuper
    public void e(@Nullable Drawable drawable) {
        super.e(drawable);
        ex();
    }

    @NonNull
    public final ViewTarget<T, Z> et() {
        if (this.po != null) {
            return this;
        }
        this.po = new OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View view) {
                ViewTarget.this.eu();
            }

            public void onViewDetachedFromWindow(View view) {
                ViewTarget.this.ev();
            }
        };
        ex();
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void eu() {
        c dp = dp();
        if (dp != null && dp.isPaused()) {
            dp.begin();
        }
    }

    /* access modifiers changed from: 0000 */
    public void ev() {
        c dp = dp();
        if (dp != null && !dp.isCancelled() && !dp.isPaused()) {
            this.pp = true;
            dp.pause();
            this.pp = false;
        }
    }

    @NonNull
    public final ViewTarget<T, Z> ew() {
        this.pn.pt = true;
        return this;
    }

    @NonNull
    public T getView() {
        return this.view;
    }

    public void j(@Nullable c cVar) {
        setTag(cVar);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Target for: ");
        sb.append(this.view);
        return sb.toString();
    }
}
