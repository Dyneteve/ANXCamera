package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.RemoteViews;

class NotificationCompatIceCreamSandwich {

    public static class Builder implements NotificationBuilderWithBuilderAccessor {
        private android.app.Notification.Builder b;

        public Builder(Context context, Notification notification, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, RemoteViews remoteViews, int i, PendingIntent pendingIntent, PendingIntent pendingIntent2, Bitmap bitmap, int i2, int i3, boolean z) {
            Notification notification2 = notification;
            boolean z2 = false;
            android.app.Notification.Builder deleteIntent = new android.app.Notification.Builder(context).setWhen(notification2.when).setSmallIcon(notification2.icon, notification2.iconLevel).setContent(notification2.contentView).setTicker(notification2.tickerText, remoteViews).setSound(notification2.sound, notification2.audioStreamType).setVibrate(notification2.vibrate).setLights(notification2.ledARGB, notification2.ledOnMS, notification2.ledOffMS).setOngoing((notification2.flags & 2) != 0).setOnlyAlertOnce((notification2.flags & 8) != 0).setAutoCancel((notification2.flags & 16) != 0).setDefaults(notification2.defaults).setContentTitle(charSequence).setContentText(charSequence2).setContentInfo(charSequence3).setContentIntent(pendingIntent).setDeleteIntent(notification2.deleteIntent);
            if ((notification2.flags & 128) != 0) {
                z2 = true;
            }
            this.b = deleteIntent.setFullScreenIntent(pendingIntent2, z2).setLargeIcon(bitmap).setNumber(i).setProgress(i2, i3, z);
        }

        public Notification build() {
            return this.b.getNotification();
        }

        public android.app.Notification.Builder getBuilder() {
            return this.b;
        }
    }

    NotificationCompatIceCreamSandwich() {
    }
}
