package com.android.lens;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PointF;
import android.graphics.Rect;
import android.media.Image;
import android.os.SystemProperties;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.statistic.CameraStatUtil;
import com.google.android.libraries.lens.lenslite.LensliteApi;
import com.google.android.libraries.lens.lenslite.LensliteUiContainer;
import com.google.android.libraries.lens.lenslite.LensliteUiController;
import com.google.android.libraries.lens.lenslite.LensliteUiController.FocusType;
import com.oneplus.camera.R;

public class LensAgent {
    private static final String TAG = "LensAgent";
    private volatile boolean mIsResumed;
    private LensliteApi mLensliteApi;

    private static class SingletonHandler {
        /* access modifiers changed from: private */
        public static final LensAgent LENS_AGENT = new LensAgent();

        private SingletonHandler() {
        }
    }

    private LensAgent() {
    }

    private void applyCustomStyle(Context context, ViewGroup viewGroup) {
        LensliteUiController uiController = this.mLensliteApi.getUiController();
        Resources resources = context.getResources();
        Rect displayRect = Util.getDisplayRect(context, 0);
        uiController.setChipLocation(new PointF(0.0f, (((float) displayRect.bottom) - resources.getDimension(R.dimen.chips_margin_preview_rect_bottom)) / Util.sPixelDensity));
        uiController.setChipDrawable(R.drawable.chips_bg);
        uiController.setOobeLocation(1, ((float) Util.sNavigationBarHeight) / Util.sPixelDensity);
        TextView textView = (TextView) viewGroup.findViewById(R.id.smarts_chip_text);
        if (textView != null) {
            LayoutParams layoutParams = new LayoutParams(textView.getLayoutParams());
            layoutParams.gravity = 17;
            layoutParams.width = -2;
            layoutParams.height = -2;
            layoutParams.setMargins(0, 0, 0, resources.getDimensionPixelOffset(R.dimen.chips_text_margin_bottom));
            textView.setLayoutParams(layoutParams);
            textView.setGravity(17);
            textView.setTextColor(-1);
            textView.setTextSize(0, resources.getDimension(R.dimen.chips_text_size));
        }
        ImageView imageView = (ImageView) viewGroup.findViewById(R.id.smarts_chip_close_button);
        if (imageView != null) {
            imageView.setImageResource(R.drawable.chips_close);
            imageView.setImageTintList(ColorStateList.valueOf(-1));
            int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.chips_close_padding);
            imageView.setPadding(dimensionPixelOffset, dimensionPixelOffset, dimensionPixelOffset, dimensionPixelOffset);
            LayoutParams layoutParams2 = new LayoutParams(imageView.getLayoutParams());
            layoutParams2.gravity = 16;
            layoutParams2.width = -2;
            layoutParams2.height = -2;
            int i = SystemProperties.getInt("cancel_margin_left", resources.getDimensionPixelOffset(R.dimen.chips_close_margin_left));
            int i2 = SystemProperties.getInt("cancel_margin_right", resources.getDimensionPixelOffset(R.dimen.chips_close_margin_right));
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("applyCustomStyle: cancel button marginLeft = ");
            sb.append(i);
            sb.append(", marginRight = ");
            sb.append(i2);
            Log.d(str, sb.toString());
            layoutParams2.setMargins(i, 0, i2, 0);
            imageView.setLayoutParams(layoutParams2);
        }
        LinearLayout linearLayout = (LinearLayout) viewGroup.findViewById(R.id.chip_view);
        if (linearLayout != null) {
            linearLayout.setPadding(0, 0, 0, 0);
        }
        FrameLayout frameLayout = (FrameLayout) viewGroup.findViewById(R.id.chip_animation_container);
        if (frameLayout != null) {
            LayoutParams layoutParams3 = new LayoutParams(frameLayout.getLayoutParams());
            layoutParams3.gravity = 16;
            int i3 = SystemProperties.getInt("icon_margin_left", resources.getDimensionPixelOffset(R.dimen.chips_icon_margin_left));
            int i4 = SystemProperties.getInt("icon_margin_right", resources.getDimensionPixelOffset(R.dimen.chips_icon_margin_right));
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("applyCustomStyle: icon marginLeft = ");
            sb2.append(i3);
            sb2.append(", marginRight = ");
            sb2.append(i4);
            Log.d(str2, sb2.toString());
            layoutParams3.setMargins(i3, 0, i4, 0);
            frameLayout.setLayoutParams(layoutParams3);
        }
        uiController.setIconForResultType(0, context.getDrawable(R.drawable.chips_location));
        uiController.setIconForResultType(1, context.getDrawable(R.drawable.chips_mail));
        uiController.setIconForResultType(2, context.getDrawable(R.drawable.chips_browser));
        uiController.setIconForResultType(3, context.getDrawable(R.drawable.chips_phone));
        uiController.setIconForResultType(4, context.getDrawable(R.drawable.chips_contact));
        uiController.setIconForResultType(5, context.getDrawable(R.drawable.chips_qrcode));
        uiController.setIconForResultType(6, context.getDrawable(R.drawable.chips_qrcode));
        uiController.setIconForResultType(7, context.getDrawable(R.drawable.chips_qrcode));
        uiController.setIconForResultType(8, context.getDrawable(R.drawable.chips_qrcode));
        uiController.setIconForResultType(12, context.getDrawable(R.drawable.chips_qrcode));
        uiController.setIconForResultType(13, context.getDrawable(R.drawable.chips_mail));
        uiController.setIconForResultType(14, context.getDrawable(R.drawable.chips_calendar));
        uiController.setIconForResultType(18, context.getDrawable(R.drawable.chips_no_result));
    }

    public static LensAgent getInstance() {
        return SingletonHandler.LENS_AGENT;
    }

    public static boolean isConflictAiScene(int i) {
        if (!(i == -1 || i == 19 || i == 25)) {
            if (i == 31) {
                return DataRepository.dataItemFeature().fa();
            }
            if (!(i == 34 || i == 37)) {
                return false;
            }
        }
        return true;
    }

    static /* synthetic */ void lambda$init$0(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onOobeStatusUpdated: ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_GOOGLE_LENS_OOBE, false)) {
            CameraStatUtil.trackGoogleLensOobeContinue(i == 3);
            DataRepository.dataItemGlobal().editor().putBoolean(CameraSettings.KEY_GOOGLE_LENS_OOBE, false).apply();
            if (i != 3) {
                DataRepository.dataItemGlobal().editor().remove(CameraSettings.KEY_LONG_PRESS_VIEWFINDER).apply();
            }
        }
    }

    public void init(Activity activity, View view, ViewGroup viewGroup) {
        this.mLensliteApi = LensliteApi.create(activity.getApplicationContext(), 3);
        long currentTimeMillis = System.currentTimeMillis();
        this.mLensliteApi.onStart(new LensliteUiContainer(view, viewGroup), activity, $$Lambda$LensAgent$cohQvDa6AK2LPMEq2gBw2XH18Nc.INSTANCE);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("LensliteApi init cost ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
        applyCustomStyle(activity.getApplicationContext(), viewGroup);
    }

    public void onFocusChange(@FocusType int i, float f, float f2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onFocusChange: type = ");
        sb.append(i);
        sb.append(", ");
        sb.append(f);
        sb.append("x");
        sb.append(f2);
        Log.d(str, sb.toString());
        try {
            this.mLensliteApi.getUiController().onFocusChange(i, new PointF(f, f2));
        } catch (Exception e) {
            Log.e(TAG, "onFocusChange: ", e);
        }
    }

    public void onNewImage(Image image, int i) {
        if (this.mIsResumed) {
            this.mLensliteApi.onNewImage(image, i);
        } else {
            Log.w(TAG, "onNewImage: lens api not resume...");
        }
    }

    public void onPause() {
        long currentTimeMillis = System.currentTimeMillis();
        if (this.mIsResumed) {
            this.mIsResumed = false;
            this.mLensliteApi.onPause();
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("LensliteApi onPause cost ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    public void onResume() {
        long currentTimeMillis = System.currentTimeMillis();
        if (!this.mIsResumed) {
            this.mLensliteApi.onResume();
            this.mIsResumed = true;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("LensliteApi onResume cost ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    public void release() {
        long currentTimeMillis = System.currentTimeMillis();
        this.mLensliteApi.onStop();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("LensliteApi release cost ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
    }

    public void showOrHideChip(boolean z) {
        this.mLensliteApi.getUiController().setLensSuggestionsEnabled(z);
    }
}
