package androidx.versionedparcelable;

import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@RestrictTo({Scope.LIBRARY_GROUP})
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.SOURCE)
/* compiled from: VersionedParcelize */
public @interface h {
    boolean A() default false;

    boolean B() default false;

    boolean C() default false;

    int[] D() default {};

    String E() default "";
}
