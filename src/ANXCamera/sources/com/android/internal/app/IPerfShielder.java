package com.android.internal.app;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.os.statistics.E2EScenario;
import android.os.statistics.E2EScenarioPayload;
import android.os.statistics.E2EScenarioSettings;
import java.util.List;
import java.util.Map;

public interface IPerfShielder extends IInterface {

    public static abstract class Stub extends Binder implements IPerfShielder {
        private static final String DESCRIPTOR = "com.android.internal.app.IPerfShielder";
        static final int TRANSACTION_abortMatchingScenario = 30;
        static final int TRANSACTION_abortSpecificScenario = 31;
        static final int TRANSACTION_addActivityLaunchTime = 2;
        static final int TRANSACTION_addCallingPkgHookRule = 26;
        static final int TRANSACTION_addTimeConsumingIntent = 16;
        static final int TRANSACTION_beginScenario = 29;
        static final int TRANSACTION_clearTimeConsumingIntent = 18;
        static final int TRANSACTION_closeCheckPriority = 13;
        static final int TRANSACTION_deleteFilterInfo = 37;
        static final int TRANSACTION_deletePackageInfo = 23;
        static final int TRANSACTION_deleteRedirectRule = 21;
        static final int TRANSACTION_finishMatchingScenario = 32;
        static final int TRANSACTION_finishSpecificScenario = 33;
        static final int TRANSACTION_getAllRunningProcessMemInfos = 7;
        static final int TRANSACTION_getFreeMemory = 24;
        static final int TRANSACTION_getMemoryTrimLevel = 19;
        static final int TRANSACTION_getPackageNameByPid = 5;
        static final int TRANSACTION_getPerfEventSocketFd = 28;
        static final int TRANSACTION_insertFilterInfo = 36;
        static final int TRANSACTION_insertPackageInfo = 22;
        static final int TRANSACTION_insertRedirectRule = 20;
        static final int TRANSACTION_killUnusedApp = 4;
        static final int TRANSACTION_removeCallingPkgHookRule = 27;
        static final int TRANSACTION_removeServicePriority = 12;
        static final int TRANSACTION_removeTimeConsumingIntent = 17;
        static final int TRANSACTION_reportAnr = 25;
        static final int TRANSACTION_reportExcessiveCpuUsageRecords = 34;
        static final int TRANSACTION_reportNotificationClick = 35;
        static final int TRANSACTION_reportPerceptibleJank = 1;
        static final int TRANSACTION_resolveQuickAppInfos = 38;
        static final int TRANSACTION_setForkedProcessGroup = 6;
        static final int TRANSACTION_setHapLinks = 39;
        static final int TRANSACTION_setMiuiBroadcastDispatchEnable = 15;
        static final int TRANSACTION_setMiuiContentProviderControl = 14;
        static final int TRANSACTION_setSchedFgPid = 3;
        static final int TRANSACTION_setServicePriority = 10;
        static final int TRANSACTION_setServicePriorityWithNoProc = 11;
        static final int TRANSACTION_updateProcessFullMemInfoByPids = 8;
        static final int TRANSACTION_updateProcessPartialMemInfoByPids = 9;

