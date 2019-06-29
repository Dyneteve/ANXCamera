package miui.hardware.display;

import android.hidl.base.V1_0.DebugInfo;
import android.hidl.base.V1_0.IBase;
import android.os.HidlSupport;
import android.os.HwBinder;
import android.os.HwBlob;
import android.os.HwParcel;
import android.os.IHwBinder;
import android.os.IHwBinder.DeathRecipient;
import android.os.IHwInterface;
import android.os.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;

public interface IDisplayFeatureCallback extends IBase {
    public static final String kInterfaceName = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeatureCallback";

    public static abstract class Stub extends HwBinder implements IDisplayFeatureCallback {
        public IHwBinder asBinder() {
            return this;
        }

        public final DebugInfo getDebugInfo() {
            DebugInfo debugInfo = new DebugInfo();
            debugInfo.pid = HidlSupport.getPidIfSharable();
            debugInfo.ptr = 0;
            debugInfo.arch = 0;
            return debugInfo;
        }

        public final ArrayList<byte[]> getHashChain() {
            return new ArrayList<>(Arrays.asList(new byte[][]{new byte[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new byte[]{-67, -38, -74, 24, 77, 122, 52, 109, -90, -96, 125, -64, -126, -116, -15, -102, 105, 111, 76, -86, 54, 17, -59, 31, 46, 20, 86, 90, 20, -76, 15, -39}}));
        }

        public final ArrayList<String> interfaceChain() {
            return new ArrayList<>(Arrays.asList(new String[]{IDisplayFeatureCallback.kInterfaceName, "android.hidl.base@1.0::IBase"}));
        }

        public final String interfaceDescriptor() {
            return IDisplayFeatureCallback.kInterfaceName;
        }

        public final boolean linkToDeath(DeathRecipient deathRecipient, long j) {
            return true;
        }

        public final void notifySyspropsChanged() {
            HwBinder.enableInstrumentation();
        }

        public void onTransact(int i, HwParcel hwParcel, HwParcel hwParcel2, int i2) throws RemoteException {
            int i3 = 0;
            boolean z = true;
            switch (i) {
                case 1:
                    if ((i2 & 1) != 0) {
                        i3 = 1;
                    }
                    if (i3 != 1) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface(IDisplayFeatureCallback.kInterfaceName);
                    displayfeatureInfoChanged(hwParcel.readInt32(), hwParcel.readInt32());
                    return;
                case 256067662:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    ArrayList interfaceChain = interfaceChain();
                    hwParcel2.writeStatus(0);
                    hwParcel2.writeStringVector(interfaceChain);
                    hwParcel2.send();
                    return;
                case 256131655:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    hwParcel2.writeStatus(0);
                    hwParcel2.send();
                    return;
                case 256136003:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    String interfaceDescriptor = interfaceDescriptor();
                    hwParcel2.writeStatus(0);
                    hwParcel2.writeString(interfaceDescriptor);
                    hwParcel2.send();
                    return;
                case 256398152:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    ArrayList hashChain = getHashChain();
                    hwParcel2.writeStatus(0);
                    HwBlob hwBlob = new HwBlob(16);
                    int size = hashChain.size();
                    hwBlob.putInt32(8, size);
                    hwBlob.putBool(12, false);
                    HwBlob hwBlob2 = new HwBlob(size * 32);
                    while (i3 < size) {
                        hwBlob2.putInt8Array((long) (i3 * 32), (byte[]) hashChain.get(i3));
                        i3++;
                    }
                    hwBlob.putBlob(0, hwBlob2);
                    hwParcel2.writeBuffer(hwBlob);
                    hwParcel2.send();
                    return;
                case 256462420:
                    if ((i2 & 1) != 0) {
                        i3 = 1;
                    }
                    if (i3 != 1) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    setHALInstrumentation();
                    return;
                case 256660548:
                    if ((i2 & 1) != 0) {
                        i3 = 1;
                    }
                    if (i3 != 0) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    return;
                case 256921159:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    ping();
                    hwParcel2.writeStatus(0);
                    hwParcel2.send();
                    return;
                case 257049926:
                    if ((i2 & 1) == 0) {
                        z = false;
                    }
                    if (z) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    DebugInfo debugInfo = getDebugInfo();
                    hwParcel2.writeStatus(0);
                    debugInfo.writeToParcel(hwParcel2);
                    hwParcel2.send();
                    return;
                case 257120595:
                    if ((i2 & 1) != 0) {
                        i3 = 1;
                    }
                    if (i3 != 1) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    hwParcel.enforceInterface("android.hidl.base@1.0::IBase");
                    notifySyspropsChanged();
                    return;
                case 257250372:
                    if ((i2 & 1) != 0) {
                        i3 = 1;
                    }
                    if (i3 != 0) {
                        hwParcel2.writeStatus(Integer.MIN_VALUE);
                        hwParcel2.send();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        public final void ping() {
        }

        public IHwInterface queryLocalInterface(String str) {
            if (IDisplayFeatureCallback.kInterfaceName.equals(str)) {
                return this;
            }
            return null;
        }

        public void registerAsService(String str) throws RemoteException {
            registerService(str);
        }

        public final void setHALInstrumentation() {
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(interfaceDescriptor());
            sb.append("@Stub");
            return sb.toString();
        }

        public final boolean unlinkToDeath(DeathRecipient deathRecipient) {
            return true;
        }
    }

    void displayfeatureInfoChanged(int i, int i2) throws RemoteException;

    DebugInfo getDebugInfo() throws RemoteException;

    ArrayList<byte[]> getHashChain() throws RemoteException;

    ArrayList<String> interfaceChain() throws RemoteException;

    String interfaceDescriptor() throws RemoteException;

    boolean linkToDeath(DeathRecipient deathRecipient, long j) throws RemoteException;

    void notifySyspropsChanged() throws RemoteException;

    void ping() throws RemoteException;

    void setHALInstrumentation() throws RemoteException;

    boolean unlinkToDeath(DeathRecipient deathRecipient) throws RemoteException;
}
