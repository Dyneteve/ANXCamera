package com.android.camera.fragment.bottom;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ColorActivateTextView;
import com.android.camera.ui.EdgeHorizonScrollView;
import com.android.camera.ui.ModeSelectView;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public class BottomActionMenu implements OnClickListener {
    public static final int ANIM_EXPAND = 160;
    public static final int ANIM_SHRINK = 161;
    public static final int BEAUTY_BOTTOM_MENU = 1;
    public static final int CAMERA_OPERATE_BOTTOM_MENU = 0;
    public static final int LIVE_BOTTOM_MENU = 2;
    private static final String TAG = BottomActionMenu.class.getSimpleName();
    private LinearLayout beautyOperateMenuView;
    private BeautyMenuGroupManager mBeautyOperateMenuViewWrapper;
    private EdgeHorizonScrollView mCameraOperateMenuView;
    private ModeSelectView mCameraOperateSelectView;
    private FrameLayout mContainerView;
    private Context mContext;
    private ColorActivateTextView mLastSelectedView;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BottomActionMenuAnimType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface BottomActionMode {
    }

    public BottomActionMenu(Context context, FrameLayout frameLayout) {
        this.mContext = context;
        initView(frameLayout);
    }

    private void beautyOperateMenuHandle(int i, boolean z) {
        if (this.mBeautyOperateMenuViewWrapper != null) {
            this.mBeautyOperateMenuViewWrapper.setCurrentBeautyMenuType(i);
            this.mBeautyOperateMenuViewWrapper.switchMenu();
        }
        this.mCameraOperateMenuView.setVisibility(8);
        if (z) {
            exitAnim(this.mCameraOperateMenuView);
        }
        if (this.mBeautyOperateMenuViewWrapper != null) {
            this.mBeautyOperateMenuViewWrapper.setVisibility(0);
            if (z) {
                enterAnim(this.mBeautyOperateMenuViewWrapper.getView());
            }
        }
    }

    private void cameraOperateMenuHandle(boolean z) {
        this.mCameraOperateMenuView.setVisibility(0);
        if (z) {
            enterAnim(this.mCameraOperateMenuView);
        }
        if (this.mBeautyOperateMenuViewWrapper != null) {
            this.mBeautyOperateMenuViewWrapper.setVisibility(8);
            if (z) {
                exitAnim(this.mBeautyOperateMenuViewWrapper.getView());
            }
        }
    }

    private void enterAnim(@NonNull View view) {
        view.clearAnimation();
        view.setAlpha(0.0f);
        ViewCompat.animate(view).alpha(1.0f).setStartDelay(140).setInterpolator(new QuinticEaseOutInterpolator()).setDuration(300).start();
    }

    private void exitAnim(@NonNull View view) {
        view.clearAnimation();
        ViewCompat.animate(view).alpha(0.0f).setInterpolator(new QuinticEaseInInterpolator()).setDuration(140).start();
    }

    private void initView(FrameLayout frameLayout) {
        this.mContainerView = frameLayout;
        this.mCameraOperateMenuView = (EdgeHorizonScrollView) this.mContainerView.findViewById(R.id.mode_select_scrollview);
        this.mCameraOperateSelectView = (ModeSelectView) this.mContainerView.findViewById(R.id.mode_select);
        switchMenuMode(0, false);
    }

    public void animateShineBeauty(boolean z) {
        char c;
        int childCount = this.beautyOperateMenuView.getChildCount();
        boolean z2 = false;
        for (int i = 0; i < childCount; i++) {
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) this.beautyOperateMenuView.getChildAt(i);
            String str = (String) colorActivateTextView.getTag();
            switch (str.hashCode()) {
                case 49:
                    if (str.equals("1")) {
                        c = 4;
                        break;
                    }
                case 51:
                    if (str.equals("3")) {
                        c = 0;
                        break;
                    }
                case 52:
                    if (str.equals("4")) {
                        c = 1;
                        break;
                    }
                case 53:
                    if (str.equals("5")) {
                        c = 2;
                        break;
                    }
                case 54:
                    if (str.equals("6")) {
                        c = 3;
                        break;
                    }
                case 55:
                    if (str.equals("7")) {
                        c = 5;
                        break;
                    }
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                case 1:
                case 2:
                case 3:
                    colorActivateTextView.setVisibility(z ? 8 : 0);
                    z2 = true;
                    break;
            }
        }
        if (z2) {
            for (int i2 = 0; i2 < childCount; i2++) {
                ColorActivateTextView colorActivateTextView2 = (ColorActivateTextView) this.beautyOperateMenuView.getChildAt(i2);
                if (colorActivateTextView2.getVisibility() == 0) {
                    Completable.create(new AlphaInOnSubscribe(colorActivateTextView2)).subscribe();
                }
            }
        }
    }

    public void bottomMenuAnimate(int i, int i2) {
        if (i == 1) {
            if (160 == i2) {
                this.mBeautyOperateMenuViewWrapper.animateExpanding(true);
            } else if (161 == i2) {
                this.mBeautyOperateMenuViewWrapper.animateExpanding(false);
            }
        }
    }

    public void clearBottomMenu() {
        if (this.beautyOperateMenuView != null && this.beautyOperateMenuView.getVisibility() == 0) {
            this.beautyOperateMenuView.setVisibility(8);
            AlphaInOnSubscribe.directSetResult(this.mCameraOperateMenuView);
        }
    }

    public void expandShine(ComponentRunningShine componentRunningShine, int i) {
        char c;
        List items = componentRunningShine.getItems();
        String currentType = componentRunningShine.getCurrentType();
        this.beautyOperateMenuView.removeAllViews();
        LayoutInflater from = LayoutInflater.from(this.mContext);
        boolean z = !componentRunningShine.isSmoothDependBeautyVersion() && BeautyConstant.LEVEL_CLOSE.equals(CameraSettings.getFaceBeautifyLevel());
        boolean z2 = items.size() > 1;
        for (int i2 = 0; i2 < items.size(); i2++) {
            ComponentDataItem componentDataItem = (ComponentDataItem) items.get(i2);
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) from.inflate(R.layout.beauty_menu_select_item, this.mContainerView, false);
            colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
            colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
            colorActivateTextView.setText(this.mContext.getString(componentDataItem.mDisplayNameRes));
            colorActivateTextView.setTag(componentDataItem.mValue);
            if (z2) {
                colorActivateTextView.setOnClickListener(this);
                if (currentType.equals(componentDataItem.mValue)) {
                    this.mLastSelectedView = colorActivateTextView;
                    colorActivateTextView.setActivated(true);
                }
            }
            this.beautyOperateMenuView.addView(colorActivateTextView);
            if (z) {
                String str = componentDataItem.mValue;
                switch (str.hashCode()) {
                    case 51:
                        if (str.equals("3")) {
                            c = 0;
                            break;
                        }
                    case 52:
                        if (str.equals("4")) {
                            c = 1;
                            break;
                        }
                    case 53:
                        if (str.equals("5")) {
                            c = 2;
                            break;
                        }
                    case 54:
                        if (str.equals("6")) {
                            c = 3;
                            break;
                        }
                    default:
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                        colorActivateTextView.setVisibility(8);
                        break;
                }
            }
        }
        this.beautyOperateMenuView.setVisibility(0);
        this.mCameraOperateMenuView.setVisibility(8);
        enterAnim(this.beautyOperateMenuView);
    }

    public EdgeHorizonScrollView getCameraOperateMenuView() {
        return this.mCameraOperateMenuView;
    }

    public ModeSelectView getCameraOperateSelectView() {
        return this.mCameraOperateSelectView;
    }

    public SparseArray<MenuItem> getMenuData() {
        return this.mBeautyOperateMenuViewWrapper.getBottomMenu().getMenuData();
    }

    public View getView() {
        return this.mContainerView;
    }

    public void initBeautyMenuView() {
        if (this.mBeautyOperateMenuViewWrapper == null) {
            this.beautyOperateMenuView = (LinearLayout) this.mContainerView.findViewById(R.id.beauty_operate_menu);
            this.beautyOperateMenuView.setVisibility(8);
            this.mBeautyOperateMenuViewWrapper = new BeautyMenuGroupManager(this.mContext, this.beautyOperateMenuView);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:9:0x003c, code lost:
        if (r7.equals(com.android.camera.data.data.runing.ComponentRunningShine.SHINE_LIVE_BEAUTY) != false) goto L_0x0054;
     */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x005c  */
    public void onClick(View view) {
        char c = 0;
        if (this.mLastSelectedView != null) {
            this.mLastSelectedView.setActivated(false);
            this.mLastSelectedView = (ColorActivateTextView) view;
            this.mLastSelectedView.setActivated(true);
        }
        String str = (String) view.getTag();
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            int hashCode = str.hashCode();
            if (hashCode != 54) {
                switch (hashCode) {
                    case 1567:
                        if (str.equals("10")) {
                            c = 1;
                            break;
                        }
                    case 1568:
                        break;
                }
            } else if (str.equals("6")) {
                c = 2;
                switch (c) {
                    case 0:
                    case 1:
                        CameraStatUtil.trackLiveBeautyClick(str);
                        break;
                    case 2:
                        CameraStatUtil.trackBeautyBodyCounterPort(str);
                        break;
                }
                miBeautyProtocol.switchShineType(str, true);
            }
            c = 65535;
            switch (c) {
                case 0:
                case 1:
                    break;
                case 2:
                    break;
            }
            miBeautyProtocol.switchShineType(str, true);
        }
    }

    public void switchMenuMode(int i, int i2, boolean z) {
        switch (i) {
            case 0:
                Log.i(TAG, "switch menu mode:camera_operate");
                cameraOperateMenuHandle(z);
                return;
            case 1:
                Log.i(TAG, "switch menu mode:beauty_operate");
                beautyOperateMenuHandle(i2, z);
                return;
            case 2:
                Log.i(TAG, "switch menu mode:live_operate");
                beautyOperateMenuHandle(i2, z);
                return;
            default:
                Log.i(TAG, "default switch menu mode:camera_operate");
                cameraOperateMenuHandle(z);
                return;
        }
    }

    public void switchMenuMode(int i, boolean z) {
        switchMenuMode(i, 161, z);
    }
}
