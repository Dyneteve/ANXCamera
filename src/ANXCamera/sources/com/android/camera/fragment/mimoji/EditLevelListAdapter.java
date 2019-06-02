package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.fragment.mimoji.ColorListAdapter.OnItemClickListener;
import com.android.camera.log.Log;
import com.android.camera.ui.baseview.BaseGridLayoutManager;
import com.android.camera.ui.baseview.OnRecyclerItemClickListener;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.util.AvatarConfigUtils;
import com.arcsoft.avatar.util.LOG;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class EditLevelListAdapter extends Adapter<ViewHolder> {
    private static final int LIST_COLUMN_NUM = 3;
    /* access modifiers changed from: private */
    public static final String TAG = EditLevelListAdapter.class.getSimpleName();
    private AtomicBoolean isColorNeedNotify = new AtomicBoolean(true);
    private AvatarConfigItemClick mAvatarConfigItemClick = new AvatarConfigItemClick() {
        public void onConfigItemClick(ASAvatarConfigInfo aSAvatarConfigInfo, boolean z, int i) {
            if (aSAvatarConfigInfo == null) {
                Log.d(EditLevelListAdapter.TAG, "onConfigItemClick, ASAvatarConfigInfo is null");
                return;
            }
            String access$200 = EditLevelListAdapter.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onConfigItemClick, ASAvatarConfigInfo = ");
            sb.append(aSAvatarConfigInfo);
            Log.d(access$200, sb.toString());
            EditLevelListAdapter.this.mItfGvOnItemClickListener.notifyUIChanged();
            AvatarEngineManager.getInstance().setAllNeedUpdate(true, z);
            AvatarEngineManager.getInstance().addAvatarConfig(aSAvatarConfigInfo);
            AvatarConfigUtils.updateConfigID(aSAvatarConfigInfo.configType, aSAvatarConfigInfo.configID, AvatarEngineManager.getInstance().getASAvatarConfigValue());
            EditLevelListAdapter.this.mRenderThread.setConfig(aSAvatarConfigInfo);
            if (z) {
                if (!EditLevelListAdapter.this.mRenderThread.getIsRendering()) {
                    EditLevelListAdapter.this.mRenderThread.draw(false);
                } else {
                    EditLevelListAdapter.this.mRenderThread.setStopRender(true);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public ClickCheck mClickCheck;
    private Context mContext;
    /* access modifiers changed from: private */
    public ItfGvOnItemClickListener mItfGvOnItemClickListener;
    private volatile List<MimojiLevelBean> mLevelDatas;
    private MimojiLevelBean mMimojiLevelBean;
    private List<MimojiThumbnailRecyclerAdapter> mMimojiThumbnailAdapters;
    /* access modifiers changed from: private */
    public MimojiThumbnailRenderThread mRenderThread;

    public class ViewHolder extends android.support.v7.widget.RecyclerView.ViewHolder {
        RecyclerView mColorRecycleView;
        RecyclerView mThumbnailGV;
        TextView mTvSubTitle;

        public ViewHolder(View view) {
            super(view);
            this.mTvSubTitle = (TextView) view.findViewById(R.id.tv_subtitle);
            this.mColorRecycleView = (RecyclerView) view.findViewById(R.id.color_select);
            this.mThumbnailGV = (RecyclerView) view.findViewById(R.id.thumbnail_gride_view);
        }
    }

    EditLevelListAdapter(Context context, ItfGvOnItemClickListener itfGvOnItemClickListener) {
        this.mContext = context;
        this.mLevelDatas = Collections.synchronizedList(new ArrayList());
        this.mMimojiThumbnailAdapters = Collections.synchronizedList(new ArrayList());
        this.mItfGvOnItemClickListener = itfGvOnItemClickListener;
    }

    /* access modifiers changed from: private */
    public void onGvItemClick(int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("outerPosition = ");
        sb.append(i);
        sb.append(" Select index = ");
        sb.append(i2);
        LOG.d(str, sb.toString());
        if (this.mLevelDatas == null || i < 0 || i >= this.mLevelDatas.size()) {
            Log.e(TAG, "gv mLevelDatas error");
            return;
        }
        MimojiLevelBean mimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        if (i2 >= 0 && i2 < mimojiLevelBean.thumnails.size()) {
            ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2);
            AvatarEngineManager.getInstance().setInnerConfigSelectIndex(mimojiLevelBean.configType, (float) i2);
            if (aSAvatarConfigInfo != null) {
                this.mAvatarConfigItemClick.onConfigItemClick(aSAvatarConfigInfo, false, i);
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x00a3  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x00ff  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private synchronized void showColor(ViewHolder viewHolder, MimojiLevelBean mimojiLevelBean, int i) {
        LinearLayoutManagerWrapper colorLayoutManagerMap;
        int i2;
        RecyclerView recyclerView = viewHolder.mColorRecycleView;
        TextView textView = viewHolder.mTvSubTitle;
        int itemCount = getItemCount();
        AvatarEngineManager.getInstance();
        if (AvatarEngineManager.showConfigTypeName(mimojiLevelBean.configType)) {
            textView.setVisibility(0);
            textView.setText(this.mMimojiLevelBean.configTypeName);
        } else {
            textView.setVisibility(8);
        }
        ArrayList colorConfigInfos = mimojiLevelBean.getColorConfigInfos();
        if (colorConfigInfos != null && AvatarEngineManager.getInstance().getColorType(mimojiLevelBean.configType) >= 0) {
            if (colorConfigInfos.size() != 0) {
                recyclerView.setVisibility(0);
                if ((!this.isColorNeedNotify.get() || recyclerView.getChildCount() == 0) && recyclerView.getVisibility() == 0) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("fmoji topic:");
                    sb.append(mimojiLevelBean.configTypeName);
                    sb.append("----");
                    sb.append(mimojiLevelBean.configType);
                    sb.append("----");
                    AvatarEngineManager.getInstance();
                    sb.append(AvatarEngineManager.showConfigTypeName(mimojiLevelBean.configType));
                    Log.i(str, sb.toString());
                    colorLayoutManagerMap = AvatarEngineManager.getInstance().getColorLayoutManagerMap(recyclerView.hashCode() + i);
                    if (recyclerView.getLayoutManager() == null || colorLayoutManagerMap == null) {
                        if (colorLayoutManagerMap == null) {
                            colorLayoutManagerMap = new LinearLayoutManagerWrapper(this.mContext, "color_select");
                            colorLayoutManagerMap.setOrientation(0);
                            AvatarEngineManager.getInstance().putColorLayoutManagerMap(recyclerView.hashCode() + i, colorLayoutManagerMap);
                        }
                        recyclerView.setLayoutManager(colorLayoutManagerMap);
                    }
                    final ColorListAdapter colorListAdapter = new ColorListAdapter(this.mContext, this.mAvatarConfigItemClick, colorLayoutManagerMap);
                    colorListAdapter.setClickCheck(this.mClickCheck);
                    colorListAdapter.setOnItemClickListener(new OnItemClickListener() {
                        public void onItemClick(int i) {
                            if (EditLevelListAdapter.this.mClickCheck == null || EditLevelListAdapter.this.mClickCheck.checkClickable()) {
                                LinearLayoutManagerWrapper linearLayoutManagerWrapper = colorListAdapter.getmLinearLayoutManagerWrapper();
                                if (linearLayoutManagerWrapper != null) {
                                    if (i == linearLayoutManagerWrapper.findFirstVisibleItemPosition() || i == linearLayoutManagerWrapper.findFirstCompletelyVisibleItemPosition()) {
                                        linearLayoutManagerWrapper.scrollToPosition(Math.max(0, i - 1));
                                    } else if (i == linearLayoutManagerWrapper.findLastVisibleItemPosition() || i == linearLayoutManagerWrapper.findLastCompletelyVisibleItemPosition()) {
                                        linearLayoutManagerWrapper.scrollToPosition(Math.min(i + 1, colorListAdapter.getItemCount() - 1));
                                    }
                                }
                            }
                        }
                    });
                    recyclerView.setAdapter(colorListAdapter);
                    colorListAdapter.setData(colorConfigInfos);
                    float innerConfigSelectIndex = AvatarEngineManager.getInstance().getInnerConfigSelectIndex(((ASAvatarConfigInfo) colorConfigInfos.get(0)).configType);
                    int i3 = this.mContext.getResources().getDisplayMetrics().widthPixels;
                    int i4 = 0;
                    for (i2 = 0; i2 < colorConfigInfos.size(); i2++) {
                        if (innerConfigSelectIndex == ((float) ((ASAvatarConfigInfo) colorConfigInfos.get(i2)).configID)) {
                            i4 = i2;
                        }
                    }
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("fmoji show color :");
                    sb2.append(mimojiLevelBean.configTypeName);
                    sb2.append("color size:");
                    sb2.append(colorConfigInfos.size());
                    sb2.append(" colorSelectPositon : ");
                    sb2.append(i4);
                    sb2.append("   curHolderPosition : ");
                    sb2.append(i);
                    Log.i(str2, sb2.toString());
                    colorLayoutManagerMap.scrollToPositionWithOffset(i4, i3 / 2);
                    if (this.isColorNeedNotify.get() && i >= itemCount - 1) {
                        this.isColorNeedNotify.set(false);
                    }
                } else {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("fmoji show color isColorNeedNotify : ");
                    sb3.append(this.isColorNeedNotify.get());
                    LOG.d(str3, sb3.toString());
                }
            }
        }
        recyclerView.setVisibility(8);
        if (!this.isColorNeedNotify.get()) {
        }
        String str4 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("fmoji topic:");
        sb4.append(mimojiLevelBean.configTypeName);
        sb4.append("----");
        sb4.append(mimojiLevelBean.configType);
        sb4.append("----");
        AvatarEngineManager.getInstance();
        sb4.append(AvatarEngineManager.showConfigTypeName(mimojiLevelBean.configType));
        Log.i(str4, sb4.toString());
        colorLayoutManagerMap = AvatarEngineManager.getInstance().getColorLayoutManagerMap(recyclerView.hashCode() + i);
        if (colorLayoutManagerMap == null) {
        }
        recyclerView.setLayoutManager(colorLayoutManagerMap);
        final ColorListAdapter colorListAdapter2 = new ColorListAdapter(this.mContext, this.mAvatarConfigItemClick, colorLayoutManagerMap);
        colorListAdapter2.setClickCheck(this.mClickCheck);
        colorListAdapter2.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(int i) {
                if (EditLevelListAdapter.this.mClickCheck == null || EditLevelListAdapter.this.mClickCheck.checkClickable()) {
                    LinearLayoutManagerWrapper linearLayoutManagerWrapper = colorListAdapter2.getmLinearLayoutManagerWrapper();
                    if (linearLayoutManagerWrapper != null) {
                        if (i == linearLayoutManagerWrapper.findFirstVisibleItemPosition() || i == linearLayoutManagerWrapper.findFirstCompletelyVisibleItemPosition()) {
                            linearLayoutManagerWrapper.scrollToPosition(Math.max(0, i - 1));
                        } else if (i == linearLayoutManagerWrapper.findLastVisibleItemPosition() || i == linearLayoutManagerWrapper.findLastCompletelyVisibleItemPosition()) {
                            linearLayoutManagerWrapper.scrollToPosition(Math.min(i + 1, colorListAdapter2.getItemCount() - 1));
                        }
                    }
                }
            }
        });
        recyclerView.setAdapter(colorListAdapter2);
        colorListAdapter2.setData(colorConfigInfos);
        float innerConfigSelectIndex2 = AvatarEngineManager.getInstance().getInnerConfigSelectIndex(((ASAvatarConfigInfo) colorConfigInfos.get(0)).configType);
        int i32 = this.mContext.getResources().getDisplayMetrics().widthPixels;
        int i42 = 0;
        while (i2 < colorConfigInfos.size()) {
        }
        String str22 = TAG;
        StringBuilder sb22 = new StringBuilder();
        sb22.append("fmoji show color :");
        sb22.append(mimojiLevelBean.configTypeName);
        sb22.append("color size:");
        sb22.append(colorConfigInfos.size());
        sb22.append(" colorSelectPositon : ");
        sb22.append(i42);
        sb22.append("   curHolderPosition : ");
        sb22.append(i);
        Log.i(str22, sb22.toString());
        colorLayoutManagerMap.scrollToPositionWithOffset(i42, i32 / 2);
        this.isColorNeedNotify.set(false);
    }

    public boolean getIsColorNeedNotify() {
        return this.isColorNeedNotify.get();
    }

    public int getItemCount() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mLevelDatas getItemCount size: ");
        sb.append(this.mLevelDatas.size());
        Log.i(str, sb.toString());
        if (this.mLevelDatas == null) {
            return 0;
        }
        return this.mLevelDatas.size();
    }

    public void notifyThumbnailUpdate(int i, int i2, int i3) {
        if (i != AvatarEngineManager.getInstance().getSelectType()) {
            Log.d(TAG, "update wrong !!!!");
            return;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("notifyThumbnailUpdate.... index = ");
        sb.append(i2);
        sb.append(", position = ");
        sb.append(i3);
        Log.d(str, sb.toString());
        if (this.mLevelDatas == null || this.mLevelDatas.size() == 0 || i2 > this.mLevelDatas.size() - 1) {
            Log.e(TAG, "mLevelDatas Exception !!!!");
        } else if (this.mMimojiThumbnailAdapters == null || i2 < 0 || i2 > this.mMimojiThumbnailAdapters.size() - 1) {
            Log.e(TAG, "mHandler message error !!!!");
        } else {
            this.mMimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i2);
            ArrayList<ASAvatarConfigInfo> arrayList = this.mMimojiLevelBean.thumnails;
            MimojiThumbnailRecyclerAdapter mimojiThumbnailRecyclerAdapter = (MimojiThumbnailRecyclerAdapter) this.mMimojiThumbnailAdapters.get(i2);
            if (arrayList == null || i3 < 0 || i3 >= arrayList.size()) {
                Log.e(TAG, "fmoji position message error !!!!");
            } else {
                mimojiThumbnailRecyclerAdapter.updateData(i3, (ASAvatarConfigInfo) arrayList.get(i3));
            }
        }
    }

    public void onBindViewHolder(@NonNull ViewHolder viewHolder, final int i) {
        this.mMimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        RecyclerView recyclerView = viewHolder.mThumbnailGV;
        showColor(viewHolder, this.mMimojiLevelBean, i);
        if (i < this.mMimojiThumbnailAdapters.size()) {
            int i2 = 0;
            int size = this.mMimojiLevelBean.thumnails == null ? 0 : this.mMimojiLevelBean.thumnails.size();
            if (size == 0) {
                recyclerView.setVisibility(8);
                return;
            }
            recyclerView.setVisibility(0);
            final MimojiThumbnailRecyclerAdapter mimojiThumbnailRecyclerAdapter = (MimojiThumbnailRecyclerAdapter) this.mMimojiThumbnailAdapters.get(i);
            recyclerView.setNestedScrollingEnabled(false);
            recyclerView.getItemAnimator().setChangeDuration(0);
            recyclerView.getItemAnimator().setRemoveDuration(0);
            recyclerView.getItemAnimator().setMoveDuration(0);
            if (recyclerView.getLayoutManager() == null) {
                recyclerView.setLayoutManager(new BaseGridLayoutManager(this.mContext, 3));
            }
            recyclerView.setAdapter(mimojiThumbnailRecyclerAdapter);
            LayoutParams layoutParams = recyclerView.getLayoutParams();
            int i3 = size / 3;
            if (size % 3 != 0) {
                i2 = 1;
            }
            int i4 = i3 + i2;
            layoutParams.height = (this.mContext.getResources().getDimensionPixelSize(R.dimen.mimoji_level_icon_size) * i4) + (this.mContext.getResources().getDimensionPixelSize(R.dimen.mimoji_level_icon_margin) * (i4 - 1));
            recyclerView.setLayoutParams(layoutParams);
            mimojiThumbnailRecyclerAdapter.setOnRecyclerItemClickListener(new OnRecyclerItemClickListener<ASAvatarConfigInfo>() {
                public void OnRecyclerItemClickListener(ASAvatarConfigInfo aSAvatarConfigInfo, int i) {
                    if (EditLevelListAdapter.this.mClickCheck == null || EditLevelListAdapter.this.mClickCheck.checkClickable()) {
                        EditLevelListAdapter.this.onGvItemClick(i, i);
                        EditLevelListAdapter.this.updateSelectView(mimojiThumbnailRecyclerAdapter, i, i);
                    }
                }
            });
            return;
        }
        recyclerView.setVisibility(8);
    }

    @NonNull
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return new ViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.mimoji_edit_level_item, viewGroup, false));
    }

    public synchronized void refreshData(List<MimojiLevelBean> list, boolean z, boolean z2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mLevelDatas refreshData list size: ");
        sb.append(list.size());
        sb.append("   mLevelDatas size");
        sb.append(this.mLevelDatas.size());
        sb.append("  isColor : ");
        sb.append(z2);
        sb.append("   loadThumbnailFromCache : ");
        sb.append(z);
        Log.i(str, sb.toString());
        if (list != null) {
            if (list.size() != 0) {
                int i = 0;
                if (this.mLevelDatas == null || this.mLevelDatas.size() != list.size() || this.mMimojiThumbnailAdapters.size() == 0 || ((MimojiThumbnailRecyclerAdapter) this.mMimojiThumbnailAdapters.get(0)).getItemCount() <= 0 || getItemCount() == 0) {
                    z2 = false;
                }
                if (z2) {
                    while (true) {
                        if (i >= list.size()) {
                            break;
                        } else if (i >= this.mMimojiThumbnailAdapters.size()) {
                            break;
                        } else {
                            if (z) {
                                ((MimojiThumbnailRecyclerAdapter) this.mMimojiThumbnailAdapters.get(i)).setDataList(((MimojiLevelBean) list.get(i)).thumnails);
                            }
                            i++;
                        }
                    }
                } else {
                    this.mLevelDatas.clear();
                    this.mLevelDatas.addAll(list);
                    this.mMimojiThumbnailAdapters.clear();
                    while (i < this.mLevelDatas.size()) {
                        this.mMimojiThumbnailAdapters.add(new MimojiThumbnailRecyclerAdapter(this.mContext, ((MimojiLevelBean) this.mLevelDatas.get(i)).configType));
                        i++;
                    }
                    notifyDataSetChanged();
                }
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("fmoji refreshData isColorNeedNotify = ");
                sb2.append(this.isColorNeedNotify.get());
                Log.d(str2, sb2.toString());
                return;
            }
        }
        Log.i(TAG, "mLevelDatas refreshData list size error");
    }

    public void setIsColorNeedNotify(boolean z) {
        this.isColorNeedNotify.set(z);
    }

    public void setRenderThread(MimojiThumbnailRenderThread mimojiThumbnailRenderThread) {
        this.mRenderThread = mimojiThumbnailRenderThread;
    }

    public void setmClickCheck(ClickCheck clickCheck) {
        this.mClickCheck = clickCheck;
    }

    public void updateSelectView(MimojiThumbnailRecyclerAdapter mimojiThumbnailRecyclerAdapter, int i, int i2) {
        MimojiLevelBean mimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        if (i2 < mimojiLevelBean.thumnails.size()) {
            String str = FragmentMimojiEdit.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("click Thumbnail configType:");
            sb.append(this.mMimojiLevelBean.configType);
            sb.append(" configName:");
            sb.append(this.mMimojiLevelBean.configTypeName);
            sb.append("configId :");
            sb.append(((ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2)).configID);
            Log.i(str, sb.toString());
            mimojiThumbnailRecyclerAdapter.setSelectItem(mimojiLevelBean.configType, ((ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2)).configID);
            mimojiThumbnailRecyclerAdapter.notifyDataSetChanged();
        }
    }
}
