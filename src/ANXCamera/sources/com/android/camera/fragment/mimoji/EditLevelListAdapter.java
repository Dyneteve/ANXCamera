package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.GridView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.log.Log;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.util.AvatarConfigUtils;
import com.arcsoft.avatar.util.LOG;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class EditLevelListAdapter extends Adapter<ViewHolder> {
    /* access modifiers changed from: private */
    public static final String TAG = EditLevelListAdapter.class.getSimpleName();
    private AvatarConfigItemClick mAvatarConfigItemClick = new AvatarConfigItemClick() {
        public void onConfigItemClick(ASAvatarConfigInfo aSAvatarConfigInfo, boolean z) {
            String access$200 = EditLevelListAdapter.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onConfigItemClick, ASAvatarConfigInfo = ");
            sb.append(aSAvatarConfigInfo);
            Log.d(access$200, sb.toString());
            AvatarEngineManager.getInstance().setAllNeedUpdate(true, z);
            AvatarEngineManager.getInstance().queryAvatar().setConfig(aSAvatarConfigInfo);
            AvatarConfigUtils.updateConfigID(aSAvatarConfigInfo.configType, aSAvatarConfigInfo.configID, AvatarEngineManager.getInstance().getASAvatarConfigValue());
            EditLevelListAdapter.this.mRenderThread.setConfig(aSAvatarConfigInfo);
            if (!z) {
                return;
            }
            if (!EditLevelListAdapter.this.mRenderThread.getIsRendering()) {
                EditLevelListAdapter.this.mRenderThread.draw();
            } else {
                EditLevelListAdapter.this.mRenderThread.setStopRender(true);
            }
        }
    };
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public ItfGvOnItemClickListener mItfGvOnItemClickListener;
    private volatile List<MimojiLevelBean> mLevelDatas;
    private MimojiLevelBean mMimojiLevelBean;
    private List<MimojiThumbnailAdapter> mMimojiThumbnailAdapters;
    /* access modifiers changed from: private */
    public MimojiThumbnailRenderThread mRenderThread;

    public class ViewHolder extends android.support.v7.widget.RecyclerView.ViewHolder {
        RecyclerView mColorRecycleView;
        View mDividerView;
        GridView mThumbnailGV;
        TextView mTvSubTitle;

        public ViewHolder(View view) {
            super(view);
            this.mTvSubTitle = (TextView) view.findViewById(R.id.tv_subtitle);
            this.mColorRecycleView = (RecyclerView) view.findViewById(R.id.color_select);
            LinearLayoutManagerWrapper linearLayoutManagerWrapper = new LinearLayoutManagerWrapper(EditLevelListAdapter.this.mContext, "color_select");
            linearLayoutManagerWrapper.setOrientation(0);
            this.mColorRecycleView.setLayoutManager(linearLayoutManagerWrapper);
            this.mThumbnailGV = (GridView) view.findViewById(R.id.thumbnail_gride_view);
            this.mDividerView = view.findViewById(R.id.view_divider);
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
        MimojiLevelBean mimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        if (i2 < mimojiLevelBean.thumnails.size()) {
            ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2);
            AvatarEngineManager.getInstance().setInnerConfigSelectIndex(mimojiLevelBean.configType, (float) i2);
            this.mAvatarConfigItemClick.onConfigItemClick(aSAvatarConfigInfo, false);
        }
    }

    private void showColor(ViewHolder viewHolder, MimojiLevelBean mimojiLevelBean) {
        RecyclerView recyclerView = viewHolder.mColorRecycleView;
        ColorListAdapter colorListAdapter = new ColorListAdapter(this.mContext, this.mAvatarConfigItemClick);
        recyclerView.setAdapter(colorListAdapter);
        TextView textView = viewHolder.mTvSubTitle;
        AvatarEngineManager.getInstance();
        if (AvatarEngineManager.showConfigTypeName(mimojiLevelBean.configType)) {
            textView.setVisibility(0);
        } else {
            textView.setVisibility(8);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("小标题:");
        sb.append(mimojiLevelBean.configTypeName);
        sb.append("----");
        sb.append(mimojiLevelBean.configType);
        sb.append("----");
        AvatarEngineManager.getInstance();
        sb.append(AvatarEngineManager.showConfigTypeName(mimojiLevelBean.configType));
        Log.i(str, sb.toString());
        textView.setText(this.mMimojiLevelBean.configTypeName);
        if (AvatarEngineManager.getInstance().getColorType(mimojiLevelBean.configType) < 0) {
            recyclerView.setVisibility(8);
            return;
        }
        recyclerView.setVisibility(0);
        ArrayList colorConfigInfos = mimojiLevelBean.getColorConfigInfos();
        if (colorConfigInfos == null) {
            recyclerView.setVisibility(8);
            return;
        }
        if (colorConfigInfos.size() == 0) {
            recyclerView.setVisibility(8);
        } else if (colorConfigInfos.size() > 0) {
            recyclerView.setVisibility(0);
            colorListAdapter.updateData(colorConfigInfos);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("颜色show:");
            sb2.append(mimojiLevelBean.configTypeName);
            sb2.append("列表大小:");
            sb2.append(colorConfigInfos.size());
            Log.i(str2, sb2.toString());
        }
    }

    private void showDivider(ViewHolder viewHolder, MimojiLevelBean mimojiLevelBean, int i) {
        View view = viewHolder.mDividerView;
        if (this.mLevelDatas != null) {
            if (this.mLevelDatas.size() <= 1) {
                view.setVisibility(8);
            } else if (i == 0) {
                view.setVisibility(8);
            } else {
                view.setVisibility(0);
            }
        }
    }

    public int getItemCount() {
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
        if (this.mLevelDatas.size() == 0) {
            Log.e(TAG, "mLevelDatas Exception !!!!");
            return;
        }
        this.mMimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i2);
        ((MimojiThumbnailAdapter) this.mMimojiThumbnailAdapters.get(i2)).addData((ASAvatarConfigInfo) this.mMimojiLevelBean.thumnails.get(i3));
    }

    public void onBindViewHolder(@NonNull ViewHolder viewHolder, final int i) {
        this.mMimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        GridView gridView = viewHolder.mThumbnailGV;
        final MimojiThumbnailAdapter mimojiThumbnailAdapter = (MimojiThumbnailAdapter) this.mMimojiThumbnailAdapters.get(i);
        ArrayList<ASAvatarConfigInfo> arrayList = this.mMimojiLevelBean.thumnails;
        showColor(viewHolder, this.mMimojiLevelBean);
        showDivider(viewHolder, this.mMimojiLevelBean, i);
        gridView.setAdapter(mimojiThumbnailAdapter);
        MeatureViewHeightWeight.setGridViewHeightBasedOnChildren(this.mContext, gridView, arrayList == null ? 0 : arrayList.size());
        gridView.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                EditLevelListAdapter.this.onGvItemClick(i, i);
                EditLevelListAdapter.this.mItfGvOnItemClickListener.notifyUIChanged();
                EditLevelListAdapter.this.updateSelectView(mimojiThumbnailAdapter, i, i);
            }
        });
    }

    @NonNull
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return new ViewHolder(View.inflate(this.mContext, R.layout.mimoji_edit_level_item, null));
    }

    public void refreshData(List<MimojiLevelBean> list, boolean z) {
        this.mLevelDatas.clear();
        this.mLevelDatas.addAll(list);
        this.mMimojiThumbnailAdapters.clear();
        for (int i = 0; i < list.size(); i++) {
            MimojiThumbnailAdapter mimojiThumbnailAdapter = new MimojiThumbnailAdapter(this.mContext, ((MimojiLevelBean) list.get(i)).configType);
            this.mMimojiThumbnailAdapters.add(mimojiThumbnailAdapter);
            if (z) {
                mimojiThumbnailAdapter.refreshData(((MimojiLevelBean) list.get(i)).thumnails);
            }
        }
        notifyDataSetChanged();
    }

    public void setRenderThread(MimojiThumbnailRenderThread mimojiThumbnailRenderThread) {
        this.mRenderThread = mimojiThumbnailRenderThread;
    }

    public void updateSelectView(MimojiThumbnailAdapter mimojiThumbnailAdapter, int i, int i2) {
        MimojiLevelBean mimojiLevelBean = (MimojiLevelBean) this.mLevelDatas.get(i);
        String str = FragmentMimojiEdit.TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("点击的子Thumbnail configType:");
        sb.append(this.mMimojiLevelBean.configType);
        sb.append(" configName:");
        sb.append(this.mMimojiLevelBean.configTypeName);
        sb.append("configId :");
        sb.append(((ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2)).configID);
        Log.i(str, sb.toString());
        mimojiThumbnailAdapter.setSelectItem(mimojiLevelBean.configType, ((ASAvatarConfigInfo) mimojiLevelBean.thumnails.get(i2)).configID);
        mimojiThumbnailAdapter.notifyDataSetChanged();
    }
}
