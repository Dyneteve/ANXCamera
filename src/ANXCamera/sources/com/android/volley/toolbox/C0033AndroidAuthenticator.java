package com.android.volley.toolbox;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.android.volley.C0013AuthFailureError;

/* renamed from: com.android.volley.toolbox.AndroidAuthenticator reason: case insensitive filesystem */
public class C0033AndroidAuthenticator implements C0034Authenticator {
    private final Account mAccount;
    private final String mAuthTokenType;
    private final Context mContext;
    private final boolean mNotifyAuthFailure;

    public C0033AndroidAuthenticator(Context context, Account account, String authTokenType) {
        this(context, account, authTokenType, false);
    }

    public C0033AndroidAuthenticator(Context context, Account account, String authTokenType, boolean notifyAuthFailure) {
        this.mContext = context;
        this.mAccount = account;
        this.mAuthTokenType = authTokenType;
        this.mNotifyAuthFailure = notifyAuthFailure;
    }

    public Account getAccount() {
        return this.mAccount;
    }

    public String getAuthToken() throws C0013AuthFailureError {
        AccountManagerFuture<Bundle> future = AccountManager.get(this.mContext).getAuthToken(this.mAccount, this.mAuthTokenType, this.mNotifyAuthFailure, null, null);
        try {
            Bundle result = (Bundle) future.getResult();
            String authToken = null;
            if (future.isDone() && !future.isCancelled()) {
                if (!result.containsKey("intent")) {
                    authToken = result.getString("authtoken");
                } else {
                    throw new C0013AuthFailureError((Intent) result.getParcelable("intent"));
                }
            }
            if (authToken != null) {
                return authToken;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Got null auth token for type: ");
            sb.append(this.mAuthTokenType);
            throw new C0013AuthFailureError(sb.toString());
        } catch (Exception e) {
            throw new C0013AuthFailureError("Error while retrieving auth token", e);
        }
    }

    public void invalidateAuthToken(String authToken) {
        AccountManager.get(this.mContext).invalidateAuthToken(this.mAccount.type, authToken);
    }
}
