package android.support.v4.graphics.drawable;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;

class WrappedDrawableApi14 extends Drawable implements Callback, TintAwareDrawable, WrappedDrawable {
    static final Mode DEFAULT_TINT_MODE = Mode.SRC_IN;
    private boolean mColorFilterSet;
    private int mCurrentColor;
    private Mode mCurrentMode;
    Drawable mDrawable;
    private boolean mMutated;
    DrawableWrapperState mState;

    protected static abstract class DrawableWrapperState extends ConstantState {
        int mChangingConfigurations;
        ConstantState mDrawableState;
        ColorStateList mTint = null;
        Mode mTintMode = WrappedDrawableApi14.DEFAULT_TINT_MODE;

        DrawableWrapperState(@Nullable DrawableWrapperState drawableWrapperState, @Nullable Resources resources) {
            if (drawableWrapperState != null) {
                this.mChangingConfigurations = drawableWrapperState.mChangingConfigurations;
                this.mDrawableState = drawableWrapperState.mDrawableState;
                this.mTint = drawableWrapperState.mTint;
                this.mTintMode = drawableWrapperState.mTintMode;
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean canConstantState() {
            return this.mDrawableState != null;
        }

        public int getChangingConfigurations() {
            return this.mChangingConfigurations | (this.mDrawableState != null ? this.mDrawableState.getChangingConfigurations() : 0);
        }

        @NonNull
        public Drawable newDrawable() {
            return newDrawable(null);
        }

        @NonNull
        public abstract Drawable newDrawable(@Nullable Resources resources);
    }

    private static class DrawableWrapperStateBase extends DrawableWrapperState {
        DrawableWrapperStateBase(@Nullable DrawableWrapperState drawableWrapperState, @Nullable Resources resources) {
            super(drawableWrapperState, resources);
        }

        @NonNull
        public Drawable newDrawable(@Nullable Resources resources) {
            return new WrappedDrawableApi14(this, resources);
        }
    }

    WrappedDrawableApi14(@Nullable Drawable drawable) {
        this.mState = mutateConstantState();
        setWrappedDrawable(drawable);
    }

    WrappedDrawableApi14(@NonNull DrawableWrapperState drawableWrapperState, @Nullable Resources resources) {
        this.mState = drawableWrapperState;
        updateLocalState(resources);
    }

    private void updateLocalState(@Nullable Resources resources) {
        if (this.mState != null && this.mState.mDrawableState != null) {
            setWrappedDrawable(this.mState.mDrawableState.newDrawable(resources));
        }
    }

    private boolean updateTint(int[] iArr) {
        if (!isCompatTintEnabled()) {
            return false;
        }
        ColorStateList colorStateList = this.mState.mTint;
        Mode mode = this.mState.mTintMode;
        if (colorStateList == null || mode == null) {
            this.mColorFilterSet = false;
            clearColorFilter();
        } else {
            int colorForState = colorStateList.getColorForState(iArr, colorStateList.getDefaultColor());
            if (!(this.mColorFilterSet && colorForState == this.mCurrentColor && mode == this.mCurrentMode)) {
                setColorFilter(colorForState, mode);
                this.mCurrentColor = colorForState;
                this.mCurrentMode = mode;
                this.mColorFilterSet = true;
                return true;
            }
        }
        return false;
    }

    public void draw(@NonNull Canvas canvas) {
        this.mDrawable.draw(canvas);
    }

    public int getChangingConfigurations() {
        return super.getChangingConfigurations() | (this.mState != null ? this.mState.getChangingConfigurations() : 0) | this.mDrawable.getChangingConfigurations();
    }

    @Nullable
    public ConstantState getConstantState() {
        if (this.mState == null || !this.mState.canConstantState()) {
            return null;
        }
        this.mState.mChangingConfigurations = getChangingConfigurations();
        return this.mState;
    }

    @NonNull
    public Drawable getCurrent() {
        return this.mDrawable.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.mDrawable.getIntrinsicHeight();
    }

    public int getIntrinsicWidth() {
        return this.mDrawable.getIntrinsicWidth();
    }

    public int getMinimumHeight() {
        return this.mDrawable.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.mDrawable.getMinimumWidth();
    }

    public int getOpacity() {
        return this.mDrawable.getOpacity();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.mDrawable.getPadding(rect);
    }

    @NonNull
    public int[] getState() {
        return this.mDrawable.getState();
    }

    public Region getTransparentRegion() {
        return this.mDrawable.getTransparentRegion();
    }

    public final Drawable getWrappedDrawable() {
        return this.mDrawable;
    }

    public void invalidateDrawable(@NonNull Drawable drawable) {
        invalidateSelf();
    }

    @RequiresApi(19)
    public boolean isAutoMirrored() {
        return this.mDrawable.isAutoMirrored();
    }

    /* access modifiers changed from: protected */
    public boolean isCompatTintEnabled() {
        return true;
    }

    public boolean isStateful() {
        ColorStateList colorStateList = (!isCompatTintEnabled() || this.mState == null) ? null : this.mState.mTint;
        return (colorStateList != null && colorStateList.isStateful()) || this.mDrawable.isStateful();
    }

    public void jumpToCurrentState() {
        this.mDrawable.jumpToCurrentState();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.mMutated && super.mutate() == this) {
            this.mState = mutateConstantState();
            if (this.mDrawable != null) {
                this.mDrawable.mutate();
            }
            if (this.mState != null) {
                this.mState.mDrawableState = this.mDrawable != null ? this.mDrawable.getConstantState() : null;
            }
            this.mMutated = true;
        }
        return this;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public DrawableWrapperState mutateConstantState() {
        return new DrawableWrapperStateBase(this.mState, null);
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        if (this.mDrawable != null) {
            this.mDrawable.setBounds(rect);
        }
    }

    /* access modifiers changed from: protected */
    public boolean onLevelChange(int i) {
        return this.mDrawable.setLevel(i);
    }

    public void scheduleDrawable(@NonNull Drawable drawable, @NonNull Runnable runnable, long j) {
        scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.mDrawable.setAlpha(i);
    }

    @RequiresApi(19)
    public void setAutoMirrored(boolean z) {
        this.mDrawable.setAutoMirrored(z);
    }

    public void setChangingConfigurations(int i) {
        this.mDrawable.setChangingConfigurations(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.mDrawable.setColorFilter(colorFilter);
    }

    public void setDither(boolean z) {
        this.mDrawable.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.mDrawable.setFilterBitmap(z);
    }

    public boolean setState(@NonNull int[] iArr) {
        return updateTint(iArr) || this.mDrawable.setState(iArr);
    }

    public void setTint(int i) {
        setTintList(ColorStateList.valueOf(i));
    }

    public void setTintList(ColorStateList colorStateList) {
        this.mState.mTint = colorStateList;
        updateTint(getState());
    }

    public void setTintMode(@NonNull Mode mode) {
        this.mState.mTintMode = mode;
        updateTint(getState());
    }

    public boolean setVisible(boolean z, boolean z2) {
        return super.setVisible(z, z2) || this.mDrawable.setVisible(z, z2);
    }

    public final void setWrappedDrawable(Drawable drawable) {
        if (this.mDrawable != null) {
            this.mDrawable.setCallback(null);
        }
        this.mDrawable = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            setVisible(drawable.isVisible(), true);
            setState(drawable.getState());
            setLevel(drawable.getLevel());
            setBounds(drawable.getBounds());
            if (this.mState != null) {
                this.mState.mDrawableState = drawable.getConstantState();
            }
        }
        invalidateSelf();
    }

    public void unscheduleDrawable(@NonNull Drawable drawable, @NonNull Runnable runnable) {
        unscheduleSelf(runnable);
    }
}
