package com.bumptech.glide.request.target;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.util.i;

/* compiled from: AppWidgetTarget */
public class a extends l<Bitmap> {
    private final ComponentName componentName;
    private final Context context;
    private final int[] oZ;
    private final RemoteViews remoteViews;
    private final int viewId;

    public a(Context context2, int i, int i2, int i3, RemoteViews remoteViews2, ComponentName componentName2) {
        super(i, i2);
        this.context = (Context) i.a(context2, "Context can not be null!");
        this.remoteViews = (RemoteViews) i.a(remoteViews2, "RemoteViews object can not be null!");
        this.componentName = (ComponentName) i.a(componentName2, "ComponentName can not be null!");
        this.viewId = i3;
        this.oZ = null;
    }

    public a(Context context2, int i, int i2, int i3, RemoteViews remoteViews2, int... iArr) {
        super(i, i2);
        if (iArr.length != 0) {
            this.context = (Context) i.a(context2, "Context can not be null!");
            this.remoteViews = (RemoteViews) i.a(remoteViews2, "RemoteViews object can not be null!");
            this.oZ = (int[]) i.a(iArr, "WidgetIds can not be null!");
            this.viewId = i3;
            this.componentName = null;
            return;
        }
        throw new IllegalArgumentException("WidgetIds must have length > 0");
    }

    public a(Context context2, int i, RemoteViews remoteViews2, ComponentName componentName2) {
        this(context2, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews2, componentName2);
    }

    public a(Context context2, int i, RemoteViews remoteViews2, int... iArr) {
        this(context2, Integer.MIN_VALUE, Integer.MIN_VALUE, i, remoteViews2, iArr);
    }

    private void update() {
        AppWidgetManager instance = AppWidgetManager.getInstance(this.context);
        if (this.componentName != null) {
            instance.updateAppWidget(this.componentName, this.remoteViews);
        } else {
            instance.updateAppWidget(this.oZ, this.remoteViews);
        }
    }

    public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
        this.remoteViews.setImageViewBitmap(this.viewId, bitmap);
        update();
    }
}
