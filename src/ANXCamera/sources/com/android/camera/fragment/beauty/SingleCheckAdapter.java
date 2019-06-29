package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.FloatEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.ui.ColorImageView;
import java.util.List;

public class SingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    /* access modifiers changed from: private */
    public ArgbEvaluator mArgbEvaluator;
    /* access modifiers changed from: private */
    public int mColorNormal;
    /* access modifiers changed from: private */
    public int mColorSelected;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public boolean mEnableClick = true;
    /* access modifiers changed from: private */
    public FloatEvaluator mFloatEvaluator;
    /* access modifiers changed from: private */
    public int mItemHorizontalMargin = 0;
    private OnItemClickListener mOnItemClickListener;
    /* access modifiers changed from: private */
    public int mPreSelectedItem = 0;
    /* access modifiers changed from: private */
    public RecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public int mSelectedItem = 0;
    private List<LevelItem> mSingleCheckList;

    public static class LevelItem {
        /* access modifiers changed from: private */
        public String mText;
        private int mTextResource;

        public LevelItem(int i) {
            this.mTextResource = i;
        }

        public LevelItem(String str) {
            this.mText = str;
        }

        public String getText() {
            return this.mText;
        }

        public int getTextResource() {
            return this.mTextResource;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private SingleCheckAdapter mAdapter;
        private ColorImageView mBase;
        private ImageView mImageView;
        private TextView mText;

        public SingleCheckViewHolder(View view, SingleCheckAdapter singleCheckAdapter) {
            super(view);
            this.mAdapter = singleCheckAdapter;
            this.mText = (TextView) view.findViewById(R.id.second_text);
            this.mImageView = (ImageView) view.findViewById(R.id.second_image);
            this.mBase = (ColorImageView) view.findViewById(R.id.second_base);
            this.mBase.setIsNeedTransparent(false);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(SingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(SingleCheckAdapter.this.mItemHorizontalMargin);
            view.setOnClickListener(this);
        }

        private void animateIn(final ColorImageView colorImageView, final TextView textView) {
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(100);
            ofFloat.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    float interpolation = super.getInterpolation(f);
                    colorImageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(interpolation, Integer.valueOf(SingleCheckAdapter.this.mColorNormal), Integer.valueOf(SingleCheckAdapter.this.mColorSelected))).intValue());
                    ViewCompat.setAlpha(textView, SingleCheckAdapter.this.mFloatEvaluator.evaluate(interpolation, Float.valueOf(0.6f), Float.valueOf(1.0f)).floatValue());
                    return interpolation;
                }
            });
            ofFloat.start();
        }

        private void animateOut(final ColorImageView colorImageView, final TextView textView) {
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(100);
            ofFloat.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    float interpolation = super.getInterpolation(f);
                    colorImageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(interpolation, Integer.valueOf(SingleCheckAdapter.this.mColorSelected), Integer.valueOf(SingleCheckAdapter.this.mColorNormal))).intValue());
                    ViewCompat.setAlpha(textView, SingleCheckAdapter.this.mFloatEvaluator.evaluate(interpolation, Float.valueOf(1.0f), Float.valueOf(0.6f)).floatValue());
                    return interpolation;
                }
            });
            ofFloat.start();
        }

        private void colorAnimate(final ColorImageView colorImageView, int i, int i2) {
            ValueAnimator ofObject = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
            ofObject.setDuration(200);
            ofObject.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    colorImageView.setColorAndRefresh(((Integer) valueAnimator.getAnimatedValue()).intValue());
                }
            });
            ofObject.start();
        }

        public void onClick(View view) {
            if (SingleCheckAdapter.this.mEnableClick) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && !cameraAction.isDoingAction() && !cameraAction.isRecording()) {
                    int adapterPosition = getAdapterPosition();
                    if (adapterPosition != SingleCheckAdapter.this.mSelectedItem) {
                        SingleCheckAdapter.this.mPreSelectedItem = SingleCheckAdapter.this.mSelectedItem;
                        SingleCheckAdapter.this.mSelectedItem = adapterPosition;
                        SingleCheckViewHolder singleCheckViewHolder = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mPreSelectedItem);
                        SingleCheckViewHolder singleCheckViewHolder2 = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mSelectedItem);
                        animateOut(singleCheckViewHolder.mBase, singleCheckViewHolder.mText);
                        animateIn(singleCheckViewHolder2.mBase, singleCheckViewHolder2.mText);
                        this.mAdapter.onItemHolderClick(this);
                    }
                }
            }
        }

        public void setDateToView(LevelItem levelItem, int i) throws Exception {
            String str;
            if (TextUtils.isEmpty(levelItem.mText)) {
                this.mText.setVisibility(8);
                this.mImageView.setVisibility(0);
                this.mImageView.setImageResource(levelItem.getTextResource());
            } else {
                this.mText.setVisibility(0);
                this.mImageView.setVisibility(8);
                this.mText.setTextSize(0, (float) SingleCheckAdapter.this.mContext.getResources().getDimensionPixelSize(R.dimen.beauty_level_text_size));
                this.mText.setText(levelItem.getText());
            }
            this.mText.setAlpha(i == SingleCheckAdapter.this.mSelectedItem ? 1.0f : 0.6f);
            this.mBase.setColor(i == SingleCheckAdapter.this.mSelectedItem ? SingleCheckAdapter.this.mColorSelected : SingleCheckAdapter.this.mColorNormal);
            if (!Util.isAccessible()) {
                return;
            }
            if (i == 0) {
                this.mText.setContentDescription(i == SingleCheckAdapter.this.mSelectedItem ? SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_closed) : SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_open));
                return;
            }
            TextView textView = this.mText;
            if (i == SingleCheckAdapter.this.mSelectedItem) {
                StringBuilder sb = new StringBuilder();
                sb.append(i);
                sb.append(SingleCheckAdapter.this.mContext.getString(R.string.accessibility_open));
                str = sb.toString();
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(i);
                sb2.append(SingleCheckAdapter.this.mContext.getString(R.string.accessibility_closed));
                str = sb2.toString();
            }
            textView.setContentDescription(str);
        }
    }

    public SingleCheckAdapter(Context context, List<LevelItem> list, int i) {
        this.mSingleCheckList = list;
        this.mColorNormal = context.getResources().getColor(R.color.transparent);
        this.mColorSelected = context.getResources().getColor(R.color.beautycamera_beauty_level_item_backgroud_pressed);
        this.mItemHorizontalMargin = i;
        this.mArgbEvaluator = new ArgbEvaluator();
        this.mFloatEvaluator = new FloatEvaluator();
        this.mContext = context;
    }

    public int getItemCount() {
        return this.mSingleCheckList.size();
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public void onBindViewHolder(SingleCheckViewHolder singleCheckViewHolder, int i) {
        try {
            singleCheckViewHolder.setDateToView((LevelItem) this.mSingleCheckList.get(i), i);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.beauty_level_item, viewGroup, false), this);
    }

    public void onItemHolderClick(SingleCheckViewHolder singleCheckViewHolder) {
        if (this.mOnItemClickListener != null) {
            this.mOnItemClickListener.onItemClick(null, singleCheckViewHolder.itemView, singleCheckViewHolder.getAdapterPosition(), singleCheckViewHolder.getItemId());
        }
    }

    public void setEnableClick(boolean z) {
        this.mEnableClick = z;
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mOnItemClickListener = onItemClickListener;
    }

    public void setSelectedPosition(int i) {
        this.mSelectedItem = i;
    }
}
