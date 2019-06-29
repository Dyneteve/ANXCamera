package com.android.camera2.vendortag;

public class VendorTagNotFoundException extends RuntimeException {
    public VendorTagNotFoundException() {
    }

    public VendorTagNotFoundException(String str) {
        super(str);
    }

    public VendorTagNotFoundException(String str, Throwable th) {
        super(str, th);
    }

    public VendorTagNotFoundException(Throwable th) {
        super(th);
    }
}
