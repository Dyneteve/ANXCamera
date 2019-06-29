package android.support.v4.view;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.LayoutInflater.Factory;
import android.view.LayoutInflater.Factory2;
import android.view.View;
import java.lang.reflect.Field;

public final class LayoutInflaterCompat {
    private static final String TAG = "LayoutInflaterCompatHC";
    private static boolean sCheckedField;
    private static Field sLayoutInflaterFactory2Field;

    static class Factory2Wrapper implements Factory2 {
        final LayoutInflaterFactory mDelegateFactory;

        Factory2Wrapper(LayoutInflaterFactory layoutInflaterFactory) {
            this.mDelegateFactory = layoutInflaterFactory;
        }

        public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
            return this.mDelegateFactory.onCreateView(view, str, context, attributeSet);
        }

        public View onCreateView(String str, Context context, AttributeSet attributeSet) {
            return this.mDelegateFactory.onCreateView(null, str, context, attributeSet);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(getClass().getName());
            sb.append("{");
            sb.append(this.mDelegateFactory);
            sb.append("}");
            return sb.toString();
        }
    }

    private LayoutInflaterCompat() {
    }

    private static void forceSetFactory2(LayoutInflater layoutInflater, Factory2 factory2) {
        if (!sCheckedField) {
            try {
                sLayoutInflaterFactory2Field = LayoutInflater.class.getDeclaredField("mFactory2");
                sLayoutInflaterFactory2Field.setAccessible(true);
            } catch (NoSuchFieldException e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("forceSetFactory2 Could not find field 'mFactory2' on class ");
                sb.append(LayoutInflater.class.getName());
                sb.append("; inflation may have unexpected results.");
                Log.e(str, sb.toString(), e);
            }
            sCheckedField = true;
        }
        if (sLayoutInflaterFactory2Field != null) {
            try {
                sLayoutInflaterFactory2Field.set(layoutInflater, factory2);
            } catch (IllegalAccessException e2) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("forceSetFactory2 could not set the Factory2 on LayoutInflater ");
                sb2.append(layoutInflater);
                sb2.append("; inflation may have unexpected results.");
                Log.e(str2, sb2.toString(), e2);
            }
        }
    }

    @Deprecated
    public static LayoutInflaterFactory getFactory(LayoutInflater layoutInflater) {
        Factory factory = layoutInflater.getFactory();
        if (factory instanceof Factory2Wrapper) {
            return ((Factory2Wrapper) factory).mDelegateFactory;
        }
        return null;
    }

    @Deprecated
    public static void setFactory(@NonNull LayoutInflater layoutInflater, @NonNull LayoutInflaterFactory layoutInflaterFactory) {
        Factory2Wrapper factory2Wrapper = null;
        if (VERSION.SDK_INT >= 21) {
            if (layoutInflaterFactory != null) {
                factory2Wrapper = new Factory2Wrapper(layoutInflaterFactory);
            }
            layoutInflater.setFactory2(factory2Wrapper);
            return;
        }
        if (layoutInflaterFactory != null) {
            factory2Wrapper = new Factory2Wrapper(layoutInflaterFactory);
        }
        layoutInflater.setFactory2(factory2Wrapper);
        Factory factory = layoutInflater.getFactory();
        if (factory instanceof Factory2) {
            forceSetFactory2(layoutInflater, (Factory2) factory);
        } else {
            forceSetFactory2(layoutInflater, factory2Wrapper);
        }
    }

    public static void setFactory2(@NonNull LayoutInflater layoutInflater, @NonNull Factory2 factory2) {
        layoutInflater.setFactory2(factory2);
        if (VERSION.SDK_INT < 21) {
            Factory factory = layoutInflater.getFactory();
            if (factory instanceof Factory2) {
                forceSetFactory2(layoutInflater, (Factory2) factory);
            } else {
                forceSetFactory2(layoutInflater, factory2);
            }
        }
    }
}
