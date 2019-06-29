package com.android.camera.fragment.mimoji;

import android.animation.ArgbEvaluator;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.R;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import java.util.ArrayList;
import java.util.List;

public class ColorListAdapter extends Adapter<ViewHolder> {
    public static final String TAG = ColorListAdapter.class.getSimpleName();
    /* access modifiers changed from: private */
    public ClickCheck clickCheck;
    /* access modifiers changed from: private */
    public AvatarConfigItemClick mAvatarConfigItemClick;
    private Context mContext;
    private List<ASAvatarConfigInfo> mDatas;
    public int mLastPosion = -1;
    private LinearLayoutManagerWrapper mLinearLayoutManagerWrapper;
    /* access modifiers changed from: private */
    public OnItemClickListener onItemClickListener;

    public interface OnItemClickListener {
        void onItemClick(int i);
    }

    public class ViewHolder extends android.support.v7.widget.RecyclerView.ViewHolder {
        CircleImageView ivColor;

        public ViewHolder(View view) {
            super(view);
            this.ivColor = (CircleImageView) view.findViewById(R.id.iv_color);
        }
    }

    public ColorListAdapter(Context context, AvatarConfigItemClick avatarConfigItemClick, LinearLayoutManagerWrapper linearLayoutManagerWrapper) {
        this.mContext = context;
        this.mDatas = new ArrayList();
        this.mAvatarConfigItemClick = avatarConfigItemClick;
        this.mLinearLayoutManagerWrapper = linearLayoutManagerWrapper;
    }

    public int getItemCount() {
        if (this.mDatas == null) {
            return 0;
        }
        return this.mDatas.size();
    }

    public float getSelectItem(int i) {
        return AvatarEngineManager.getInstance().getInnerConfigSelectIndex(i);
    }

    public LinearLayoutManagerWrapper getmLinearLayoutManagerWrapper() {
        return this.mLinearLayoutManagerWrapper;
    }

    public void onBindViewHolder(@NonNull ViewHolder viewHolder, int i) {
        final ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) this.mDatas.get(i);
        final CircleImageView circleImageView = viewHolder.ivColor;
        float selectItem = getSelectItem(aSAvatarConfigInfo.configType);
        final ArgbEvaluator argbEvaluator = new ArgbEvaluator();
        int intValue = ((Integer) argbEvaluator.evaluate(aSAvatarConfigInfo.continuousValue, Integer.valueOf(aSAvatarConfigInfo.startColorValue), Integer.valueOf(aSAvatarConfigInfo.endColorValue))).intValue();
        if (selectItem == ((float) aSAvatarConfigInfo.configID)) {
            circleImageView.updateView(true, intValue);
            this.mLastPosion = i;
        } else {
            circleImageView.updateView(false, intValue);
        }
        View view = viewHolder.itemView;
        final int i2 = i;
        final ViewHolder viewHolder2 = viewHolder;
        AnonymousClass1 r1 = new OnClickListener() {
            public void onClick(View view) {
                if ((ColorListAdapter.this.clickCheck == null || ColorListAdapter.this.clickCheck.checkClickable()) && ColorListAdapter.this.mLastPosion != i2 && argbEvaluator != null) {
                    if (aSAvatarConfigInfo.configType == 2) {
                        AvatarEngineManager.getInstance().setInnerConfigSelectIndex(18, (float) aSAvatarConfigInfo.configID);
                        AvatarEngineManager.getInstance().setInnerConfigSelectIndex(15, (float) aSAvatarConfigInfo.configID);
                    }
                    AvatarEngineManager.getInstance().setInnerConfigSelectIndex(aSAvatarConfigInfo.configType, (float) aSAvatarConfigInfo.configID);
                    circleImageView.updateView(true);
                    ViewHolder viewHolder = (ViewHolder) ((RecyclerView) viewHolder2.itemView.getParent()).findViewHolderForAdapterPosition(ColorListAdapter.this.mLastPosion);
                    if (viewHolder != null) {
                        viewHolder.ivColor.updateView(false);
                    } else {
                        ColorListAdapter.this.notifyItemChanged(ColorListAdapter.this.mLastPosion);
                    }
                    ColorListAdapter.this.mLastPosion = i2;
                    ColorListAdapter.this.mAvatarConfigItemClick.onConfigItemClick(aSAvatarConfigInfo, true, i2);
                    if (ColorListAdapter.this.onItemClickListener != null) {
                        ColorListAdapter.this.onItemClickListener.onItemClick(i2);
                    }
                }
            }
        };
        view.setOnClickListener(r1);
    }

    @NonNull
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return new ViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.item_mimoji_color, viewGroup, false));
    }

    public void setClickCheck(ClickCheck clickCheck2) {
        this.clickCheck = clickCheck2;
    }

    public void setData(List<ASAvatarConfigInfo> list) {
        this.mDatas = list;
        notifyDataSetChanged();
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener2) {
        this.onItemClickListener = onItemClickListener2;
    }
}
