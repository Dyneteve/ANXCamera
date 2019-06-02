package com.android.camera.fragment;

import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.SparseArray;
import android.util.SparseIntArray;
import com.android.camera.Camera;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.animation.AnimationComposite;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.FragmentBlankBeauty;
import com.android.camera.fragment.beauty.FragmentPopuEyeLightTip;
import com.android.camera.fragment.beauty.FragmentPopupBeauty;
import com.android.camera.fragment.beauty.FragmentPopupBeautyLevel;
import com.android.camera.fragment.bottom.FragmentBottomAction;
import com.android.camera.fragment.dual.FragmentDualCameraAdjust;
import com.android.camera.fragment.dual.FragmentDualCameraBokehAdjust;
import com.android.camera.fragment.dual.FragmentDualStereo;
import com.android.camera.fragment.fullscreen.FragmentFullScreen;
import com.android.camera.fragment.lifeCircle.BaseLifeCircleBindFragment;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.fragment.live.FragmentLiveSpeed;
import com.android.camera.fragment.live.FragmentLiveSticker;
import com.android.camera.fragment.manually.FragmentManually;
import com.android.camera.fragment.mimoji.FragmentMimoji;
import com.android.camera.fragment.sticker.FragmentSticker;
import com.android.camera.fragment.top.FragmentTopConfig;
import com.android.camera.module.loader.StartControl;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.mi.config.b;
import io.reactivex.Completable;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class BaseFragmentDelegate implements BaseDelegate {
    public static final int BEAUTY_FRAGMENT_CONTAINER_ID = 2131558440;
    public static final int EYE_LIGHT_POPU_TIP_FRAGMENT_CONTAINER_ID = 2131558704;
    public static final int FRAGMENT_BEAUTY = 251;
    public static final int FRAGMENT_BLANK_BEAUTY = 4090;
    public static final int FRAGMENT_BOTTOM_ACTION = 241;
    public static final int FRAGMENT_BOTTOM_INTENT_DONE = 4083;
    public static final int FRAGMENT_BOTTOM_POPUP_TIPS = 4081;
    public static final int FRAGMENT_DUAL_CAMERA_ADJUST = 4084;
    public static final int FRAGMENT_DUAL_CAMERA_BOKEH_ADJUST = 4091;
    public static final int FRAGMENT_DUAL_STEREO = 4085;
    public static final int FRAGMENT_EYE_LIGHT_POPU_TIP = 4089;
    public static final int FRAGMENT_FILTER = 250;
    public static final int FRAGMENT_INVALID = 240;
    public static final int FRAGMENT_LIGHTING = 4087;
    public static final int FRAGMENT_MAIN_CONTENT = 243;
    public static final int FRAGMENT_MANUALLY_EXTRA = 254;
    public static final int FRAGMENT_MIMOJI_EDIT = 65521;
    public static final int FRAGMENT_MIMOJI_LIST = 4095;
    public static final int FRAGMENT_MODE_SELECT = 242;
    public static final int FRAGMENT_PANORAMA = 4080;
    public static final int FRAGMENT_POPUP_BEAUTY = 249;
    public static final int FRAGMENT_POPUP_BEAUTYLEVEL = 4082;
    public static final int FRAGMENT_POPUP_LIVE_SPEED = 4093;
    public static final int FRAGMENT_POPUP_LIVE_STICKER = 4092;
    public static final int FRAGMENT_POPUP_MAKEUP = 252;
    public static final int FRAGMENT_POPUP_MANUALLY = 247;
    public static final int FRAGMENT_SCREEN_LIGHT = 4086;
    public static final int FRAGMENT_STICKER = 255;
    public static final int FRAGMENT_TOP_ALERT = 253;
    public static final int FRAGMENT_TOP_CONFIG = 244;
    public static final int FRAGMENT_TOP_CONFIG_EXTRA = 245;
    public static final int FRAGMENT_VERTICAL = 4088;
    public static final int FRAGMENT_WIDESELFIE = 4094;
    public static final int MAKE_UP_POPU_FRAGMENT_CONTAINER_ID = 2131558703;
    private static final String TAG = BaseFragmentDelegate.class.getSimpleName();
    private AnimationComposite animationComposite;
    private SparseArray<List<Integer>> currentFragments;
    private Camera mActivity;
    private BaseLifecycleListener mBaseLifecycleListener = null;
    private FragmentManager mSupportFragmentManager = null;
    private SparseIntArray originalFragments;

    @Retention(RetentionPolicy.SOURCE)
    public @interface FragmentInto {
    }

    public BaseFragmentDelegate(Camera camera) {
        this.mActivity = camera;
        this.animationComposite = new AnimationComposite();
        this.originalFragments = new SparseIntArray();
    }

    private void applyUpdateSet(List<BaseFragmentOperation> list, BaseLifecycleListener baseLifecycleListener) {
        if (list == null || list.isEmpty()) {
            throw new RuntimeException("need operation info");
        } else if (this.mActivity == null || !this.mActivity.isFinishing()) {
            FragmentManager supportFragmentManager = this.mActivity.getSupportFragmentManager();
            FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction();
            for (BaseFragmentOperation baseFragmentOperation : list) {
                int activeFragment = getActiveFragment(baseFragmentOperation.containerViewId);
                int i = baseFragmentOperation.pendingFragmentInfo;
                switch (baseFragmentOperation.operateType) {
                    case 1:
                        int activeFragment2 = getActiveFragment(baseFragmentOperation.containerViewId);
                        this.animationComposite.remove(activeFragment2);
                        BaseFragment constructFragment = constructFragment(false, i, activeFragment2, baseLifecycleListener);
                        beginTransaction.replace(baseFragmentOperation.containerViewId, constructFragment, constructFragment.getFragmentTag());
                        this.animationComposite.put(constructFragment.getFragmentInto(), constructFragment);
                        updateCurrentFragments(baseFragmentOperation.containerViewId, i, baseFragmentOperation.operateType);
                        break;
                    case 2:
                        this.animationComposite.remove(i);
                        BaseFragment baseFragment = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(i));
                        if (baseFragment != null) {
                            baseFragment.pendingGone(false);
                            beginTransaction.remove(baseFragment);
                        }
                        updateCurrentFragments(baseFragmentOperation.containerViewId, i, baseFragmentOperation.operateType);
                        break;
                    case 3:
                        this.animationComposite.remove(activeFragment);
                        BaseFragment baseFragment2 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(activeFragment));
                        if (baseFragment2 != null) {
                            baseFragment2.pendingGone(false);
                            beginTransaction.remove(baseFragment2);
                        }
                        updateCurrentFragments(baseFragmentOperation.containerViewId, activeFragment, baseFragmentOperation.operateType);
                        break;
                    case 4:
                        BaseFragment baseFragment3 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(activeFragment));
                        if (baseFragment3 != null) {
                            baseFragment3.pendingGone(false);
                            beginTransaction.hide(baseFragment3);
                        }
                        BaseFragment baseFragment4 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(i));
                        if (baseFragment4 != null) {
                            baseFragment4.pendingShow();
                            beginTransaction.show(baseFragment4);
                        } else {
                            baseFragment4 = constructFragment(false, i, activeFragment, baseLifecycleListener);
                            beginTransaction.add(baseFragmentOperation.containerViewId, baseFragment4, baseFragment4.getFragmentTag());
                        }
                        this.animationComposite.put(baseFragment4.getFragmentInto(), baseFragment4);
                        updateCurrentFragments(baseFragmentOperation.containerViewId, i, baseFragmentOperation.operateType);
                        break;
                    case 5:
                        List list2 = (List) this.currentFragments.get(baseFragmentOperation.containerViewId);
                        for (int i2 = 0; i2 < list2.size(); i2++) {
                            int intValue = ((Integer) list2.get(i2)).intValue();
                            if (intValue != i) {
                                this.animationComposite.remove(intValue);
                                BaseFragment baseFragment5 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(intValue));
                                if (baseFragment5 != null) {
                                    if (intValue != activeFragment) {
                                        baseFragment5.pendingGone(true);
                                    } else {
                                        baseFragment5.pendingGone(false);
                                    }
                                    beginTransaction.remove(baseFragment5);
                                }
                            }
                        }
                        BaseFragment baseFragment6 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(i));
                        baseFragment6.setLastFragmentInfo(activeFragment);
                        baseFragment6.pendingShow();
                        beginTransaction.show(baseFragment6);
                        updateCurrentFragments(baseFragmentOperation.containerViewId, i, baseFragmentOperation.operateType);
                        break;
                    case 6:
                        if (activeFragment != i) {
                            BaseFragment baseFragment7 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(activeFragment));
                            if (baseFragment7 != null) {
                                baseFragment7.pendingGone(true);
                                beginTransaction.hide(baseFragment7);
                            }
                        }
                        BaseFragment baseFragment8 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(i));
                        baseFragment8.setLastFragmentInfo(activeFragment);
                        baseFragment8.pendingShow();
                        beginTransaction.show(baseFragment8);
                        updateCurrentFragments(baseFragmentOperation.containerViewId, i, baseFragmentOperation.operateType);
                        break;
                    case 7:
                        BaseFragment baseFragment9 = (BaseFragment) supportFragmentManager.findFragmentByTag(String.valueOf(activeFragment));
                        if (baseFragment9 != null) {
                            beginTransaction.hide(baseFragment9);
                        }
                        updateCurrentFragments(baseFragmentOperation.containerViewId, activeFragment, baseFragmentOperation.operateType);
                        break;
                }
            }
            beginTransaction.commitAllowingStateLoss();
        }
    }

    @Deprecated
    public static void bindLifeCircle(Fragment fragment) {
        FragmentManager childFragmentManager = fragment.getChildFragmentManager();
        BaseLifeCircleBindFragment baseLifeCircleBindFragment = new BaseLifeCircleBindFragment();
        baseLifeCircleBindFragment.getFragmentLifecycle().addListener(new BaseLifecycleListener() {
            public void onLifeAlive() {
            }

            public void onLifeDestroy(String str) {
            }

            public void onLifeStart(String str) {
            }

            public void onLifeStop(String str) {
            }

            public void setBlockingLifeCycles(List<String> list) {
            }
        }, BaseLifeCircleBindFragment.FRAGMENT_TAG);
        childFragmentManager.beginTransaction().add((Fragment) baseLifeCircleBindFragment, BaseLifeCircleBindFragment.FRAGMENT_TAG).commitAllowingStateLoss();
    }

    private BaseFragment constructFragment(boolean z, int i, int i2, BaseLifecycleListener baseLifecycleListener) {
        BaseFragment baseFragment = null;
        if (i == 247) {
            baseFragment = new FragmentManually();
        } else if (i == 249) {
            baseFragment = new FragmentPopupBeauty();
        } else if (i == 251) {
            baseFragment = new FragmentBeauty();
        } else if (i != 255) {
            switch (i) {
                case 240:
                    return null;
                case 241:
                    baseFragment = new FragmentBottomAction();
                    break;
                default:
                    switch (i) {
                        case 243:
                            baseFragment = new FragmentMainContent();
                            break;
                        case 244:
                            baseFragment = new FragmentTopConfig();
                            break;
                        default:
                            switch (i) {
                                case 4080:
                                    baseFragment = new FragmentPanorama();
                                    break;
                                case 4081:
                                    baseFragment = new FragmentBottomPopupTips();
                                    break;
                                case 4082:
                                    baseFragment = new FragmentPopupBeautyLevel();
                                    break;
                                case 4083:
                                    baseFragment = new FragmentBottomIntentDone();
                                    break;
                                case 4084:
                                    baseFragment = new FragmentDualCameraAdjust();
                                    break;
                                case 4085:
                                    baseFragment = new FragmentDualStereo();
                                    break;
                                case 4086:
                                    baseFragment = new FragmentFullScreen();
                                    break;
                                default:
                                    switch (i) {
                                        case FRAGMENT_VERTICAL /*4088*/:
                                            baseFragment = new FragmentVertical();
                                            break;
                                        case 4089:
                                            baseFragment = new FragmentPopuEyeLightTip();
                                            break;
                                        case 4090:
                                            baseFragment = new FragmentBlankBeauty();
                                            break;
                                        case 4091:
                                            baseFragment = new FragmentDualCameraBokehAdjust();
                                            break;
                                        case FRAGMENT_POPUP_LIVE_STICKER /*4092*/:
                                            baseFragment = new FragmentLiveSticker();
                                            break;
                                        case FRAGMENT_POPUP_LIVE_SPEED /*4093*/:
                                            baseFragment = new FragmentLiveSpeed();
                                            break;
                                        case 4094:
                                            baseFragment = new FragmentWideSelfie();
                                            break;
                                        case FRAGMENT_MIMOJI_LIST /*4095*/:
                                            baseFragment = new FragmentMimoji();
                                            break;
                                    }
                            }
                    }
            }
        } else {
            baseFragment = new FragmentSticker();
        }
        baseFragment.setLastFragmentInfo(i2);
        baseFragment.setLifecycleListener(baseLifecycleListener);
        baseFragment.registerProtocol();
        baseFragment.setEnableClickInitValue(!z);
        return baseFragment;
    }

    private void initCurrentFragments(SparseIntArray sparseIntArray) {
        int size = sparseIntArray.size();
        this.currentFragments = new SparseArray<>(size);
        for (int i = 0; i < size; i++) {
            ArrayList arrayList = new ArrayList();
            arrayList.add(Integer.valueOf(sparseIntArray.valueAt(i)));
            this.currentFragments.put(sparseIntArray.keyAt(i), arrayList);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0038, code lost:
        if (((java.lang.Integer) r2.get(r0)).intValue() != r3) goto L_0x003e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x003a, code lost:
        r2.remove(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x003e, code lost:
        r0 = r0 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0041, code lost:
        r2.add(java.lang.Integer.valueOf(r3));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0060, code lost:
        if (r0 >= r2.size()) goto L_0x009b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x006c, code lost:
        if (((java.lang.Integer) r2.get(r0)).intValue() != r3) goto L_0x0072;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x006e, code lost:
        r2.remove(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0072, code lost:
        r0 = r0 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x007a, code lost:
        if (r0 >= r2.size()) goto L_0x009b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0086, code lost:
        if (((java.lang.Integer) r2.get(r0)).intValue() != r3) goto L_0x008c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0088, code lost:
        r2.remove(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x008c, code lost:
        r0 = r0 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:3:0x0012, code lost:
        if (r0 >= r2.size()) goto L_0x009b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x001e, code lost:
        if (((java.lang.Integer) r2.get(r0)).intValue() != r3) goto L_0x0025;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x0020, code lost:
        r2.remove(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0025, code lost:
        r0 = r0 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x002c, code lost:
        if (r0 >= r2.size()) goto L_0x0041;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateCurrentFragments(@IdRes int i, int i2, int i3) {
        List list = (List) this.currentFragments.get(i);
        int i4 = 0;
        switch (i3) {
            case 1:
                list.clear();
                list.add(Integer.valueOf(i2));
                return;
            case 2:
                break;
            case 3:
                break;
            case 4:
                list.add(Integer.valueOf(i2));
                return;
            case 5:
                list.clear();
                list.add(Integer.valueOf(i2));
                return;
            case 6:
                break;
            case 7:
                break;
            default:
                return;
        }
    }

    public void delegateEvent(int i) {
        ArrayList arrayList = new ArrayList();
        switch (i) {
            case 1:
                if (getActiveFragment(R.id.bottom_action) != 250) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).push(250));
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                }
                arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                break;
            case 2:
                if (getActiveFragment(R.id.bottom_beauty) == 251) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).replaceWith(251));
                    break;
                }
            case 4:
                if (getActiveFragment(R.id.bottom_action) == 255) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).replaceWith(4081));
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).push(255));
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    break;
                }
            case 5:
                if (getActiveFragment(R.id.bottom_popup_beauty) == 4082) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).replaceWith(4082));
                    break;
                }
            case 6:
                if (getActiveFragment(R.id.bottom_action) == 4083) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    arrayList.add(BaseFragmentOperation.create(R.id.main_top).show(getOriginalFragment(R.id.main_top)));
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_manually).show(getOriginalFragment(R.id.bottom_popup_manually)));
                    if (!this.mActivity.getCameraIntentManager().isVideoCaptureIntent()) {
                        arrayList.add(BaseFragmentOperation.create(R.id.main_content).show(getOriginalFragment(R.id.main_content)));
                    }
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).show(getOriginalFragment(R.id.bottom_popup_tips)));
                    if (b.isSupportedOpticalZoom() || b.ie() || HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                        arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_dual_camera_adjust).show(getOriginalFragment(R.id.bottom_popup_dual_camera_adjust)));
                        break;
                    }
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).push(4083));
                    arrayList.add(BaseFragmentOperation.create(R.id.main_top).hideCurrent());
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_manually).hideCurrent());
                    if (!this.mActivity.getCameraIntentManager().isVideoCaptureIntent()) {
                        arrayList.add(BaseFragmentOperation.create(R.id.main_content).hideCurrent());
                    }
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).hideCurrent());
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_dual_camera_adjust).hideCurrent());
                    break;
                }
            case 7:
                if (getActiveFragment(R.id.bottom_action) != 241) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_action).popAndClearOthers(241));
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_beauty).removeCurrent());
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_tips).replaceWith(4081));
                    break;
                }
                break;
            case 9:
                if (getActiveFragment(R.id.bottom_popup_eye_light) != 240) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_eye_light).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_popup_eye_light).replaceWith(4089));
                    break;
                }
            case 10:
                if (getActiveFragment(R.id.bottom_beauty) == 4090) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).replaceWith(4090));
                    break;
                }
            case 12:
                if (getActiveFragment(R.id.bottom_beauty) == 4092) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).replaceWith(FRAGMENT_POPUP_LIVE_STICKER));
                    break;
                }
            case 13:
                if (getActiveFragment(R.id.bottom_beauty) == 4093) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).replaceWith(FRAGMENT_POPUP_LIVE_SPEED));
                    break;
                }
            case 14:
                if (getActiveFragment(R.id.bottom_beauty) == 4095) {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).removeCurrent());
                    break;
                } else {
                    arrayList.add(BaseFragmentOperation.create(R.id.bottom_beauty).replaceWith(FRAGMENT_MIMOJI_LIST));
                    break;
                }
        }
        applyUpdateSet(arrayList, null);
    }

    public Disposable delegateMode(@Nullable Completable completable, StartControl startControl, final BaseLifecycleListener baseLifecycleListener) {
        if (this.mActivity == null) {
            return null;
        }
        Action r0 = baseLifecycleListener != null ? new Action() {
            public void run() throws Exception {
                baseLifecycleListener.onLifeAlive();
            }
        } : null;
        if (!DataRepository.dataItemFeature().isSupportUltraWide()) {
            return this.animationComposite.dispose(completable, r0, startControl);
        }
        if (completable != null) {
            if (baseLifecycleListener != null) {
                completable.subscribe(r0);
            } else {
                completable.subscribe();
            }
        }
        return this.animationComposite.dispose(null, null, startControl);
    }

    public int getActiveFragment(@IdRes int i) {
        List list = (List) this.currentFragments.get(i);
        if (list == null || list.isEmpty()) {
            return 240;
        }
        return ((Integer) list.get(list.size() - 1)).intValue();
    }

    public AnimationComposite getAnimationComposite() {
        return this.animationComposite;
    }

    public int getOriginalFragment(@IdRes int i) {
        return this.originalFragments.get(i, 240);
    }

    public void init(FragmentManager fragmentManager, int i, BaseLifecycleListener baseLifecycleListener) {
        BaseLifecycleListener baseLifecycleListener2 = baseLifecycleListener;
        registerProtocol();
        this.mSupportFragmentManager = fragmentManager;
        this.mBaseLifecycleListener = baseLifecycleListener2;
        BaseFragment constructFragment = constructFragment(true, 244, 240, baseLifecycleListener2);
        BaseFragment constructFragment2 = constructFragment(true, 247, 240, baseLifecycleListener2);
        BaseFragment constructFragment3 = constructFragment(true, 4081, 240, baseLifecycleListener2);
        BaseFragment constructFragment4 = constructFragment(true, 241, 240, baseLifecycleListener2);
        BaseFragment constructFragment5 = constructFragment(true, 243, 240, baseLifecycleListener2);
        BaseFragment constructFragment6 = constructFragment(true, 4080, 240, baseLifecycleListener2);
        BaseFragment constructFragment7 = constructFragment(true, FRAGMENT_VERTICAL, 240, baseLifecycleListener2);
        FragmentTransaction beginTransaction = fragmentManager.beginTransaction();
        beginTransaction.replace(R.id.bottom_popup_tips, constructFragment3, constructFragment3.getFragmentTag());
        beginTransaction.replace(R.id.bottom_action, constructFragment4, constructFragment4.getFragmentTag());
        beginTransaction.replace(R.id.main_top, constructFragment, constructFragment.getFragmentTag());
        beginTransaction.replace(R.id.bottom_popup_manually, constructFragment2, constructFragment2.getFragmentTag());
        beginTransaction.replace(R.id.main_content, constructFragment5, constructFragment5.getFragmentTag());
        beginTransaction.replace(R.id.panorama_content, constructFragment6, constructFragment6.getFragmentTag());
        beginTransaction.replace(R.id.main_vertical, constructFragment7, constructFragment7.getFragmentTag());
        BaseFragment baseFragment = (b.isSupportedOpticalZoom() || HybridZoomingSystem.IS_3_OR_MORE_SAT) ? constructFragment(true, 4084, 240, baseLifecycleListener2) : b.ie() ? constructFragment(true, 4085, 240, baseLifecycleListener2) : null;
        if (baseFragment != null) {
            this.originalFragments.put(R.id.bottom_popup_dual_camera_adjust, baseFragment.getFragmentInto());
            this.animationComposite.put(baseFragment.getFragmentInto(), baseFragment);
            beginTransaction.replace(R.id.bottom_popup_dual_camera_adjust, baseFragment, baseFragment.getFragmentTag());
        } else {
            this.originalFragments.put(R.id.bottom_popup_dual_camera_adjust, 240);
        }
        if (DataRepository.dataItemFeature().isSupportBokehAdjust()) {
            BaseFragment constructFragment8 = constructFragment(true, 4091, 240, baseLifecycleListener2);
            this.originalFragments.put(R.id.bottom_popup_dual_camera_bokeh_adjust, constructFragment8.getFragmentInto());
            this.animationComposite.put(constructFragment8.getFragmentInto(), constructFragment8);
            beginTransaction.replace(R.id.bottom_popup_dual_camera_bokeh_adjust, constructFragment8, constructFragment8.getFragmentTag());
        }
        this.originalFragments.put(R.id.bottom_popup_tips, constructFragment3.getFragmentInto());
        this.originalFragments.put(R.id.bottom_action, constructFragment4.getFragmentInto());
        this.originalFragments.put(R.id.main_top, constructFragment.getFragmentInto());
        this.originalFragments.put(R.id.bottom_popup_beauty, 240);
        this.originalFragments.put(R.id.bottom_popup_manually, constructFragment2.getFragmentInto());
        this.originalFragments.put(R.id.main_content, constructFragment5.getFragmentInto());
        this.originalFragments.put(R.id.panorama_content, constructFragment6.getFragmentInto());
        this.originalFragments.put(R.id.bottom_beauty, 240);
        this.originalFragments.put(R.id.bottom_popup_eye_light, 240);
        this.animationComposite.put(constructFragment3.getFragmentInto(), constructFragment3);
        this.animationComposite.put(constructFragment.getFragmentInto(), constructFragment);
        this.animationComposite.put(constructFragment2.getFragmentInto(), constructFragment2);
        this.animationComposite.put(constructFragment5.getFragmentInto(), constructFragment5);
        this.animationComposite.put(constructFragment4.getFragmentInto(), constructFragment4);
        this.animationComposite.put(constructFragment6.getFragmentInto(), constructFragment6);
        this.animationComposite.put(constructFragment7.getFragmentInto(), constructFragment7);
        if (DataRepository.dataItemFeature().fS()) {
            BaseFragment constructFragment9 = constructFragment(true, 4094, 240, baseLifecycleListener2);
            beginTransaction.replace(R.id.wideselfie_content, constructFragment9, constructFragment9.getFragmentTag());
            this.animationComposite.put(constructFragment9.getFragmentInto(), constructFragment9);
        }
        initCurrentFragments(this.originalFragments);
        beginTransaction.commitAllowingStateLoss();
        baseLifecycleListener.onLifeAlive();
    }

    public void initTargetFragment(int i) {
        if (this.originalFragments.get(R.id.full_screen) != i) {
            FragmentTransaction beginTransaction = this.mSupportFragmentManager.beginTransaction();
            if (i == 4086) {
                BaseFragment constructFragment = constructFragment(true, 4086, 240, this.mBaseLifecycleListener);
                beginTransaction.replace(R.id.full_screen, constructFragment, constructFragment.getFragmentTag());
                this.originalFragments.put(R.id.full_screen, constructFragment.getFragmentInto());
                this.animationComposite.put(constructFragment.getFragmentInto(), constructFragment);
                initCurrentFragments(this.originalFragments);
                beginTransaction.commitAllowingStateLoss();
                this.mBaseLifecycleListener.onLifeAlive();
            }
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(160, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(160, this);
        this.animationComposite.destroy();
        this.mActivity = null;
    }
}
