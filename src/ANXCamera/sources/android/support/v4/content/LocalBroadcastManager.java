package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.ss.android.vesdk.VECameraSettings;
import com.xiaomi.camera.base.Constants.ShotType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class LocalBroadcastManager {
    private static final boolean DEBUG = false;
    static final int MSG_EXEC_PENDING_BROADCASTS = 1;
    private static final String TAG = "LocalBroadcastManager";
    private static LocalBroadcastManager mInstance;
    private static final Object mLock = new Object();
    private final HashMap<String, ArrayList<ReceiverRecord>> mActions = new HashMap<>();
    private final Context mAppContext;
    private final Handler mHandler;
    private final ArrayList<BroadcastRecord> mPendingBroadcasts = new ArrayList<>();
    private final HashMap<BroadcastReceiver, ArrayList<IntentFilter>> mReceivers = new HashMap<>();

    private static class BroadcastRecord {
        final Intent intent;
        final ArrayList<ReceiverRecord> receivers;

        BroadcastRecord(Intent intent2, ArrayList<ReceiverRecord> arrayList) {
            this.intent = intent2;
            this.receivers = arrayList;
        }
    }

    private static class ReceiverRecord {
        boolean broadcasting;
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
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001f, code lost:
        if (r2 >= r0.length) goto L_0x0043;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0021, code lost:
        r3 = r0[r2];
        r4 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002a, code lost:
        if (r4 >= r3.receivers.size()) goto L_0x0040;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x002c, code lost:
        ((android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r3.receivers.get(r4)).receiver.onReceive(r8.mAppContext, r3.intent);
        r4 = r4 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0040, code lost:
        r2 = r2 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001c, code lost:
        r2 = 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
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

    public static LocalBroadcastManager getInstance(Context context) {
        LocalBroadcastManager localBroadcastManager;
        synchronized (mLock) {
            if (mInstance == null) {
                mInstance = new LocalBroadcastManager(context.getApplicationContext());
            }
            localBroadcastManager = mInstance;
        }
        return localBroadcastManager;
    }

    public void registerReceiver(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter) {
        synchronized (this.mReceivers) {
            ReceiverRecord receiverRecord = new ReceiverRecord(intentFilter, broadcastReceiver);
            ArrayList arrayList = (ArrayList) this.mReceivers.get(broadcastReceiver);
            if (arrayList == null) {
                arrayList = new ArrayList(1);
                this.mReceivers.put(broadcastReceiver, arrayList);
            }
            arrayList.add(intentFilter);
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

    /* JADX WARNING: Code restructure failed: missing block: B:54:0x0167, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x016a, code lost:
        return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean sendBroadcast(Intent intent) {
        String str;
        int i;
        ArrayList arrayList;
        String str2;
        Intent intent2 = intent;
        synchronized (this.mReceivers) {
            String action = intent.getAction();
            String resolveTypeIfNeeded = intent2.resolveTypeIfNeeded(this.mAppContext.getContentResolver());
            Uri data = intent.getData();
            String scheme = intent.getScheme();
            Set categories = intent.getCategories();
            boolean z = (intent.getFlags() & 8) != 0;
            if (z) {
                String str3 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Resolving type ");
                sb.append(resolveTypeIfNeeded);
                sb.append(" scheme ");
                sb.append(scheme);
                sb.append(" of intent ");
                sb.append(intent2);
                Log.v(str3, sb.toString());
            }
            ArrayList arrayList2 = (ArrayList) this.mActions.get(intent.getAction());
            if (arrayList2 != null) {
                if (z) {
                    String str4 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Action list: ");
                    sb2.append(arrayList2);
                    Log.v(str4, sb2.toString());
                }
                ArrayList arrayList3 = null;
                int i2 = 0;
                while (true) {
                    int i3 = i2;
                    if (i3 < arrayList2.size()) {
                        ReceiverRecord receiverRecord = (ReceiverRecord) arrayList2.get(i3);
                        if (z) {
                            String str5 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Matching against filter ");
                            sb3.append(receiverRecord.filter);
                            Log.v(str5, sb3.toString());
                        }
                        if (receiverRecord.broadcasting) {
                            if (z) {
                                Log.v(TAG, "  Filter's target already added");
                            }
                            str = resolveTypeIfNeeded;
                            i = i3;
                            arrayList = arrayList3;
                        } else {
                            ReceiverRecord receiverRecord2 = receiverRecord;
                            i = i3;
                            str = resolveTypeIfNeeded;
                            arrayList = arrayList3;
                            int match = receiverRecord.filter.match(action, resolveTypeIfNeeded, scheme, data, categories, TAG);
                            if (match >= 0) {
                                if (z) {
                                    String str6 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("  Filter matched!  match=0x");
                                    sb4.append(Integer.toHexString(match));
                                    Log.v(str6, sb4.toString());
                                }
                                if (arrayList == null) {
                                    arrayList = new ArrayList();
                                }
                                arrayList.add(receiverRecord2);
                                receiverRecord2.broadcasting = true;
                                arrayList3 = arrayList;
                            } else if (z) {
                                switch (match) {
                                    case ShotType.MIMOJI_PREVIEW_SHOT /*-4*/:
                                        str2 = "category";
                                        break;
                                    case -3:
                                        str2 = VECameraSettings.SCENE_MODE_ACTION;
                                        break;
                                    case -2:
                                        str2 = "data";
                                        break;
                                    case -1:
                                        str2 = "type";
                                        break;
                                    default:
                                        str2 = "unknown reason";
                                        break;
                                }
                                String str7 = TAG;
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("  Filter did not match: ");
                                sb5.append(str2);
                                Log.v(str7, sb5.toString());
                                arrayList3 = arrayList;
                                String str8 = str2;
                            }
                            i2 = i + 1;
                            resolveTypeIfNeeded = str;
                        }
                        arrayList3 = arrayList;
                        i2 = i + 1;
                        resolveTypeIfNeeded = str;
                    } else {
                        String str9 = resolveTypeIfNeeded;
                        ArrayList arrayList4 = arrayList3;
                        if (arrayList4 != null) {
                            for (int i4 = 0; i4 < arrayList4.size(); i4++) {
                                ((ReceiverRecord) arrayList4.get(i4)).broadcasting = false;
                            }
                            this.mPendingBroadcasts.add(new BroadcastRecord(intent2, arrayList4));
                            if (!this.mHandler.hasMessages(1)) {
                                this.mHandler.sendEmptyMessage(1);
                            }
                        }
                    }
                }
            }
        }
    }

    public void sendBroadcastSync(Intent intent) {
        if (sendBroadcast(intent)) {
            executePendingBroadcasts();
        }
    }

    public void unregisterReceiver(BroadcastReceiver broadcastReceiver) {
        synchronized (this.mReceivers) {
            ArrayList arrayList = (ArrayList) this.mReceivers.remove(broadcastReceiver);
            if (arrayList != null) {
                for (int i = 0; i < arrayList.size(); i++) {
                    IntentFilter intentFilter = (IntentFilter) arrayList.get(i);
                    for (int i2 = 0; i2 < intentFilter.countActions(); i2++) {
                        String action = intentFilter.getAction(i2);
                        ArrayList arrayList2 = (ArrayList) this.mActions.get(action);
                        if (arrayList2 != null) {
                            int i3 = 0;
                            while (i3 < arrayList2.size()) {
                                if (((ReceiverRecord) arrayList2.get(i3)).receiver == broadcastReceiver) {
                                    arrayList2.remove(i3);
                                    i3--;
                                }
                                i3++;
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
