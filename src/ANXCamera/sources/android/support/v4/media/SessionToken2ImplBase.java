package android.support.v4.media;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.app.BundleCompat;
import android.support.v4.media.IMediaSession2.Stub;
import android.text.TextUtils;
import java.util.List;

final class SessionToken2ImplBase implements SupportLibraryImpl {
    private final ComponentName mComponentName;
    private final IMediaSession2 mISession2;
    private final String mPackageName;
    private final String mServiceName;
    private final String mSessionId;
    private final int mType;
    private final int mUid;

    @RestrictTo({Scope.LIBRARY_GROUP})
    SessionToken2ImplBase(int i, int i2, String str, String str2, String str3, IMediaSession2 iMediaSession2) {
        this.mUid = i;
        this.mType = i2;
        this.mPackageName = str;
        this.mServiceName = str2;
        this.mComponentName = this.mType == 0 ? null : new ComponentName(str, str2);
        this.mSessionId = str3;
        this.mISession2 = iMediaSession2;
    }

    SessionToken2ImplBase(@NonNull Context context, @NonNull ComponentName componentName) {
        this(context, componentName, -1);
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    SessionToken2ImplBase(@NonNull Context context, @NonNull ComponentName componentName, int i) {
        if (componentName != null) {
            this.mComponentName = componentName;
            this.mPackageName = componentName.getPackageName();
            this.mServiceName = componentName.getClassName();
            PackageManager packageManager = context.getPackageManager();
            if (i == -1) {
                try {
                    i = packageManager.getApplicationInfo(this.mPackageName, 0).uid;
                } catch (NameNotFoundException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Cannot find package ");
                    sb.append(this.mPackageName);
                    throw new IllegalArgumentException(sb.toString());
                }
            }
            this.mUid = i;
            String sessionIdFromService = getSessionIdFromService(packageManager, MediaLibraryService2.SERVICE_INTERFACE, componentName);
            if (sessionIdFromService != null) {
                this.mSessionId = sessionIdFromService;
                this.mType = 2;
            } else {
                this.mSessionId = getSessionIdFromService(packageManager, MediaSessionService2.SERVICE_INTERFACE, componentName);
                this.mType = 1;
            }
            if (this.mSessionId != null) {
                this.mISession2 = null;
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("service ");
            sb2.append(this.mServiceName);
            sb2.append(" doesn't implement");
            sb2.append(" session service nor library service. Use service's full name.");
            throw new IllegalArgumentException(sb2.toString());
        }
        throw new IllegalArgumentException("serviceComponent shouldn't be null");
    }

    public static SessionToken2ImplBase fromBundle(@NonNull Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        int i = bundle.getInt("android.media.token.uid");
        int i2 = bundle.getInt("android.media.token.type", -1);
        String string = bundle.getString("android.media.token.package_name");
        String string2 = bundle.getString("android.media.token.service_name");
        String string3 = bundle.getString("android.media.token.session_id");
        IMediaSession2 asInterface = Stub.asInterface(BundleCompat.getBinder(bundle, "android.media.token.session_binder"));
        switch (i2) {
            case 0:
                if (asInterface == null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unexpected token for session, binder=");
                    sb.append(asInterface);
                    throw new IllegalArgumentException(sb.toString());
                }
                break;
            case 1:
            case 2:
                if (TextUtils.isEmpty(string2)) {
                    throw new IllegalArgumentException("Session service needs service name");
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid type");
        }
        if (TextUtils.isEmpty(string) || string3 == null) {
            throw new IllegalArgumentException("Package name nor ID cannot be null.");
        }
        SessionToken2ImplBase sessionToken2ImplBase = new SessionToken2ImplBase(i, i2, string, string2, string3, asInterface);
        return sessionToken2ImplBase;
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    public static String getSessionId(ResolveInfo resolveInfo) {
        if (resolveInfo == null || resolveInfo.serviceInfo == null) {
            return null;
        }
        return resolveInfo.serviceInfo.metaData == null ? "" : resolveInfo.serviceInfo.metaData.getString(MediaSessionService2.SERVICE_META_DATA, "");
    }

    private static String getSessionIdFromService(PackageManager packageManager, String str, ComponentName componentName) {
        Intent intent = new Intent(str);
        intent.setPackage(componentName.getPackageName());
        List queryIntentServices = packageManager.queryIntentServices(intent, 128);
        if (queryIntentServices != null) {
            for (int i = 0; i < queryIntentServices.size(); i++) {
                ResolveInfo resolveInfo = (ResolveInfo) queryIntentServices.get(i);
                if (resolveInfo != null && resolveInfo.serviceInfo != null && TextUtils.equals(resolveInfo.serviceInfo.name, componentName.getClassName())) {
                    return getSessionId(resolveInfo);
                }
            }
        }
        return null;
    }

    private boolean sessionBinderEquals(IMediaSession2 iMediaSession2, IMediaSession2 iMediaSession22) {
        if (iMediaSession2 != null && iMediaSession22 != null) {
            return iMediaSession2.asBinder().equals(iMediaSession22.asBinder());
        }
        return iMediaSession2 == iMediaSession22;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof SessionToken2ImplBase)) {
            return false;
        }
        SessionToken2ImplBase sessionToken2ImplBase = (SessionToken2ImplBase) obj;
        if (this.mUid == sessionToken2ImplBase.mUid && TextUtils.equals(this.mPackageName, sessionToken2ImplBase.mPackageName) && TextUtils.equals(this.mServiceName, sessionToken2ImplBase.mServiceName) && TextUtils.equals(this.mSessionId, sessionToken2ImplBase.mSessionId) && this.mType == sessionToken2ImplBase.mType && sessionBinderEquals(this.mISession2, sessionToken2ImplBase.mISession2)) {
            z = true;
        }
        return z;
    }

    public Object getBinder() {
        if (this.mISession2 == null) {
            return null;
        }
        return this.mISession2.asBinder();
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    public ComponentName getComponentName() {
        return this.mComponentName;
    }

    @NonNull
    public String getPackageName() {
        return this.mPackageName;
    }

    @Nullable
    public String getServiceName() {
        return this.mServiceName;
    }

    public String getSessionId() {
        return this.mSessionId;
    }

    public int getType() {
        return this.mType;
    }

    public int getUid() {
        return this.mUid;
    }

    public int hashCode() {
        return this.mType + (31 * (this.mUid + ((this.mPackageName.hashCode() + ((this.mSessionId.hashCode() + ((this.mServiceName != null ? this.mServiceName.hashCode() : 0) * 31)) * 31)) * 31)));
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt("android.media.token.uid", this.mUid);
        bundle.putString("android.media.token.package_name", this.mPackageName);
        bundle.putString("android.media.token.service_name", this.mServiceName);
        bundle.putString("android.media.token.session_id", this.mSessionId);
        bundle.putInt("android.media.token.type", this.mType);
        if (this.mISession2 != null) {
            BundleCompat.putBinder(bundle, "android.media.token.session_binder", this.mISession2.asBinder());
        }
        return bundle;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SessionToken {pkg=");
        sb.append(this.mPackageName);
        sb.append(" id=");
        sb.append(this.mSessionId);
        sb.append(" type=");
        sb.append(this.mType);
        sb.append(" service=");
        sb.append(this.mServiceName);
        sb.append(" IMediaSession2=");
        sb.append(this.mISession2);
        sb.append("}");
        return sb.toString();
    }
}
