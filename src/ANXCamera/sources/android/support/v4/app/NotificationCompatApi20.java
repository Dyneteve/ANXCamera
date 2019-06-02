package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.NotificationCompatBase.Action;
import android.support.v4.app.NotificationCompatBase.Action.Factory;
import android.widget.RemoteViews;
import java.util.ArrayList;

class NotificationCompatApi20 {

    public static class Builder implements NotificationBuilderWithBuilderAccessor, NotificationBuilderWithActions {
        private android.app.Notification.Builder b;
        private Bundle mExtras;

        public Builder(Context context, Notification notification, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, RemoteViews remoteViews, int i, PendingIntent pendingIntent, PendingIntent pendingIntent2, Bitmap bitmap, int i2, int i3, boolean z, boolean z2, boolean z3, int i4, CharSequence charSequence4, boolean z4, ArrayList<String> arrayList, Bundle bundle, String str, boolean z5, String str2) {
            Notification notification2 = notification;
            ArrayList<String> arrayList2 = arrayList;
            Bundle bundle2 = bundle;
            boolean z6 = false;
            android.app.Notification.Builder deleteIntent = new android.app.Notification.Builder(context).setWhen(notification2.when).setShowWhen(z2).setSmallIcon(notification2.icon, notification2.iconLevel).setContent(notification2.contentView).setTicker(notification2.tickerText, remoteViews).setSound(notification2.sound, notification2.audioStreamType).setVibrate(notification2.vibrate).setLights(notification2.ledARGB, notification2.ledOnMS, notification2.ledOffMS).setOngoing((notification2.flags & 2) != 0).setOnlyAlertOnce((notification2.flags & 8) != 0).setAutoCancel((notification2.flags & 16) != 0).setDefaults(notification2.defaults).setContentTitle(charSequence).setContentText(charSequence2).setSubText(charSequence4).setContentInfo(charSequence3).setContentIntent(pendingIntent).setDeleteIntent(notification2.deleteIntent);
            if ((notification2.flags & 128) != 0) {
                z6 = true;
            }
            this.b = deleteIntent.setFullScreenIntent(pendingIntent2, z6).setLargeIcon(bitmap).setNumber(i).setUsesChronometer(z3).setPriority(i4).setProgress(i2, i3, z).setLocalOnly(z4).setGroup(str).setGroupSummary(z5).setSortKey(str2);
            this.mExtras = new Bundle();
            if (bundle2 != null) {
                this.mExtras.putAll(bundle2);
            }
            if (arrayList2 != null && !arrayList.isEmpty()) {
                this.mExtras.putStringArray(NotificationCompat.EXTRA_PEOPLE, (String[]) arrayList2.toArray(new String[arrayList.size()]));
            }
        }

        public void addAction(Action action) {
            NotificationCompatApi20.addAction(this.b, action);
        }

        public Notification build() {
            this.b.setExtras(this.mExtras);
            return this.b.build();
        }

        public android.app.Notification.Builder getBuilder() {
            return this.b;
        }
    }

    NotificationCompatApi20() {
    }

    public static void addAction(android.app.Notification.Builder builder, Action action) {
        android.app.Notification.Action.Builder builder2 = new android.app.Notification.Action.Builder(action.getIcon(), action.getTitle(), action.getActionIntent());
        if (action.getRemoteInputs() != null) {
            for (RemoteInput addRemoteInput : RemoteInputCompatApi20.fromCompat(action.getRemoteInputs())) {
                builder2.addRemoteInput(addRemoteInput);
            }
        }
        if (action.getExtras() != null) {
            builder2.addExtras(action.getExtras());
        }
        builder.addAction(builder2.build());
    }

    public static Action getAction(Notification notification, int i, Factory factory, RemoteInputCompatBase.RemoteInput.Factory factory2) {
        return getActionCompatFromAction(notification.actions[i], factory, factory2);
    }

    private static Action getActionCompatFromAction(Notification.Action action, Factory factory, RemoteInputCompatBase.RemoteInput.Factory factory2) {
        return factory.build(action.icon, action.title, action.actionIntent, action.getExtras(), RemoteInputCompatApi20.toCompat(action.getRemoteInputs(), factory2));
    }

    private static Notification.Action getActionFromActionCompat(Action action) {
        android.app.Notification.Action.Builder addExtras = new android.app.Notification.Action.Builder(action.getIcon(), action.getTitle(), action.getActionIntent()).addExtras(action.getExtras());
        RemoteInputCompatBase.RemoteInput[] remoteInputs = action.getRemoteInputs();
        if (remoteInputs != null) {
            for (RemoteInput addRemoteInput : RemoteInputCompatApi20.fromCompat(remoteInputs)) {
                addExtras.addRemoteInput(addRemoteInput);
            }
        }
        return addExtras.build();
    }

    public static Action[] getActionsFromParcelableArrayList(ArrayList<Parcelable> arrayList, Factory factory, RemoteInputCompatBase.RemoteInput.Factory factory2) {
        if (arrayList == null) {
            return null;
        }
        Action[] newArray = factory.newArray(arrayList.size());
        for (int i = 0; i < newArray.length; i++) {
            newArray[i] = getActionCompatFromAction((Notification.Action) arrayList.get(i), factory, factory2);
        }
        return newArray;
    }

    public static String getGroup(Notification notification) {
        return notification.getGroup();
    }

    public static boolean getLocalOnly(Notification notification) {
        return (notification.flags & 256) != 0;
    }

    public static ArrayList<Parcelable> getParcelableArrayListForActions(Action[] actionArr) {
        if (actionArr == null) {
            return null;
        }
        ArrayList<Parcelable> arrayList = new ArrayList<>(actionArr.length);
        for (Action actionFromActionCompat : actionArr) {
            arrayList.add(getActionFromActionCompat(actionFromActionCompat));
        }
        return arrayList;
    }

    public static String getSortKey(Notification notification) {
        return notification.getSortKey();
    }

    public static boolean isGroupSummary(Notification notification) {
        return (notification.flags & 512) != 0;
    }
}
