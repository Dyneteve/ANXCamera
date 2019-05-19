package com.ss.android.ugc.effectmanager;

import android.content.Context;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.ss.android.ugc.effectmanager.common.TaskManager;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IEffectNetWorker;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import com.ss.android.ugc.effectmanager.network.EffectNetWorkerWrapper;
import java.io.File;
import java.util.List;

public class EffectConfiguration {
    private static final String API_ADDRESS = "/effect/api";
    public static final String KEY_ACCESS_KEY = "access_key";
    public static final String KEY_APP_ID = "aid";
    public static final String KEY_APP_LANGUAGE = "app_language";
    public static final String KEY_APP_VERSION = "app_version";
    public static final String KEY_CHANNEL = "channel";
    public static final String KEY_DEVICE_ID = "device_id";
    public static final String KEY_DEVICE_PLATFORM = "device_platform";
    public static final String KEY_DEVICE_TYPE = "device_type";
    public static final String KEY_EFFECT_IDS = "effect_ids";
    public static final String KEY_PANEL = "panel";
    public static final String KEY_REGION = "region";
    public static final String KEY_SDK_VERSION = "sdk_version";
    public static final String KEY_SYS_LANGUAGE = "language";
    public static final String KEY_TYPE = "type";
    public static final String KEY_VERSION = "version";
    private IJsonConverter jsonConverter;
    private ListenerManger listenerManger;
    private String mAccessKey;
    private String mApiAddress;
    private String mAppID;
    private String mAppLanguage;
    private String mAppVersion;
    private ICache mCache;
    private String mChannel;
    private String mDeviceId;
    private String mDeviceType;
    private File mEffectDir;
    private EffectNetWorkerWrapper mEffectNetWorker;
    private LinkSelectorConfiguration mLinkSelectorConfiguration;
    private String mPlatform;
    private String mRegion;
    private int mRetryCount;
    private String mSdkVersion;
    private String mSysLanguage;
    private TaskManager mTaskManager;

    public static final class Builder {
        /* access modifiers changed from: private */
        public String accessKey;
        /* access modifiers changed from: private */
        public String appID;
        /* access modifiers changed from: private */
        public String appLanguage;
        /* access modifiers changed from: private */
        public String appVersion;
        /* access modifiers changed from: private */
        public ICache cache;
        /* access modifiers changed from: private */
        public String channel;
        /* access modifiers changed from: private */
        public String deviceId;
        /* access modifiers changed from: private */
        public String deviceType;
        /* access modifiers changed from: private */
        public File effectDir;
        /* access modifiers changed from: private */
        public IEffectNetWorker effectNetWorker;
        /* access modifiers changed from: private */
        public IJsonConverter jsonConverter;
        /* access modifiers changed from: private */
        public LinkSelectorConfiguration mLinkSelectorConfiguration = new LinkSelectorConfiguration();
        /* access modifiers changed from: private */
        public String platform;
        /* access modifiers changed from: private */
        public String region;
        /* access modifiers changed from: private */
        public int retryCount = 3;
        /* access modifiers changed from: private */
        public String sdkVersion;
        /* access modifiers changed from: private */
        public String sysLanguage;

        public Builder JsonConverter(IJsonConverter iJsonConverter) {
            this.jsonConverter = iJsonConverter;
            return this;
        }

        public Builder accessKey(String str) {
            this.accessKey = str;
            return this;
        }

        public Builder appID(String str) {
            this.appID = str;
            return this;
        }

        public Builder appLanguage(String str) {
            this.appLanguage = str;
            return this;
        }

        public Builder appVersion(String str) {
            this.appVersion = str;
            return this;
        }

        public EffectConfiguration build() {
            return new EffectConfiguration(this);
        }

        public Builder cache(ICache iCache) {
            this.cache = iCache;
            return this;
        }

        public Builder channel(String str) {
            this.channel = str;
            return this;
        }

        public Builder context(Context context) {
            this.mLinkSelectorConfiguration.setContext(context);
            return this;
        }

        public Builder deviceId(String str) {
            this.deviceId = str;
            return this;
        }

        public Builder deviceType(String str) {
            this.deviceType = str;
            return this;
        }

        public Builder effectDir(File file) {
            this.effectDir = file;
            if (this.effectDir != null && !this.effectDir.exists()) {
                this.effectDir.mkdirs();
            }
            return this;
        }

        public Builder effectNetWorker(IEffectNetWorker iEffectNetWorker) {
            this.effectNetWorker = iEffectNetWorker;
            return this;
        }