        private static class Proxy implements IPerfShielder {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public void reportPerceptibleJank(int callingPid, int renderThreadTid, String windowName, long totalDuration, long maxFrameDuration, long endTs, int selfCause, long num_frames) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(callingPid);
                    try {
                        _data.writeInt(renderThreadTid);
                        try {
                            _data.writeString(windowName);
                            try {
                                _data.writeLong(totalDuration);
                            } catch (Throwable th) {
                                th = th;
                                long j = maxFrameDuration;
                                long j2 = endTs;
                                int i = selfCause;
                                long j3 = num_frames;
                                _data.recycle();
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            long j4 = totalDuration;
                            long j5 = maxFrameDuration;
                            long j22 = endTs;
                            int i2 = selfCause;
                            long j32 = num_frames;
                            _data.recycle();
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        String str = windowName;
                        long j42 = totalDuration;
                        long j52 = maxFrameDuration;
                        long j222 = endTs;
                        int i22 = selfCause;
                        long j322 = num_frames;
                        _data.recycle();
                        throw th;
                    }
                    try {
                        _data.writeLong(maxFrameDuration);
                        try {
                            _data.writeLong(endTs);
                            try {
                                _data.writeInt(selfCause);
                                try {
                                    _data.writeLong(num_frames);
                                } catch (Throwable th4) {
                                    th = th4;
                                    _data.recycle();
                                    throw th;
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                long j3222 = num_frames;
                                _data.recycle();
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            int i222 = selfCause;
                            long j32222 = num_frames;
                            _data.recycle();
                            throw th;
                        }
                        try {
                            this.mRemote.transact(1, _data, null, 1);
                            _data.recycle();
                        } catch (Throwable th7) {
                            th = th7;
                            _data.recycle();
                            throw th;
                        }
                    } catch (Throwable th8) {
                        th = th8;
                        long j2222 = endTs;
                        int i2222 = selfCause;
                        long j322222 = num_frames;
                        _data.recycle();
                        throw th;
                    }
                } catch (Throwable th9) {
                    th = th9;
                    int i3 = renderThreadTid;
                    String str2 = windowName;
                    long j422 = totalDuration;
                    long j522 = maxFrameDuration;
                    long j22222 = endTs;
                    int i22222 = selfCause;
                    long j3222222 = num_frames;
                    _data.recycle();
                    throw th;
                }
            }

            public void addActivityLaunchTime(String packageName, String activityName, long launchStartTime, long launchEndTime, boolean fromHome, boolean isColdStart) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(packageName);
                    _data.writeString(activityName);
                    _data.writeLong(launchStartTime);
                    _data.writeLong(launchEndTime);
                    _data.writeInt(fromHome);
                    _data.writeInt(isColdStart);
                    this.mRemote.transact(2, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void setSchedFgPid(int pid) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(pid);
                    this.mRemote.transact(3, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void killUnusedApp(int uid, int pid) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(uid);
                    _data.writeInt(pid);
                    this.mRemote.transact(4, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public String getPackageNameByPid(int pid) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(pid);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    return _reply.readString();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void setForkedProcessGroup(int puid, int ppid, int group, String processName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(puid);
                    _data.writeInt(ppid);
                    _data.writeInt(group);
                    _data.writeString(processName);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public List<Bundle> getAllRunningProcessMemInfos() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    return _reply.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public List<Bundle> updateProcessFullMemInfoByPids(int[] pids) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeIntArray(pids);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    return _reply.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public List<Bundle> updateProcessPartialMemInfoByPids(int[] pids) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeIntArray(pids);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    return _reply.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void setServicePriority(List<MiuiServicePriority> servicePrioritys) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeTypedList(servicePrioritys);
                    this.mRemote.transact(10, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void setServicePriorityWithNoProc(List<MiuiServicePriority> servicePrioritys, long noProcDelayTime) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeTypedList(servicePrioritys);
                    _data.writeLong(noProcDelayTime);
                    this.mRemote.transact(11, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void removeServicePriority(MiuiServicePriority servicePriority, boolean inBlacklist) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (servicePriority != null) {
                        _data.writeInt(1);
                        servicePriority.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(inBlacklist);
                    this.mRemote.transact(12, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void closeCheckPriority() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(13, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void setMiuiContentProviderControl(boolean enable) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(enable);
                    this.mRemote.transact(14, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void setMiuiBroadcastDispatchEnable(boolean enable) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(enable);
                    this.mRemote.transact(15, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void addTimeConsumingIntent(String[] actions) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStringArray(actions);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void removeTimeConsumingIntent(String[] actions) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeStringArray(actions);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void clearTimeConsumingIntent() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(18, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public int getMemoryTrimLevel() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, _data, _reply, 0);
                    _reply.readException();
                    return _reply.readInt();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean insertRedirectRule(String callingPkg, String destPkg, String redirectPkgname, Bundle clsNameMap) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingPkg);
                    _data.writeString(destPkg);
                    _data.writeString(redirectPkgname);
                    boolean _result = true;
                    if (clsNameMap != null) {
                        _data.writeInt(1);
                        clsNameMap.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(20, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() == 0) {
                        _result = false;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean deleteRedirectRule(String callingPkg, String destPkg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(callingPkg);
                    _data.writeString(destPkg);
                    boolean z = false;
                    this.mRemote.transact(21, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean insertPackageInfo(PackageInfo pInfo) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    boolean _result = true;
                    if (pInfo != null) {
                        _data.writeInt(1);
                        pInfo.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(22, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() == 0) {
                        _result = false;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean deletePackageInfo(String pkgName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(pkgName);
                    boolean z = false;
                    this.mRemote.transact(23, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public long getFreeMemory() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(24, _data, _reply, 0);
                    _reply.readException();
                    return _reply.readLong();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void reportAnr(int callingPid, String windowName, long totalDuration, long endTs, String cpuInfo) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(callingPid);
                    _data.writeString(windowName);
                    _data.writeLong(totalDuration);
                    _data.writeLong(endTs);
                    _data.writeString(cpuInfo);
                    this.mRemote.transact(25, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public boolean addCallingPkgHookRule(String hostApp, String originCallingPkg, String hookCallingPkg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(hostApp);
                    _data.writeString(originCallingPkg);
                    _data.writeString(hookCallingPkg);
                    boolean z = false;
                    this.mRemote.transact(26, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean removeCallingPkgHookRule(String hostApp, String originCallingPkg) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(hostApp);
                    _data.writeString(originCallingPkg);
                    boolean z = false;
                    this.mRemote.transact(27, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public ParcelFileDescriptor getPerfEventSocketFd() throws RemoteException {
                ParcelFileDescriptor _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(28, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag, E2EScenarioPayload payload, int tid, long uptimeMillis, boolean needResultBundle) throws RemoteException {
                Bundle _result;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (scenario != null) {
                        _data.writeInt(1);
                        scenario.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    if (settings != null) {
                        _data.writeInt(1);
                        settings.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeString(tag);
                    if (payload != null) {
                        _data.writeInt(1);
                        payload.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(tid);
                    _data.writeLong(uptimeMillis);
                    _data.writeInt(needResultBundle);
                    this.mRemote.transact(29, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = (Bundle) Bundle.CREATOR.createFromParcel(_reply);
                    } else {
                        _result = null;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void abortMatchingScenario(E2EScenario scenario, String tag, int tid, long uptimeMillis) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (scenario != null) {
                        _data.writeInt(1);
                        scenario.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeString(tag);
                    _data.writeInt(tid);
                    _data.writeLong(uptimeMillis);
                    this.mRemote.transact(30, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void abortSpecificScenario(Bundle scenarioBundle, int tid, long uptimeMillis) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (scenarioBundle != null) {
                        _data.writeInt(1);
                        scenarioBundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(tid);
                    _data.writeLong(uptimeMillis);
                    this.mRemote.transact(31, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void finishMatchingScenario(E2EScenario scenario, String tag, E2EScenarioPayload payload, int tid, long uptimeMillis) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (scenario != null) {
                        _data.writeInt(1);
                        scenario.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeString(tag);
                    if (payload != null) {
                        _data.writeInt(1);
                        payload.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(tid);
                    _data.writeLong(uptimeMillis);
                    this.mRemote.transact(32, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void finishSpecificScenario(Bundle scenarioBundle, E2EScenarioPayload payload, int tid, long uptimeMillis) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (scenarioBundle != null) {
                        _data.writeInt(1);
                        scenarioBundle.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    if (payload != null) {
                        _data.writeInt(1);
                        payload.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeInt(tid);
                    _data.writeLong(uptimeMillis);
                    this.mRemote.transact(33, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void reportExcessiveCpuUsageRecords(List<Bundle> records) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeTypedList(records);
                    this.mRemote.transact(34, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void reportNotificationClick(String postPackage, Intent intent, long uptimeMillis) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(postPackage);
                    if (intent != null) {
                        _data.writeInt(1);
                        intent.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeLong(uptimeMillis);
                    this.mRemote.transact(35, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public boolean insertFilterInfo(String packageName, String name, Uri iconUri, List<Bundle> filterInfos) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(packageName);
                    _data.writeString(name);
                    boolean _result = true;
                    if (iconUri != null) {
                        _data.writeInt(1);
                        iconUri.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    _data.writeTypedList(filterInfos);
                    this.mRemote.transact(36, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() == 0) {
                        _result = false;
                    }
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean deleteFilterInfo(String packageName) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(packageName);
                    boolean z = false;
                    this.mRemote.transact(37, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public List<QuickAppResolveInfo> resolveQuickAppInfos(Intent targetIntent) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (targetIntent != null) {
                        _data.writeInt(1);
                        targetIntent.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(38, _data, _reply, 0);
                    _reply.readException();
                    return _reply.createTypedArrayList(QuickAppResolveInfo.CREATOR);
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void setHapLinks(Map data, ActivityInfo activityInfo) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeMap(data);
                    if (activityInfo != null) {
                        _data.writeInt(1);
                        activityInfo.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(39, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPerfShielder asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin == null || !(iin instanceof IPerfShielder)) {
                return new Proxy(obj);
            }
            return (IPerfShielder) iin;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            MiuiServicePriority _arg0;
            boolean z;
            MiuiServicePriority _arg02;
            MiuiServicePriority _arg03;
            E2EScenario _arg04;
            E2EScenarioSettings _arg1;
            MiuiServicePriority _arg05;
            MiuiServicePriority _arg06;
            MiuiServicePriority _arg07;
            E2EScenario _arg08;
            MiuiServicePriority _arg09;
            Bundle _arg010;
            MiuiServicePriority _arg011;
            MiuiServicePriority _arg012;
            MiuiServicePriority _arg013;
            int i = code;
            Parcel parcel = data;
            Parcel parcel2 = reply;
            String descriptor = DESCRIPTOR;
            if (i != 1598968902) {
                boolean z2 = false;
                MiuiServicePriority _arg014 = null;
                switch (i) {
                    case 1:
                        parcel.enforceInterface(descriptor);
                        Parcel parcel3 = parcel2;
                        String str = descriptor;
                        reportPerceptibleJank(data.readInt(), data.readInt(), data.readString(), data.readLong(), data.readLong(), data.readLong(), data.readInt(), data.readLong());
                        return true;
                    case 2:
                        parcel.enforceInterface(descriptor);
                        addActivityLaunchTime(data.readString(), data.readString(), data.readLong(), data.readLong(), data.readInt() != 0, data.readInt() != 0);
                        return true;
                    case 3:
                        parcel.enforceInterface(descriptor);
                        setSchedFgPid(data.readInt());
                        return true;
                    case 4:
                        parcel.enforceInterface(descriptor);
                        killUnusedApp(data.readInt(), data.readInt());
                        return true;
                    case 5:
                        parcel.enforceInterface(descriptor);
                        String _result = getPackageNameByPid(data.readInt());
                        reply.writeNoException();
                        parcel2.writeString(_result);
                        return true;
                    case 6:
                        parcel.enforceInterface(descriptor);
                        setForkedProcessGroup(data.readInt(), data.readInt(), data.readInt(), data.readString());
                        reply.writeNoException();
                        return true;
                    case 7:
                        parcel.enforceInterface(descriptor);
                        List<Bundle> _result2 = getAllRunningProcessMemInfos();
                        reply.writeNoException();
                        parcel2.writeTypedList(_result2);
                        return true;
                    case 8:
                        parcel.enforceInterface(descriptor);
                        List<Bundle> _result3 = updateProcessFullMemInfoByPids(data.createIntArray());
                        reply.writeNoException();
                        parcel2.writeTypedList(_result3);
                        return true;
                    case 9:
                        parcel.enforceInterface(descriptor);
                        List<Bundle> _result4 = updateProcessPartialMemInfoByPids(data.createIntArray());
                        reply.writeNoException();
                        parcel2.writeTypedList(_result4);
                        return true;
                    case 10:
                        parcel.enforceInterface(descriptor);
                        setServicePriority(parcel.createTypedArrayList(MiuiServicePriority.CREATOR));
                        return true;
                    case 11:
                        parcel.enforceInterface(descriptor);
                        setServicePriorityWithNoProc(parcel.createTypedArrayList(MiuiServicePriority.CREATOR), data.readLong());
                        return true;
                    case 12:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg0 = (MiuiServicePriority) MiuiServicePriority.CREATOR.createFromParcel(parcel);
                        }
                        if (data.readInt() != 0) {
                            z = true;
                        }
                        removeServicePriority(_arg0, z);
                        return true;
                    case 13:
                        parcel.enforceInterface(descriptor);
                        closeCheckPriority();
                        reply.writeNoException();
                        return true;
                    case 14:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            z2 = true;
                        }
                        setMiuiContentProviderControl(z2);
                        return true;
                    case 15:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            z2 = true;
                        }
                        setMiuiBroadcastDispatchEnable(z2);
                        return true;
                    case 16:
                        parcel.enforceInterface(descriptor);
                        addTimeConsumingIntent(data.createStringArray());
                        reply.writeNoException();
                        return true;
                    case 17:
                        parcel.enforceInterface(descriptor);
                        removeTimeConsumingIntent(data.createStringArray());
                        reply.writeNoException();
                        return true;
                    case 18:
                        parcel.enforceInterface(descriptor);
                        clearTimeConsumingIntent();
                        reply.writeNoException();
                        return true;
                    case 19:
                        parcel.enforceInterface(descriptor);
                        int _result5 = getMemoryTrimLevel();
                        reply.writeNoException();
                        parcel2.writeInt(_result5);
                        return true;
                    case 20:
                        parcel.enforceInterface(descriptor);
                        String _arg015 = data.readString();
                        String _arg12 = data.readString();
                        String _arg2 = data.readString();
                        if (data.readInt() != 0) {
                            _arg02 = (Bundle) Bundle.CREATOR.createFromParcel(parcel);
                        }
                        boolean _result6 = insertRedirectRule(_arg015, _arg12, _arg2, _arg02);
                        reply.writeNoException();
                        parcel2.writeInt(_result6);
                        return true;
                    case 21:
                        parcel.enforceInterface(descriptor);
                        boolean _result7 = deleteRedirectRule(data.readString(), data.readString());
                        reply.writeNoException();
                        parcel2.writeInt(_result7);
                        return true;
                    case 22:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg03 = (PackageInfo) PackageInfo.CREATOR.createFromParcel(parcel);
                        }
                        boolean _result8 = insertPackageInfo(_arg03);
                        reply.writeNoException();
                        parcel2.writeInt(_result8);
                        return true;
                    case 23:
                        parcel.enforceInterface(descriptor);
                        boolean _result9 = deletePackageInfo(data.readString());
                        reply.writeNoException();
                        parcel2.writeInt(_result9);
                        return true;
                    case 24:
                        parcel.enforceInterface(descriptor);
                        long _result10 = getFreeMemory();
                        reply.writeNoException();
                        parcel2.writeLong(_result10);
                        return true;
                    case 25:
                        parcel.enforceInterface(descriptor);
                        reportAnr(data.readInt(), data.readString(), data.readLong(), data.readLong(), data.readString());
                        return true;
                    case 26:
                        parcel.enforceInterface(descriptor);
                        boolean _result11 = addCallingPkgHookRule(data.readString(), data.readString(), data.readString());
                        reply.writeNoException();
                        parcel2.writeInt(_result11);
                        return true;
                    case 27:
                        parcel.enforceInterface(descriptor);
                        boolean _result12 = removeCallingPkgHookRule(data.readString(), data.readString());
                        reply.writeNoException();
                        parcel2.writeInt(_result12);
                        return true;
                    case 28:
                        parcel.enforceInterface(descriptor);
                        ParcelFileDescriptor _result13 = getPerfEventSocketFd();
                        reply.writeNoException();
                        if (_result13 != null) {
                            parcel2.writeInt(1);
                            _result13.writeToParcel(parcel2, 1);
                        } else {
                            parcel2.writeInt(0);
                        }
                        return true;
                    case 29:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg04 = (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel);
                        } else {
                            _arg04 = null;
                        }
                        if (data.readInt() != 0) {
                            _arg1 = (E2EScenarioSettings) E2EScenarioSettings.CREATOR.createFromParcel(parcel);
                        } else {
                            _arg1 = null;
                        }
                        String _arg22 = data.readString();
                        if (data.readInt() != 0) {
                            _arg05 = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel);
                        }
                        Bundle _result14 = beginScenario(_arg04, _arg1, _arg22, _arg05, data.readInt(), data.readLong(), data.readInt() != 0);
                        reply.writeNoException();
                        if (_result14 != null) {
                            parcel2.writeInt(1);
                            _result14.writeToParcel(parcel2, 1);
                        } else {
                            parcel2.writeInt(0);
                        }
                        return true;
                    case 30:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg06 = (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel);
                        }
                        abortMatchingScenario(_arg06, data.readString(), data.readInt(), data.readLong());
                        reply.writeNoException();
                        return true;
                    case 31:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg07 = (Bundle) Bundle.CREATOR.createFromParcel(parcel);
                        }
                        abortSpecificScenario(_arg07, data.readInt(), data.readLong());
                        reply.writeNoException();
                        return true;
                    case 32:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg08 = (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel);
                        } else {
                            _arg08 = null;
                        }
                        String _arg13 = data.readString();
                        if (data.readInt() != 0) {
                            _arg09 = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel);
                        }
                        finishMatchingScenario(_arg08, _arg13, _arg09, data.readInt(), data.readLong());
                        reply.writeNoException();
                        return true;
                    case 33:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg010 = (Bundle) Bundle.CREATOR.createFromParcel(parcel);
                        } else {
                            _arg010 = null;
                        }
                        if (data.readInt() != 0) {
                            _arg011 = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel);
                        }
                        finishSpecificScenario(_arg010, _arg011, data.readInt(), data.readLong());
                        reply.writeNoException();
                        return true;
                    case 34:
                        parcel.enforceInterface(descriptor);
                        reportExcessiveCpuUsageRecords(parcel.createTypedArrayList(Bundle.CREATOR));
                        return true;
                    case 35:
                        parcel.enforceInterface(descriptor);
                        String _arg016 = data.readString();
                        if (data.readInt() != 0) {
                            _arg012 = (Intent) Intent.CREATOR.createFromParcel(parcel);
                        }
                        reportNotificationClick(_arg016, _arg012, data.readLong());
                        return true;
                    case 36:
                        parcel.enforceInterface(descriptor);
                        String _arg017 = data.readString();
                        String _arg14 = data.readString();
                        if (data.readInt() != 0) {
                            _arg013 = (Uri) Uri.CREATOR.createFromParcel(parcel);
                        }
                        boolean _result15 = insertFilterInfo(_arg017, _arg14, _arg013, parcel.createTypedArrayList(Bundle.CREATOR));
                        reply.writeNoException();
                        parcel2.writeInt(_result15);
                        return true;
                    case 37:
                        parcel.enforceInterface(descriptor);
                        boolean _result16 = deleteFilterInfo(data.readString());
                        reply.writeNoException();
                        parcel2.writeInt(_result16);
                        return true;
                    case 38:
                        parcel.enforceInterface(descriptor);
                        if (data.readInt() != 0) {
                            _arg014 = (Intent) Intent.CREATOR.createFromParcel(parcel);
                        }
                        List<QuickAppResolveInfo> _result17 = resolveQuickAppInfos(_arg014);
                        reply.writeNoException();
                        parcel2.writeTypedList(_result17);
                        return true;
                    case 39:
                        parcel.enforceInterface(descriptor);
                        Map _arg018 = parcel.readHashMap(getClass().getClassLoader());
                        if (data.readInt() != 0) {
                            _arg014 = (ActivityInfo) ActivityInfo.CREATOR.createFromParcel(parcel);
                        }
                        setHapLinks(_arg018, _arg014);
                        return true;
                    default:
                        return super.onTransact(code, data, reply, flags);
                }
            } else {
                parcel2.writeString(descriptor);
                return true;
            }
        }
    }

    void abortMatchingScenario(E2EScenario e2EScenario, String str, int i, long j) throws RemoteException;

    void abortSpecificScenario(Bundle bundle, int i, long j) throws RemoteException;

    void addActivityLaunchTime(String str, String str2, long j, long j2, boolean z, boolean z2) throws RemoteException;

    boolean addCallingPkgHookRule(String str, String str2, String str3) throws RemoteException;

    void addTimeConsumingIntent(String[] strArr) throws RemoteException;

    Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str, E2EScenarioPayload e2EScenarioPayload, int i, long j, boolean z) throws RemoteException;

    void clearTimeConsumingIntent() throws RemoteException;

    void closeCheckPriority() throws RemoteException;

    boolean deleteFilterInfo(String str) throws RemoteException;

    boolean deletePackageInfo(String str) throws RemoteException;

    boolean deleteRedirectRule(String str, String str2) throws RemoteException;

    void finishMatchingScenario(E2EScenario e2EScenario, String str, E2EScenarioPayload e2EScenarioPayload, int i, long j) throws RemoteException;

    void finishSpecificScenario(Bundle bundle, E2EScenarioPayload e2EScenarioPayload, int i, long j) throws RemoteException;

    List<Bundle> getAllRunningProcessMemInfos() throws RemoteException;

    long getFreeMemory() throws RemoteException;

    int getMemoryTrimLevel() throws RemoteException;

    String getPackageNameByPid(int i) throws RemoteException;

    ParcelFileDescriptor getPerfEventSocketFd() throws RemoteException;

    boolean insertFilterInfo(String str, String str2, Uri uri, List<Bundle> list) throws RemoteException;

    boolean insertPackageInfo(PackageInfo packageInfo) throws RemoteException;

    boolean insertRedirectRule(String str, String str2, String str3, Bundle bundle) throws RemoteException;

    void killUnusedApp(int i, int i2) throws RemoteException;

    boolean removeCallingPkgHookRule(String str, String str2) throws RemoteException;

    void removeServicePriority(MiuiServicePriority miuiServicePriority, boolean z) throws RemoteException;

    void removeTimeConsumingIntent(String[] strArr) throws RemoteException;

    void reportAnr(int i, String str, long j, long j2, String str2) throws RemoteException;

    void reportExcessiveCpuUsageRecords(List<Bundle> list) throws RemoteException;

    void reportNotificationClick(String str, Intent intent, long j) throws RemoteException;

    void reportPerceptibleJank(int i, int i2, String str, long j, long j2, long j3, int i3, long j4) throws RemoteException;

    List<QuickAppResolveInfo> resolveQuickAppInfos(Intent intent) throws RemoteException;

    void setForkedProcessGroup(int i, int i2, int i3, String str) throws RemoteException;

    void setHapLinks(Map map, ActivityInfo activityInfo) throws RemoteException;

    void setMiuiBroadcastDispatchEnable(boolean z) throws RemoteException;

    void setMiuiContentProviderControl(boolean z) throws RemoteException;

    void setSchedFgPid(int i) throws RemoteException;

    void setServicePriority(List<MiuiServicePriority> list) throws RemoteException;

    void setServicePriorityWithNoProc(List<MiuiServicePriority> list, long j) throws RemoteException;

    List<Bundle> updateProcessFullMemInfoByPids(int[] iArr) throws RemoteException;

    List<Bundle> updateProcessPartialMemInfoByPids(int[] iArr) throws RemoteException;
}
