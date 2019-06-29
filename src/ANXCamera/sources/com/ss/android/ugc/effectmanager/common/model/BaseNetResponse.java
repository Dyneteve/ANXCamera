package com.ss.android.ugc.effectmanager.common.model;

public class BaseNetResponse {
    private String message;
    private int status_code;

    public String getMessage() {
        return this.message;
    }

    public int getStatus_code() {
        return this.status_code;
    }

    public void setMessage(String str) {
        this.message = str;
    }

    public void setStatus_code(int i) {
        this.status_code = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("BaseNetResponse{status_code=");
        sb.append(this.status_code);
        sb.append(", message='");
        sb.append(this.message);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
