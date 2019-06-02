package android.support.v4.app;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.InsetDrawable;
import android.os.Build.VERSION;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v4.widget.DrawerLayout.DrawerListener;
import android.view.MenuItem;
import android.view.View;

@Deprecated
public class ActionBarDrawerToggle implements DrawerListener {
    private static final int ID_HOME = 16908332;
    private static final ActionBarDrawerToggleImpl IMPL;
    private static final float TOGGLE_DRAWABLE_OFFSET = 0.33333334f;
    /* access modifiers changed from: private */
    public final Activity mActivity;
    private final Delegate mActivityImpl;
    private final int mCloseDrawerContentDescRes;
    private Drawable mDrawerImage;
    private final int mDrawerImageResource;
    private boolean mDrawerIndicatorEnabled;
    private final DrawerLayout mDrawerLayout;
    private boolean mHasCustomUpIndicator;
    private Drawable mHomeAsUpIndicator;
    private final int mOpenDrawerContentDescRes;
    private Object mSetIndicatorInfo;
    private SlideDrawable mSlider;

    private interface ActionBarDrawerToggleImpl {
        Drawable getThemeUpIndicator(Activity activity);

        Object setActionBarDescription(Object obj, Activity activity, int i);

        Object setActionBarUpIndicator(Object obj, Activity activity, Drawable drawable, int i);
    }

    private static class ActionBarDrawerToggleImplBase implements ActionBarDrawerToggleImpl {
        private ActionBarDrawerToggleImplBase() {
        }

        public Drawable getThemeUpIndicator(Activity activity) {
            return null;
        }

        public Object setActionBarDescription(Object obj, Activity activity, int i) {
            return obj;
        }

        public Object setActionBarUpIndicator(Object obj, Activity activity, Drawable drawable, int i) {
            return obj;
        }
    }

    private static class ActionBarDrawerToggleImplHC implements ActionBarDrawerToggleImpl {
        private ActionBarDrawerToggleImplHC() {
        }

        public Drawable getThemeUpIndicator(Activity activity) {
            return ActionBarDrawerToggleHoneycomb.getThemeUpIndicator(activity);
        }

        public Object setActionBarDescription(Object obj, Activity activity, int i) {
            return ActionBarDrawerToggleHoneycomb.setActionBarDescription(obj, activity, i);
        }

        public Object setActionBarUpIndicator(Object obj, Activity activity, Drawable drawable, int i) {
            return ActionBarDrawerToggleHoneycomb.setActionBarUpIndicator(obj, activity, drawable, i);
        }
    }

    private static class ActionBarDrawerToggleImplJellybeanMR2 implements ActionBarDrawerToggleImpl {
        private ActionBarDrawerToggleImplJellybeanMR2() {
        }

        public Drawable getThemeUpIndicator(Activity activity) {
            return ActionBarDrawerToggleJellybeanMR2.getThemeUpIndicator(activity);
        }

        public Object setActionBarDescription(Object obj, Activity activity, int i) {
            return ActionBarDrawerToggleJellybeanMR2.setActionBarDescription(obj, activity, i);
        }

        public Object setActionBarUpIndicator(Object obj, Activity activity, Drawable drawable, int i) {
            return ActionBarDrawerToggleJellybeanMR2.setActionBarUpIndicator(obj, activity, drawable, i);
        }
    }

    public interface Delegate {
        @Nullable
        Drawable getThemeUpIndicator();

        void setActionBarDescription(@StringRes int i);

        void setActionBarUpIndicator(Drawable drawable, @StringRes int i);
    }

    public interface DelegateProvider {
        @Nullable
        Delegate getDrawerToggleDelegate();
    }

    private class SlideDrawable extends InsetDrawable implements Callback {
        private final boolean mHasMirroring;
        private float mOffset;
        private float mPosition;
        private final Rect mTmpRect;

        private SlideDrawable(Drawable drawable) {
            boolean z = false;
            super(drawable, 0);
            if (VERSION.SDK_INT > 18) {
                z = true;
            }
            this.mHasMirroring = z;
            this.mTmpRect = new Rect();
        }

        public void draw(Canvas canvas) {
            copyBounds(this.mTmpRect);
            canvas.save();
            int i = 1;
            boolean z = ViewCompat.getLayoutDirection(ActionBarDrawerToggle.this.mActivity.getWindow().getDecorView()) == 1;
            if (z) {
                i = -1;
            }
            int width = this.mTmpRect.width();
            canvas.translate((-this.mOffset) * ((float) width) * this.mPosition * ((float) i), 0.0f);
            if (z && !this.mHasMirroring) {
                canvas.translate((float) width, 0.0f);
                canvas.scale(-1.0f, 1.0f);
            }
            super.draw(canvas);
            canvas.restore();
        }

        public float getPosition() {
            return this.mPosition;
        }

        public void setOffset(float f) {
            this.mOffset = f;
            invalidateSelf();
        }

        public void setPosition(float f) {
            this.mPosition = f;
            invalidateSelf();
        }
    }

    static {
        int i = VERSION.SDK_INT;
        if (i >= 18) {
            IMPL = new ActionBarDrawerToggleImplJellybeanMR2();
        } else if (i >= 11) {
            IMPL = new ActionBarDrawerToggleImplHC();
        } else {
            IMPL = new ActionBarDrawerToggleImplBase();
        }
    }

    public ActionBarDrawerToggle(Activity activity, DrawerLayout drawerLayout, @DrawableRes int i, @StringRes int i2, @StringRes int i3) {
        this(activity, drawerLayout, !assumeMaterial(activity), i, i2, i3);
    }

