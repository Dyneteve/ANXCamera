package com.android.volley;

public class ClientError extends ServerError {
    public ClientError() {
    }

    public ClientError(NetworkResponse networkResponse) {
        super(networkResponse);
    }
}
