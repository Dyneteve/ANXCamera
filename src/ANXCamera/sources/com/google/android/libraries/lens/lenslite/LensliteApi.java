package com.google.android.libraries.lens.lenslite;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import com.google.android.libraries.lens.lenslite.api.LinkImage;

public class LensliteApi {
    private static final String TAG = "LensliteApi";

    public static LensliteApi create(Context context, int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("create: context = ");
        sb.append(context);
        sb.append(", imagePoolSize = ");
        sb.append(i);
        Log.d(str, sb.toString());
        return null;
    }

    public LensliteUiController getUiController() {
        return null;
    }

    public void onNewImage(LinkImage linkImage) {
    }

    public void onPause() {
    }

    public void onResume() {
    }

    public void onStart(LensliteUiContainer lensliteUiContainer, Activity activity, StatusUpdateCallback statusUpdateCallback) {
    }

    public void onStop() {
    }
}
