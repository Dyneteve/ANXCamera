package com.android.camera.fragment.mimoji;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.oneplus.camera.R;

public class BubbleEditMimojiPresenter {
    private static final int DELETE_PROCESS = 102;
    private static final int EDIT_PROCESS = 101;
    private static final int INVISIBLE_STATE = -1;
    private static final int RESET_STATE = -2;
    private static final String TAG = "BubbleEditMimojiPresenter";
    private static final int VISIBLE_STATE = 1;
    BubblePop bubblePop1;
    BubblePop bubblePop2;
    Context mContext;
    public int[] mLocationSelect = new int[3];

    class BubblePop {
        public static final int DELETE_PROCESS = 102;
        public static final int EDIT_PROCESS = 101;
        public static final int HIDE_STATE = 104;
        public static final int SHOW_STATE = 103;
        private boolean hasAddView = false;
        /* access modifiers changed from: private */
        public LayoutParams layoutParamsDelete;
        /* access modifiers changed from: private */
        public LayoutParams layoutParamsEdit;
        Context mContext;
        /* access modifiers changed from: private */
        public int mHashCode;
        ImageView mIvDeleteFisrt;
        ImageView mIvEditFirst;
        public int[] mLocationSelect = new int[3];
        private RelativeLayout mRootView;
        private int processState = 104;

        BubblePop(Context context, OnClickListener onClickListener, RelativeLayout relativeLayout) {
            this.mContext = context;
            this.mRootView = relativeLayout;
            this.mIvDeleteFisrt = new ImageView(this.mContext);
            this.mIvDeleteFisrt.setImageDrawable(this.mContext.getDrawable(R.drawable.mimoji_delete));
            this.mIvDeleteFisrt.setTag(Integer.valueOf(102));
            this.mIvDeleteFisrt.setOnClickListener(onClickListener);
            this.mIvEditFirst = new ImageView(this.mContext);
            this.mIvEditFirst.setImageDrawable(this.mContext.getDrawable(R.drawable.mimoji_edit));
            this.mIvEditFirst.setTag(Integer.valueOf(101));
            this.mIvEditFirst.setOnClickListener(onClickListener);
            this.mLocationSelect[0] = -1;
            this.mLocationSelect[1] = -1;
            this.layoutParamsEdit = new LayoutParams(80, 80);
            this.layoutParamsDelete = new LayoutParams(80, 80);
        }

        public int getProcessState() {
            return this.processState;
        }

