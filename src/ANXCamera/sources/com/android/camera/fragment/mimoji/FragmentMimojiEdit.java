package com.android.camera.fragment.mimoji;

import android.annotation.SuppressLint;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v7.widget.RecyclerView;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewStub;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.module.impl.component.MimojiStatusManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.ui.MimojiEditGLSurfaceView;
import com.android.camera.ui.MimojiTypeSelectView;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigValue;
import com.arcsoft.avatar.AvatarEngine;
import io.reactivex.Completable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class FragmentMimojiEdit extends BaseFragment implements OnClickListener, OnTouchListener, HandleBackTrace, MimojiEditor {
    private static final int EDIT_STATE_STEP1 = 1;
    private static final int EDIT_STATE_STEP2 = 2;
    private static final int EDIT_STATE_STEP3 = 3;
    private static final int FRAGMENT_INFO = 65521;
    public static final String TAG = FragmentMimojiEdit.class.getSimpleName();
    private static final String TEMPDATA;
    /* access modifiers changed from: private */
    public boolean editState = false;
    /* access modifiers changed from: private */
    public AvatarEngine mAvatar;
    private AvatarEngineManager mAvatarEngineManager;
    private TextView mBackTextView;
    private TextView mConfirmTextView;
    /* access modifiers changed from: private */
    public Context mContext;
    private String mCurrentConfigPath = "";
    /* access modifiers changed from: private */
    public EditLevelListAdapter mEditLevelListAdapter;
    private TextView mEditTextView;
    private boolean mEnterFromMimoji = false;
    @SuppressLint({"HandlerLeak"})
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 4:
                    Bitmap thumbnailBitmapFromData = MimojiHelper.getThumbnailBitmapFromData((byte[]) message.obj, 200, 200);
                    String format = new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.getDefault()).format(new Date());
                    StringBuilder sb = new StringBuilder();
                    sb.append(MimojiHelper.CUSTOM_DIR);
                    sb.append("/");
                    sb.append(format);
                    sb.append("/");
                    String sb2 = sb.toString();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(sb2);
                    sb3.append(format);
                    sb3.append("config.dat");
                    String sb4 = sb3.toString();
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append(sb2);
                    sb5.append(format);
                    sb5.append("pic.png");
                    FileUtils.saveBitmap(thumbnailBitmapFromData, sb5.toString());
                    int saveConfig = FragmentMimojiEdit.this.mAvatar.saveConfig(sb4);
                    FragmentMimojiEdit.this.mAvatar.loadConfig(sb4);
                    String str = FragmentMimojiEdit.TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("res = ");
                    sb6.append(saveConfig);
                    sb6.append("  save path : ");
                    sb6.append(sb4);
                    Log.d(str, sb6.toString());
                    ToastUtils.showToast((Context) FragmentMimojiEdit.this.getActivity(), FragmentMimojiEdit.this.getResources().getString(R.string.mimoji_save_success));
                    FragmentMimojiEdit.this.goBack(false, true);
                    return;
                case 5:
                    Bundle bundle = (Bundle) message.obj;
                    int i = bundle.getInt("OUTER");
                    int i2 = bundle.getInt("INNER");
                    FragmentMimojiEdit.this.mEditLevelListAdapter.notifyThumbnailUpdate(bundle.getInt("TYPE"), i, i2);
                    return;
                case 6:
                    int selectType = AvatarEngineManager.getInstance().getSelectType();
                    if (AvatarEngineManager.getInstance().isColorSelected()) {
                        AvatarEngineManager.getInstance().setInterruptIndex(selectType, 0);
                    }
                    ArrayList subConfigList = AvatarEngineManager.getInstance().getSubConfigList(FragmentMimojiEdit.this.mContext, selectType);
                    boolean isNeedUpdate = AvatarEngineManager.getInstance().isNeedUpdate(selectType);
                    FragmentMimojiEdit.this.mEditLevelListAdapter.refreshData(subConfigList, !isNeedUpdate);
                    if (isNeedUpdate) {
                        FragmentMimojiEdit.this.mRenderThread.draw();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };
    private boolean mIsGoBack;
    private boolean mIsStartEdit;
    private RecyclerView mLevelRecyleView;
    private View mMimojiConfigAdjustLayout;
    /* access modifiers changed from: private */
    public MimojiEditGLSurfaceView mMimojiEditGLSurfaceView;
    private View mMimojiEditViewLayout;
    private ViewStub mMimojiEditViewStub;
    private MimojiTypeSelectView mMimojiTypeSelectView;
    private View mOperateSelectLayout;
    private TextView mReCaptureTextView;
    /* access modifiers changed from: private */
    public MimojiThumbnailRenderThread mRenderThread;
    private TextView mSaveTextView;
    private TextView mTipsTextView;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(MimojiHelper.CUSTOM_DIR);
        sb.append("temp.dat");
        TEMPDATA = sb.toString();
    }

    /* access modifiers changed from: private */
    public void goBack(boolean z, boolean z2) {
        MimojiAvatarEngine mimojiAvatarEngine = (MimojiAvatarEngine) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (mimojiAvatarEngine != null) {
            mimojiAvatarEngine.backToPreview(z2);
            if (z) {
                mimojiAvatarEngine.onMimojiCreate();
            }
        }
        this.mEnterFromMimoji = false;
        this.mIsStartEdit = false;
        if (this.mMimojiEditViewLayout != null) {
            this.mMimojiEditGLSurfaceView.setVisibility(8);
            this.mMimojiEditViewLayout.setVisibility(8);
            this.mMimojiConfigAdjustLayout.setVisibility(8);
            this.mOperateSelectLayout.setVisibility(0);
            updateTitleState(1);
            this.mMimojiEditGLSurfaceView.queueEvent(new Runnable() {
                public void run() {
                    if (FragmentMimojiEdit.this.mAvatar != null) {
                        Log.d(FragmentMimojiEdit.TAG, "releaseRender 2");
                        FragmentMimojiEdit.this.mAvatar.releaseRender();
                    }
                    FragmentMimojiEdit.this.mMimojiEditGLSurfaceView.setStopRender(true);
                }
            });
        }
        this.mRenderThread.quit();
        FragmentUtils.removeFragmentByTag(getFragmentManager(), TAG);
    }

    private void initConfigList() {
        this.mRenderThread.initAvatar(this.mEnterFromMimoji ? this.mCurrentConfigPath : AvatarEngineManager.TempOriginalConfigPath);
        ASAvatarConfigValue aSAvatarConfigValue = new ASAvatarConfigValue();
        this.mAvatar.getConfigValue(aSAvatarConfigValue);
        this.mAvatarEngineManager.setASAvatarConfigValue(aSAvatarConfigValue);
        this.mAvatarEngineManager.setConfigTypeList(this.mAvatar.getSupportConfigType(this.mAvatarEngineManager.getASAvatarConfigValue().gender));
        this.mMimojiTypeSelectView.init();
    }

    private void initMimojiEdit(View view) {
        ((RelativeLayout) view.findViewById(R.id.rv_navigation_layout)).setOnClickListener(this);
        this.mReCaptureTextView = (TextView) view.findViewById(R.id.tv_recapture);
        this.mReCaptureTextView.setOnClickListener(this);
        this.mReCaptureTextView.setOnTouchListener(this);
        this.mEditTextView = (TextView) view.findViewById(R.id.tv_edit);
        this.mEditTextView.setOnClickListener(this);
        this.mEditTextView.setOnTouchListener(this);
        this.mSaveTextView = (TextView) view.findViewById(R.id.tv_save);
        this.mSaveTextView.setOnClickListener(this);
        this.mSaveTextView.setOnTouchListener(this);
        this.mBackTextView = (TextView) view.findViewById(R.id.tv_back);
        this.mBackTextView.setOnClickListener(this);
        this.mConfirmTextView = (TextView) view.findViewById(R.id.btn_confirm);
        this.mConfirmTextView.setOnClickListener(this);
        updateTitleState(1);
        this.mMimojiEditGLSurfaceView = (MimojiEditGLSurfaceView) view.findViewById(R.id.mimoji_edit_preview);
        this.mMimojiEditGLSurfaceView.setmHandler(this.mHandler);
        this.mOperateSelectLayout = view.findViewById(R.id.operate_select_layout);
        this.mMimojiConfigAdjustLayout = view.findViewById(R.id.mimoji_config_adjust_layout);
        this.mMimojiTypeSelectView = (MimojiTypeSelectView) view.findViewById(R.id.mimoji_type_select_view);
        this.mLevelRecyleView = view.findViewById(R.id.color_level);
        LinearLayoutManagerWrapper linearLayoutManagerWrapper = new LinearLayoutManagerWrapper(this.mContext, "color_level");
        linearLayoutManagerWrapper.setOrientation(1);
        this.mLevelRecyleView.setLayoutManager(linearLayoutManagerWrapper);
        this.mEditLevelListAdapter = new EditLevelListAdapter(this.mContext, new ItfGvOnItemClickListener() {
            public void notifyUIChanged() {
                if (!FragmentMimojiEdit.this.editState) {
                    FragmentMimojiEdit.this.editState = true;
                    FragmentMimojiEdit.this.updateTitleState(3);
                }
            }
        });
        this.mLevelRecyleView.setAdapter(this.mEditLevelListAdapter);
        this.mTipsTextView = (TextView) view.findViewById(R.id.popup_tips_no_face);
        setupAvatar();
    }

    private void resetData() {
        this.mRenderThread.reset();
        AvatarEngineManager.getInstance().resetData();
        this.mEditLevelListAdapter.notifyDataSetChanged();
    }

    private void setupAvatar() {
        Log.d(TAG, "setup avatar");
        this.mAvatarEngineManager = AvatarEngineManager.getInstance();
        this.mAvatar = this.mAvatarEngineManager.queryAvatar();
        if (!this.mEnterFromMimoji) {
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
        }
        ASAvatarConfigValue aSAvatarConfigValue = new ASAvatarConfigValue();
        this.mAvatar.getConfigValue(aSAvatarConfigValue);
        this.mAvatarEngineManager.setASAvatarConfigValue(aSAvatarConfigValue);
        this.mAvatarEngineManager.setASAvatarConfigValueDefault(aSAvatarConfigValue);
        this.mAvatar.setRenderScene(false, 1.0f);
        this.mMimojiEditGLSurfaceView.setStopRender(false);
        this.mRenderThread = new MimojiThumbnailRenderThread("MimojiEdit", 200, 200, this.mContext);
        this.mRenderThread.start();
        this.mRenderThread.waitUntilReady();
        this.mRenderThread.setUpdateHandler(this.mHandler);
        this.mEditLevelListAdapter.setRenderThread(this.mRenderThread);
        this.mAvatarEngineManager.initUpdatePara();
    }

    private void showAlertDialog() {
        Builder builder = new Builder(getActivity());
        builder.setTitle(R.string.mimoji_edit_whether_abandon);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.mimoji_confirm, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FragmentMimojiEdit.this.goBack(false, false);
            }
        });
        builder.setNegativeButton(R.string.mimoji_cancle, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.show();
    }

    private void showRecaptureDialog() {
        getActivity().runOnUiThread(new Runnable() {
            public void run() {
                Builder builder = new Builder(FragmentMimojiEdit.this.getActivity());
                builder.setTitle(R.string.recapture_dialog_title);
                builder.setMessage(R.string.recapture_dialog_message);
                builder.setCancelable(false);
                builder.setPositiveButton(R.string.snap_confirmed, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        FragmentMimojiEdit.this.goBack(true, false);
                    }
                });
                builder.setNegativeButton(R.string.snap_cancel, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                    }
                });
                builder.show();
            }
        });
    }

    public void directlyEnterEditMode(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configPath = ");
        sb.append(str);
        Log.d(str2, sb.toString());
        this.mEnterFromMimoji = true;
        this.mCurrentConfigPath = str;
        DataRepository.dataItemLive().getMimojiStatusManager().setMode(MimojiStatusManager.MIMOJI_EIDT);
        this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
        startMimojiEdit();
        updateTitleState(2);
        this.mOperateSelectLayout.setVisibility(8);
        this.mMimojiConfigAdjustLayout.setVisibility(0);
        initConfigList();
        this.mIsStartEdit = true;
    }

    public int getFragmentInto() {
        return 65521;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_full_screen_mimoji;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mContext = getContext();
        this.mMimojiEditViewStub = (ViewStub) view.findViewById(R.id.mimoji_edit);
    }

    public boolean onBackEvent(int i) {
        if (i == 1) {
            if (this.mIsStartEdit) {
                showAlertDialog();
                return true;
            } else if (!(this.mMimojiEditViewLayout == null || this.mMimojiEditViewLayout.getVisibility() == 8)) {
                goBack(true, false);
                return true;
            }
        }
        return false;
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.tv_edit /*2131558423*/:
                updateTitleState(2);
                this.mOperateSelectLayout.setVisibility(8);
                this.mMimojiConfigAdjustLayout.setVisibility(0);
                initConfigList();
                DataRepository.dataItemLive().getMimojiStatusManager().setMode(MimojiStatusManager.MIMOJI_EIDT);
                this.mIsStartEdit = true;
                return;
            case R.id.tv_back /*2131558572*/:
                if (this.editState) {
                    this.editState = false;
                    updateTitleState(2);
                    resetData();
                    this.mAvatar.loadConfig(this.mEnterFromMimoji ? this.mCurrentConfigPath : AvatarEngineManager.TempOriginalConfigPath);
                    return;
                }
                goBack(true, false);
                return;
            case R.id.btn_confirm /*2131558573*/:
            case R.id.tv_save /*2131558580*/:
                this.mMimojiEditGLSurfaceView.setSaveConfigThum(true);
                resetData();
                return;
            case R.id.tv_recapture /*2131558579*/:
                showRecaptureDialog();
                return;
            default:
                return;
        }
    }

    public void onDeviceRotationChange(int i) {
        if (this.mMimojiEditGLSurfaceView != null) {
            this.mMimojiEditGLSurfaceView.onDeviceRotationChange(i);
        }
    }

    public void onResume() {
        super.onResume();
    }

    public void onStart() {
        super.onStart();
        if (this.mBackTextView != null) {
            this.editState = false;
            updateTitleState(1);
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        int id = view.getId();
        if (id != R.id.tv_edit) {
            switch (id) {
                case R.id.tv_recapture /*2131558579*/:
                    if (motionEvent.getActionMasked() != 0) {
                        if (motionEvent.getActionMasked() == 1) {
                            this.mReCaptureTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_default));
                            this.mReCaptureTextView.setTextColor(getResources().getColor(R.color.white));
                            break;
                        }
                    } else {
                        this.mReCaptureTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_selected));
                        this.mReCaptureTextView.setTextColor(getResources().getColor(R.color.white_alpha_cc));
                        break;
                    }
                    break;
                case R.id.tv_save /*2131558580*/:
                    if (motionEvent.getActionMasked() != 0) {
                        if (motionEvent.getActionMasked() == 1) {
                            this.mSaveTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_save_default));
                            this.mSaveTextView.setTextColor(getResources().getColor(R.color.white));
                            break;
                        }
                    } else {
                        this.mSaveTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_save_selected));
                        this.mSaveTextView.setTextColor(getResources().getColor(R.color.white_alpha_cc));
                        break;
                    }
                    break;
            }
        } else if (motionEvent.getActionMasked() == 0) {
            this.mEditTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_selected));
            this.mEditTextView.setTextColor(getResources().getColor(R.color.white_alpha_cc));
        } else if (motionEvent.getActionMasked() == 1) {
            this.mEditTextView.setBackground(getResources().getDrawable(R.drawable.shape_round_corner_default));
            this.mEditTextView.setTextColor(getResources().getColor(R.color.white));
        }
        return false;
    }

    public void onTypeConfigSelect(int i) {
        this.mAvatarEngineManager.setIsColorSelected(false);
        this.mAvatarEngineManager.setSelectType(i);
        if (!this.mRenderThread.getIsRendering()) {
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 6;
            this.mHandler.sendMessage(obtainMessage);
            return;
        }
        this.mRenderThread.setStopRender(true);
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("provideAnimateElement, animateInElements");
        sb.append(list);
        sb.append("resetType = ");
        sb.append(i2);
        Log.d(str, sb.toString());
        if (this.mMimojiEditViewLayout != null && this.mMimojiEditViewLayout.getVisibility() == 0 && i2 == 3) {
            Log.d(TAG, "mimoji edit timeout");
            goBack(false, false);
            DataRepository.dataItemLive().getMimojiStatusManager().reset();
            ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getAnimationComposite().remove(getFragmentInto());
        }
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(224, this);
    }

    public void requestRender() {
        if (this.mMimojiEditGLSurfaceView != null && !this.mIsGoBack) {
            this.mMimojiEditGLSurfaceView.requestRender();
        }
    }

    public void resetConfig() {
        this.mAvatarEngineManager = AvatarEngineManager.getInstance();
        this.mAvatar = this.mAvatarEngineManager.queryAvatar();
        this.mMimojiEditGLSurfaceView.setupAvatar();
    }

    public void showOrHideTips(boolean z) {
        if (this.mTipsTextView != null) {
            this.mTipsTextView.setVisibility(z ? 0 : 4);
        }
    }

    public void startMimojiEdit() {
        Log.d(TAG, "startMimojiEdit");
        if (this.mMimojiEditViewLayout == null) {
            this.mMimojiEditViewLayout = this.mMimojiEditViewStub.inflate();
            initMimojiEdit(this.mMimojiEditViewLayout);
        } else {
            setupAvatar();
        }
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getAnimationComposite().put(getFragmentInto(), this);
        this.mMimojiEditViewLayout.setVisibility(0);
        this.mMimojiEditGLSurfaceView.setVisibility(0);
        this.mAvatar.saveConfig(AvatarEngineManager.TempOriginalConfigPath);
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(224, this);
    }

    public void updateTitleState(int i) {
        switch (i) {
            case 1:
                this.mBackTextView.setText(getResources().getString(R.string.mimoji_back));
                this.mBackTextView.setTextColor(getResources().getColor(R.color.white));
                this.mBackTextView.setClickable(true);
                this.mBackTextView.setVisibility(0);
                this.mConfirmTextView.setVisibility(8);
                if (this.mMimojiTypeSelectView != null) {
                    this.mMimojiTypeSelectView.setVisibility(8);
                    return;
                }
                return;
            case 2:
                this.mMimojiTypeSelectView.setVisibility(0);
                this.mBackTextView.setVisibility(0);
                this.mConfirmTextView.setVisibility(0);
                this.mBackTextView.setTextColor(getResources().getColor(R.color.color_333333));
                this.mBackTextView.setClickable(false);
                this.mConfirmTextView.setText(getResources().getString(R.string.mimoji_save));
                this.mBackTextView.setText(getResources().getString(R.string.mimoji_reset));
                this.mConfirmTextView.setClickable(true);
                this.mConfirmTextView.setTextColor(getResources().getColor(R.color.white));
                return;
            case 3:
                this.mMimojiTypeSelectView.setVisibility(0);
                this.mBackTextView.setVisibility(0);
                this.mConfirmTextView.setVisibility(0);
                this.mBackTextView.setTextColor(getResources().getColor(R.color.white));
                this.mConfirmTextView.setTextColor(getResources().getColor(R.color.white));
                this.mBackTextView.setClickable(true);
                this.mConfirmTextView.setClickable(true);
                this.mConfirmTextView.setText(getResources().getString(R.string.mimoji_save));
                this.mBackTextView.setText(getResources().getString(R.string.mimoji_reset));
                return;
            default:
                return;
        }
    }
}
