package com.google.android.libraries.lens.lenslite;

public interface StatusUpdateCallback {

    public @interface LensOobeStatus {
        public static final int ACCEPTED = 3;
        public static final int NOT_SEEN = 1;
        public static final int SEEN_NOT_ACCEPTED = 2;
        public static final int UNSPECIFIED = 0;
    }

    void onOobeStatusUpdated(@LensOobeStatus int i);
}
