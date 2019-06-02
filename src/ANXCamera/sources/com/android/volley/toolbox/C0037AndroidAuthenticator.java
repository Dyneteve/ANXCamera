package com.android.volley.toolbox;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.android.volley.C0017AuthFailureError;

/* renamed from: com.android.volley.toolbox.AndroidAuthenticator reason: case insensitive filesystem */
public class C0037AndroidAuthenticator implements C0038Authenticator {
    private final Account mAccount;
    private final String mAuthTokenType;
    private final Context mContext;
    private final boolean mNotifyAuthFailure;

    public C0037AndroidAuthenticator(Context context, Account account, String str) {
        this(context, account, str, false);
    }

    public C0037AndroidAuthenticator(Context context, Account account, String str, boolean z) {
        this.mContext = context;
        this.mAccount = account;
        this.mAuthTokenType = str;
        this.mNotifyAuthFailure = z;
    }

    public Account getAccount() {
        return this.mAccount;
    }

    public String getAuthToken() throws C0017AuthFailureError {
        AccountManagerFuture authToken = AccountManager.get(this.mContext).getAuthToken(this.mAccount, this.mAuthTokenType, this.mNotifyAuthFailure, null, null);
        try {
            Bundle bundle = (Bundle) authToken.getResult();
            String str = null;
            if (authToken.isDone() && !authToken.isCancelled()) {
                if (!bundle.containsKey("intent")) {
                    str = bundle.getString("authtoken");
                } else {
                    throw new C0017AuthFailureError((Intent) bundle.getParcelable("intent"));
                }
            }
            if (str != null) {
                return str;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Got null auth token for type: ");
            sb.append(this.mAuthTokenType);
            throw new C0017AuthFailureError(sb.toString());
        } catch (Exception e) {
            throw new C0017AuthFailureError("Error while retrieving auth token", e);
        }
    }

    public void invalidateAuthToken(String str) {
        AccountManager.get(this.mContext).invalidateAuthToken(this.mAccount.type, str);
    }
}
