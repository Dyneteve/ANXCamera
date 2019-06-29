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
import java.util.HashMap;
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

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public void abortMatchingScenario(E2EScenario e2EScenario, String str, int i, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (e2EScenario != null) {
                        obtain.writeInt(1);
                        e2EScenario.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.mRemote.transact(30, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void abortSpecificScenario(Bundle bundle, int i, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.mRemote.transact(31, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void addActivityLaunchTime(String str, String str2, long j, long j2, boolean z, boolean z2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeInt(z ? 1 : 0);
                    obtain.writeInt(z2 ? 1 : 0);
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public boolean addCallingPkgHookRule(String str, String str2, String str3) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeString(str3);
                    boolean z = false;
                    this.mRemote.transact(26, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void addTimeConsumingIntent(String[] strArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeStringArray(strArr);
                    this.mRemote.transact(16, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str, E2EScenarioPayload e2EScenarioPayload, int i, long j, boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (e2EScenario != null) {
                        obtain.writeInt(1);
                        e2EScenario.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (e2EScenarioSettings != null) {
                        obtain.writeInt(1);
                        e2EScenarioSettings.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (e2EScenarioPayload != null) {
                        obtain.writeInt(1);
                        e2EScenarioPayload.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    obtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(29, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void clearTimeConsumingIntent() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(18, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void closeCheckPriority() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(13, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean deleteFilterInfo(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    boolean z = false;
                    this.mRemote.transact(37, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean deletePackageInfo(String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    boolean z = false;
                    this.mRemote.transact(23, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean deleteRedirectRule(String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    boolean z = false;
                    this.mRemote.transact(21, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void finishMatchingScenario(E2EScenario e2EScenario, String str, E2EScenarioPayload e2EScenarioPayload, int i, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (e2EScenario != null) {
                        obtain.writeInt(1);
                        e2EScenario.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (e2EScenarioPayload != null) {
                        obtain.writeInt(1);
                        e2EScenarioPayload.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.mRemote.transact(32, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void finishSpecificScenario(Bundle bundle, E2EScenarioPayload e2EScenarioPayload, int i, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (e2EScenarioPayload != null) {
                        obtain.writeInt(1);
                        e2EScenarioPayload.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.mRemote.transact(33, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public List<Bundle> getAllRunningProcessMemInfos() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(7, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public long getFreeMemory() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(24, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readLong();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public int getMemoryTrimLevel() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(19, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public String getPackageNameByPid(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readString();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public ParcelFileDescriptor getPerfEventSocketFd() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(28, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt() != 0 ? (ParcelFileDescriptor) ParcelFileDescriptor.CREATOR.createFromParcel(obtain2) : null;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean insertFilterInfo(String str, String str2, Uri uri, List<Bundle> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    boolean z = true;
                    if (uri != null) {
                        obtain.writeInt(1);
                        uri.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeTypedList(list);
                    this.mRemote.transact(36, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() == 0) {
                        z = false;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean insertPackageInfo(PackageInfo packageInfo) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    boolean z = true;
                    if (packageInfo != null) {
                        obtain.writeInt(1);
                        packageInfo.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(22, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() == 0) {
                        z = false;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean insertRedirectRule(String str, String str2, String str3, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    obtain.writeString(str3);
                    boolean z = true;
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(20, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() == 0) {
                        z = false;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void killUnusedApp(int i, int i2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    this.mRemote.transact(4, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public boolean removeCallingPkgHookRule(String str, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeString(str2);
                    boolean z = false;
                    this.mRemote.transact(27, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void removeServicePriority(MiuiServicePriority miuiServicePriority, boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (miuiServicePriority != null) {
                        obtain.writeInt(1);
                        miuiServicePriority.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(12, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void removeTimeConsumingIntent(String[] strArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeStringArray(strArr);
                    this.mRemote.transact(17, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void reportAnr(int i, String str, long j, long j2, String str2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeString(str);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeString(str2);
                    this.mRemote.transact(25, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void reportExcessiveCpuUsageRecords(List<Bundle> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(34, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void reportNotificationClick(String str, Intent intent, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    if (intent != null) {
                        obtain.writeInt(1);
                        intent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeLong(j);
                    this.mRemote.transact(35, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void reportPerceptibleJank(int i, int i2, String str, long j, long j2, long j3, int i3, long j4) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    try {
                        obtain.writeInt(i2);
                        try {
                            obtain.writeString(str);
                            try {
                                obtain.writeLong(j);
                            } catch (Throwable th) {
                                th = th;
                                long j5 = j2;
                                long j6 = j3;
                                int i4 = i3;
                                long j7 = j4;
                                obtain.recycle();
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            long j8 = j;
                            long j52 = j2;
                            long j62 = j3;
                            int i42 = i3;
                            long j72 = j4;
                            obtain.recycle();
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        String str2 = str;
                        long j82 = j;
                        long j522 = j2;
                        long j622 = j3;
                        int i422 = i3;
                        long j722 = j4;
                        obtain.recycle();
                        throw th;
                    }
                    try {
                        obtain.writeLong(j2);
                        try {
                            obtain.writeLong(j3);
                            try {
                                obtain.writeInt(i3);
                                try {
                                    obtain.writeLong(j4);
                                } catch (Throwable th4) {
                                    th = th4;
                                    obtain.recycle();
                                    throw th;
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                long j7222 = j4;
                                obtain.recycle();
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            int i4222 = i3;
                            long j72222 = j4;
                            obtain.recycle();
                            throw th;
                        }
                        try {
                            this.mRemote.transact(1, obtain, null, 1);
                            obtain.recycle();
                        } catch (Throwable th7) {
                            th = th7;
                            obtain.recycle();
                            throw th;
                        }
                    } catch (Throwable th8) {
                        th = th8;
                        long j6222 = j3;
                        int i42222 = i3;
                        long j722222 = j4;
                        obtain.recycle();
                        throw th;
                    }
                } catch (Throwable th9) {
                    th = th9;
                    int i5 = i2;
                    String str22 = str;
                    long j822 = j;
                    long j5222 = j2;
                    long j62222 = j3;
                    int i422222 = i3;
                    long j7222222 = j4;
                    obtain.recycle();
                    throw th;
                }
            }

            public List<QuickAppResolveInfo> resolveQuickAppInfos(Intent intent) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (intent != null) {
                        obtain.writeInt(1);
                        intent.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(38, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(QuickAppResolveInfo.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void setForkedProcessGroup(int i, int i2, int i3, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    obtain.writeString(str);
                    this.mRemote.transact(6, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void setHapLinks(Map map, ActivityInfo activityInfo) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeMap(map);
                    if (activityInfo != null) {
                        obtain.writeInt(1);
                        activityInfo.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(39, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void setMiuiBroadcastDispatchEnable(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(15, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void setMiuiContentProviderControl(boolean z) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(z ? 1 : 0);
                    this.mRemote.transact(14, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void setSchedFgPid(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(3, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void setServicePriority(List<MiuiServicePriority> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(10, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void setServicePriorityWithNoProc(List<MiuiServicePriority> list, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    obtain.writeLong(j);
                    this.mRemote.transact(11, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public List<Bundle> updateProcessFullMemInfoByPids(int[] iArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeIntArray(iArr);
                    this.mRemote.transact(8, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public List<Bundle> updateProcessPartialMemInfoByPids(int[] iArr) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeIntArray(iArr);
                    this.mRemote.transact(9, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.createTypedArrayList(Bundle.CREATOR);
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPerfShielder asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface == null || !(queryLocalInterface instanceof IPerfShielder)) ? new Proxy(iBinder) : (IPerfShielder) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            int i3 = i;
            Parcel parcel3 = parcel;
            Parcel parcel4 = parcel2;
            String str = DESCRIPTOR;
            if (i3 != 1598968902) {
                boolean z = false;
                MiuiServicePriority miuiServicePriority = null;
                switch (i3) {
                    case 1:
                        parcel3.enforceInterface(str);
                        Parcel parcel5 = parcel4;
                        String str2 = str;
                        reportPerceptibleJank(parcel.readInt(), parcel.readInt(), parcel.readString(), parcel.readLong(), parcel.readLong(), parcel.readLong(), parcel.readInt(), parcel.readLong());
                        return true;
                    case 2:
                        parcel3.enforceInterface(str);
                        addActivityLaunchTime(parcel.readString(), parcel.readString(), parcel.readLong(), parcel.readLong(), parcel.readInt() != 0, parcel.readInt() != 0);
                        return true;
                    case 3:
                        parcel3.enforceInterface(str);
                        setSchedFgPid(parcel.readInt());
                        return true;
                    case 4:
                        parcel3.enforceInterface(str);
                        killUnusedApp(parcel.readInt(), parcel.readInt());
                        return true;
                    case 5:
                        parcel3.enforceInterface(str);
                        String packageNameByPid = getPackageNameByPid(parcel.readInt());
                        parcel2.writeNoException();
                        parcel4.writeString(packageNameByPid);
                        return true;
                    case 6:
                        parcel3.enforceInterface(str);
                        setForkedProcessGroup(parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readString());
                        parcel2.writeNoException();
                        return true;
                    case 7:
                        parcel3.enforceInterface(str);
                        List allRunningProcessMemInfos = getAllRunningProcessMemInfos();
                        parcel2.writeNoException();
                        parcel4.writeTypedList(allRunningProcessMemInfos);
                        return true;
                    case 8:
                        parcel3.enforceInterface(str);
                        List updateProcessFullMemInfoByPids = updateProcessFullMemInfoByPids(parcel.createIntArray());
                        parcel2.writeNoException();
                        parcel4.writeTypedList(updateProcessFullMemInfoByPids);
                        return true;
                    case 9:
                        parcel3.enforceInterface(str);
                        List updateProcessPartialMemInfoByPids = updateProcessPartialMemInfoByPids(parcel.createIntArray());
                        parcel2.writeNoException();
                        parcel4.writeTypedList(updateProcessPartialMemInfoByPids);
                        return true;
                    case 10:
                        parcel3.enforceInterface(str);
                        setServicePriority(parcel3.createTypedArrayList(MiuiServicePriority.CREATOR));
                        return true;
                    case 11:
                        parcel3.enforceInterface(str);
                        setServicePriorityWithNoProc(parcel3.createTypedArrayList(MiuiServicePriority.CREATOR), parcel.readLong());
                        return true;
                    case 12:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (MiuiServicePriority) MiuiServicePriority.CREATOR.createFromParcel(parcel3);
                        }
                        if (parcel.readInt() != 0) {
                            z = true;
                        }
                        removeServicePriority(miuiServicePriority, z);
                        return true;
                    case 13:
                        parcel3.enforceInterface(str);
                        closeCheckPriority();
                        parcel2.writeNoException();
                        return true;
                    case 14:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            z = true;
                        }
                        setMiuiContentProviderControl(z);
                        return true;
                    case 15:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            z = true;
                        }
                        setMiuiBroadcastDispatchEnable(z);
                        return true;
                    case 16:
                        parcel3.enforceInterface(str);
                        addTimeConsumingIntent(parcel.createStringArray());
                        parcel2.writeNoException();
                        return true;
                    case 17:
                        parcel3.enforceInterface(str);
                        removeTimeConsumingIntent(parcel.createStringArray());
                        parcel2.writeNoException();
                        return true;
                    case 18:
                        parcel3.enforceInterface(str);
                        clearTimeConsumingIntent();
                        parcel2.writeNoException();
                        return true;
                    case 19:
                        parcel3.enforceInterface(str);
                        int memoryTrimLevel = getMemoryTrimLevel();
                        parcel2.writeNoException();
                        parcel4.writeInt(memoryTrimLevel);
                        return true;
                    case 20:
                        parcel3.enforceInterface(str);
                        String readString = parcel.readString();
                        String readString2 = parcel.readString();
                        String readString3 = parcel.readString();
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (Bundle) Bundle.CREATOR.createFromParcel(parcel3);
                        }
                        boolean insertRedirectRule = insertRedirectRule(readString, readString2, readString3, miuiServicePriority);
                        parcel2.writeNoException();
                        parcel4.writeInt(insertRedirectRule ? 1 : 0);
                        return true;
                    case 21:
                        parcel3.enforceInterface(str);
                        boolean deleteRedirectRule = deleteRedirectRule(parcel.readString(), parcel.readString());
                        parcel2.writeNoException();
                        parcel4.writeInt(deleteRedirectRule ? 1 : 0);
                        return true;
                    case 22:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (PackageInfo) PackageInfo.CREATOR.createFromParcel(parcel3);
                        }
                        boolean insertPackageInfo = insertPackageInfo(miuiServicePriority);
                        parcel2.writeNoException();
                        parcel4.writeInt(insertPackageInfo ? 1 : 0);
                        return true;
                    case 23:
                        parcel3.enforceInterface(str);
                        boolean deletePackageInfo = deletePackageInfo(parcel.readString());
                        parcel2.writeNoException();
                        parcel4.writeInt(deletePackageInfo ? 1 : 0);
                        return true;
                    case 24:
                        parcel3.enforceInterface(str);
                        long freeMemory = getFreeMemory();
                        parcel2.writeNoException();
                        parcel4.writeLong(freeMemory);
                        return true;
                    case 25:
                        parcel3.enforceInterface(str);
                        reportAnr(parcel.readInt(), parcel.readString(), parcel.readLong(), parcel.readLong(), parcel.readString());
                        return true;
                    case 26:
                        parcel3.enforceInterface(str);
                        boolean addCallingPkgHookRule = addCallingPkgHookRule(parcel.readString(), parcel.readString(), parcel.readString());
                        parcel2.writeNoException();
                        parcel4.writeInt(addCallingPkgHookRule ? 1 : 0);
                        return true;
                    case 27:
                        parcel3.enforceInterface(str);
                        boolean removeCallingPkgHookRule = removeCallingPkgHookRule(parcel.readString(), parcel.readString());
                        parcel2.writeNoException();
                        parcel4.writeInt(removeCallingPkgHookRule ? 1 : 0);
                        return true;
                    case 28:
                        parcel3.enforceInterface(str);
                        ParcelFileDescriptor perfEventSocketFd = getPerfEventSocketFd();
                        parcel2.writeNoException();
                        if (perfEventSocketFd != null) {
                            parcel4.writeInt(1);
                            perfEventSocketFd.writeToParcel(parcel4, 1);
                        } else {
                            parcel4.writeInt(0);
                        }
                        return true;
                    case 29:
                        parcel3.enforceInterface(str);
                        E2EScenario e2EScenario = parcel.readInt() != 0 ? (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel3) : null;
                        E2EScenarioSettings e2EScenarioSettings = parcel.readInt() != 0 ? (E2EScenarioSettings) E2EScenarioSettings.CREATOR.createFromParcel(parcel3) : null;
                        String readString4 = parcel.readString();
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel3);
                        }
                        Bundle beginScenario = beginScenario(e2EScenario, e2EScenarioSettings, readString4, miuiServicePriority, parcel.readInt(), parcel.readLong(), parcel.readInt() != 0);
                        parcel2.writeNoException();
                        if (beginScenario != null) {
                            parcel4.writeInt(1);
                            beginScenario.writeToParcel(parcel4, 1);
                        } else {
                            parcel4.writeInt(0);
                        }
                        return true;
                    case 30:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel3);
                        }
                        abortMatchingScenario(miuiServicePriority, parcel.readString(), parcel.readInt(), parcel.readLong());
                        parcel2.writeNoException();
                        return true;
                    case 31:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (Bundle) Bundle.CREATOR.createFromParcel(parcel3);
                        }
                        abortSpecificScenario(miuiServicePriority, parcel.readInt(), parcel.readLong());
                        parcel2.writeNoException();
                        return true;
                    case 32:
                        parcel3.enforceInterface(str);
                        E2EScenario e2EScenario2 = parcel.readInt() != 0 ? (E2EScenario) E2EScenario.CREATOR.createFromParcel(parcel3) : null;
                        String readString5 = parcel.readString();
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel3);
                        }
                        finishMatchingScenario(e2EScenario2, readString5, miuiServicePriority, parcel.readInt(), parcel.readLong());
                        parcel2.writeNoException();
                        return true;
                    case 33:
                        parcel3.enforceInterface(str);
                        Bundle bundle = parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null;
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (E2EScenarioPayload) E2EScenarioPayload.CREATOR.createFromParcel(parcel3);
                        }
                        finishSpecificScenario(bundle, miuiServicePriority, parcel.readInt(), parcel.readLong());
                        parcel2.writeNoException();
                        return true;
                    case 34:
                        parcel3.enforceInterface(str);
                        reportExcessiveCpuUsageRecords(parcel3.createTypedArrayList(Bundle.CREATOR));
                        return true;
                    case 35:
                        parcel3.enforceInterface(str);
                        String readString6 = parcel.readString();
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (Intent) Intent.CREATOR.createFromParcel(parcel3);
                        }
                        reportNotificationClick(readString6, miuiServicePriority, parcel.readLong());
                        return true;
                    case 36:
                        parcel3.enforceInterface(str);
                        String readString7 = parcel.readString();
                        String readString8 = parcel.readString();
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (Uri) Uri.CREATOR.createFromParcel(parcel3);
                        }
                        boolean insertFilterInfo = insertFilterInfo(readString7, readString8, miuiServicePriority, parcel3.createTypedArrayList(Bundle.CREATOR));
                        parcel2.writeNoException();
                        parcel4.writeInt(insertFilterInfo ? 1 : 0);
                        return true;
                    case 37:
                        parcel3.enforceInterface(str);
                        boolean deleteFilterInfo = deleteFilterInfo(parcel.readString());
                        parcel2.writeNoException();
                        parcel4.writeInt(deleteFilterInfo ? 1 : 0);
                        return true;
                    case 38:
                        parcel3.enforceInterface(str);
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (Intent) Intent.CREATOR.createFromParcel(parcel3);
                        }
                        List resolveQuickAppInfos = resolveQuickAppInfos(miuiServicePriority);
                        parcel2.writeNoException();
                        parcel4.writeTypedList(resolveQuickAppInfos);
                        return true;
                    case 39:
                        parcel3.enforceInterface(str);
                        HashMap readHashMap = parcel3.readHashMap(getClass().getClassLoader());
                        if (parcel.readInt() != 0) {
                            miuiServicePriority = (ActivityInfo) ActivityInfo.CREATOR.createFromParcel(parcel3);
                        }
                        setHapLinks(readHashMap, miuiServicePriority);
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel4.writeString(str);
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
