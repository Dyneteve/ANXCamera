package com.android.camera.fragment.mimoji;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
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
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Space;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.fragment.RecyclerAdapterWrapper;
import com.android.camera.fragment.live.FragmentLiveBase;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.MimojiAlert;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.bumptech.glide.c;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.f;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FragmentMimoji extends FragmentLiveBase implements OnClickListener, MimojiAlert {
    public static final String ADD_STATE = "add_state";
    public static final String CLOSE_STATE = "close_state";
    private static final String FAKE_ADD_CONFIGPATH = "add";
    private static final int FRAGMENT_INFO = 4095;
    private static final String TAG = FragmentMimoji.class.getSimpleName();
    /* access modifiers changed from: private */
    public BubbleEditMimojiPresenter bubbleEditMimojiPresenter;
    private Context mContext;
    private int mItemWidth;
    private LinearLayoutManager mLayoutManager;
    private LinearLayout mLlProgress;
    /* access modifiers changed from: private */
    public List<MimojiInfo> mMimojiInfoList;
    /* access modifiers changed from: private */
    public MimojiInfo mMimojiInfoSelect;
    /* access modifiers changed from: private */
    public MimojiItemAdapter mMimojiItemAdapter;
    private RecyclerView mMimojiRecylerView;
    private View mNoneItemView;
    /* access modifiers changed from: private */
    public View mNoneSelectItemView;
    private int mSelectIndex;
    private String mSelectState = CLOSE_STATE;
    private int mTotalWidth;
    private RelativeLayout popContainer;
    private RelativeLayout popParent;

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
                int adapterPosition = getAdapterPosition() - 1;
                if (adapterPosition != -2) {
                    FragmentMimoji.this.onItemSelected((MimojiInfo) MimojiItemAdapter.this.datas.get(adapterPosition), adapterPosition, view, false);
                }
            }
        }

        public MimojiItemAdapter(Context context, String str) {
            this.mContext = context;
            this.adapterSelectState = str;
            this.mLayoutInflater = LayoutInflater.from(context);
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
            if (mimojiInfo != null && mimojiInfo.mConfigPath != null) {
                if (FragmentMimoji.FAKE_ADD_CONFIGPATH.equals(mimojiInfo.mConfigPath)) {
                    c.g(this.mContext).a(Integer.valueOf(R.drawable.mimoji_add)).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(10, 1))).a(imageView);
                } else {
                    c.g(this.mContext).l(mimojiInfo.mThumbnailUrl).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(10, 1))).a(imageView);
                }
                if (mimojiInfo == null || TextUtils.isEmpty(this.adapterSelectState) || TextUtils.isEmpty(mimojiInfo.mConfigPath) || !this.adapterSelectState.equals(mimojiInfo.mConfigPath) || mimojiInfo.mConfigPath.equals(FragmentMimoji.FAKE_ADD_CONFIGPATH)) {
                    this.mSelectItemView.setVisibility(8);
                    view.setVisibility(8);
                    this.mimojiInfoSelected = null;
                } else {
                    this.mSelectItemView.setVisibility(0);
                    if (AvatarEngineManager.isPrefabModel(mimojiInfo.mConfigPath)) {
                        view.setVisibility(8);
                        this.mSelectItemView.setBackground(FragmentMimoji.this.getResources().getDrawable(R.drawable.bg_mimoji_animal_selected));
                    } else {
                        view.setVisibility(0);
                        this.mSelectItemView.setBackground(FragmentMimoji.this.getResources().getDrawable(R.drawable.bg_live_sticker_selected));
                    }
                    this.mimojiInfoSelected = mimojiInfo;
                }
            }
        }

        public MimojiItemHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new MimojiItemHolder(this.mLayoutInflater.inflate(R.layout.fragment_mimoji_item, viewGroup, false));
        }

        public void setMimojiInfoList(List<MimojiInfo> list) {
            this.datas.clear();
            this.datas.addAll(list);
            notifyDataSetChanged();
        }

        public void updateSelect() {
            this.adapterSelectState = CameraSettings.getCurrentMimojiState();
            notifyDataSetChanged();
        }
    }

    private boolean scrollIfNeed(int i) {
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
            return true;
        } else if (i != this.mLayoutManager.findLastVisibleItemPosition() && i != this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            return false;
        } else {
            this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mMimojiItemAdapter.getItemCount() - 1));
            return true;
        }
    }

    private void setItemInCenter(int i) {
        this.mLayoutManager.scrollToPositionWithOffset(i, (this.mTotalWidth / 2) - (this.mItemWidth / 2));
    }

    private void showAlertDialog() {
        Builder builder = new Builder(getActivity());
        builder.setTitle(R.string.mimoji_delete_dialog_title);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.mimoji_delete, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (FragmentMimoji.this.mMimojiInfoSelect != null && !TextUtils.isEmpty(FragmentMimoji.this.mMimojiInfoSelect.mPackPath)) {
                    FileUtils.deleteFile(FragmentMimoji.this.mMimojiInfoSelect.mPackPath);
                    FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
                    CameraSettings.setCurrentMimojiState(FragmentMimoji.CLOSE_STATE);
                    FragmentMimoji.this.mMimojiItemAdapter.updateSelect();
                    FragmentMimoji.this.filelistToMinojiInfo();
                    DataRepository.dataItemLive().getMimojiStatusManager().mCurrentMimojiInfo = null;
                    MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
                    if (mimojiAvatarEngine != null) {
                        mimojiAvatarEngine.onMimojiDeleted();
                    }
                    CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_DELETE);
                    CameraStatUtil.trackMimojiCount(Integer.toString(FragmentMimoji.this.mMimojiInfoList.size() - 4));
                }
            }
        });
        builder.setNegativeButton(R.string.mimoji_cancle, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.show();
    }

    public void filelistToMinojiInfo() {
        File[] listFiles;
        this.mMimojiInfoList = new ArrayList();
        MimojiInfo mimojiInfo = new MimojiInfo();
        mimojiInfo.mConfigPath = FAKE_ADD_CONFIGPATH;
        mimojiInfo.mDirectoryName = Long.MAX_VALUE;
        this.mMimojiInfoList.add(mimojiInfo);
        ArrayList arrayList = new ArrayList();
        try {
            File file = new File(MimojiHelper.CUSTOM_DIR);
            if (file.isDirectory()) {
                for (File file2 : file.listFiles()) {
                    MimojiInfo mimojiInfo2 = new MimojiInfo();
                    mimojiInfo2.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
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
                            mimojiInfo2.mConfigPath = sb6;
                            mimojiInfo2.mThumbnailUrl = sb8;
                            mimojiInfo2.mPackPath = absolutePath;
                            mimojiInfo2.mDirectoryName = Long.valueOf(name).longValue();
                            this.mMimojiInfoList.add(mimojiInfo2);
                        }
                    } else {
                        arrayList.add(absolutePath);
                    }
                }
                Collections.sort(this.mMimojiInfoList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        MimojiInfo mimojiInfo3 = new MimojiInfo();
        mimojiInfo3.mAvatarTemplatePath = AvatarEngineManager.PigTemplatePath;
        mimojiInfo3.mConfigPath = AvatarEngineManager.FAKE_PIG_CONFIGPATH;
        StringBuilder sb9 = new StringBuilder();
        sb9.append(MimojiHelper.MIMOJI_DIR);
        sb9.append("/pig.png");
        mimojiInfo3.mThumbnailUrl = sb9.toString();
        this.mMimojiInfoList.add(mimojiInfo3);
        MimojiInfo mimojiInfo4 = new MimojiInfo();
        mimojiInfo4.mAvatarTemplatePath = AvatarEngineManager.RoyanTemplatePath;
        mimojiInfo4.mConfigPath = AvatarEngineManager.FAKE_ROYAN_CONFIGPATH;
        StringBuilder sb10 = new StringBuilder();
        sb10.append(MimojiHelper.MIMOJI_DIR);
        sb10.append("/royan.png");
        mimojiInfo4.mThumbnailUrl = sb10.toString();
        this.mMimojiInfoList.add(mimojiInfo4);
        MimojiInfo mimojiInfo5 = new MimojiInfo();
        mimojiInfo5.mAvatarTemplatePath = AvatarEngineManager.BearTemplatePath;
        mimojiInfo5.mConfigPath = AvatarEngineManager.FAKE_BEAR_CONFIGPATH;
        StringBuilder sb11 = new StringBuilder();
        sb11.append(MimojiHelper.MIMOJI_DIR);
        sb11.append("/bear.png");
        mimojiInfo5.mThumbnailUrl = sb11.toString();
        this.mMimojiInfoList.add(mimojiInfo5);
        MimojiInfo mimojiInfo6 = new MimojiInfo();
        mimojiInfo6.mAvatarTemplatePath = AvatarEngineManager.RabbitTemplatePath;
        mimojiInfo6.mConfigPath = AvatarEngineManager.FAKE_RABBIT_CONFIGPATH;
        StringBuilder sb12 = new StringBuilder();
        sb12.append(MimojiHelper.MIMOJI_DIR);
        sb12.append("/rabbit.png");
        mimojiInfo6.mThumbnailUrl = sb12.toString();
        this.mMimojiInfoList.add(mimojiInfo6);
        this.mMimojiItemAdapter.setMimojiInfoList(this.mMimojiInfoList);
        this.mMimojiItemAdapter.notifyDataSetChanged();
        for (int i = 0; i < arrayList.size(); i++) {
            FileUtils.deleteFile((String) arrayList.get(i));
        }
    }

    public void firstProgressShow(boolean z) {
        if (this.mLlProgress == null) {
            initView(getView());
        }
        if (z) {
            this.mLlProgress.setVisibility(0);
            this.mMimojiRecylerView.setVisibility(8);
            return;
        }
        this.mLlProgress.setVisibility(8);
        this.mMimojiRecylerView.setVisibility(0);
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
        this.mItemWidth = getResources().getDimensionPixelSize(R.dimen.live_sticker_item_size);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        this.mContext = getContext();
        this.mNoneItemView = view.findViewById(R.id.mimoji_none_item);
        this.mMimojiRecylerView = view.findViewById(R.id.mimoji_list);
        this.popContainer = (RelativeLayout) view.findViewById(R.id.ll_bubble_pop_occupation);
        this.popParent = (RelativeLayout) view.findViewById(R.id.rl_bubble_pop_parent);
        this.mLlProgress = (LinearLayout) view.findViewById(R.id.ll_updating);
        DefaultItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mMimojiRecylerView.setItemAnimator(defaultItemAnimator);
        this.mNoneSelectItemView = view.findViewById(R.id.mimoji_none_selected_indicator);
        this.bubbleEditMimojiPresenter = new BubbleEditMimojiPresenter(getContext(), this, this.popParent);
        this.mMimojiRecylerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                FragmentMimoji.super.onScrollStateChanged(recyclerView, i);
                FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
            }
        });
        this.mNoneItemView.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentMimoji.this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
                CameraSettings.setCurrentMimojiState(FragmentMimoji.CLOSE_STATE);
                FragmentMimoji.this.mNoneSelectItemView.setVisibility(0);
                MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
                if (mimojiAvatarEngine != null) {
                    mimojiAvatarEngine.onMimojiSelect(null);
                }
                if (FragmentMimoji.this.mMimojiItemAdapter != null) {
                    FragmentMimoji.this.mMimojiItemAdapter.updateSelect();
                }
                CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_NULL);
            }
        });
        this.mMimojiItemAdapter = new MimojiItemAdapter(getContext(), this.mSelectState);
        firstProgressShow(DataRepository.dataItemLive().getMimojiStatusManager().IsLoading());
        filelistToMinojiInfo();
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mMimojiRecylerView.setLayoutManager(this.mLayoutManager);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.live_share_item_margin);
        RecyclerAdapterWrapper recyclerAdapterWrapper = new RecyclerAdapterWrapper(this.mMimojiItemAdapter);
        Space space = new Space(getContext());
        space.setMinimumWidth(dimensionPixelSize);
        recyclerAdapterWrapper.addHeader(space);
        recyclerAdapterWrapper.addFooter(space);
        this.mMimojiRecylerView.setAdapter(recyclerAdapterWrapper);
        this.mSelectIndex = -1;
        String currentMimojiState = CameraSettings.getCurrentMimojiState();
        int i = 1;
        while (true) {
            if (i >= this.mMimojiInfoList.size()) {
                break;
            } else if (currentMimojiState.equals(((MimojiInfo) this.mMimojiInfoList.get(i)).mConfigPath)) {
                this.mSelectIndex = i;
                break;
            } else {
                i++;
            }
        }
        setItemInCenter(this.mSelectIndex);
        if (currentMimojiState.equals(CLOSE_STATE)) {
            this.mNoneSelectItemView.setVisibility(0);
        } else {
            CameraSettings.setCurrentMimojiState(currentMimojiState);
            this.mMimojiItemAdapter.updateSelect();
            MimojiInfo mimojiInfoSelected = this.mMimojiItemAdapter.getMimojiInfoSelected();
            if (mimojiInfoSelected != null) {
                onItemSelected(mimojiInfoSelected, -1, null, true);
            }
        }
        CameraSettings.setMimojiPannelState(true);
    }

    /* access modifiers changed from: protected */
    public void onAddItemSelected() {
        this.mIsNeedShowWhenExit = false;
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.onMimojiCreate();
        }
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null) {
            actionProcessing.forceSwitchFront();
        }
    }

    public boolean onBackEvent(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onBackEvent = ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiEdit() && i != 4) {
            return false;
        }
        CameraSettings.setMimojiPannelState(false);
        return super.onBackEvent(i);
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
                    mimojiEditor.directlyEnterEditMode(this.mMimojiInfoSelect, 101);
                }
                CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_EDIT);
                this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
                return;
            case 102:
                showAlertDialog();
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
            if (!str.equals(FAKE_ADD_CONFIGPATH)) {
                CameraSettings.setCurrentMimojiState(str);
            }
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("click　currentState:");
            sb.append(str);
            sb.append(" lastState:");
            sb.append(currentMimojiState);
            Log.i(str2, sb.toString());
            this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
            if (FAKE_ADD_CONFIGPATH.equals(mimojiInfo.mConfigPath)) {
                onAddItemSelected();
                CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_ADD);
                return;
            }
            if (!z) {
                if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
                    this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
                } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
                    this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mMimojiItemAdapter.getItemCount() - 1));
                } else if (i == this.mLayoutManager.findLastVisibleItemPosition() - 1 || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition() - 1) {
                    this.mLayoutManager.scrollToPosition(Math.min(i + 2, this.mMimojiItemAdapter.getItemCount()));
                } else {
                    processBubble(mimojiInfo, str, currentMimojiState, view, z);
                }
                setAvatarAndSelect(str, mimojiInfo);
            } else {
                processBubble(mimojiInfo, str, currentMimojiState, view, z);
                setAvatarAndSelect(str, mimojiInfo);
            }
        }
    }

    public void processBubble(MimojiInfo mimojiInfo, String str, String str2, View view, boolean z) {
        boolean isPrefabModel = AvatarEngineManager.isPrefabModel(mimojiInfo.mConfigPath);
        if (str.equals(str2) && !str2.equals(ADD_STATE) && !str2.equals(CLOSE_STATE) && !z && !isPrefabModel) {
            this.mMimojiInfoSelect = mimojiInfo;
            int width = view.getWidth();
            int[] iArr = new int[2];
            view.getLocationOnScreen(iArr);
            int dimensionPixelSize = this.mContext.getResources().getDimensionPixelSize(R.dimen.mimoji_edit_bubble_width) / 2;
            int i = (iArr[0] + (width / 2)) - dimensionPixelSize;
            int height = (this.popContainer.getHeight() + (view.getHeight() / 2)) - dimensionPixelSize;
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("coordinateY:");
            sb.append(height);
            Log.i(str3, sb.toString());
            this.bubbleEditMimojiPresenter.processBubbleAni(i, height, view);
        }
    }

    public int refreshMimojiList() {
        if (this.mMimojiItemAdapter == null) {
            return 0;
        }
        Log.d(TAG, "refreshMimojiList");
        filelistToMinojiInfo();
        this.mMimojiItemAdapter.updateSelect();
        return this.mMimojiInfoList.size() - 4;
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        ModeCoordinatorImpl.getInstance().attachProtocol(226, this);
    }

    public void setAvatarAndSelect(String str, MimojiInfo mimojiInfo) {
        this.mNoneSelectItemView.setVisibility(8);
        CameraSettings.setCurrentMimojiState(str);
        this.mMimojiItemAdapter.updateSelect();
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.onMimojiSelect(mimojiInfo);
        }
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.bubbleEditMimojiPresenter.processBubbleAni(-2, -2, null);
        ModeCoordinatorImpl.getInstance().detachProtocol(226, this);
    }
}
