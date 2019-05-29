package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.content.res.Resources;
import com.android.camera.R;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.log.Log;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigType;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigValue;
import com.arcsoft.avatar.AvatarEngine;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class AvatarEngineManager {
    public static final String BearTemplatePath;
    public static final int CONFIGTYPE_EARRING = 16;
    public static final int CONFIGTYPE_EAR_SHAPE = 27;
    public static final int CONFIGTYPE_EYEBROW_COLOR = 18;
    public static final int CONFIGTYPE_EYEBROW_SHAPE = 28;
    public static final int CONFIGTYPE_EYEGLASS = 9;
    public static final int CONFIGTYPE_EYEGLASS_COLOR = 10;
    public static final int CONFIGTYPE_EYELASH = 17;
    public static final int CONFIGTYPE_EYE_COLOR = 4;
    public static final int CONFIGTYPE_EYE_SHAPE = 20;
    public static final int CONFIGTYPE_FACE_COLOR = 3;
    public static final int CONFIGTYPE_FEATURED_FACE = 19;
    public static final int CONFIGTYPE_FRECKLE = 7;
    public static final int CONFIGTYPE_HAIR_COLOR = 2;
    public static final int CONFIGTYPE_HAIR_STYLE = 1;
    public static final int CONFIGTYPE_HEADWEAR = 12;
    public static final int CONFIGTYPE_HEADWEAR_COLOR = 13;
    public static final int CONFIGTYPE_LENS_COLOR = 11;
    public static final int CONFIGTYPE_LIPS_COLOR = 5;
    public static final int CONFIGTYPE_MOUSE_SHAPE = 21;
    public static final int CONFIGTYPE_MUSTACHE = 14;
    public static final int CONFIGTYPE_MUSTACHE_COLOR = 15;
    public static final int CONFIGTYPE_NEVUS = 8;
    public static final int CONFIGTYPE_NOSE_SHAPE = 24;
    public static final String FACE_MODEL;
    public static final String FAKE_BEAR_CONFIGPATH = "bear";
    public static final String FAKE_PIG_CONFIGPATH = "pig";
    public static final String FAKE_ROYAN_CONFIGPATH = "royan";
    public static final String PersonTemplatePath;
    public static final String PigTemplatePath;
    public static final String RoyanTemplatePath;
    public static final int THUMB_HEIGHT = 200;
    public static final int THUMB_WIDTH = 200;
    public static final String TRACK_DATA;
    public static final String TempEditConfigPath;
    public static final String TempOriginalConfigPath;
    private static AvatarEngineManager mInstance;
    private ASAvatarConfigValue mASAvatarConfigValue;
    private ASAvatarConfigValue mASAvatarConfigValueDefault;
    private boolean mAllNeedUpdate = false;
    private AvatarEngine mAvatar;
    private int mAvatarRef = 0;
    private Map<Integer, LinearLayoutManagerWrapper> mColorLayoutManagerMap = new ConcurrentHashMap();
    private Map<Integer, ArrayList<ASAvatarConfigInfo>> mConfigMap = new ConcurrentHashMap();
    private Map<Integer, Float> mInnerConfigSelectMap = new ConcurrentHashMap();
    private Map<Integer, Integer> mInterruptMap = new ConcurrentHashMap();
    private boolean mIsColorSelected = false;
    private Map<Integer, Boolean> mNeedUpdateMap = new ConcurrentHashMap();
    private int mSelectTabIndex = 0;
    private int mSelectType = 0;
    private ArrayList<MimojiLevelBean> mSubConfigs = new ArrayList<>();
    private ArrayList<ASAvatarConfigType> mTypeList = new ArrayList<>();

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(MimojiHelper.MIMOJI_DIR);
        sb.append("track_data.dat");
        TRACK_DATA = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(MimojiHelper.MIMOJI_DIR);
        sb2.append("config.txt");
        FACE_MODEL = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(MimojiHelper.MIMOJI_DIR);
        sb3.append("model/cartoon_xiaomi_v_0_0_0_21");
        PersonTemplatePath = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(MimojiHelper.MIMOJI_DIR);
        sb4.append("model/bear_v_0_0_0_3");
        BearTemplatePath = sb4.toString();
        StringBuilder sb5 = new StringBuilder();
        sb5.append(MimojiHelper.MIMOJI_DIR);
        sb5.append("model/pig_v_0_0_0_3");
        PigTemplatePath = sb5.toString();
        StringBuilder sb6 = new StringBuilder();
        sb6.append(MimojiHelper.MIMOJI_DIR);
        sb6.append("model/royan_v_0_0_0_2");
        RoyanTemplatePath = sb6.toString();
        StringBuilder sb7 = new StringBuilder();
        sb7.append(MimojiHelper.MIMOJI_DIR);
        sb7.append("origin_config.dat");
        TempOriginalConfigPath = sb7.toString();
        StringBuilder sb8 = new StringBuilder();
        sb8.append(MimojiHelper.MIMOJI_DIR);
        sb8.append("edit_config.dat");
        TempEditConfigPath = sb8.toString();
    }

    public static boolean filterTypeTitle(int i) {
        if (!(i == 1 || i == 12 || i == 14 || i == 28)) {
            switch (i) {
                case 8:
                case 9:
                    break;
                default:
                    switch (i) {
                        case 19:
                        case 20:
                        case 21:
                            break;
                        default:
                            return true;
                    }
            }
        }
        return false;
    }

    public static synchronized AvatarEngineManager getInstance() {
        AvatarEngineManager avatarEngineManager;
        synchronized (AvatarEngineManager.class) {
            if (mInstance == null) {
                mInstance = new AvatarEngineManager();
            }
            avatarEngineManager = mInstance;
        }
        return avatarEngineManager;
    }

    public static boolean isPrefabModel(String str) {
        return str.equals(FAKE_PIG_CONFIGPATH) || str.equals(FAKE_BEAR_CONFIGPATH) || str.equals(FAKE_ROYAN_CONFIGPATH);
    }

    public static String replaceTabTitle(Context context, int i) {
        Resources resources = context.getResources();
        if (i == 1) {
            return resources.getString(R.string.mimoji_hairstyle);
        }
        if (i == 12) {
            return resources.getString(R.string.mimoji_ornament);
        }
        if (i == 14) {
            return resources.getString(R.string.mimoji_mustache);
        }
        if (i == 28) {
            return resources.getString(R.string.mimoji_eyebrow);
        }
        switch (i) {
            case 8:
                return resources.getString(R.string.mimoji_freckle);
            case 9:
                return resources.getString(R.string.mimoji_eyeglass);
            default:
                switch (i) {
                    case 19:
                        return resources.getString(R.string.mimoji_featured_face);
                    case 20:
                        return resources.getString(R.string.mimoji_eye);
                    case 21:
                        return resources.getString(R.string.mimoji_nose_lisps);
                    default:
                        return "";
                }
        }
    }

    private void resetInnerConfigSelectMap() {
        getASAvatarConfigValueDefault();
    }

    public static boolean showConfigTypeName(int i) {
        if (!(i == 1 || i == 7 || i == 9 || i == 14 || i == 24 || i == 28)) {
            switch (i) {
                case 19:
                case 20:
                    break;
                default:
                    return true;
            }
        }
        return false;
    }

    public ASAvatarConfigValue getASAvatarConfigValue() {
        return this.mASAvatarConfigValue;
    }

    public ASAvatarConfigValue getASAvatarConfigValueDefault() {
        if (this.mASAvatarConfigValueDefault != null) {
            ASAvatarConfigValue aSAvatarConfigValue = this.mASAvatarConfigValueDefault;
            String str = FragmentMimojiEdit.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("value 属性:gender = ");
            sb.append(aSAvatarConfigValue.gender);
            sb.append(" configHairStyleID = ");
            sb.append(aSAvatarConfigValue.configHairStyleID);
            sb.append(" configHairColorID = ");
            sb.append(aSAvatarConfigValue.configHairColorID);
            sb.append(" configHairColorValue = ");
            sb.append(aSAvatarConfigValue.configHairColorValue);
            sb.append(" configFaceColorID = ");
            sb.append(aSAvatarConfigValue.configFaceColorID);
            sb.append(" configFaceColorValue = ");
            sb.append(aSAvatarConfigValue.configFaceColorValue);
            sb.append(" configEyeColorID = ");
            sb.append(aSAvatarConfigValue.configEyeColorID);
            sb.append(" configEyeColorValue = ");
            sb.append(aSAvatarConfigValue.configEyeColorValue);
            sb.append(" configLipColorID = ");
            sb.append(aSAvatarConfigValue.configLipColorID);
            sb.append(" configLipColorValue = ");
            sb.append(aSAvatarConfigValue.configLipColorValue);
            sb.append(" configHairHighlightColorID = ");
            sb.append(aSAvatarConfigValue.configHairHighlightColorID);
            sb.append(" configHairHighlightColorValue = ");
            sb.append(aSAvatarConfigValue.configHairHighlightColorValue);
            sb.append(" configFrecklesID = ");
            sb.append(aSAvatarConfigValue.configFrecklesID);
            sb.append(" configNevusID = ");
            sb.append(aSAvatarConfigValue.configNevusID);
            sb.append(" configEyewearStyleID = ");
            sb.append(aSAvatarConfigValue.configEyewearStyleID);
            sb.append(" configEyewearFrameID = ");
            sb.append(aSAvatarConfigValue.configEyewearFrameID);
            sb.append(" configEyewearFrameValue = ");
            sb.append(aSAvatarConfigValue.configEyewearFrameValue);
            sb.append(" configEyewearLensesID = ");
            sb.append(aSAvatarConfigValue.configEyewearLensesID);
            sb.append(" configEyewearLensesValue = ");
            sb.append(aSAvatarConfigValue.configEyewearLensesValue);
            sb.append(" configHeadwearStyleID = ");
            sb.append(aSAvatarConfigValue.configHeadwearStyleID);
            sb.append(" configHeadwearColorID = ");
            sb.append(aSAvatarConfigValue.configHeadwearColorID);
            sb.append(" configHeadwearColorValue = ");
            sb.append(aSAvatarConfigValue.configHeadwearColorValue);
            sb.append(" configBeardStyleID = ");
            sb.append(aSAvatarConfigValue.configBeardStyleID);
            sb.append(" configBeardColorID = ");
            sb.append(aSAvatarConfigValue.configBeardColorID);
            sb.append(" configBeardColorValue = ");
            sb.append(aSAvatarConfigValue.configBeardColorValue);
            sb.append(" configEarringStyleID = ");
            sb.append(aSAvatarConfigValue.configEarringStyleID);
            sb.append(" configEyelashStyleID = ");
            sb.append(aSAvatarConfigValue.configEyelashStyleID);
            sb.append(" configEyebrowColorID = ");
            sb.append(aSAvatarConfigValue.configEyebrowColorID);
            sb.append(" configEyebrowColorValue = ");
            sb.append(aSAvatarConfigValue.configEyebrowColorValue);
            sb.append(" configFaceShapeID = ");
            sb.append(aSAvatarConfigValue.configFaceShapeID);
            sb.append(" configFaceShapeValue = ");
            sb.append(aSAvatarConfigValue.configFaceShapeValue);
            sb.append(" configEyeShapeID = ");
            sb.append(aSAvatarConfigValue.configEyeShapeID);
            sb.append(" configEyeShapeValue = ");
            sb.append(aSAvatarConfigValue.configEyeShapeValue);
            sb.append(" configMouthShapeID = ");
            sb.append(aSAvatarConfigValue.configMouthShapeID);
            sb.append(" configMouthShapeValue = ");
            sb.append(aSAvatarConfigValue.configMouthShapeValue);
            sb.append(" configNoseShapeID = ");
            sb.append(aSAvatarConfigValue.configNoseShapeID);
            sb.append(" configNoseShapeValue = ");
            sb.append(aSAvatarConfigValue.configNoseShapeValue);
            sb.append(" configEarShapeID = ");
            sb.append(aSAvatarConfigValue.configEarShapeID);
            sb.append(" configEarShapeValue = ");
            sb.append(aSAvatarConfigValue.configEarShapeValue);
            sb.append(" configEyebrowShapeID = ");
            sb.append(aSAvatarConfigValue.configEyebrowShapeID);
            sb.append(" configEyebrowShapeValue = ");
            sb.append(aSAvatarConfigValue.configEyebrowShapeValue);
            Log.i(str, sb.toString());
            this.mInnerConfigSelectMap.put(Integer.valueOf(1), Float.valueOf((float) aSAvatarConfigValue.configHairStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(2), Float.valueOf((float) aSAvatarConfigValue.configHairColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(3), Float.valueOf((float) aSAvatarConfigValue.configFaceColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(19), Float.valueOf((float) aSAvatarConfigValue.configFaceShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(4), Float.valueOf(aSAvatarConfigValue.configEyeColorValue));
            this.mInnerConfigSelectMap.put(Integer.valueOf(5), Float.valueOf((float) aSAvatarConfigValue.configLipColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(7), Float.valueOf((float) aSAvatarConfigValue.configFrecklesID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(8), Float.valueOf((float) aSAvatarConfigValue.configNevusID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(23), Float.valueOf((float) aSAvatarConfigValue.configEyewearStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(9), Float.valueOf((float) aSAvatarConfigValue.configHeadwearStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(14), Float.valueOf((float) aSAvatarConfigValue.configBeardStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(15), Float.valueOf((float) aSAvatarConfigValue.configBeardColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(23), Float.valueOf((float) aSAvatarConfigValue.configEarringStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(17), Float.valueOf((float) aSAvatarConfigValue.configEyelashStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(18), Float.valueOf((float) aSAvatarConfigValue.configEyebrowColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(20), Float.valueOf((float) aSAvatarConfigValue.configEyeShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(21), Float.valueOf((float) aSAvatarConfigValue.configMouthShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(24), Float.valueOf((float) aSAvatarConfigValue.configNoseShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(27), Float.valueOf((float) aSAvatarConfigValue.configEarShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(28), Float.valueOf((float) aSAvatarConfigValue.configEyebrowShapeID));
        }
        return this.mASAvatarConfigValueDefault;
    }

    public LinearLayoutManagerWrapper getColorLayoutManagerMap(int i) {
        return (LinearLayoutManagerWrapper) this.mColorLayoutManagerMap.get(Integer.valueOf(i));
    }

    public int getColorType(int i) {
        if (i == 1) {
            return 2;
        }
        if (i == 12) {
            return 13;
        }
        if (i == 14) {
            return 15;
        }
        if (i == 19) {
            return 3;
        }
        if (i != 21) {
            return i != 28 ? -1 : 18;
        }
        return 5;
    }

    public ArrayList<ASAvatarConfigInfo> getConfigList(int i) {
        if (this.mConfigMap.size() <= 0) {
            return null;
        }
        return (ArrayList) this.mConfigMap.get(Integer.valueOf(i));
    }

    public ASAvatarConfigType getConfigTypeForIndex(int i) {
        if (this.mTypeList == null || this.mTypeList.size() <= 0) {
            return null;
        }
        return (ASAvatarConfigType) this.mTypeList.get(i);
    }

    public ArrayList<ASAvatarConfigType> getConfigTypeList() {
        return this.mTypeList;
    }

    public float getInnerConfigSelectIndex(int i) {
        if (this.mInnerConfigSelectMap.get(Integer.valueOf(i)) == null) {
            return -1.0f;
        }
        return ((Float) this.mInnerConfigSelectMap.get(Integer.valueOf(i))).floatValue();
    }

    public int getInterruptIndex(int i) {
        Integer num = (Integer) this.mInterruptMap.get(Integer.valueOf(i));
        if (num == null) {
            return 0;
        }
        return num.intValue();
    }

    public ArrayList<ASAvatarConfigInfo> getSelectConfigList() {
        if (this.mConfigMap.size() <= 0) {
            return null;
        }
        return (ArrayList) this.mConfigMap.get(Integer.valueOf(this.mSelectType));
    }

    public int getSelectType() {
        return this.mSelectType;
    }

    public int getSelectTypeIndex() {
        return this.mSelectTabIndex;
    }

    public ArrayList<ASAvatarConfigInfo> getSubConfigColorList(int i) {
        if (i == 1) {
            return getConfigList(2);
        }
        if (i == 12) {
            return getConfigList(13);
        }
        if (i == 14) {
            return getConfigList(15);
        }
        if (i == 28) {
            return getConfigList(18);
        }
        switch (i) {
            case 19:
                return getConfigList(3);
            case 20:
                return getConfigList(4);
            case 21:
                return getConfigList(5);
            default:
                return null;
        }
    }

    public ArrayList<MimojiLevelBean> getSubConfigList(Context context) {
        return getSubConfigList(context, this.mSelectType);
    }

    public ArrayList<MimojiLevelBean> getSubConfigList(Context context, int i) {
        this.mSubConfigs.clear();
        Resources resources = context.getResources();
        if (i == 1) {
            MimojiLevelBean mimojiLevelBean = new MimojiLevelBean();
            mimojiLevelBean.thumnails = getConfigList(1);
            if (mimojiLevelBean.thumnails != null && mimojiLevelBean.thumnails.size() > 0) {
                mimojiLevelBean.configType = 1;
                mimojiLevelBean.configTypeName = resources.getString(R.string.mimoji_hairstyle);
                this.mSubConfigs.add(mimojiLevelBean);
            }
        } else if (i == 12) {
            MimojiLevelBean mimojiLevelBean2 = new MimojiLevelBean();
            mimojiLevelBean2.thumnails = getConfigList(12);
            if (mimojiLevelBean2.thumnails != null && mimojiLevelBean2.thumnails.size() > 0) {
                mimojiLevelBean2.configType = 12;
                mimojiLevelBean2.configTypeName = resources.getString(R.string.mimoji_headwear);
                this.mSubConfigs.add(mimojiLevelBean2);
            }
            MimojiLevelBean mimojiLevelBean3 = new MimojiLevelBean();
            mimojiLevelBean3.thumnails = getConfigList(16);
            if (mimojiLevelBean3.thumnails != null && mimojiLevelBean3.thumnails.size() > 0) {
                mimojiLevelBean3.configType = 16;
                mimojiLevelBean3.configTypeName = resources.getString(R.string.mimoji_earring);
                this.mSubConfigs.add(mimojiLevelBean3);
            }
        } else if (i == 14) {
            MimojiLevelBean mimojiLevelBean4 = new MimojiLevelBean();
            mimojiLevelBean4.thumnails = getConfigList(14);
            if (mimojiLevelBean4.thumnails != null && mimojiLevelBean4.thumnails.size() > 0) {
                mimojiLevelBean4.configType = 14;
                mimojiLevelBean4.configTypeName = resources.getString(R.string.mimoji_mustache);
                this.mSubConfigs.add(mimojiLevelBean4);
            }
        } else if (i != 28) {
            switch (i) {
                case 8:
                    MimojiLevelBean mimojiLevelBean5 = new MimojiLevelBean();
                    mimojiLevelBean5.thumnails = getConfigList(7);
                    if (mimojiLevelBean5.thumnails != null && mimojiLevelBean5.thumnails.size() > 0) {
                        mimojiLevelBean5.configType = 7;
                        mimojiLevelBean5.configTypeName = resources.getString(R.string.mimoji_freckle);
                        this.mSubConfigs.add(mimojiLevelBean5);
                    }
                    MimojiLevelBean mimojiLevelBean6 = new MimojiLevelBean();
                    mimojiLevelBean6.thumnails = getConfigList(8);
                    if (mimojiLevelBean6.thumnails != null && mimojiLevelBean6.thumnails.size() > 0) {
                        mimojiLevelBean6.configType = 8;
                        mimojiLevelBean6.configTypeName = resources.getString(R.string.mimoji_mole);
                        this.mSubConfigs.add(mimojiLevelBean6);
                        break;
                    }
                case 9:
                    MimojiLevelBean mimojiLevelBean7 = new MimojiLevelBean();
                    mimojiLevelBean7.thumnails = getConfigList(9);
                    if (mimojiLevelBean7.thumnails != null && mimojiLevelBean7.thumnails.size() > 0) {
                        mimojiLevelBean7.configType = 9;
                        mimojiLevelBean7.configTypeName = resources.getString(R.string.mimoji_eyeglass);
                        this.mSubConfigs.add(mimojiLevelBean7);
                        break;
                    }
                default:
                    switch (i) {
                        case 19:
                            MimojiLevelBean mimojiLevelBean8 = new MimojiLevelBean();
                            mimojiLevelBean8.thumnails.addAll(getConfigList(19));
                            if (mimojiLevelBean8.thumnails != null && mimojiLevelBean8.thumnails.size() > 0) {
                                mimojiLevelBean8.configType = 19;
                                mimojiLevelBean8.configTypeName = resources.getString(R.string.mimoji_featured_face);
                                this.mSubConfigs.add(mimojiLevelBean8);
                            }
                            MimojiLevelBean mimojiLevelBean9 = new MimojiLevelBean();
                            mimojiLevelBean9.thumnails = getConfigList(27);
                            if (mimojiLevelBean9.thumnails != null && mimojiLevelBean9.thumnails.size() > 0) {
                                mimojiLevelBean9.configType = 27;
                                mimojiLevelBean9.configTypeName = resources.getString(R.string.mimoji_ear);
                                this.mSubConfigs.add(mimojiLevelBean9);
                                break;
                            }
                        case 20:
                            MimojiLevelBean mimojiLevelBean10 = new MimojiLevelBean();
                            mimojiLevelBean10.thumnails = getConfigList(20);
                            if (mimojiLevelBean10.thumnails != null && mimojiLevelBean10.thumnails.size() > 0) {
                                mimojiLevelBean10.configType = 20;
                                mimojiLevelBean10.configTypeName = resources.getString(R.string.mimoji_eye_shape);
                                this.mSubConfigs.add(mimojiLevelBean10);
                            }
                            MimojiLevelBean mimojiLevelBean11 = new MimojiLevelBean();
                            mimojiLevelBean11.thumnails = getConfigList(17);
                            if (mimojiLevelBean11.thumnails != null && mimojiLevelBean11.thumnails.size() > 0) {
                                mimojiLevelBean11.configType = 17;
                                mimojiLevelBean11.configTypeName = resources.getString(R.string.mimoji_eyelash);
                                this.mSubConfigs.add(mimojiLevelBean11);
                                break;
                            }
                        case 21:
                            MimojiLevelBean mimojiLevelBean12 = new MimojiLevelBean();
                            mimojiLevelBean12.thumnails = getConfigList(24);
                            if (mimojiLevelBean12.thumnails != null && mimojiLevelBean12.thumnails.size() > 0) {
                                mimojiLevelBean12.configType = 24;
                                mimojiLevelBean12.configTypeName = resources.getString(R.string.mimoji_nose);
                                this.mSubConfigs.add(mimojiLevelBean12);
                            }
                            MimojiLevelBean mimojiLevelBean13 = new MimojiLevelBean();
                            mimojiLevelBean13.thumnails = getConfigList(21);
                            if (mimojiLevelBean13.thumnails != null && mimojiLevelBean13.thumnails.size() > 0) {
                                mimojiLevelBean13.configType = 21;
                                mimojiLevelBean13.configTypeName = resources.getString(R.string.mimoji_mouth_type);
                                this.mSubConfigs.add(mimojiLevelBean13);
                                break;
                            }
                    }
                    break;
            }
        } else {
            MimojiLevelBean mimojiLevelBean14 = new MimojiLevelBean();
            mimojiLevelBean14.thumnails = getConfigList(28);
            if (mimojiLevelBean14.thumnails != null && mimojiLevelBean14.thumnails.size() > 0) {
                mimojiLevelBean14.configType = 28;
                mimojiLevelBean14.configTypeName = resources.getString(R.string.mimoji_eyebrow_shape);
                this.mSubConfigs.add(mimojiLevelBean14);
            }
        }
        return this.mSubConfigs;
    }

    public void initUpdatePara() {
        this.mInterruptMap.clear();
        this.mNeedUpdateMap.clear();
        this.mAllNeedUpdate = true;
    }

    public boolean isColorSelected() {
        return this.mIsColorSelected;
    }

    public boolean isNeedUpdate(int i) {
        Boolean bool = (Boolean) this.mNeedUpdateMap.get(Integer.valueOf(i));
        boolean z = true;
        if (bool == null) {
            this.mNeedUpdateMap.put(Integer.valueOf(i), Boolean.valueOf(false));
            return true;
        }
        if (!bool.booleanValue() && !this.mAllNeedUpdate) {
            z = false;
        }
        return z;
    }

    public void putColorLayoutManagerMap(int i, LinearLayoutManagerWrapper linearLayoutManagerWrapper) {
        this.mColorLayoutManagerMap.put(Integer.valueOf(i), linearLayoutManagerWrapper);
    }

    public void putConfigList(int i, ArrayList<ASAvatarConfigInfo> arrayList) {
        if (!this.mConfigMap.containsKey(Integer.valueOf(i))) {
            this.mConfigMap.put(Integer.valueOf(i), arrayList);
        }
    }

    public synchronized AvatarEngine queryAvatar() {
        if (this.mAvatar == null) {
            Log.d("AvatarEngineManager", "avatar create");
            this.mAvatar = new AvatarEngine();
        }
        this.mAvatarRef++;
        return this.mAvatar;
    }

    public synchronized void releaseAvatar() {
        Log.d("AvatarEngineManager", "avatar destroy");
        this.mAvatar.destroy();
        this.mAvatar = null;
    }

    public void resetData() {
        this.mSelectType = 0;
        this.mSelectTabIndex = 0;
        resetInnerConfigSelectMap();
        this.mInnerConfigSelectMap.clear();
        this.mSubConfigs.clear();
        this.mColorLayoutManagerMap.clear();
    }

    public void setASAvatarConfigValue(ASAvatarConfigValue aSAvatarConfigValue) {
        this.mASAvatarConfigValue = aSAvatarConfigValue;
        if (aSAvatarConfigValue != null) {
            String str = FragmentMimojiEdit.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("value 属性:gender = ");
            sb.append(aSAvatarConfigValue.gender);
            sb.append(" configHairStyleID = ");
            sb.append(aSAvatarConfigValue.configHairStyleID);
            sb.append(" configHairColorID = ");
            sb.append(aSAvatarConfigValue.configHairColorID);
            sb.append(" configHairColorValue = ");
            sb.append(aSAvatarConfigValue.configHairColorValue);
            sb.append(" configFaceColorID = ");
            sb.append(aSAvatarConfigValue.configFaceColorID);
            sb.append(" configFaceColorValue = ");
            sb.append(aSAvatarConfigValue.configFaceColorValue);
            sb.append(" configEyeColorID = ");
            sb.append(aSAvatarConfigValue.configEyeColorID);
            sb.append(" configEyeColorValue = ");
            sb.append(aSAvatarConfigValue.configEyeColorValue);
            sb.append(" configLipColorID = ");
            sb.append(aSAvatarConfigValue.configLipColorID);
            sb.append(" configLipColorValue = ");
            sb.append(aSAvatarConfigValue.configLipColorValue);
            sb.append(" configHairHighlightColorID = ");
            sb.append(aSAvatarConfigValue.configHairHighlightColorID);
            sb.append(" configHairHighlightColorValue = ");
            sb.append(aSAvatarConfigValue.configHairHighlightColorValue);
            sb.append(" configFrecklesID = ");
            sb.append(aSAvatarConfigValue.configFrecklesID);
            sb.append(" configNevusID = ");
            sb.append(aSAvatarConfigValue.configNevusID);
            sb.append(" configEyewearStyleID = ");
            sb.append(aSAvatarConfigValue.configEyewearStyleID);
            sb.append(" configEyewearFrameID = ");
            sb.append(aSAvatarConfigValue.configEyewearFrameID);
            sb.append(" configEyewearFrameValue = ");
            sb.append(aSAvatarConfigValue.configEyewearFrameValue);
            sb.append(" configEyewearLensesID = ");
            sb.append(aSAvatarConfigValue.configEyewearLensesID);
            sb.append(" configEyewearLensesValue = ");
            sb.append(aSAvatarConfigValue.configEyewearLensesValue);
            sb.append(" configHeadwearStyleID = ");
            sb.append(aSAvatarConfigValue.configHeadwearStyleID);
            sb.append(" configHeadwearColorID = ");
            sb.append(aSAvatarConfigValue.configHeadwearColorID);
            sb.append(" configHeadwearColorValue = ");
            sb.append(aSAvatarConfigValue.configHeadwearColorValue);
            sb.append(" configBeardStyleID = ");
            sb.append(aSAvatarConfigValue.configBeardStyleID);
            sb.append(" configBeardColorID = ");
            sb.append(aSAvatarConfigValue.configBeardColorID);
            sb.append(" configBeardColorValue = ");
            sb.append(aSAvatarConfigValue.configBeardColorValue);
            sb.append(" configEarringStyleID = ");
            sb.append(aSAvatarConfigValue.configEarringStyleID);
            sb.append(" configEyelashStyleID = ");
            sb.append(aSAvatarConfigValue.configEyelashStyleID);
            sb.append(" configEyebrowColorID = ");
            sb.append(aSAvatarConfigValue.configEyebrowColorID);
            sb.append(" configEyebrowColorValue = ");
            sb.append(aSAvatarConfigValue.configEyebrowColorValue);
            sb.append(" configFaceShapeID = ");
            sb.append(aSAvatarConfigValue.configFaceShapeID);
            sb.append(" configFaceShapeValue = ");
            sb.append(aSAvatarConfigValue.configFaceShapeValue);
            sb.append(" configEyeShapeID = ");
            sb.append(aSAvatarConfigValue.configEyeShapeID);
            sb.append(" configEyeShapeValue = ");
            sb.append(aSAvatarConfigValue.configEyeShapeValue);
            sb.append(" configMouthShapeID = ");
            sb.append(aSAvatarConfigValue.configMouthShapeID);
            sb.append(" configMouthShapeValue = ");
            sb.append(aSAvatarConfigValue.configMouthShapeValue);
            sb.append(" configNoseShapeID = ");
            sb.append(aSAvatarConfigValue.configNoseShapeID);
            sb.append(" configNoseShapeValue = ");
            sb.append(aSAvatarConfigValue.configNoseShapeValue);
            sb.append(" configEarShapeID = ");
            sb.append(aSAvatarConfigValue.configEarShapeID);
            sb.append(" configEarShapeValue = ");
            sb.append(aSAvatarConfigValue.configEarShapeValue);
            sb.append(" configEyebrowShapeID = ");
            sb.append(aSAvatarConfigValue.configEyebrowShapeID);
            sb.append(" configEyebrowShapeValue = ");
            sb.append(aSAvatarConfigValue.configEyebrowShapeValue);
            Log.i(str, sb.toString());
            this.mInnerConfigSelectMap.put(Integer.valueOf(1), Float.valueOf((float) aSAvatarConfigValue.configHairStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(2), Float.valueOf((float) aSAvatarConfigValue.configHairColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(3), Float.valueOf((float) aSAvatarConfigValue.configFaceColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(19), Float.valueOf((float) aSAvatarConfigValue.configFaceShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(4), Float.valueOf(aSAvatarConfigValue.configEyeColorValue));
            this.mInnerConfigSelectMap.put(Integer.valueOf(5), Float.valueOf((float) aSAvatarConfigValue.configLipColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(7), Float.valueOf((float) aSAvatarConfigValue.configFrecklesID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(8), Float.valueOf((float) aSAvatarConfigValue.configNevusID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(23), Float.valueOf((float) aSAvatarConfigValue.configEyewearStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(9), Float.valueOf((float) aSAvatarConfigValue.configHeadwearStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(14), Float.valueOf((float) aSAvatarConfigValue.configBeardStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(15), Float.valueOf((float) aSAvatarConfigValue.configBeardColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(23), Float.valueOf((float) aSAvatarConfigValue.configEarringStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(17), Float.valueOf((float) aSAvatarConfigValue.configEyelashStyleID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(18), Float.valueOf((float) aSAvatarConfigValue.configEyebrowColorID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(20), Float.valueOf((float) aSAvatarConfigValue.configEyeShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(21), Float.valueOf((float) aSAvatarConfigValue.configMouthShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(24), Float.valueOf((float) aSAvatarConfigValue.configNoseShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(27), Float.valueOf((float) aSAvatarConfigValue.configEarShapeID));
            this.mInnerConfigSelectMap.put(Integer.valueOf(28), Float.valueOf((float) aSAvatarConfigValue.configEyebrowShapeID));
        }
    }

    public void setASAvatarConfigValueDefault(ASAvatarConfigValue aSAvatarConfigValue) {
        this.mASAvatarConfigValueDefault = (ASAvatarConfigValue) aSAvatarConfigValue.clone();
    }

    public void setAllNeedUpdate(boolean z, boolean z2) {
        this.mAllNeedUpdate = z;
        this.mIsColorSelected = z2;
        this.mInterruptMap.clear();
    }

    public void setConfigTypeList(ArrayList<ASAvatarConfigType> arrayList) {
        this.mTypeList = arrayList;
    }

    public void setInnerConfigSelectIndex(int i, float f) {
        this.mInnerConfigSelectMap.put(Integer.valueOf(i), Float.valueOf(f));
    }

    public void setInterruptIndex(int i, int i2) {
        this.mInterruptMap.put(Integer.valueOf(i), Integer.valueOf(i2));
    }

    public void setIsColorSelected(boolean z) {
        this.mIsColorSelected = z;
    }

    public void setSelectType(int i) {
        this.mSelectType = i;
    }

    public void setSelectTypeIndex(int i) {
        this.mSelectTabIndex = i;
    }

    public void setTypeNeedUpdate(int i, boolean z) {
        this.mNeedUpdateMap.put(Integer.valueOf(i), Boolean.valueOf(z));
    }
}
