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

        BroadcastRecord(Intent _intent, ArrayList<ReceiverRecord> _receivers) {
            this.intent = _intent;
            this.receivers = _receivers;
        }
    }

    private static class ReceiverRecord {
        boolean broadcasting;
        final IntentFilter filter;
        final BroadcastReceiver receiver;

        ReceiverRecord(IntentFilter _filter, BroadcastReceiver _receiver) {
            this.filter = _filter;
            this.receiver = _receiver;
        }

        public String toString() {
            StringBuilder builder = new StringBuilder(128);
            builder.append("Receiver{");
            builder.append(this.receiver);
            builder.append(" filter=");
            builder.append(this.filter);
            builder.append("}");
            return builder.toString();
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

    private LocalBroadcastManager(Context context) {
        this.mAppContext = context;
        this.mHandler = new Handler(context.getMainLooper()) {
            public void handleMessage(Message msg) {
                if (msg.what != 1) {
                    super.handleMessage(msg);
                } else {
                    LocalBroadcastManager.this.executePendingBroadcasts();
                }
            }
        };
    }

    public void registerReceiver(BroadcastReceiver receiver, IntentFilter filter) {
        synchronized (this.mReceivers) {
            ReceiverRecord entry = new ReceiverRecord(filter, receiver);
            ArrayList arrayList = (ArrayList) this.mReceivers.get(receiver);
            if (arrayList == null) {
                arrayList = new ArrayList(1);
                this.mReceivers.put(receiver, arrayList);
            }
            arrayList.add(filter);
            for (int i = 0; i < filter.countActions(); i++) {
                String action = filter.getAction(i);
                ArrayList arrayList2 = (ArrayList) this.mActions.get(action);
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList(1);
                    this.mActions.put(action, arrayList2);
                }
                arrayList2.add(entry);
            }
        }
    }

    public void unregisterReceiver(BroadcastReceiver receiver) {
        synchronized (this.mReceivers) {
            ArrayList<IntentFilter> filters = (ArrayList) this.mReceivers.remove(receiver);
            if (filters != null) {
                for (int i = 0; i < filters.size(); i++) {
                    IntentFilter filter = (IntentFilter) filters.get(i);
                    for (int j = 0; j < filter.countActions(); j++) {
                        String action = filter.getAction(j);
                        ArrayList<ReceiverRecord> receivers = (ArrayList) this.mActions.get(action);
                        if (receivers != null) {
                            int k = 0;
                            while (k < receivers.size()) {
                                if (((ReceiverRecord) receivers.get(k)).receiver == receiver) {
                                    receivers.remove(k);
                                    k--;
                                }
                                k++;
                            }
                            if (receivers.size() <= 0) {
                                this.mActions.remove(action);
                            }
                        }
                    }
                }
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
        String type;
        int i;
        ArrayList arrayList;
        String reason;
        Intent intent2 = intent;
        synchronized (this.mReceivers) {
            String action = intent.getAction();
            String type2 = intent2.resolveTypeIfNeeded(this.mAppContext.getContentResolver());
            Uri data = intent.getData();
            String scheme = intent.getScheme();
            Set<String> categories = intent.getCategories();
            boolean debug = (intent.getFlags() & 8) != 0;
            if (debug) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Resolving type ");
                sb.append(type2);
                sb.append(" scheme ");
                sb.append(scheme);
                sb.append(" of intent ");
                sb.append(intent2);
                Log.v(str, sb.toString());
            }
            ArrayList arrayList2 = (ArrayList) this.mActions.get(intent.getAction());
            if (arrayList2 != null) {
                if (debug) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Action list: ");
                    sb2.append(arrayList2);
                    Log.v(str2, sb2.toString());
                }
                ArrayList arrayList3 = null;
                int i2 = 0;
                while (true) {
                    int i3 = i2;
                    if (i3 < arrayList2.size()) {
                        ReceiverRecord receiver = (ReceiverRecord) arrayList2.get(i3);
                        if (debug) {
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("Matching against filter ");
                            sb3.append(receiver.filter);
                            Log.v(str3, sb3.toString());
                        }
                        if (receiver.broadcasting) {
                            if (debug) {
                                Log.v(TAG, "  Filter's target already added");
                            }
                            type = type2;
                            i = i3;
                            arrayList = arrayList3;
                        } else {
                            ReceiverRecord receiver2 = receiver;
                            i = i3;
                            type = type2;
                            arrayList = arrayList3;
                            int match = receiver.filter.match(action, type2, scheme, data, categories, TAG);
                            if (match >= 0) {
                                if (debug) {
                                    String str4 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("  Filter matched!  match=0x");
                                    sb4.append(Integer.toHexString(match));
                                    Log.v(str4, sb4.toString());
                                }
                                if (arrayList == null) {
                                    arrayList = new ArrayList();
                                }
                                arrayList.add(receiver2);
                                receiver2.broadcasting = true;
                                arrayList3 = arrayList;
                            } else if (debug) {
                                switch (match) {
                                    case ShotType.MIMOJI_PREVIEW_SHOT /*-4*/:
                                        reason = "category";
                                        break;
                                    case -3:
                                        reason = VECameraSettings.SCENE_MODE_ACTION;
                                        break;
                                    case -2:
                                        reason = "data";
                                        break;
                                    case -1:
                                        reason = "type";
                                        break;
                                    default:
                                        reason = "unknown reason";
                                        break;
                                }
                                String str5 = TAG;
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("  Filter did not match: ");
                                sb5.append(reason);
                                Log.v(str5, sb5.toString());
                                arrayList3 = arrayList;
                                String str6 = reason;
                            }
                            i2 = i + 1;
                            type2 = type;
                        }
                        arrayList3 = arrayList;
                        i2 = i + 1;
                        type2 = type;
                    } else {
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
                int N = this.mPendingBroadcasts.size();
                if (N > 0) {
                    BroadcastRecord[] brs = new BroadcastRecord[N];
                    this.mPendingBroadcasts.toArray(brs);
                    this.mPendingBroadcasts.clear();
                } else {
                    return;
                }
            }
        }
        while (true) {
        }
    }
}
