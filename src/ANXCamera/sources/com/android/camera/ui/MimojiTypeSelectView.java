package com.android.camera.ui;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Message;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.fragment.mimoji.FragmentMimojiEdit;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigType;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MimojiTypeSelectView extends LinearLayout implements OnClickListener {
    private Context mContext;
    private ColorActivateTextView mLastActivateTextView;
    private OnMimojiTypeClickedListener mOnMimojiTypeClickedListener;

    public interface OnMimojiTypeClickedListener {
        void onMimojiTypeClicked(int i);
    }

    public MimojiTypeSelectView(Context context) {
        super(context);
        this.mContext = context;
        initView();
    }

    public MimojiTypeSelectView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mContext = context;
        initView();
    }

    public MimojiTypeSelectView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mContext = context;
        initView();
    }

    private static final int getChildMeasureWidth(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int i = marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
        int measuredWidth = view.getMeasuredWidth();
        if (measuredWidth > 0) {
            return measuredWidth + i;
        }
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(makeMeasureSpec, makeMeasureSpec);
        return view.getMeasuredWidth() + i;
    }

    private void scrollTo(int i, List<Completable> list) {
        ((MimojiTypeHorizonScrollView) getParent()).smoothScrollTo(-i, 0);
    }

    private void setSelection(int i, List<Completable> list) {
        if (this.mLastActivateTextView != null) {
            this.mLastActivateTextView.setActivated(false);
        }
        ViewGroup viewGroup = (ViewGroup) getChildAt(i);
        View findViewById = viewGroup.findViewById(R.id.mode_select_red_dot);
        if (findViewById.getVisibility() == 0) {
            findViewById.setVisibility(4);
        }
        ColorActivateTextView colorActivateTextView = (ColorActivateTextView) viewGroup.findViewById(R.id.text_item_title);
        colorActivateTextView.setActivated(true);
        if (Util.isAccessible()) {
            StringBuilder sb = new StringBuilder();
            sb.append(colorActivateTextView.getText().toString());
            sb.append(getContext().getString(R.string.accessibility_selected));
            colorActivateTextView.setContentDescription(sb.toString());
            colorActivateTextView.sendAccessibilityEvent(128);
        }
        this.mLastActivateTextView = colorActivateTextView;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            i2 += Util.getChildMeasureWidth(getChildAt(i3));
        }
        int childMeasureWidth = (getResources().getDisplayMetrics().widthPixels / 2) - (i2 + (getChildMeasureWidth(viewGroup) / 2));
        if (Util.isLayoutRTL(getContext())) {
            childMeasureWidth = -childMeasureWidth;
        }
        scrollTo(childMeasureWidth, list);
    }

    public void init() {
        Iterator it = AvatarEngineManager.getInstance().getConfigTypeList().iterator();
        int i = 0;
        while (it.hasNext()) {
            ASAvatarConfigType aSAvatarConfigType = (ASAvatarConfigType) it.next();
            ArrayList config = AvatarEngineManager.getInstance().queryAvatar().getConfig(aSAvatarConfigType.configType, AvatarEngineManager.getInstance().getASAvatarConfigValue().gender);
            String str = FragmentMimojiEdit.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("putConfigList:");
            sb.append(aSAvatarConfigType.configTypeDesc);
            sb.append(":");
            sb.append(aSAvatarConfigType.configType);
            Log.i(str, sb.toString());
            AvatarEngineManager.getInstance().putConfigList(aSAvatarConfigType.configType, config);
            if (!AvatarEngineManager.filterTypeTitle(aSAvatarConfigType.configType)) {
                ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(getContext()).inflate(R.layout.mimoji_type_select_view, this, false);
                ColorActivateTextView colorActivateTextView = (ColorActivateTextView) viewGroup.findViewById(R.id.text_item_title);
                colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
                viewGroup.setOnClickListener(this);
                colorActivateTextView.setNormalCor(-1);
                colorActivateTextView.setTypeface(Typeface.defaultFromStyle(1));
                colorActivateTextView.setTextSize(17.5f);
                colorActivateTextView.setText(AvatarEngineManager.replaceTabTitle(this.mContext, aSAvatarConfigType.configType));
                Message obtain = Message.obtain();
                int i2 = i + 1;
                obtain.arg1 = i;
                obtain.arg2 = aSAvatarConfigType.configType;
                viewGroup.setTag(obtain);
                addView(viewGroup);
                i = i2;
            }
        }
        for (int i3 = 0; i3 < getChildCount(); i3++) {
            if (i3 == 0 || i3 == getChildCount() - 1) {
                View childAt = getChildAt(i3);
                int childMeasureWidth = (getResources().getDisplayMetrics().widthPixels - getChildMeasureWidth(childAt)) / 2;
                MarginLayoutParams marginLayoutParams = (MarginLayoutParams) childAt.getLayoutParams();
                if (i3 == 0) {
                    marginLayoutParams.setMarginStart(childMeasureWidth);
                } else {
                    marginLayoutParams.setMarginEnd(childMeasureWidth);
                }
                childAt.setLayoutParams(marginLayoutParams);
            }
        }
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.onTypeConfigSelect(1);
        }
        setSelection(0, null);
    }

    public void initView() {
    }

    public void onClick(View view) {
        Message message = (Message) view.getTag();
        int i = message.arg1;
        int i2 = message.arg2;
        setSelection(i, null);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null && i2 != AvatarEngineManager.getInstance().getSelectType()) {
            mimojiEditor.onTypeConfigSelect(i2);
        }
    }

    public void setOnModeClickedListener(OnMimojiTypeClickedListener onMimojiTypeClickedListener) {
        this.mOnMimojiTypeClickedListener = onMimojiTypeClickedListener;
    }
}
