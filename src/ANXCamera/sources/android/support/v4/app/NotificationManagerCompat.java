package android.support.v4.app;

import android.app.AppOpsManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.provider.Settings.Secure;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.INotificationSideChannel.Stub;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class NotificationManagerCompat {
    public static final String ACTION_BIND_SIDE_CHANNEL = "android.support.BIND_NOTIFICATION_SIDE_CHANNEL";
    private static final String CHECK_OP_NO_THROW = "checkOpNoThrow";
    public static final String EXTRA_USE_SIDE_CHANNEL = "android.support.useSideChannel";
    public static final int IMPORTANCE_DEFAULT = 3;
    public static final int IMPORTANCE_HIGH = 4;
    public static final int IMPORTANCE_LOW = 2;
    public static final int IMPORTANCE_MAX = 5;
    public static final int IMPORTANCE_MIN = 1;
    public static final int IMPORTANCE_NONE = 0;
    public static final int IMPORTANCE_UNSPECIFIED = -1000;
    static final int MAX_SIDE_CHANNEL_SDK_VERSION = 19;
    private static final String OP_POST_NOTIFICATION = "OP_POST_NOTIFICATION";
    private static final String SETTING_ENABLED_NOTIFICATION_LISTENERS = "enabled_notification_listeners";
    private static final int SIDE_CHANNEL_RETRY_BASE_INTERVAL_MS = 1000;
    private static final int SIDE_CHANNEL_RETRY_MAX_COUNT = 6;
    private static final String TAG = "NotifManCompat";
    @GuardedBy("sEnabledNotificationListenersLock")
    private static Set<String> sEnabledNotificationListenerPackages = new HashSet();
    @GuardedBy("sEnabledNotificationListenersLock")
    private static String sEnabledNotificationListeners;
    private static final Object sEnabledNotificationListenersLock = new Object();
    private static final Object sLock = new Object();
    @GuardedBy("sLock")
    private static SideChannelManager sSideChannelManager;
    private final Context mContext;
    private final NotificationManager mNotificationManager = ((NotificationManager) this.mContext.getSystemService("notification"));

    private static class CancelTask implements Task {
        final boolean all;
        final int id;
        final String packageName;
        final String tag;

        CancelTask(String str) {
            this.packageName = str;
            this.id = 0;
            this.tag = null;
            this.all = true;
        }

        CancelTask(String str, int i, String str2) {
            this.packageName = str;
            this.id = i;
            this.tag = str2;
            this.all = false;
        }

        public void send(INotificationSideChannel iNotificationSideChannel) throws RemoteException {
            if (this.all) {
                iNotificationSideChannel.cancelAll(this.packageName);
            } else {
                iNotificationSideChannel.cancel(this.packageName, this.id, this.tag);
            }
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("CancelTask[");
            sb.append("packageName:");
            sb.append(this.packageName);
            sb.append(", id:");
            sb.append(this.id);
            sb.append(", tag:");
            sb.append(this.tag);
            sb.append(", all:");
            sb.append(this.all);
            sb.append("]");
            return sb.toString();
        }
    }

    private static class NotifyTask implements Task {
        final int id;
        final Notification notif;
        final String packageName;
        final String tag;

        NotifyTask(String str, int i, String str2, Notification notification) {
            this.packageName = str;
            this.id = i;
            this.tag = str2;
            this.notif = notification;
        }

        public void send(INotificationSideChannel iNotificationSideChannel) throws RemoteException {
            iNotificationSideChannel.notify(this.packageName, this.id, this.tag, this.notif);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("NotifyTask[");
            sb.append("packageName:");
            sb.append(this.packageName);
            sb.append(", id:");
            sb.append(this.id);
            sb.append(", tag:");
            sb.append(this.tag);
            sb.append("]");
            return sb.toString();
        }
    }

    private static class ServiceConnectedEvent {
        final ComponentName componentName;
        final IBinder iBinder;

        ServiceConnectedEvent(ComponentName componentName2, IBinder iBinder2) {
            this.componentName = componentName2;
            this.iBinder = iBinder2;
        }
    }

    private static class SideChannelManager implements ServiceConnection, Callback {
        private static final int MSG_QUEUE_TASK = 0;
        private static final int MSG_RETRY_LISTENER_QUEUE = 3;
        private static final int MSG_SERVICE_CONNECTED = 1;
        private static final int MSG_SERVICE_DISCONNECTED = 2;
        private Set<String> mCachedEnabledPackages = new HashSet();
        private final Context mContext;
        private final Handler mHandler;
        private final HandlerThread mHandlerThread;
        private final Map<ComponentName, ListenerRecord> mRecordMap = new HashMap();

        private static class ListenerRecord {
            boolean bound = false;
            final ComponentName componentName;
            int retryCount = 0;
            INotificationSideChannel service;
            ArrayDeque<Task> taskQueue = new ArrayDeque<>();

            ListenerRecord(ComponentName componentName2) {
                this.componentName = componentName2;
            }
        }

        SideChannelManager(Context context) {
            this.mContext = context;
            this.mHandlerThread = new HandlerThread("NotificationManagerCompat");
            this.mHandlerThread.start();
            this.mHandler = new Handler(this.mHandlerThread.getLooper(), this);
        }

        private boolean ensureServiceBound(ListenerRecord listenerRecord) {
            if (listenerRecord.bound) {
                return true;
            }
            listenerRecord.bound = this.mContext.bindService(new Intent(NotificationManagerCompat.ACTION_BIND_SIDE_CHANNEL).setComponent(listenerRecord.componentName), this, 33);
            if (listenerRecord.bound) {
                listenerRecord.retryCount = 0;
            } else {
                String str = NotificationManagerCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to bind to listener ");
                sb.append(listenerRecord.componentName);
                Log.w(str, sb.toString());
                this.mContext.unbindService(this);
            }
            return listenerRecord.bound;
        }

        private void ensureServiceUnbound(ListenerRecord listenerRecord) {
            if (listenerRecord.bound) {
                this.mContext.unbindService(this);
                listenerRecord.bound = false;
            }
            listenerRecord.service = null;
        }

        private void handleQueueTask(Task task) {
            updateListenerMap();
            for (ListenerRecord listenerRecord : this.mRecordMap.values()) {
                listenerRecord.taskQueue.add(task);
                processListenerQueue(listenerRecord);
            }
        }

        private void handleRetryListenerQueue(ComponentName componentName) {
            ListenerRecord listenerRecord = (ListenerRecord) this.mRecordMap.get(componentName);
            if (listenerRecord != null) {
                processListenerQueue(listenerRecord);
            }
        }

        private void handleServiceConnected(ComponentName componentName, IBinder iBinder) {
            ListenerRecord listenerRecord = (ListenerRecord) this.mRecordMap.get(componentName);
            if (listenerRecord != null) {
                listenerRecord.service = Stub.asInterface(iBinder);
                listenerRecord.retryCount = 0;
                processListenerQueue(listenerRecord);
            }
        }

        private void handleServiceDisconnected(ComponentName componentName) {
            ListenerRecord listenerRecord = (ListenerRecord) this.mRecordMap.get(componentName);
            if (listenerRecord != null) {
                ensureServiceUnbound(listenerRecord);
            }
        }

        private void processListenerQueue(ListenerRecord listenerRecord) {
            if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                String str = NotificationManagerCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Processing component ");
                sb.append(listenerRecord.componentName);
                sb.append(", ");
                sb.append(listenerRecord.taskQueue.size());
                sb.append(" queued tasks");
                Log.d(str, sb.toString());
            }
            if (!listenerRecord.taskQueue.isEmpty()) {
                if (!ensureServiceBound(listenerRecord) || listenerRecord.service == null) {
                    scheduleListenerRetry(listenerRecord);
                    return;
                }
                while (true) {
                    Task task = (Task) listenerRecord.taskQueue.peek();
                    if (task == null) {
                        break;
                    }
                    try {
                        if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                            String str2 = NotificationManagerCompat.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Sending task ");
                            sb2.append(task);
                            Log.d(str2, sb2.toString());
                        }
                        task.send(listenerRecord.service);
                        listenerRecord.taskQueue.remove();
                    } catch (DeadObjectException e) {
                        if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                            String str3 = NotificationManagerCompat.TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Remote service has died: ");
                            sb3.append(listenerRecord.componentName);
                            Log.d(str3, sb3.toString());
                        }
                    } catch (RemoteException e2) {
                        String str4 = NotificationManagerCompat.TAG;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("RemoteException communicating with ");
                        sb4.append(listenerRecord.componentName);
                        Log.w(str4, sb4.toString(), e2);
                    }
                }
                if (!listenerRecord.taskQueue.isEmpty()) {
                    scheduleListenerRetry(listenerRecord);
                }
            }
        }

        private void scheduleListenerRetry(ListenerRecord listenerRecord) {
            if (!this.mHandler.hasMessages(3, listenerRecord.componentName)) {
                listenerRecord.retryCount++;
                if (listenerRecord.retryCount > 6) {
                    String str = NotificationManagerCompat.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Giving up on delivering ");
                    sb.append(listenerRecord.taskQueue.size());
                    sb.append(" tasks to ");
                    sb.append(listenerRecord.componentName);
                    sb.append(" after ");
                    sb.append(listenerRecord.retryCount);
                    sb.append(" retries");
                    Log.w(str, sb.toString());
                    listenerRecord.taskQueue.clear();
                    return;
                }
                int i = 1000 * (1 << (listenerRecord.retryCount - 1));
                if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                    String str2 = NotificationManagerCompat.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Scheduling retry for ");
                    sb2.append(i);
                    sb2.append(" ms");
                    Log.d(str2, sb2.toString());
                }
                this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(3, listenerRecord.componentName), (long) i);
            }
        }

        private void updateListenerMap() {
            Set<String> enabledListenerPackages = NotificationManagerCompat.getEnabledListenerPackages(this.mContext);
            if (!enabledListenerPackages.equals(this.mCachedEnabledPackages)) {
                this.mCachedEnabledPackages = enabledListenerPackages;
                List<ResolveInfo> queryIntentServices = this.mContext.getPackageManager().queryIntentServices(new Intent().setAction(NotificationManagerCompat.ACTION_BIND_SIDE_CHANNEL), 0);
                HashSet<ComponentName> hashSet = new HashSet<>();
                for (ResolveInfo resolveInfo : queryIntentServices) {
                    if (enabledListenerPackages.contains(resolveInfo.serviceInfo.packageName)) {
                        ComponentName componentName = new ComponentName(resolveInfo.serviceInfo.packageName, resolveInfo.serviceInfo.name);
                        if (resolveInfo.serviceInfo.permission != null) {
                            String str = NotificationManagerCompat.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Permission present on component ");
                            sb.append(componentName);
                            sb.append(", not adding listener record.");
                            Log.w(str, sb.toString());
                        } else {
                            hashSet.add(componentName);
                        }
                    }
                }
                for (ComponentName componentName2 : hashSet) {
                    if (!this.mRecordMap.containsKey(componentName2)) {
                        if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                            String str2 = NotificationManagerCompat.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Adding listener record for ");
                            sb2.append(componentName2);
                            Log.d(str2, sb2.toString());
                        }
                        this.mRecordMap.put(componentName2, new ListenerRecord(componentName2));
                    }
                }
                Iterator it = this.mRecordMap.entrySet().iterator();
                while (it.hasNext()) {
                    Entry entry = (Entry) it.next();
                    if (!hashSet.contains(entry.getKey())) {
                        if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                            String str3 = NotificationManagerCompat.TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Removing listener record for ");
                            sb3.append(entry.getKey());
                            Log.d(str3, sb3.toString());
                        }
                        ensureServiceUnbound((ListenerRecord) entry.getValue());
                        it.remove();
                    }
                }
            }
        }

        public boolean handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    handleQueueTask((Task) message.obj);
                    return true;
                case 1:
                    ServiceConnectedEvent serviceConnectedEvent = (ServiceConnectedEvent) message.obj;
                    handleServiceConnected(serviceConnectedEvent.componentName, serviceConnectedEvent.iBinder);
                    return true;
                case 2:
                    handleServiceDisconnected((ComponentName) message.obj);
                    return true;
                case 3:
                    handleRetryListenerQueue((ComponentName) message.obj);
                    return true;
                default:
                    return false;
            }
        }

        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                String str = NotificationManagerCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Connected to service ");
                sb.append(componentName);
                Log.d(str, sb.toString());
            }
            this.mHandler.obtainMessage(1, new ServiceConnectedEvent(componentName, iBinder)).sendToTarget();
        }

        public void onServiceDisconnected(ComponentName componentName) {
            if (Log.isLoggable(NotificationManagerCompat.TAG, 3)) {
                String str = NotificationManagerCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Disconnected from service ");
                sb.append(componentName);
                Log.d(str, sb.toString());
            }
            this.mHandler.obtainMessage(2, componentName).sendToTarget();
        }

        public void queueTask(Task task) {
            this.mHandler.obtainMessage(0, task).sendToTarget();
        }
    }

    private interface Task {
        void send(INotificationSideChannel iNotificationSideChannel) throws RemoteException;
    }

    private NotificationManagerCompat(Context context) {
        this.mContext = context;
    }

    @NonNull
    public static NotificationManagerCompat from(@NonNull Context context) {
        return new NotificationManagerCompat(context);
    }

    @NonNull
    public static Set<String> getEnabledListenerPackages(@NonNull Context context) {
        Set<String> set;
        String string = Secure.getString(context.getContentResolver(), SETTING_ENABLED_NOTIFICATION_LISTENERS);
        synchronized (sEnabledNotificationListenersLock) {
            if (string != null) {
                try {
                    if (!string.equals(sEnabledNotificationListeners)) {
                        String[] split = string.split(":", -1);
                        HashSet hashSet = new HashSet(split.length);
                        for (String unflattenFromString : split) {
                            ComponentName unflattenFromString2 = ComponentName.unflattenFromString(unflattenFromString);
                            if (unflattenFromString2 != null) {
                                hashSet.add(unflattenFromString2.getPackageName());
                            }
                        }
                        sEnabledNotificationListenerPackages = hashSet;
                        sEnabledNotificationListeners = string;
                    }
                } finally {
                }
            }
            set = sEnabledNotificationListenerPackages;
        }
        return set;
    }

    private void pushSideChannelQueue(Task task) {
        synchronized (sLock) {
            if (sSideChannelManager == null) {
                sSideChannelManager = new SideChannelManager(this.mContext.getApplicationContext());
            }
            sSideChannelManager.queueTask(task);
        }
    }

    private static boolean useSideChannelForNotification(Notification notification) {
        Bundle extras = NotificationCompat.getExtras(notification);
        return extras != null && extras.getBoolean(EXTRA_USE_SIDE_CHANNEL);
    }

    public boolean areNotificationsEnabled() {
        if (VERSION.SDK_INT >= 24) {
            return this.mNotificationManager.areNotificationsEnabled();
        }
        boolean z = true;
        if (VERSION.SDK_INT < 19) {
            return true;
        }
        AppOpsManager appOpsManager = (AppOpsManager) this.mContext.getSystemService("appops");
        ApplicationInfo applicationInfo = this.mContext.getApplicationInfo();
        String packageName = this.mContext.getApplicationContext().getPackageName();
        int i = applicationInfo.uid;
        try {
            Class cls = Class.forName(AppOpsManager.class.getName());
            if (((Integer) cls.getMethod(CHECK_OP_NO_THROW, new Class[]{Integer.TYPE, Integer.TYPE, String.class}).invoke(appOpsManager, new Object[]{Integer.valueOf(((Integer) cls.getDeclaredField(OP_POST_NOTIFICATION).get(Integer.class)).intValue()), Integer.valueOf(i), packageName})).intValue() != 0) {
                z = false;
            }
            return z;
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException | NoSuchMethodException | RuntimeException | InvocationTargetException e) {
            return true;
        }
    }

    public void cancel(int i) {
        cancel(null, i);
    }

    public void cancel(@Nullable String str, int i) {
        this.mNotificationManager.cancel(str, i);
        if (VERSION.SDK_INT <= 19) {
            pushSideChannelQueue(new CancelTask(this.mContext.getPackageName(), i, str));
        }
    }

    public void cancelAll() {
        this.mNotificationManager.cancelAll();
        if (VERSION.SDK_INT <= 19) {
            pushSideChannelQueue(new CancelTask(this.mContext.getPackageName()));
        }
    }

    public int getImportance() {
        if (VERSION.SDK_INT >= 24) {
            return this.mNotificationManager.getImportance();
        }
        return -1000;
    }

    public void notify(int i, @NonNull Notification notification) {
        notify(null, i, notification);
    }

    public void notify(@Nullable String str, int i, @NonNull Notification notification) {
        if (useSideChannelForNotification(notification)) {
            pushSideChannelQueue(new NotifyTask(this.mContext.getPackageName(), i, str, notification));
            this.mNotificationManager.cancel(str, i);
            return;
        }
        this.mNotificationManager.notify(str, i, notification);
    }
}
