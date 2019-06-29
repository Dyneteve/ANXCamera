package com.ss.android.ugc.effectmanager.link.model.blackRoom;

import com.ss.android.ugc.effectmanager.common.utils.LogUtils;

public class BlackRoom {
    private static final String TAG = "BlackRoom";

    private long getLockedTime(int i) {
        if (i > 5) {
            i = 5;
        }
        if (i == 1) {
            return 60000;
        }
        return ((long) Math.pow(2.0d, (double) (i - 1))) * 60000;
    }

    public boolean checkHostAvailable(BlackRoomItem blackRoomItem) {
        if (blackRoomItem == null) {
            return false;
        }
        if (!blackRoomItem.isInBlackRoom()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append(blackRoomItem.getItemName());
            sb.append(" is available");
            LogUtils.d(str, sb.toString());
            return true;
        }
        long currentTimeMillis = System.currentTimeMillis() - blackRoomItem.startLockTime();
        if (currentTimeMillis >= getLockedTime(blackRoomItem.getLockedCount())) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("unlock ");
            sb2.append(blackRoomItem.getItemName());
            sb2.append(", locked count = ");
            sb2.append(blackRoomItem.getLockedCount());
            sb2.append(", should lock ");
            sb2.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
            sb2.append(" min, already locked ");
            sb2.append(currentTimeMillis / 60000);
            sb2.append(" min");
            LogUtils.d(str2, sb2.toString());
            blackRoomItem.unlockFromBlackRoom();
            return true;
        }
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append(blackRoomItem.getItemName());
        sb3.append(" is locked, locked count = ");
        sb3.append(blackRoomItem.getLockedCount());
        sb3.append(", should lock ");
        sb3.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
        sb3.append(" min, already locked ");
        sb3.append(currentTimeMillis / 60000);
        sb3.append(" min");
        LogUtils.e(str3, sb3.toString());
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:9:0x004b, code lost:
        return;
     */
    public synchronized void lock(BlackRoomItem blackRoomItem) {
        if (blackRoomItem != null) {
            if (blackRoomItem.lockToBlackRoom()) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("lock ");
                sb.append(blackRoomItem.getItemName());
                sb.append(" ");
                sb.append(blackRoomItem.getLockedCount());
                sb.append(" time for ");
                sb.append(getLockedTime(blackRoomItem.getLockedCount()) / 60000);
                sb.append(" min");
                LogUtils.e(str, sb.toString());
            }
        }
    }
}
