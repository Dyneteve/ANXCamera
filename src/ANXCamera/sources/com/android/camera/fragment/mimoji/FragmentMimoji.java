package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.live.FragmentLiveBase;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.bumptech.glide.c;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.f;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class FragmentMimoji extends FragmentLiveBase implements OnClickListener {
    public static final String ADD_STATE = "add_state";
    public static final String CLOSE_STATE = "close_state";
    private static final int FRAGMENT_INFO = 4095;
    private static final String TAG = FragmentMimoji.class.getSimpleName();
    /* access modifiers changed from: private */
    public BubbleEditMimojiPresenter bubbleEditMimojiPresenter;
    private View mAddItemView;
    private Context mContext;
    private LinearLayoutManager mLayoutManager;
    /* access modifiers changed from: private */
    public List<MimojiInfo> mMimojiInfoList;
    private MimojiInfo mMimojiInfoSelect;
    /* access modifiers changed from: private */
    public MimojiItemAdapter mMimojiItemAdapter;
    private RecyclerView mMimojiRecylerView;
    private View mNoneItemView;
    /* access modifiers changed from: private */
    public View mNoneSelectItemView;
    private String mSelectState = CLOSE_STATE;

    public class MimojiItemAdapter extends Adapter<MimojiItemHolder> {
        private String adapterSelectState;
        /* access modifiers changed from: private */
        public List<MimojiInfo> datas = new ArrayList();
        private Context mContext;
        LayoutInflater mLayoutInflater;
        private View mSelectItemView;
        private MimojiInfo mimojiInfoSelected;

        class MimojiItemHolder extends CommonRecyclerViewHolder implements OnClickListener {
            public MimojiItemHolder(View view) {
                super(view);
                view.setOnClickListener(this);
            }

            public void onClick(View view) {
                int adapterPosition = getAdapterPosition();
                FragmentMimoji.this.onItemSelected((MimojiInfo) MimojiItemAdapter.this.datas.get(adapterPosition), adapterPosition, view, false);
            }
        }

        public MimojiItemAdapter(Context context, String str) {
            this.mContext = context;
            this.adapterSelectState = str;
            this.mLayoutInflater = LayoutInflater.from(context);
        }

        public void cancelSelect() {
            this.adapterSelectState = FragmentMimoji.ADD_STATE;
            notifyDataSetChanged();
        }

        public int getItemCount() {
            return FragmentMimoji.this.mMimojiInfoList.size();
        }

        public MimojiInfo getMimojiInfoSelected() {
            return this.mimojiInfoSelected;
        }

        public void onBindViewHolder(MimojiItemHolder mimojiItemHolder, int i) {
            ImageView imageView = (ImageView) mimojiItemHolder.getView(R.id.mimoji_item_image);
            this.mSelectItemView = mimojiItemHolder.getView(R.id.mimoji_item_selected_indicator);
            View view = mimojiItemHolder.getView(R.id.mimoji_long_item_selected_indicator);
            MimojiInfo mimojiInfo = (MimojiInfo) this.datas.get(i);
            mimojiItemHolder.itemView.setTag(mimojiInfo);
            c.g(this.mContext).l(mimojiInfo.mThumbnailUrl).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(10, 1))).a(imageView);
            if (mimojiInfo == null || !mimojiInfo.mConfigPath.equals(this.adapterSelectState)) {
                this.mSelectItemView.setVisibility(8);
                view.setVisibility(8);
                this.mimojiInfoSelected = null;
                return;
            }
            this.mSelectItemView.setVisibility(0);
            view.setVisibility(0);
            this.mimojiInfoSelected = mimojiInfo;
        }

        public MimojiItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new MimojiItemHolder(this.mLayoutInflater.inflate(R.layout.fragment_mimoji_item, viewGroup, false));
        }

        public void setMimojiInfoList(List<MimojiInfo> list) {
            this.datas.clear();
            this.datas.addAll(list);
            notifyDataSetChanged();
        }

        public void setSelectState(String str) {
            this.adapterSelectState = str;
        }
    }

    private void scrollIfNeed(int i) {
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
        } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mMimojiItemAdapter.getItemCount() - 1));
        }
    }

    public void filelistToMinojiInfo() {
        File[] listFiles;
        this.mMimojiInfoList = new ArrayList();
        ArrayList arrayList = new ArrayList();
        try {
            File file = new File(MimojiHelper.CUSTOM_DIR);
            if (file.isDirectory()) {
                for (File file2 : file.listFiles()) {
                    MimojiInfo mimojiInfo = new MimojiInfo();
                    mimojiInfo.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
                    String name = file2.getName();
                    String absolutePath = file2.getAbsolutePath();
                    StringBuilder sb = new StringBuilder();
                    sb.append(name);
                    sb.append("config.dat");
                    String sb2 = sb.toString();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(name);
                    sb3.append("pic.png");
                    String sb4 = sb3.toString();
                    if (file2.isDirectory()) {
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append(MimojiHelper.CUSTOM_DIR);
                        sb5.append(name);
                        sb5.append("/");
                        sb5.append(sb2);
                        String sb6 = sb5.toString();
                        StringBuilder sb7 = new StringBuilder();
                        sb7.append(MimojiHelper.CUSTOM_DIR);
                        sb7.append(name);
                        sb7.append("/");
                        sb7.append(sb4);
                        String sb8 = sb7.toString();
                        if (!FileUtils.checkFileConsist(sb6) || !FileUtils.checkFileConsist(sb8)) {
                            arrayList.add(absolutePath);
                        } else {
                            mimojiInfo.mConfigPath = sb6;
                            mimojiInfo.mThumbnailUrl = sb8;
                            mimojiInfo.mPackPath = absolutePath;
                            this.mMimojiInfoList.add(mimojiInfo);
                        }
                    } else {
                        arrayList.add(absolutePath);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.mMimojiItemAdapter.setMimojiInfoList(this.mMimojiInfoList);
        this.mMimojiItemAdapter.notifyDataSetChanged();
        for (int i = 0; i < arrayList.size(); i++) {
            FileUtils.deleteFile((String) arrayList.get(i));
        }
    }

    public int getFragmentInto() {
        return 4095;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_mimoji;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mContext = getContext();
        this.mNoneItemView = view.findViewById(R.id.mimoji_none_item);
        this.mMimojiRecylerView = (RecyclerView) view.findViewById(R.id.mimoji_list);
        RelativeLayout relativeLayout = (RelativeLayout) view.findViewById(R.id.ll_bubble_pop_occupation);
        DefaultItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mMimojiRecylerView.setItemAnimator(defaultItemAnimator);
        this.mNoneSelectItemView = view.findViewById(R.id.mimoji_none_selected_indicator);
        this.bubbleEditMimojiPresenter = new BubbleEditMimojiPresenter(getContext(), this, relativeLayout);
        this.mMimojiRecylerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                super.onScrollStateChanged(recyclerView, i);
                FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
            }
        });
        this.mNoneItemView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
                CameraSettings.setCurrentMimojiState(FragmentMimoji.CLOSE_STATE);
                FragmentMimoji.this.mNoneSelectItemView.setVisibility(0);
                MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
                if (mimojiAvatarEngine != null) {
                    mimojiAvatarEngine.onMimojiSelect(null);
                }
                if (FragmentMimoji.this.mMimojiItemAdapter != null) {
                    FragmentMimoji.this.mMimojiItemAdapter.cancelSelect();
                }
            }
        });
        this.mAddItemView = view.findViewById(R.id.mimoji_add_item);
        this.mAddItemView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
                FragmentMimoji.this.onAddItemSelected(view);
            }
        });
        this.mMimojiItemAdapter = new MimojiItemAdapter(getContext(), this.mSelectState);
        filelistToMinojiInfo();
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mMimojiRecylerView.setLayoutManager(this.mLayoutManager);
        this.mMimojiRecylerView.setAdapter(this.mMimojiItemAdapter);
        String currentMimojiState = CameraSettings.getCurrentMimojiState();
        if (currentMimojiState.equals(CLOSE_STATE)) {
            this.mNoneSelectItemView.setVisibility(0);
            return;
        }
        this.mMimojiItemAdapter.setSelectState(currentMimojiState);
        this.mMimojiItemAdapter.notifyDataSetChanged();
        MimojiInfo mimojiInfoSelected = this.mMimojiItemAdapter.getMimojiInfoSelected();
        if (mimojiInfoSelected != null) {
            onItemSelected(mimojiInfoSelected, -1, null, true);
        }
    }

    /* access modifiers changed from: protected */
    public void onAddItemSelected(View view) {
        this.mIsNeedShowWhenExit = false;
        CameraSettings.setCurrentMimojiState(ADD_STATE);
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.onMimojiCreate();
        }
    }

    public void onClick(View view) {
        switch (((Integer) view.getTag()).intValue()) {
            case 101:
                MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
                if (mimojiAvatarEngine != null) {
                    mimojiAvatarEngine.releaseRender();
                }
                MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
                if (mimojiEditor != null) {
                    mimojiEditor.directlyEnterEditMode(this.mMimojiInfoSelect.mConfigPath);
                }
                this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
                return;
            case 102:
                if (this.mMimojiInfoSelect != null && !TextUtils.isEmpty(this.mMimojiInfoSelect.mPackPath)) {
                    FileUtils.deleteFile(this.mMimojiInfoSelect.mPackPath);
                    this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
                    this.mMimojiItemAdapter.setSelectState(CLOSE_STATE);
                    this.mMimojiItemAdapter.notifyDataSetChanged();
                    ToastUtils.showToast((Context) getActivity(), getResources().getString(R.string.mimoji_delete_success));
                    filelistToMinojiInfo();
                    return;
                }
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onItemSelected(MimojiInfo mimojiInfo, int i, View view, boolean z) {
        if (mimojiInfo != null) {
            String str = mimojiInfo.mConfigPath;
            String currentMimojiState = CameraSettings.getCurrentMimojiState();
            CameraSettings.setCurrentMimojiState(str);
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("点击currentState:");
            sb.append(str);
            sb.append(" lastState:");
            sb.append(currentMimojiState);
            Log.i(str2, sb.toString());
            this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
            if (!z) {
                scrollIfNeed(i);
            }
            if (!str.equals(currentMimojiState) || currentMimojiState.equals(ADD_STATE) || currentMimojiState.equals(CLOSE_STATE) || z) {
                this.mNoneSelectItemView.setVisibility(8);
                this.mMimojiItemAdapter.setSelectState(mimojiInfo.mConfigPath);
                this.mMimojiItemAdapter.notifyDataSetChanged();
                MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
                if (mimojiAvatarEngine != null) {
                    mimojiAvatarEngine.onMimojiSelect(mimojiInfo);
                }
                return;
            }
            this.mMimojiInfoSelect = mimojiInfo;
            int width = view.getWidth();
            int[] iArr = new int[2];
            view.getLocationOnScreen(iArr);
            int i2 = (iArr[0] + (width / 2)) - 40;
            this.bubbleEditMimojiPresenter.processBubbleAni(i2, 70 + view.getHeight());
        }
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2);
    }
}
