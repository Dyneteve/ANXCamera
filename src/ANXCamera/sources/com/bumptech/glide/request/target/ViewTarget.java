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
    private static boolean pn;
    @Nullable
    private static Integer po;
    private final SizeDeterminer pp;
    @Nullable
    private OnAttachStateChangeListener pq;
    private boolean pr;
    private boolean ps;
    protected final T view;

    @VisibleForTesting
    static final class SizeDeterminer {
        @Nullable
        @VisibleForTesting
        static Integer maxDisplayLength;
        private static final int pu = 0;
        private final List<m> gx = new ArrayList();
        boolean pv;
        @Nullable
        private a pw;
        private final View view;

        private static final class a implements OnPreDrawListener {
            private final WeakReference<SizeDeterminer> px;

            a(@NonNull SizeDeterminer sizeDeterminer) {
                this.px = new WeakReference<>(sizeDeterminer);
            }

            public boolean onPreDraw() {
                if (Log.isLoggable(ViewTarget.TAG, 2)) {
                    String str = ViewTarget.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("OnGlobalLayoutListener called attachStateListener=");
                    sb.append(this);
                    Log.v(str, sb.toString());
                }
                SizeDeterminer sizeDeterminer = (SizeDeterminer) this.px.get();
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
            if (this.pv && this.view.isLayoutRequested()) {
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
            Iterator it = new ArrayList(this.gx).iterator();
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
            if (!this.gx.contains(mVar)) {
                this.gx.add(mVar);
            }
            if (this.pw == null) {
                ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
                this.pw = new a(this);
                viewTreeObserver.addOnPreDrawListener(this.pw);
            }
        }

        /* access modifiers changed from: 0000 */
        public void b(@NonNull m mVar) {
            this.gx.remove(mVar);
        }

        /* access modifiers changed from: 0000 */
        public void eA() {
            ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this.pw);
            }
            this.pw = null;
            this.gx.clear();
        }

        /* access modifiers changed from: 0000 */
        public void ez() {
            if (!this.gx.isEmpty()) {
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
        this.pp = new SizeDeterminer(t);
    }

    @Deprecated
    public ViewTarget(@NonNull T t, boolean z) {
        this(t);
        if (z) {
            ew();
        }
    }

    public static void U(int i) {
        if (po != null || pn) {
            throw new IllegalArgumentException("You cannot set the tag id more than once or change the tag id after the first request has been made");
        }
        po = Integer.valueOf(i);
    }

    private void ex() {
        if (this.pq != null && !this.ps) {
            this.view.addOnAttachStateChangeListener(this.pq);
            this.ps = true;
        }
    }

    private void ey() {
        if (this.pq != null && this.ps) {
            this.view.removeOnAttachStateChangeListener(this.pq);
            this.ps = false;
        }
    }

    @Nullable
    private Object getTag() {
        return po == null ? this.view.getTag() : this.view.getTag(po.intValue());
    }

    private void setTag(@Nullable Object obj) {
        if (po == null) {
            pn = true;
            this.view.setTag(obj);
            return;
        }
        this.view.setTag(po.intValue(), obj);
    }

    @CallSuper
    public void a(@NonNull m mVar) {
        this.pp.a(mVar);
    }

    @CallSuper
    public void b(@NonNull m mVar) {
        this.pp.b(mVar);
    }

    @CallSuper
    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        this.pp.eA();
        if (!this.pr) {
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
        if (this.pq != null) {
            return this;
        }
        this.pq = new OnAttachStateChangeListener() {
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
            this.pr = true;
            dp.pause();
            this.pr = false;
        }
    }

    @NonNull
    public final ViewTarget<T, Z> ew() {
        this.pp.pv = true;
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
