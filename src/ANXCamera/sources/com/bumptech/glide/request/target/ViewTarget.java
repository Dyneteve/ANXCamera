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
    private static boolean qn;
    @Nullable
    private static Integer qo;
    private final SizeDeterminer qp;
    @Nullable
    private OnAttachStateChangeListener qq;
    private boolean qr;
    private boolean qt;
    protected final T view;

    @VisibleForTesting
    static final class SizeDeterminer {
        @Nullable
        @VisibleForTesting
        static Integer maxDisplayLength;
        private static final int qv = 0;
        private final List<m> hx = new ArrayList();
        boolean qw;
        @Nullable
        private a qx;
        private final View view;

        private static final class a implements OnPreDrawListener {
            private final WeakReference<SizeDeterminer> qy;

            a(@NonNull SizeDeterminer sizeDeterminer) {
                this.qy = new WeakReference<>(sizeDeterminer);
            }

            public boolean onPreDraw() {
                if (Log.isLoggable(ViewTarget.TAG, 2)) {
                    String str = ViewTarget.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("OnGlobalLayoutListener called attachStateListener=");
                    sb.append(this);
                    Log.v(str, sb.toString());
                }
                SizeDeterminer sizeDeterminer = (SizeDeterminer) this.qy.get();
                if (sizeDeterminer != null) {
                    sizeDeterminer.fb();
                }
                return true;
            }
        }

        SizeDeterminer(@NonNull View view2) {
            this.view = view2;
        }

        private boolean Z(int i) {
            return i > 0 || i == Integer.MIN_VALUE;
        }

        private int b(int i, int i2, int i3) {
            int i4 = i2 - i3;
            if (i4 > 0) {
                return i4;
            }
            if (this.qw && this.view.isLayoutRequested()) {
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

        private int fd() {
            int paddingTop = this.view.getPaddingTop() + this.view.getPaddingBottom();
            LayoutParams layoutParams = this.view.getLayoutParams();
            return b(this.view.getHeight(), layoutParams != null ? layoutParams.height : 0, paddingTop);
        }

        private int fe() {
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

        private void r(int i, int i2) {
            Iterator it = new ArrayList(this.hx).iterator();
            while (it.hasNext()) {
                ((m) it.next()).q(i, i2);
            }
        }

        private boolean s(int i, int i2) {
            return Z(i) && Z(i2);
        }

        /* access modifiers changed from: 0000 */
        public void a(@NonNull m mVar) {
            int fe = fe();
            int fd = fd();
            if (s(fe, fd)) {
                mVar.q(fe, fd);
                return;
            }
            if (!this.hx.contains(mVar)) {
                this.hx.add(mVar);
            }
            if (this.qx == null) {
                ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
                this.qx = new a(this);
                viewTreeObserver.addOnPreDrawListener(this.qx);
            }
        }

        /* access modifiers changed from: 0000 */
        public void b(@NonNull m mVar) {
            this.hx.remove(mVar);
        }

        /* access modifiers changed from: 0000 */
        public void fb() {
            if (!this.hx.isEmpty()) {
                int fe = fe();
                int fd = fd();
                if (s(fe, fd)) {
                    r(fe, fd);
                    fc();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void fc() {
            ViewTreeObserver viewTreeObserver = this.view.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.removeOnPreDrawListener(this.qx);
            }
            this.qx = null;
            this.hx.clear();
        }
    }

    public ViewTarget(@NonNull T t) {
        this.view = (View) i.checkNotNull(t);
        this.qp = new SizeDeterminer(t);
    }

    @Deprecated
    public ViewTarget(@NonNull T t, boolean z) {
        this(t);
        if (z) {
            eY();
        }
    }

    public static void Y(int i) {
        if (qo != null || qn) {
            throw new IllegalArgumentException("You cannot set the tag id more than once or change the tag id after the first request has been made");
        }
        qo = Integer.valueOf(i);
    }

    private void eZ() {
        if (this.qq != null && !this.qt) {
            this.view.addOnAttachStateChangeListener(this.qq);
            this.qt = true;
        }
    }

    private void fa() {
        if (this.qq != null && this.qt) {
            this.view.removeOnAttachStateChangeListener(this.qq);
            this.qt = false;
        }
    }

    @Nullable
    private Object getTag() {
        return qo == null ? this.view.getTag() : this.view.getTag(qo.intValue());
    }

    private void setTag(@Nullable Object obj) {
        if (qo == null) {
            qn = true;
            this.view.setTag(obj);
            return;
        }
        this.view.setTag(qo.intValue(), obj);
    }

    @CallSuper
    public void a(@NonNull m mVar) {
        this.qp.a(mVar);
    }

    @CallSuper
    public void b(@NonNull m mVar) {
        this.qp.b(mVar);
    }

    @CallSuper
    public void d(@Nullable Drawable drawable) {
        super.d(drawable);
        this.qp.fc();
        if (!this.qr) {
            fa();
        }
    }

    @Nullable
    public c dR() {
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
        eZ();
    }

    @NonNull
    public final ViewTarget<T, Z> eV() {
        if (this.qq != null) {
            return this;
        }
        this.qq = new OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View view) {
                ViewTarget.this.eW();
            }

            public void onViewDetachedFromWindow(View view) {
                ViewTarget.this.eX();
            }
        };
        eZ();
        return this;
    }

    /* access modifiers changed from: 0000 */
    public void eW() {
        c dR = dR();
        if (dR != null && dR.isPaused()) {
            dR.begin();
        }
    }

    /* access modifiers changed from: 0000 */
    public void eX() {
        c dR = dR();
        if (dR != null && !dR.isCancelled() && !dR.isPaused()) {
            this.qr = true;
            dR.pause();
            this.qr = false;
        }
    }

    @NonNull
    public final ViewTarget<T, Z> eY() {
        this.qp.qw = true;
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
