package com.ss.android.vesdk;

public class VEException extends RuntimeException {
    private String msgDes;
    private int ret;

    public VEException(int i, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("VESDK exception ret: ");
        sb.append(i);
        sb.append("msg: ");
        sb.append(str);
        super(sb.toString());
        this.ret = i;
        this.msgDes = str;
    }

    public String getMsgDes() {
        return this.msgDes;
    }

    public int getRetCd() {
        return this.ret;
    }
}
