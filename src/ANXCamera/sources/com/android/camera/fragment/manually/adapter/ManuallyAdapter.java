package com.android.camera.fragment.manually.adapter;

import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import java.util.List;

public class ManuallyAdapter extends Adapter<CommonRecyclerViewHolder> {
    private List<ComponentData> mComponentDataList;
    private int mCurrentMode;
    private OnClickListener mOnClickListener;
    @StringRes
    private int mSelectedTitle;

    public ManuallyAdapter(int i, OnClickListener onClickListener, List<ComponentData> list) {
        this.mCurrentMode = i;
        this.mOnClickListener = onClickListener;
        this.mComponentDataList = list;
    }

    public int getItemCount() {
        return this.mComponentDataList.size();
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        ComponentData componentData = (ComponentData) this.mComponentDataList.get(i);
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        commonRecyclerViewHolder.itemView.setTag(componentData);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.manually_item_key);
        TextView textView2 = (TextView) commonRecyclerViewHolder.getView(R.id.manually_item_value);
        ImageView imageView = (ImageView) commonRecyclerViewHolder.getView(R.id.manually_item_value_image);
        if (componentData.getDisplayTitleString() > 0) {
            textView.setText(componentData.getDisplayTitleString());
            if (componentData.disableUpdate()) {
                commonRecyclerViewHolder.itemView.setEnabled(false);
                textView2.setVisibility(0);
                textView2.setText(componentData.getDefaultValueDisplayString(this.mCurrentMode));
                imageView.setVisibility(8);
                textView.setTextColor(ColorConstant.COLOR_COMMON_DISABLE);
                textView2.setTextColor(ColorConstant.COLOR_COMMON_DISABLE);
                return;
            }
            commonRecyclerViewHolder.itemView.setEnabled(true);
        }
        textView.setTextColor(componentData.getDisplayTitleString() == this.mSelectedTitle ? ColorConstant.COLOR_COMMON_SELECTED : ColorConstant.COLOR_COMMON_NORMAL);
        int valueDisplayString = componentData.getValueDisplayString(this.mCurrentMode);
        if (valueDisplayString != -1) {
            textView2.setVisibility(0);
            textView2.setText(valueDisplayString);
            imageView.setVisibility(8);
        } else {
            textView2.setVisibility(8);
            imageView.setImageResource(componentData.getValueSelectedDrawable(this.mCurrentMode));
            imageView.setVisibility(0);
        }
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_manually_item, viewGroup, false);
        inflate.getLayoutParams().width = inflate.getResources().getDisplayMetrics().widthPixels / getItemCount();
        return new CommonRecyclerViewHolder(inflate);
    }

    public void setSelectedTitle(@StringRes int i) {
        this.mSelectedTitle = i;
        notifyDataSetChanged();
    }
}
