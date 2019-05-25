package com.android.camera.fragment.mimoji;

import android.animation.ArgbEvaluator;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.log.Log;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ColorListAdapter extends Adapter<ViewHolder> {
    /* access modifiers changed from: private */
    public AvatarConfigItemClick mAvatarConfigItemClick;
    private Context mContext;
    private List<ASAvatarConfigInfo> mDatas = new ArrayList();

    public class ViewHolder extends android.support.v7.widget.RecyclerView.ViewHolder {
        CircleImageView ivColor;

        public ViewHolder(View view) {
            super(view);
            this.ivColor = (CircleImageView) view.findViewById(R.id.iv_color);
        }
    }

    public ColorListAdapter(Context context, AvatarConfigItemClick avatarConfigItemClick) {
        this.mContext = context;
        this.mAvatarConfigItemClick = avatarConfigItemClick;
    }

    public int getItemCount() {
        return this.mDatas.size();
    }

    public float getSelectItem(int i) {
        return AvatarEngineManager.getInstance().getInnerConfigSelectIndex(i);
    }

    public void onBindViewHolder(@NonNull ViewHolder viewHolder, int i) {
        final ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) this.mDatas.get(i);
        CircleImageView circleImageView = viewHolder.ivColor;
        float selectItem = getSelectItem(aSAvatarConfigInfo.configType);
        int intValue = ((Integer) new ArgbEvaluator().evaluate(aSAvatarConfigInfo.continuousValue, Integer.valueOf(aSAvatarConfigInfo.startColorValue), Integer.valueOf(aSAvatarConfigInfo.endColorValue))).intValue();
        String str = FragmentMimojiEdit.TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("colorValue:");
        sb.append(intValue);
        Log.i(str, sb.toString());
        if (selectItem == ((float) aSAvatarConfigInfo.configID)) {
            circleImageView.updateView(true, intValue);
        } else {
            circleImageView.updateView(false, intValue);
        }
        circleImageView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                String str = FragmentMimojiEdit.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("点击的子color:");
                sb.append(aSAvatarConfigInfo.configType);
                sb.append(" 子ID:");
                sb.append(aSAvatarConfigInfo.configID);
                Log.i(str, sb.toString());
                AvatarEngineManager.getInstance().setInnerConfigSelectIndex(aSAvatarConfigInfo.configType, (float) aSAvatarConfigInfo.configID);
                ColorListAdapter.this.mAvatarConfigItemClick.onConfigItemClick(aSAvatarConfigInfo, true);
                ColorListAdapter.this.notifyDataSetChanged();
            }
        });
    }

    @NonNull
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return new ViewHolder(View.inflate(this.mContext, R.layout.item_mimoji_color, null));
    }

    public void updateData(List<ASAvatarConfigInfo> list) {
        this.mDatas.clear();
        if (list != null) {
            this.mDatas.addAll(list);
            notifyDataSetChanged();
        }
    }
}
