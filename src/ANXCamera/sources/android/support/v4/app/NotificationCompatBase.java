package android.support.v4.app;

import android.app.PendingIntent;
import android.os.Bundle;
import android.support.v4.app.RemoteInputCompatBase.RemoteInput;

public class NotificationCompatBase {

    public static abstract class Action {

        public interface Factory {
            Action build(int i, CharSequence charSequence, PendingIntent pendingIntent, Bundle bundle, RemoteInput[] remoteInputArr);

            Action[] newArray(int i);
        }

        public abstract PendingIntent getActionIntent();

        public abstract Bundle getExtras();

        public abstract int getIcon();

        public abstract RemoteInput[] getRemoteInputs();

        public abstract CharSequence getTitle();
    }

    public static abstract class UnreadConversation {

        public interface Factory {
            UnreadConversation build(String[] strArr, RemoteInput remoteInput, PendingIntent pendingIntent, PendingIntent pendingIntent2, String[] strArr2, long j);
        }

        public abstract long getLatestTimestamp();

        public abstract String[] getMessages();

        public abstract String getParticipant();

        public abstract String[] getParticipants();

        public abstract PendingIntent getReadPendingIntent();

        public abstract RemoteInput getRemoteInput();

        public abstract PendingIntent getReplyPendingIntent();
    }
}
