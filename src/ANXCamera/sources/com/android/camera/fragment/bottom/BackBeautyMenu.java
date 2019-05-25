package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.android.camera.CameraAppImpl;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.ui.ColorActivateTextView;
import com.oneplus.camera.R;

public class BackBeautyMenu extends AbBottomMenu implements OnClickListener {
    private SparseArray<MenuItem> mBackBeautyMenuTabList;
    private SparseArray<ColorActivateTextView> mMenuTextViewList;

    public BackBeautyMenu(Context context, LinearLayout linearLayout, BeautyMenuAnimator beautyMenuAnimator) {
        super(context, linearLayout, beautyMenuAnimator);
    }

    private boolean isJustBeautyTab() {
        return false;
    }

    /* access modifiers changed from: 0000 */
    public void addAllView() {
        this.mMenuTextViewList = new SparseArray<>();
        SparseArray menuData = getMenuData();
        for (int i = 0; i < menuData.size(); i++) {
            MenuItem menuItem = (MenuItem) menuData.valueAt(i);
            if (!isJustBeautyTab() || menuItem.type == 1) {
                ColorActivateTextView colorActivateTextView = (ColorActivateTextView) LayoutInflater.from(this.mContext).inflate(R.layout.beauty_menu_select_item, this.mContainerView, false);
                colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
                if (isJustBeautyTab()) {
                    colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_NORMAL);
                } else {
                    colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
                }
                colorActivateTextView.setText(menuItem.text);
                colorActivateTextView.setTag(Integer.valueOf(menuItem.type));
                colorActivateTextView.setOnClickListener(this);
                if (1 == menuItem.type) {
                    colorActivateTextView.setActivated(true);
                    this.mCurrentBeautyTextView = colorActivateTextView;
                } else {
                    colorActivateTextView.setActivated(false);
                }
                this.mMenuTextViewList.put(menuItem.type, colorActivateTextView);
                this.mContainerView.addView(colorActivateTextView);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public SparseArray<ColorActivateTextView> getChildMenuViewList() {
        return this.mMenuTextViewList;
    }

    /* access modifiers changed from: 0000 */
    public int getDefaultType() {
        return 1;
    }

    /* access modifiers changed from: 0000 */
    public SparseArray<MenuItem> getMenuData() {
        if (this.mBackBeautyMenuTabList != null) {
            return this.mBackBeautyMenuTabList;
        }
        this.mBackBeautyMenuTabList = new SparseArray<>();
        String string = CameraAppImpl.getAndroidContext().getString(R.string.beauty_fragment_tab_name_3d_beauty);
        MenuItem menuItem = new MenuItem();
        menuItem.type = 1;
        menuItem.text = string;
        menuItem.number = 0;
        this.mBackBeautyMenuTabList.put(1, menuItem);
        if (DataRepository.dataItemFeature().isSupportBeautyBody()) {
            String string2 = CameraAppImpl.getAndroidContext().getString(R.string.beauty_body);
            MenuItem menuItem2 = new MenuItem();
            menuItem2.type = 5;
            menuItem2.text = string2;
            menuItem2.number = 1;
            this.mBackBeautyMenuTabList.put(5, menuItem2);
        }
        return this.mBackBeautyMenuTabList;
    }

    /* access modifiers changed from: 0000 */
    public boolean isRefreshUI() {
        return true;
    }

    public void onClick(View view) {
        if (isClickEnable()) {
            selectBeautyType(((Integer) view.getTag()).intValue());
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.hideQrCodeTip();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void switchMenu() {
        this.mContainerView.removeAllViews();
        addAllView();
        selectBeautyType(getDefaultType());
    }
}
