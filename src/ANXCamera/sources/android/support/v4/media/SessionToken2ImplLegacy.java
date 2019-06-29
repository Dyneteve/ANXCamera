package android.support.v4.media;

import android.content.ComponentName;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.session.MediaSessionCompat.Token;

final class SessionToken2ImplLegacy implements SupportLibraryImpl {
    private final Token mLegacyToken;

    SessionToken2ImplLegacy(Token token) {
        this.mLegacyToken = token;
    }

    public static SessionToken2ImplLegacy fromBundle(@NonNull Bundle bundle) {
        return new SessionToken2ImplLegacy(Token.fromBundle(bundle.getBundle("android.media.token.LEGACY")));
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof SessionToken2ImplLegacy)) {
            return false;
        }
        return this.mLegacyToken.equals(((SessionToken2ImplLegacy) obj).mLegacyToken);
    }

    public Object getBinder() {
        return this.mLegacyToken;
    }

    public ComponentName getComponentName() {
        return null;
    }

    @NonNull
    public String getPackageName() {
        return null;
    }

    @Nullable
    public String getServiceName() {
        return null;
    }

    public String getSessionId() {
        return null;
    }

    public int getType() {
        return 0;
    }

    public int getUid() {
        return -1;
    }

    public int hashCode() {
        return this.mLegacyToken.hashCode();
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt("android.media.token.type", 100);
        bundle.putBundle("android.media.token.LEGACY", this.mLegacyToken.toBundle());
        return bundle;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SessionToken2 {legacyToken=");
        sb.append(this.mLegacyToken);
        sb.append("}");
        return sb.toString();
    }
}