        public Builder hosts(List<Host> list) {
            this.mLinkSelectorConfiguration.setOriginHosts(list);
            return this;
        }

        public Builder lazy(boolean z) {
            this.mLinkSelectorConfiguration.setLazy(z);
            return this;
        }

        public Builder netWorkChangeMonitor(boolean z) {
            this.mLinkSelectorConfiguration.setNetworkChangeMonitor(z);
            return this;
        }

        public Builder platform(String str) {
            this.platform = str;
            return this;
        }

        public Builder region(String str) {
            this.region = str;
            return this;
        }

        public Builder repeatTime(int i) {
            this.mLinkSelectorConfiguration.setRepeatTime(i);
            return this;
        }

        public Builder retryCount(int i) {
            this.retryCount = i;
            return this;
        }

        public Builder sdkVersion(String str) {
            this.sdkVersion = str;
            return this;
        }

        public Builder speedApi(String str) {
            this.mLinkSelectorConfiguration.setSpeedApi(str);
            return this;
        }

        public Builder speedTimeOut(int i) {
            this.mLinkSelectorConfiguration.setSpeedTimeOut(i);
            return this;
        }

        public Builder sysLanguage(String str) {
            this.sysLanguage = str;
            return this;
        }
    }

    private EffectConfiguration(Builder builder) {
        this.mChannel = MonitorCommonConstants.DEFAULT_AID;
        this.mRetryCount = 3;
        this.mApiAddress = API_ADDRESS;
        this.mAccessKey = builder.accessKey;
        this.mSdkVersion = builder.sdkVersion;
        this.mAppVersion = builder.appVersion;
        this.mDeviceId = builder.deviceId;
        this.mChannel = builder.channel;
        this.mPlatform = builder.platform;
        this.mDeviceType = builder.deviceType;
        this.mEffectDir = builder.effectDir;
        this.mEffectNetWorker = new EffectNetWorkerWrapper(builder.effectNetWorker);
        this.mRegion = builder.region;
        this.mCache = builder.cache;
        this.mRetryCount = builder.retryCount;
        this.jsonConverter = builder.jsonConverter;
        this.mAppID = builder.appID;
        this.mAppLanguage = builder.appLanguage;
        this.mSysLanguage = builder.sysLanguage;
        this.mLinkSelectorConfiguration = builder.mLinkSelectorConfiguration;
        this.listenerManger = new ListenerManger();
    }

    public String getAccessKey() {
        return this.mAccessKey;
    }

    public String getApiAdress() {
        return this.mApiAddress;
    }

    public String getAppID() {
        return this.mAppID;
    }

    public String getAppLanguage() {
        return this.mAppLanguage;
    }

    public String getAppVersion() {
        return this.mAppVersion;
    }

    public ICache getCache() {
        return this.mCache;
    }

    public String getChannel() {
        return this.mChannel;
    }

    public String getDeviceId() {
        return this.mDeviceId;
    }

    public String getDeviceType() {
        return this.mDeviceType;
    }

    public File getEffectDir() {
        return this.mEffectDir;
    }

    public EffectNetWorkerWrapper getEffectNetWorker() {
        return this.mEffectNetWorker;
    }

    public IJsonConverter getJsonConverter() {
        return this.jsonConverter;
    }

    public LinkSelectorConfiguration getLinkSelectorConfiguration() {
        return this.mLinkSelectorConfiguration;
    }

    public ListenerManger getListenerManger() {
        return this.listenerManger;
    }

    public String getPlatform() {
        return this.mPlatform;
    }

    public String getRegion() {
        return this.mRegion;
    }

    public int getRetryCount() {
        return this.mRetryCount;
    }

    public String getSdkVersion() {
        return this.mSdkVersion;
    }

    public String getSysLanguage() {
        return this.mSysLanguage;
    }

    public TaskManager getTaskManager() {
        return this.mTaskManager;
    }

    public void setCache(ICache iCache) {
        this.mCache = iCache;
    }

    public void setDeviceId(String str) {
        this.mDeviceId = str;
    }

    public void setEffectDir(File file) {
        this.mEffectDir = file;
    }

    public void setEffectNetWorker(IEffectNetWorker iEffectNetWorker) {
        this.mEffectNetWorker.setIEffectNetWorker(iEffectNetWorker);
    }

    public void setTaskManager(TaskManager taskManager) {
        this.mTaskManager = taskManager;
    }
}