        public void hideBubbleAni() {
            if (this.mIvDeleteFisrt != null && this.mIvEditFirst != null) {
                this.processState = 104;
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.mIvEditFirst, View.SCALE_X, new float[]{1.0f, 0.2f});
                ObjectAnimator ofFloat2 = ObjectAnimator.ofFloat(this.mIvEditFirst, View.SCALE_Y, new float[]{1.0f, 0.2f});
                ObjectAnimator ofFloat3 = ObjectAnimator.ofFloat(this.mIvEditFirst, View.ALPHA, new float[]{1.0f, 0.0f});
                ObjectAnimator ofFloat4 = ObjectAnimator.ofFloat(this.mIvEditFirst, "translationX", new float[]{0.0f, 25.0f});
                ObjectAnimator ofFloat5 = ObjectAnimator.ofFloat(this.mIvEditFirst, "translationY", new float[]{0.0f, 85.0f});
                AnimatorSet animatorSet = new AnimatorSet();
                animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2, ofFloat3, ofFloat4, ofFloat5});
                animatorSet.setDuration(150);
                animatorSet.setInterpolator(new DecelerateInterpolator());
                animatorSet.addListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        super.onAnimationEnd(animator);
                        BubblePop.this.mIvEditFirst.setVisibility(4);
                    }

                    public void onAnimationStart(Animator animator) {
                        super.onAnimationStart(animator);
                    }
                });
                AnimatorSet animatorSet2 = new AnimatorSet();
                animatorSet2.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.SCALE_X, new float[]{1.0f, 0.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.SCALE_Y, new float[]{1.0f, 0.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.ALPHA, new float[]{1.0f, 0.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, "translationX", new float[]{0.0f, -25.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, "translationY", new float[]{0.0f, 85.0f})});
                animatorSet2.setDuration(150);
                animatorSet2.addListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animator) {
                        super.onAnimationEnd(animator);
                        BubblePop.this.layoutParamsEdit.leftMargin = BubblePop.this.mLocationSelect[0];
                        BubblePop.this.layoutParamsEdit.topMargin = BubblePop.this.mLocationSelect[1];
                        BubblePop.this.mIvDeleteFisrt.setVisibility(4);
                        BubblePop.this.mLocationSelect[2] = -1;
                        BubblePop.this.mLocationSelect[0] = -1;
                        BubblePop.this.mLocationSelect[1] = -1;
                        String str = BubbleEditMimojiPresenter.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("HASH CODE");
                        sb.append(BubblePop.this.mHashCode);
                        sb.append("hide ani end:");
                        sb.append(BubblePop.this.mLocationSelect[2]);
                        Log.i(str, sb.toString());
                    }

                    public void onAnimationStart(Animator animator) {
                        super.onAnimationStart(animator);
                    }
                });
                animatorSet.start();
                animatorSet2.start();
            }
        }

        public void processBubbleAni(int i, int i2, int i3) {
            this.mHashCode = i3;
            if (!this.hasAddView) {
                this.mRootView.addView(this.mIvEditFirst);
                this.mRootView.addView(this.mIvDeleteFisrt);
                this.hasAddView = true;
            }
            String str = BubbleEditMimojiPresenter.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("HASH CODE");
            sb.append(this.mHashCode);
            sb.append("init x：");
            sb.append(this.mLocationSelect[0]);
            sb.append("---");
            sb.append(i2);
            sb.append("init y：");
            sb.append(this.mLocationSelect[1]);
            sb.append("---");
            sb.append(i);
            Log.i(str, sb.toString());
            if (this.mLocationSelect[2] > 0) {
                hideBubbleAni();
            } else {
                showBubbleAni(i2, i);
            }
        }

        public void showBubbleAni(int i, int i2) {
            int i3 = i;
            int i4 = i2;
            this.processState = 103;
            this.mLocationSelect[0] = i3;
            this.mLocationSelect[1] = i4;
            String str = BubbleEditMimojiPresenter.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("HASH CODE");
            sb.append(this.mHashCode);
            sb.append("show111x=");
            sb.append(this.mLocationSelect[0]);
            sb.append("show111y=");
            sb.append(this.mLocationSelect[1]);
            Log.i(str, sb.toString());
            this.layoutParamsEdit.topMargin = i4;
            this.layoutParamsEdit.leftMargin = i3;
            this.mIvEditFirst.setLayoutParams(this.layoutParamsEdit);
            this.mIvEditFirst.setLeft(i3);
            this.layoutParamsDelete.topMargin = i4;
            this.layoutParamsDelete.leftMargin = i3;
            this.mIvDeleteFisrt.setLayoutParams(this.layoutParamsDelete);
            this.mIvEditFirst.setVisibility(0);
            this.mIvDeleteFisrt.setVisibility(0);
            ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.mIvEditFirst, View.SCALE_X, new float[]{0.0f, 1.0f});
            ObjectAnimator ofFloat2 = ObjectAnimator.ofFloat(this.mIvEditFirst, View.SCALE_Y, new float[]{0.0f, 1.0f});
            ObjectAnimator ofFloat3 = ObjectAnimator.ofFloat(this.mIvEditFirst, View.ALPHA, new float[]{0.0f, 1.0f});
            ObjectAnimator ofFloat4 = ObjectAnimator.ofFloat(this.mIvEditFirst, "translationX", new float[]{0.0f, -25.0f});
            ObjectAnimator ofFloat5 = ObjectAnimator.ofFloat(this.mIvEditFirst, "translationY", new float[]{0.0f, -85.0f});
            AnimatorSet animatorSet = new AnimatorSet();
            animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2, ofFloat3, ofFloat4, ofFloat5});
            animatorSet.setDuration(300);
            animatorSet.setInterpolator(new DecelerateInterpolator());
            animatorSet.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    BubblePop.this.mIvEditFirst.setVisibility(0);
                }

                public void onAnimationStart(Animator animator) {
                    super.onAnimationStart(animator);
                    BubblePop.this.layoutParamsEdit.leftMargin = BubblePop.this.mLocationSelect[0] - 25;
                    BubblePop.this.layoutParamsEdit.topMargin = BubblePop.this.mLocationSelect[1] - 85;
                    BubblePop.this.mIvEditFirst.setVisibility(0);
                }
            });
            AnimatorSet animatorSet2 = new AnimatorSet();
            animatorSet2.playTogether(new Animator[]{ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.SCALE_X, new float[]{0.0f, 1.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.SCALE_Y, new float[]{0.0f, 1.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, View.ALPHA, new float[]{0.0f, 1.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, "translationX", new float[]{0.0f, 25.0f}), ObjectAnimator.ofFloat(this.mIvDeleteFisrt, "translationY", new float[]{0.0f, -85.0f})});
            animatorSet2.setDuration(300);
            animatorSet2.addListener(new AnimatorListenerAdapter() {
                public void onAnimationEnd(Animator animator) {
                    super.onAnimationEnd(animator);
                    BubblePop.this.mLocationSelect[2] = 1;
                    BubblePop.this.mIvDeleteFisrt.setVisibility(0);
                    String str = BubbleEditMimojiPresenter.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("HASH CODE--");
                    sb.append(BubblePop.this.mHashCode);
                    sb.append(" start ani end:");
                    sb.append(BubblePop.this.mLocationSelect[2]);
                    Log.i(str, sb.toString());
                }

                public void onAnimationStart(Animator animator) {
                    super.onAnimationStart(animator);
                    BubblePop.this.layoutParamsDelete.leftMargin = BubblePop.this.mLocationSelect[0] + 25;
                    BubblePop.this.layoutParamsDelete.topMargin = BubblePop.this.mLocationSelect[1] - 85;
                    BubblePop.this.mIvDeleteFisrt.setVisibility(0);
                }
            });
            animatorSet.start();
            animatorSet2.start();
        }
    }

    BubbleEditMimojiPresenter(Context context, OnClickListener onClickListener, RelativeLayout relativeLayout) {
        this.mContext = context;
        this.bubblePop1 = new BubblePop(this.mContext, onClickListener, relativeLayout);
        this.bubblePop2 = new BubblePop(this.mContext, onClickListener, relativeLayout);
    }

    public void processBubbleAni(int i, int i2) {
        if (-2 == i && -2 == i2) {
            if (this.bubblePop2.getProcessState() == 103) {
                this.bubblePop2.processBubbleAni(i2, i, this.bubblePop2.hashCode());
            }
            if (this.bubblePop1.getProcessState() == 103) {
                this.bubblePop1.processBubbleAni(i2, i, this.bubblePop2.hashCode());
            }
            return;
        }
        if (this.bubblePop1.mLocationSelect[0] == i && this.bubblePop1.mLocationSelect[1] == i2) {
            this.bubblePop1.processBubbleAni(i2, i, this.bubblePop1.hashCode());
        } else if (this.bubblePop2.mLocationSelect[0] == i && this.bubblePop2.mLocationSelect[1] == i2) {
            this.bubblePop2.processBubbleAni(i2, i, this.bubblePop1.hashCode());
        } else if (this.bubblePop1.mLocationSelect[0] == -1 && this.bubblePop1.mLocationSelect[1] == -1) {
            this.bubblePop1.processBubbleAni(i2, i, this.bubblePop1.hashCode());
            if (this.bubblePop2.getProcessState() == 103) {
                this.bubblePop2.processBubbleAni(i2, i, this.bubblePop2.hashCode());
            }
        } else {
            this.bubblePop1.processBubbleAni(i2, i, this.bubblePop1.hashCode());
            this.bubblePop2.processBubbleAni(i2, i, this.bubblePop2.hashCode());
        }
    }
}
