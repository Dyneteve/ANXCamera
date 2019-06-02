package io.reactivex;

import io.reactivex.annotations.NonNull;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.NotificationLite;

public final class Notification<T> {
    static final Notification<Object> COMPLETE = new Notification<>(null);
    final Object value;

    private Notification(Object obj) {
        this.value = obj;
    }

    @NonNull
    public static <T> Notification<T> createOnComplete() {
        return COMPLETE;
    }

    @NonNull
    public static <T> Notification<T> createOnError(@NonNull Throwable th) {
        ObjectHelper.requireNonNull(th, "error is null");
        return new Notification<>(NotificationLite.error(th));
    }

    @NonNull
    public static <T> Notification<T> createOnNext(@NonNull T t) {
        ObjectHelper.requireNonNull(t, "value is null");
        return new Notification<>(t);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof Notification)) {
            return false;
        }
        return ObjectHelper.equals(this.value, ((Notification) obj).value);
    }

    @Nullable
    public Throwable getError() {
        Object obj = this.value;
        if (NotificationLite.isError(obj)) {
            return NotificationLite.getError(obj);
        }
        return null;
    }

    @Nullable
    public T getValue() {
        Object obj = this.value;
        if (obj == null || NotificationLite.isError(obj)) {
            return null;
        }
        return this.value;
    }

    public int hashCode() {
        Object obj = this.value;
        if (obj != null) {
            return obj.hashCode();
        }
        return 0;
    }

    public boolean isOnComplete() {
        return this.value == null;
    }

    public boolean isOnError() {
        return NotificationLite.isError(this.value);
    }

    public boolean isOnNext() {
        Object obj = this.value;
        return obj != null && !NotificationLite.isError(obj);
    }

    public String toString() {
        Object obj = this.value;
        if (obj == null) {
            return "OnCompleteNotification";
        }
        if (NotificationLite.isError(obj)) {
            StringBuilder sb = new StringBuilder();
            sb.append("OnErrorNotification[");
            sb.append(NotificationLite.getError(obj));
            sb.append("]");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("OnNextNotification[");
        sb2.append(this.value);
        sb2.append("]");
        return sb2.toString();
    }
}
