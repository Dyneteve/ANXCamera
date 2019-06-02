package com.android.camera.fragment.sticker;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.fragment.sticker.BaseSelectAdapter.BaseSelectHolder;
import com.android.camera.fragment.sticker.BaseSelectAdapter.ItemSelectChangeListener;
import com.android.camera.fragment.sticker.StickerAdapter.StickerHolder;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.network.resource.DownloadHelper;
import com.android.camera.network.resource.OnDownloadListener;
import com.android.camera.network.resource.Resource;
import com.android.camera.network.resource.ResourceDownloadManager;
import com.android.camera.network.resource.StickerResourceRequest;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.android.camera.sticker.StickerHelper;
import com.android.camera.sticker.StickerInfo;
import java.util.List;

public class FragmentStickerPager extends Fragment {
    private static final int MSG_NOTIFY_ITEM = 1;
    private static final int MSG_NOTIFY_LIST = 2;
    private static final String TAG = "FragmentStickerPager";
    /* access modifiers changed from: private */
    public StickerAdapter mAdapter;
    /* access modifiers changed from: private */
    public DownloadHelper mDefaultDownloadHelper = new DownloadHelper() {
        public String getDownloadPath(Resource resource) {
            return StickerHelper.getInstance().getStickerPath(resource.id);
        }
    };
    private OnDownloadListener mDownloadListener = new OnDownloadListener() {
        public void onFinish(long j, int i) {
            String str = FragmentStickerPager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append(j);
            sb.append(":");
            sb.append(i);
            Log.i(str, sb.toString());
            for (int i2 = 0; i2 < FragmentStickerPager.this.mList.size(); i2++) {
                if (((StickerInfo) FragmentStickerPager.this.mList.get(i2)).id == j) {
                    ((StickerInfo) FragmentStickerPager.this.mList.get(i2)).downloadState = i;
                    Message.obtain(FragmentStickerPager.this.mHandler, 1, i2, 0).sendToTarget();
                }
            }
        }

        public void onProgressUpdate(long j, int i) {
            String str = FragmentStickerPager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append(i);
            sb.append("");
            Log.i(str, sb.toString());
        }
    };
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    FragmentStickerPager.this.mAdapter.notifyItemChanged(message.arg1);
                    Log.i(FragmentStickerPager.TAG, "MSG_NOTIFY_ITEM");
                    break;
                case 2:
                    FragmentStickerPager.this.mAdapter.notifyDataSetChanged();
                    break;
            }
            super.handleMessage(message);
        }
    };
    /* access modifiers changed from: private */
    public List<StickerInfo> mList;
    private RecyclerView mRecyclerView;

    private void initView(View view) {
        this.mRecyclerView = view.findViewById(R.id.sticker_item_list);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManagerWrapper(getContext(), 0, false, "sticker_item_list"));
        this.mAdapter = new StickerAdapter(getContext());
        this.mRecyclerView.setAdapter(this.mAdapter);
        this.mAdapter.setItemSelectChangeListener(new ItemSelectChangeListener() {
            public boolean onItemSelect(BaseSelectHolder baseSelectHolder, int i, boolean z) {
                StickerInfo stickerInfo = (StickerInfo) FragmentStickerPager.this.mAdapter.getItemData(i);
                int downloadState = stickerInfo.getDownloadState();
                boolean z2 = false;
                if (downloadState == 1 || downloadState == 3) {
                    String srcPath = stickerInfo.getSrcPath();
                    FragmentStickerPager.this.persistSticker(srcPath);
                    EffectController.getInstance().setCurrentSticker(srcPath);
                    EffectController instance = EffectController.getInstance();
                    if (i == 0) {
                        z2 = true;
                    }
                    instance.enableMakeup(z2);
                    StickerProtocol stickerProtocol = (StickerProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(178);
                    if (stickerProtocol != null) {
                        stickerProtocol.onStickerChanged(srcPath);
                    }
                    int filterId = stickerInfo.getFilterId();
                    if (filterId != FilterInfo.FILTER_ID_NONE) {
                        FilterProtocol filterProtocol = (FilterProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(165);
                        if (filterProtocol != null) {
                            filterProtocol.onFilterChanged(1, filterId);
                        }
                    }
                    return true;
                }
                if ((downloadState == 0 || downloadState == 4) && CtaNoticeFragment.checkCta(FragmentStickerPager.this.getActivity().getFragmentManager())) {
                    ((StickerHolder) baseSelectHolder).mDownloadView.startDownload();
                    stickerInfo.downloadState = 2;
                    ResourceDownloadManager.getInstance().download((Resource) FragmentStickerPager.this.mList.get(i), FragmentStickerPager.this.mDefaultDownloadHelper);
                }
                return false;
            }
        });
        ResourceDownloadManager.getInstance().addDownloadListener(this.mDownloadListener);
        loadData();
    }

    private void loadData() {
        new StickerResourceRequest().execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                List list = objArr[0];
                FragmentStickerPager.this.refreshDownloadState(list);
                FragmentStickerPager.this.refreshData(list);
                String str = FragmentStickerPager.TAG;
                String str2 = "getStickerList %d ";
                Object[] objArr2 = new Object[1];
                objArr2[0] = Integer.valueOf(list == null ? -1 : list.size());
                Log.d(str, String.format(str2, objArr2));
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                FragmentStickerPager.this.refreshData(null);
                Log.e(FragmentStickerPager.TAG, String.format("errorCode %d msg:%s", new Object[]{Integer.valueOf(errorCode.CODE), str}));
            }
        });
    }

    /* access modifiers changed from: private */
    public void persistSticker(String str) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString("pref_sticker_path_key", str);
        editor.apply();
    }

    /* access modifiers changed from: private */
    public void refreshData(List<StickerInfo> list) {
        this.mList = StickerHelper.getInstance().getLocalStick();
        if (list != null) {
            this.mList.addAll(list);
        }
        this.mAdapter.setList(this.mList);
        setSelectItem();
        this.mHandler.sendEmptyMessage(2);
    }

    /* access modifiers changed from: private */
    public void refreshDownloadState(List<StickerInfo> list) {
        for (StickerInfo stickerInfo : list) {
            stickerInfo.downloadState = ResourceDownloadManager.getInstance().getDownloadState(stickerInfo.id);
        }
    }

    private void setSelectItem() {
        String currentSticker = EffectController.getInstance().getCurrentSticker();
        for (int i = 0; i < this.mList.size(); i++) {
            if (TextUtils.equals(currentSticker, ((StickerInfo) this.mList.get(i)).getSrcPath())) {
                this.mAdapter.initSelectItem(i);
                return;
            }
        }
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_sticker_pager, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    public void onDestroy() {
        FragmentStickerPager.super.onDestroy();
        ResourceDownloadManager.getInstance().removeDownloadListener(this.mDownloadListener);
    }

    public void setUserVisibleHint(boolean z) {
        FragmentStickerPager.super.setUserVisibleHint(z);
        if (z && this.mRecyclerView != null) {
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(300);
            this.mRecyclerView.startAnimation(alphaAnimation);
        }
    }
}