    public ActionBarDrawerToggle(Activity activity, DrawerLayout drawerLayout, boolean z, @DrawableRes int i, @StringRes int i2, @StringRes int i3) {
        this.mDrawerIndicatorEnabled = true;
        this.mActivity = activity;
        if (activity instanceof DelegateProvider) {
            this.mActivityImpl = ((DelegateProvider) activity).getDrawerToggleDelegate();
        } else {
            this.mActivityImpl = null;
        }
        this.mDrawerLayout = drawerLayout;
        this.mDrawerImageResource = i;
        this.mOpenDrawerContentDescRes = i2;
        this.mCloseDrawerContentDescRes = i3;
        this.mHomeAsUpIndicator = getThemeUpIndicator();
        this.mDrawerImage = ContextCompat.getDrawable(activity, i);
        this.mSlider = new SlideDrawable(this.mDrawerImage);
        this.mSlider.setOffset(z ? TOGGLE_DRAWABLE_OFFSET : 0.0f);
    }

    private static boolean assumeMaterial(Context context) {
        return context.getApplicationInfo().targetSdkVersion >= 21 && VERSION.SDK_INT >= 21;
    }

    /* access modifiers changed from: 0000 */
    public Drawable getThemeUpIndicator() {
        return this.mActivityImpl != null ? this.mActivityImpl.getThemeUpIndicator() : IMPL.getThemeUpIndicator(this.mActivity);
    }

    public boolean isDrawerIndicatorEnabled() {
        return this.mDrawerIndicatorEnabled;
    }

    public void onConfigurationChanged(Configuration configuration) {
        if (!this.mHasCustomUpIndicator) {
            this.mHomeAsUpIndicator = getThemeUpIndicator();
        }
        this.mDrawerImage = ContextCompat.getDrawable(this.mActivity, this.mDrawerImageResource);
        syncState();
    }

    public void onDrawerClosed(View view) {
        this.mSlider.setPosition(0.0f);
        if (this.mDrawerIndicatorEnabled) {
            setActionBarDescription(this.mOpenDrawerContentDescRes);
        }
    }

    public void onDrawerOpened(View view) {
        this.mSlider.setPosition(1.0f);
        if (this.mDrawerIndicatorEnabled) {
            setActionBarDescription(this.mCloseDrawerContentDescRes);
        }
    }

    public void onDrawerSlide(View view, float f) {
        float position = this.mSlider.getPosition();
        this.mSlider.setPosition(f > 0.5f ? Math.max(position, Math.max(0.0f, f - 0.5f) * 2.0f) : Math.min(position, 2.0f * f));
    }

    public void onDrawerStateChanged(int i) {
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem == null || menuItem.getItemId() != ID_HOME || !this.mDrawerIndicatorEnabled) {
            return false;
        }
        if (this.mDrawerLayout.isDrawerVisible(8388611)) {
            this.mDrawerLayout.closeDrawer(8388611);
        } else {
            this.mDrawerLayout.openDrawer(8388611);
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void setActionBarDescription(int i) {
        if (this.mActivityImpl != null) {
            this.mActivityImpl.setActionBarDescription(i);
        } else {
            this.mSetIndicatorInfo = IMPL.setActionBarDescription(this.mSetIndicatorInfo, this.mActivity, i);
        }
    }

    /* access modifiers changed from: 0000 */
    public void setActionBarUpIndicator(Drawable drawable, int i) {
        if (this.mActivityImpl != null) {
            this.mActivityImpl.setActionBarUpIndicator(drawable, i);
        } else {
            this.mSetIndicatorInfo = IMPL.setActionBarUpIndicator(this.mSetIndicatorInfo, this.mActivity, drawable, i);
        }
    }

    public void setDrawerIndicatorEnabled(boolean z) {
        if (z != this.mDrawerIndicatorEnabled) {
            if (z) {
                setActionBarUpIndicator(this.mSlider, this.mDrawerLayout.isDrawerOpen(8388611) ? this.mCloseDrawerContentDescRes : this.mOpenDrawerContentDescRes);
            } else {
                setActionBarUpIndicator(this.mHomeAsUpIndicator, 0);
            }
            this.mDrawerIndicatorEnabled = z;
        }
    }

    public void setHomeAsUpIndicator(int i) {
        Drawable drawable = null;
        if (i != 0) {
            drawable = ContextCompat.getDrawable(this.mActivity, i);
        }
        setHomeAsUpIndicator(drawable);
    }

    public void setHomeAsUpIndicator(Drawable drawable) {
        if (drawable == null) {
            this.mHomeAsUpIndicator = getThemeUpIndicator();
            this.mHasCustomUpIndicator = false;
        } else {
            this.mHomeAsUpIndicator = drawable;
            this.mHasCustomUpIndicator = true;
        }
        if (!this.mDrawerIndicatorEnabled) {
            setActionBarUpIndicator(this.mHomeAsUpIndicator, 0);
        }
    }

    public void syncState() {
        if (this.mDrawerLayout.isDrawerOpen(8388611)) {
            this.mSlider.setPosition(1.0f);
        } else {
            this.mSlider.setPosition(0.0f);
        }
        if (this.mDrawerIndicatorEnabled) {
            setActionBarUpIndicator(this.mSlider, this.mDrawerLayout.isDrawerOpen(8388611) ? this.mCloseDrawerContentDescRes : this.mOpenDrawerContentDescRes);
        }
    }
}
