package miui.hardware.display;

import android.content.res.Resources;
import android.os.HwBinder;
import android.os.IBinder;
import android.os.IBinder.DeathRecipient;
import android.os.IHwBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.util.Slog;
import miui.os.DeviceFeature;
import miui.util.FeatureParser;

public class DisplayFeatureManager {
    private static final int CONFIG_SERVICENAME_RESOURCEID = Resources.getSystem().getIdentifier("config_displayFeatureHidlServiceName", "string", "android");
    public static final int DEFALUT_GAMUT_MODE = 0;
    public static final int DEFALUT_SCREEN_COLOR = 2;
    private static final String DISPLAY_FEATURE_SERVICE = "DisplayFeatureControl";
    public static final int DISPLAY_INFO_GRAY = 0;
    public static final int EXT_COLOR_PROC_STATE = 15;
    private static final String HIDL_SERVICENAME_DEFAULT = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature";
    public static final String PROPERTY_ASSERTIVE_DISPLAY = "persist.sys.ltm_enable";
    public static final String PROPERTY_GAMUT_MODE = "persist.sys.gamut_mode";
    public static final String PROPERTY_SCREEN_COLOR = "persist.sys.display_prefer";
    public static final String PROPERTY_SCREEN_SATURATION = "persist.sys.display_ce";
    public static final int SCREEN_ADAPT = 0;
    public static final int SCREEN_ENHANCE = 1;
    public static final int SCREEN_EYECARE = 3;
    public static final int SCREEN_GAME_HDR = 19;
    public static final int SCREEN_HIGHLIGHT = 11;
    public static final int SCREEN_MONOCHROME = 4;
    public static final int SCREEN_NIGHTLIGHT = 9;
    public static final int SCREEN_STANDARD = 2;
    public static final int SCREEN_SUNLIGHT = 8;
    private static final boolean SUPPORT_SET_FEATURE = (!FeatureParser.getBoolean("support_screen_effect", false));
    /* access modifiers changed from: private */
    public static String TAG = "DisplayFeatureManager";
    public static final int UPDATE_PCC_LEVEL = 20000;
    public static final int UPDATE_WCG_STATE = 10000;
    private static volatile DisplayFeatureManager sInstance;
    private DeathRecipient mBinderDeathHandler;
    private IHwBinder.DeathRecipient mHwBinderDeathHandler;
    /* access modifiers changed from: private */
    public Object mLock = new Object();
    /* access modifiers changed from: private */
    public DisplayFeatureServiceProxy mProxy;

    private DisplayFeatureManager() {
        initServiceDeathRecipient();
        synchronized (this.mLock) {
            initProxyLocked();
        }
    }

    public static DisplayFeatureManager getInstance() {
        if (sInstance == null) {
            synchronized (DisplayFeatureManager.class) {
                if (sInstance == null) {
                    sInstance = new DisplayFeatureManager();
                }
            }
        }
        return sInstance;
    }

    private void initProxyLocked() {
        try {
            if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
                String string = CONFIG_SERVICENAME_RESOURCEID == 0 ? HIDL_SERVICENAME_DEFAULT : Resources.getSystem().getString(CONFIG_SERVICENAME_RESOURCEID);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("initProxyLoced CONFIG_SERVICENAME_RESOURCEID = ");
                sb.append(CONFIG_SERVICENAME_RESOURCEID);
                sb.append(" hidlServiceName = ");
                sb.append(string);
                Slog.d(str, sb.toString());
                IHwBinder service = HwBinder.getService(string, "default");
                if (service != null) {
                    service.linkToDeath(this.mHwBinderDeathHandler, 10001);
                    this.mProxy = new DisplayFeatureServiceProxy(service);
                }
                return;
            }
            IBinder service2 = ServiceManager.getService(DISPLAY_FEATURE_SERVICE);
            if (service2 != null) {
                service2.linkToDeath(this.mBinderDeathHandler, 0);
                this.mProxy = new DisplayFeatureServiceProxy(service2);
            }
        } catch (RemoteException e) {
        }
    }

    private void initServiceDeathRecipient() {
        if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
            this.mHwBinderDeathHandler = new IHwBinder.DeathRecipient() {
                public void serviceDied(long j) {
                    synchronized (DisplayFeatureManager.this.mLock) {
                        Slog.v(DisplayFeatureManager.TAG, "hwbinder service binderDied!");
                        DisplayFeatureManager.this.mProxy = null;
                    }
                }
            };
        } else {
            this.mBinderDeathHandler = new DeathRecipient() {
                public void binderDied() {
                    synchronized (DisplayFeatureManager.this.mLock) {
                        Slog.v(DisplayFeatureManager.TAG, "binder service binderDied!");
                        DisplayFeatureManager.this.mProxy = null;
                    }
                }
            };
        }
    }

    public int getColorPrefer() {
        return SystemProperties.getInt(PROPERTY_SCREEN_COLOR, 2);
    }

    public int getScreenGamut() {
        return SystemProperties.getInt(PROPERTY_GAMUT_MODE, 0);
    }

    public boolean isAdEnable() {
        return SystemProperties.getBoolean(PROPERTY_ASSERTIVE_DISPLAY, true);
    }

    public void registerCallback(Object obj) {
        synchronized (this.mLock) {
            if (this.mProxy == null) {
                initProxyLocked();
            }
            if (this.mProxy != null) {
                this.mProxy.registerCallback(0, obj);
            }
        }
    }

    public void setScreenEffect(int i, int i2) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setScreenEffect mode=");
            sb.append(i);
            sb.append(" value=");
            sb.append(i2);
            Slog.d(str, sb.toString());
            if (this.mProxy == null) {
                initProxyLocked();
            }
            if (this.mProxy != null) {
                this.mProxy.setFeature(0, i, i2, 255);
            }
        }
    }

    public void setScreenEffect(int i, int i2, int i3) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setScreenEffect mode=");
            sb.append(i);
            sb.append(" value=");
            sb.append(i2);
            sb.append(" cookie=");
            sb.append(i3);
            Slog.d(str, sb.toString());
            if (this.mProxy == null) {
                initProxyLocked();
            }
            if (this.mProxy != null) {
                this.mProxy.setFeature(0, i, i2, i3);
            }
        }
    }
}
