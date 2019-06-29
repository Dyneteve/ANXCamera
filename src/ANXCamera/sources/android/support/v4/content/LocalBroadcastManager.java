package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.NonNull;
import android.util.Log;
import com.ss.android.vesdk.VECameraSettings;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public final class LocalBroadcastManager {
    private static final boolean DEBUG = false;
    static final int MSG_EXEC_PENDING_BROADCASTS = 1;
    private static final String TAG = "LocalBroadcastManager";
    private static LocalBroadcastManager mInstance;
    private static final Object mLock = new Object();
    private final HashMap<String, ArrayList<ReceiverRecord>> mActions = new HashMap<>();
    private final Context mAppContext;
    private final Handler mHandler;
    private final ArrayList<BroadcastRecord> mPendingBroadcasts = new ArrayList<>();
    private final HashMap<BroadcastReceiver, ArrayList<ReceiverRecord>> mReceivers = new HashMap<>();

    private static final class BroadcastRecord {
        final Intent intent;
        final ArrayList<ReceiverRecord> receivers;

        BroadcastRecord(Intent intent2, ArrayList<ReceiverRecord> arrayList) {
            this.intent = intent2;
            this.receivers = arrayList;
        }
    }

    private static final class ReceiverRecord {
        boolean broadcasting;
        boolean dead;
        final IntentFilter filter;
        final BroadcastReceiver receiver;

        ReceiverRecord(IntentFilter intentFilter, BroadcastReceiver broadcastReceiver) {
            this.filter = intentFilter;
            this.receiver = broadcastReceiver;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder(128);
            sb.append("Receiver{");
            sb.append(this.receiver);
            sb.append(" filter=");
            sb.append(this.filter);
            if (this.dead) {
                sb.append(" DEAD");
            }
            sb.append("}");
            return sb.toString();
        }
    }

    private LocalBroadcastManager(Context context) {
        this.mAppContext = context;
        this.mHandler = new Handler(context.getMainLooper()) {
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    super.handleMessage(message);
                } else {
                    LocalBroadcastManager.this.executePendingBroadcasts();
                }
            }
        };
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
        if (r2 >= r1.length) goto L_0x0000;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001f, code lost:
        r3 = r1[r2];
        r4 = r3.receivers.size();
        r5 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0028, code lost:
        if (r5 >= r4) goto L_0x0042;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002a, code lost:
        r6 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r3.receivers.get(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0034, code lost:
        if (r6.dead != false) goto L_0x003f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0036, code lost:
        r6.receiver.onReceive(r9.mAppContext, r3.intent);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x003f, code lost:
        r5 = r5 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0042, code lost:
        r2 = r2 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001a, code lost:
        r2 = 0;
     */
    public void executePendingBroadcasts() {
        while (true) {
            synchronized (this.mReceivers) {
                int size = this.mPendingBroadcasts.size();
                if (size > 0) {
                    BroadcastRecord[] broadcastRecordArr = new BroadcastRecord[size];
                    this.mPendingBroadcasts.toArray(broadcastRecordArr);
                    this.mPendingBroadcasts.clear();
                } else {
                    return;
                }
            }
        }
        while (true) {
        }
    }

    @NonNull
    public static LocalBroadcastManager getInstance(@NonNull Context context) {
        LocalBroadcastManager localBroadcastManager;
        synchronized (mLock) {
            if (mInstance == null) {
                mInstance = new LocalBroadcastManager(context.getApplicationContext());
            }
            localBroadcastManager = mInstance;
        }
        return localBroadcastManager;
    }

    public void registerReceiver(@NonNull BroadcastReceiver broadcastReceiver, @NonNull IntentFilter intentFilter) {
        synchronized (this.mReceivers) {
            ReceiverRecord receiverRecord = new ReceiverRecord(intentFilter, broadcastReceiver);
            ArrayList arrayList = (ArrayList) this.mReceivers.get(broadcastReceiver);
            if (arrayList == null) {
                arrayList = new ArrayList(1);
                this.mReceivers.put(broadcastReceiver, arrayList);
            }
            arrayList.add(receiverRecord);
            for (int i = 0; i < intentFilter.countActions(); i++) {
                String action = intentFilter.getAction(i);
                ArrayList arrayList2 = (ArrayList) this.mActions.get(action);
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList(1);
                    this.mActions.put(action, arrayList2);
                }
                arrayList2.add(receiverRecord);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:52:0x016c, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x016f, code lost:
        return false;
     */
    public boolean sendBroadcast(@NonNull Intent intent) {
        String str;
        ArrayList arrayList;
        int i;
        String str2;
        ArrayList arrayList2;
        String str3;
        Intent intent2 = intent;
        synchronized (this.mReceivers) {
            String action = intent.getAction();
            String resolveTypeIfNeeded = intent2.resolveTypeIfNeeded(this.mAppContext.getContentResolver());
            Uri data = intent.getData();
            String scheme = intent.getScheme();
            Set categories = intent.getCategories();
            boolean z = (intent.getFlags() & 8) != 0;
            if (z) {
                String str4 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Resolving type ");
                sb.append(resolveTypeIfNeeded);
                sb.append(" scheme ");
                sb.append(scheme);
                sb.append(" of intent ");
                sb.append(intent2);
                Log.v(str4, sb.toString());
            }
            ArrayList arrayList3 = (ArrayList) this.mActions.get(intent.getAction());
            if (arrayList3 != null) {
                if (z) {
                    String str5 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Action list: ");
                    sb2.append(arrayList3);
                    Log.v(str5, sb2.toString());
                }
                ArrayList arrayList4 = null;
                int i2 = 0;
                while (i2 < arrayList3.size()) {
                    ReceiverRecord receiverRecord = (ReceiverRecord) arrayList3.get(i2);
                    if (z) {
                        String str6 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Matching against filter ");
                        sb3.append(receiverRecord.filter);
                        Log.v(str6, sb3.toString());
                    }
                    if (receiverRecord.broadcasting) {
                        if (z) {
                            Log.v(TAG, "  Filter's target already added");
                        }
                        i = i2;
                        arrayList = arrayList3;
                        str2 = action;
                        str = resolveTypeIfNeeded;
                        arrayList2 = arrayList4;
                    } else {
                        ReceiverRecord receiverRecord2 = receiverRecord;
                        str2 = action;
                        arrayList2 = arrayList4;
                        i = i2;
                        arrayList = arrayList3;
                        str = resolveTypeIfNeeded;
                        int match = receiverRecord.filter.match(action, resolveTypeIfNeeded, scheme, data, categories, TAG);
                        if (match >= 0) {
                            if (z) {
                                String str7 = TAG;
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("  Filter matched!  match=0x");
                                sb4.append(Integer.toHexString(match));
                                Log.v(str7, sb4.toString());
                            }
                            arrayList4 = arrayList2 == null ? new ArrayList() : arrayList2;
                            arrayList4.add(receiverRecord2);
                            receiverRecord2.broadcasting = true;
                            i2 = i + 1;
                            action = str2;
                            arrayList3 = arrayList;
                            resolveTypeIfNeeded = str;
                        } else if (z) {
                            switch (match) {
                                case -4:
                                    str3 = "category";
                                    break;
                                case -3:
                                    str3 = VECameraSettings.SCENE_MODE_ACTION;
                                    break;
                                case -2:
                                    str3 = "data";
                                    break;
                                case -1:
                                    str3 = "type";
                                    break;
                                default:
                                    str3 = "unknown reason";
                                    break;
                            }
                            String str8 = TAG;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("  Filter did not match: ");
                            sb5.append(str3);
                            Log.v(str8, sb5.toString());
                        }
                    }
                    arrayList4 = arrayList2;
                    i2 = i + 1;
                    action = str2;
                    arrayList3 = arrayList;
                    resolveTypeIfNeeded = str;
                }
                ArrayList arrayList5 = arrayList4;
                if (arrayList5 != null) {
                    for (int i3 = 0; i3 < arrayList5.size(); i3++) {
                        ((ReceiverRecord) arrayList5.get(i3)).broadcasting = false;
                    }
                    this.mPendingBroadcasts.add(new BroadcastRecord(intent2, arrayList5));
                    if (!this.mHandler.hasMessages(1)) {
                        this.mHandler.sendEmptyMessage(1);
                    }
                }
            }
        }
    }

    public void sendBroadcastSync(@NonNull Intent intent) {
        if (sendBroadcast(intent)) {
            executePendingBroadcasts();
        }
    }

    public void unregisterReceiver(@NonNull BroadcastReceiver broadcastReceiver) {
        synchronized (this.mReceivers) {
            ArrayList arrayList = (ArrayList) this.mReceivers.remove(broadcastReceiver);
            if (arrayList != null) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    ReceiverRecord receiverRecord = (ReceiverRecord) arrayList.get(size);
                    receiverRecord.dead = true;
                    for (int i = 0; i < receiverRecord.filter.countActions(); i++) {
                        String action = receiverRecord.filter.getAction(i);
                        ArrayList arrayList2 = (ArrayList) this.mActions.get(action);
                        if (arrayList2 != null) {
                            for (int size2 = arrayList2.size() - 1; size2 >= 0; size2--) {
                                ReceiverRecord receiverRecord2 = (ReceiverRecord) arrayList2.get(size2);
                                if (receiverRecord2.receiver == broadcastReceiver) {
                                    receiverRecord2.dead = true;
                                    arrayList2.remove(size2);
                                }
                            }
                            if (arrayList2.size() <= 0) {
                                this.mActions.remove(action);
                            }
                        }
                    }
                }
            }
        }
    }
}
