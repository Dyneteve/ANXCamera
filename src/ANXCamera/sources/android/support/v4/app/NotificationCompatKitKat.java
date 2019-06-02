package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.NotificationCompatBase.Action;
import android.support.v4.app.NotificationCompatBase.Action.Factory;
import android.support.v4.app.RemoteInputCompatBase.RemoteInput;
import android.util.SparseArray;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.List;

class NotificationCompatKitKat {

    public static class Builder implements NotificationBuilderWithBuilderAccessor, NotificationBuilderWithActions {
        private android.app.Notification.Builder b;
        private List<Bundle> mActionExtrasList = new ArrayList();
        private Bundle mExtras;

        public Builder(Context context, Notification notification, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, RemoteViews remoteViews, int i, PendingIntent pendingIntent, PendingIntent pendingIntent2, Bitmap bitmap, int i2, int i3, boolean z, boolean z2, boolean z3, int i4, CharSequence charSequence4, boolean z4, ArrayList<String> arrayList, Bundle bundle, String str, boolean z5, String str2) {
            Notification notification2 = notification;
            ArrayList<String> arrayList2 = arrayList;
            Bundle bundle2 = bundle;
            String str3 = str;
            String str4 = str2;
            this.b = new android.app.Notification.Builder(context).setWhen(notification2.when).setShowWhen(z2).setSmallIcon(notification2.icon, notification2.iconLevel).setContent(notification2.contentView).setTicker(notification2.tickerText, remoteViews).setSound(notification2.sound, notification2.audioStreamType).setVibrate(notification2.vibrate).setLights(notification2.ledARGB, notification2.ledOnMS, notification2.ledOffMS).setOngoing((notification2.flags & 2) != 0).setOnlyAlertOnce((notification2.flags & 8) != 0).setAutoCancel((notification2.flags & 16) != 0).setDefaults(notification2.defaults).setContentTitle(charSequence).setContentText(charSequence2).setSubText(charSequence4).setContentInfo(charSequence3).setContentIntent(pendingIntent).setDeleteIntent(notification2.deleteIntent).setFullScreenIntent(pendingIntent2, (notification2.flags & 128) != 0).setLargeIcon(bitmap).setNumber(i).setUsesChronometer(z3).setPriority(i4).setProgress(i2, i3, z);
            this.mExtras = new Bundle();
            if (bundle2 != null) {
                this.mExtras.putAll(bundle2);
            }
            if (arrayList2 != null && !arrayList.isEmpty()) {
                this.mExtras.putStringArray(NotificationCompat.EXTRA_PEOPLE, (String[]) arrayList2.toArray(new String[arrayList.size()]));
            }
            if (z4) {
                this.mExtras.putBoolean(NotificationCompatExtras.EXTRA_LOCAL_ONLY, true);
            }
            if (str3 != null) {
                this.mExtras.putString(NotificationCompatExtras.EXTRA_GROUP_KEY, str3);
                if (z5) {
                    this.mExtras.putBoolean(NotificationCompatExtras.EXTRA_GROUP_SUMMARY, true);
                } else {
                    this.mExtras.putBoolean(NotificationManagerCompat.EXTRA_USE_SIDE_CHANNEL, true);
                }
            }
            if (str4 != null) {
                this.mExtras.putString(NotificationCompatExtras.EXTRA_SORT_KEY, str4);
            }
        }

        public void addAction(Action action) {
            this.mActionExtrasList.add(NotificationCompatJellybean.writeActionAndGetExtras(this.b, action));
        }

        public Notification build() {
            SparseArray buildActionExtrasMap = NotificationCompatJellybean.buildActionExtrasMap(this.mActionExtrasList);
            if (buildActionExtrasMap != null) {
                this.mExtras.putSparseParcelableArray(NotificationCompatExtras.EXTRA_ACTION_EXTRAS, buildActionExtrasMap);
            }
            this.b.setExtras(this.mExtras);
            return this.b.build();
        }

        public android.app.Notification.Builder getBuilder() {
            return this.b;
        }
    }

    NotificationCompatKitKat() {
    }

    public static Action getAction(Notification notification, int i, Factory factory, RemoteInput.Factory factory2) {
        Notification.Action action = notification.actions[i];
        Bundle bundle = null;
        SparseArray sparseParcelableArray = notification.extras.getSparseParcelableArray(NotificationCompatExtras.EXTRA_ACTION_EXTRAS);
        if (sparseParcelableArray != null) {
            bundle = (Bundle) sparseParcelableArray.get(i);
        }
        return NotificationCompatJellybean.readAction(factory, factory2, action.icon, action.title, action.actionIntent, bundle);
    }

    public static int getActionCount(Notification notification) {
        if (notification.actions != null) {
            return notification.actions.length;
        }
        return 0;
    }

    public static Bundle getExtras(Notification notification) {
        return notification.extras;
    }

    public static String getGroup(Notification notification) {
        return notification.extras.getString(NotificationCompatExtras.EXTRA_GROUP_KEY);
    }

    public static boolean getLocalOnly(Notification notification) {
        return notification.extras.getBoolean(NotificationCompatExtras.EXTRA_LOCAL_ONLY);
    }

    public static String getSortKey(Notification notification) {
        return notification.extras.getString(NotificationCompatExtras.EXTRA_SORT_KEY);
    }

    public static boolean isGroupSummary(Notification notification) {
        return notification.extras.getBoolean(NotificationCompatExtras.EXTRA_GROUP_SUMMARY);
    }
}
