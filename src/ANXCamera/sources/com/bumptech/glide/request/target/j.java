package com.bumptech.glide.request.target;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.util.i;

/* compiled from: NotificationTarget */
public class j extends l<Bitmap> {
    private final Context context;
    private final int notificationId;
    private final String ph;
    private final Notification pi;
    private final RemoteViews remoteViews;
    private final int viewId;

    public j(Context context2, int i, int i2, int i3, RemoteViews remoteViews2, Notification notification, int i4, String str) {
        super(i, i2);
        this.context = (Context) i.a(context2, "Context must not be null!");
        this.pi = (Notification) i.a(notification, "Notification object can not be null!");
        this.remoteViews = (RemoteViews) i.a(remoteViews2, "RemoteViews object can not be null!");
        this.viewId = i3;
        this.notificationId = i4;
        this.ph = str;
    }

    public j(Context context2, int i, RemoteViews remoteViews2, Notification notification, int i2) {
        this(context2, i, remoteViews2, notification, i2, null);
    }

    public j(Context context2, int i, RemoteViews remoteViews2, Notification notification, int i2, String str) {
        this(context2, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews2, notification, i2, str);
    }

    private void update() {
        ((NotificationManager) i.checkNotNull((NotificationManager) this.context.getSystemService("notification"))).notify(this.ph, this.notificationId, this.pi);
    }

    public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
        this.remoteViews.setImageViewBitmap(this.viewId, bitmap);
        update();
    }
}
