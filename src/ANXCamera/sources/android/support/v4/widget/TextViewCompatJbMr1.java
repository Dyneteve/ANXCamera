package android.support.v4.widget;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.TextView;

class TextViewCompatJbMr1 {
    TextViewCompatJbMr1() {
    }

    public static void setCompoundDrawablesRelative(@NonNull TextView textView, @Nullable Drawable drawable, @Nullable Drawable drawable2, @Nullable Drawable drawable3, @Nullable Drawable drawable4) {
        boolean z = true;
        if (textView.getLayoutDirection() != 1) {
            z = false;
        }
        boolean z2 = z;
        textView.setCompoundDrawables(z2 ? drawable3 : drawable, drawable2, z2 ? drawable : drawable3, drawable4);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, int i, int i2, int i3, int i4) {
        boolean z = true;
        if (textView.getLayoutDirection() != 1) {
            z = false;
        }
        boolean z2 = z;
        textView.setCompoundDrawablesWithIntrinsicBounds(z2 ? i3 : i, i2, z2 ? i : i3, i4);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, @Nullable Drawable drawable, @Nullable Drawable drawable2, @Nullable Drawable drawable3, @Nullable Drawable drawable4) {
        boolean z = true;
        if (textView.getLayoutDirection() != 1) {
            z = false;
        }
        boolean z2 = z;
        textView.setCompoundDrawablesWithIntrinsicBounds(z2 ? drawable3 : drawable, drawable2, z2 ? drawable : drawable3, drawable4);
    }
}
