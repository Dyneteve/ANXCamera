package android.support.v4.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.ImageView;

public class ImageViewCompat {
    private ImageViewCompat() {
    }

    @Nullable
    public static ColorStateList getImageTintList(@NonNull ImageView imageView) {
        if (VERSION.SDK_INT >= 21) {
            return imageView.getImageTintList();
        }
        return imageView instanceof TintableImageSourceView ? ((TintableImageSourceView) imageView).getSupportImageTintList() : null;
    }

    @Nullable
    public static Mode getImageTintMode(@NonNull ImageView imageView) {
        if (VERSION.SDK_INT >= 21) {
            return imageView.getImageTintMode();
        }
        return imageView instanceof TintableImageSourceView ? ((TintableImageSourceView) imageView).getSupportImageTintMode() : null;
    }

    public static void setImageTintList(@NonNull ImageView imageView, @Nullable ColorStateList colorStateList) {
        if (VERSION.SDK_INT >= 21) {
            imageView.setImageTintList(colorStateList);
            if (VERSION.SDK_INT == 21) {
                Drawable drawable = imageView.getDrawable();
                boolean z = (imageView.getImageTintList() == null || imageView.getImageTintMode() == null) ? false : true;
                if (drawable != null && z) {
                    if (drawable.isStateful()) {
                        drawable.setState(imageView.getDrawableState());
                    }
                    imageView.setImageDrawable(drawable);
                }
            }
        } else if (imageView instanceof TintableImageSourceView) {
            ((TintableImageSourceView) imageView).setSupportImageTintList(colorStateList);
        }
    }

    public static void setImageTintMode(@NonNull ImageView imageView, @Nullable Mode mode) {
        if (VERSION.SDK_INT >= 21) {
            imageView.setImageTintMode(mode);
            if (VERSION.SDK_INT == 21) {
                Drawable drawable = imageView.getDrawable();
                boolean z = (imageView.getImageTintList() == null || imageView.getImageTintMode() == null) ? false : true;
                if (drawable != null && z) {
                    if (drawable.isStateful()) {
                        drawable.setState(imageView.getDrawableState());
                    }
                    imageView.setImageDrawable(drawable);
                }
            }
        } else if (imageView instanceof TintableImageSourceView) {
            ((TintableImageSourceView) imageView).setSupportImageTintMode(mode);
        }
    }
}
