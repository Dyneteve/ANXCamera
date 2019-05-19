package com.android.camera.network.live;

import android.os.Build;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.sticker.LiveStickerInfo;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TTLiveStickerResourceRequest extends BaseJsonRequest<List<LiveStickerInfo>> {
    private static final String APP_VERSION = "3.0.1";
    private static final String BASE_URL = "https://effect.snssdk.com/effect/api/v3/effects";
    private static final String DEVICE_ID = "123456";
    private static final String DEVICE_TYPE = "Xiaomi";
    private static final long MAX_CACHE_TIME = 86400000;
    private static final String PLATFORM = "android";
    private static final String SDK_VERSION = "3.4.0";

    public TTLiveStickerResourceRequest(String str, String str2) {
        super(BASE_URL);
        String accessKey = Util.getAccessKey();
        addParam("app_version", APP_VERSION);
        addParam("device_id", Util.sAAID);
        addParam(EffectConfiguration.KEY_ACCESS_KEY, accessKey);
        addParam(EffectConfiguration.KEY_SDK_VERSION, SDK_VERSION);
        addParam("channel", str);
        addParam(EffectConfiguration.KEY_DEVICE_PLATFORM, PLATFORM);
        addParam(EffectConfiguration.KEY_DEVICE_TYPE, Build.MODEL);
        addParam(EffectConfiguration.KEY_PANEL, str2);
    }

    /* access modifiers changed from: private */
    public List<LiveStickerInfo> loadFromCache() throws BaseRequestException {
        try {
            return processJson(new JSONObject(CameraSettings.getTTLiveStickerJsonCache()));
        } catch (JSONException e) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, e.getMessage(), e);
        }
    }

    public void execute(ResponseListener responseListener) {
        execute(true, responseListener);
    }

    public void execute(final boolean z, final ResponseListener responseListener) {
        AnonymousClass1 r0 = new ResponseListener() {
            public void onResponse(Object... objArr) {
                if (!z) {
                    CameraSettings.setLiveStickerLastCacheTime(0);
                }
                responseListener.onResponse(objArr);
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                if (errorCode == ErrorCode.NETWORK_NOT_CONNECTED) {
                    responseListener.onResponseError(errorCode, str, obj);
                    return;
                }
                try {
                    Log.v("BaseRequest", "Network error, TT sticker load from cache");
                    responseListener.onResponse(TTLiveStickerResourceRequest.this.loadFromCache());
                } catch (BaseRequestException e) {
                    responseListener.onResponseError(errorCode, str, obj);
                }
            }
        };
        if (!z) {
            CameraSettings.setLiveStickerLastCacheTime(0);
        }
        long liveStickerLastCacheTime = CameraSettings.getLiveStickerLastCacheTime();
        long currentTimeMillis = System.currentTimeMillis();
        if (liveStickerLastCacheTime <= 0 || currentTimeMillis - liveStickerLastCacheTime > MAX_CACHE_TIME) {
            Log.v("BaseRequest", "TT sticker directly request");
            super.execute(r0);
            return;
        }
        try {
            Log.v("BaseRequest", "TT sticker load from cache");
            responseListener.onResponse(loadFromCache());
        } catch (BaseRequestException e) {
            responseListener.onResponseError(e.getErrorCode(), e.getMessage(), e);
        }
    }

    /* access modifiers changed from: protected */
    public void hasUpdate(String str) {
        String tTLiveStickerJsonCache = CameraSettings.getTTLiveStickerJsonCache();
        if (!str.equals(tTLiveStickerJsonCache) && !tTLiveStickerJsonCache.isEmpty()) {
            CameraSettings.setTTLiveStickerNeedRedDot(true);
            CameraSettings.setLiveModuleClicked(false);
            CameraSettings.setLiveStickerRedDotTime(System.currentTimeMillis());
        }
    }

    /* access modifiers changed from: protected */
    public List<LiveStickerInfo> processJson(JSONObject jSONObject) throws BaseRequestException, JSONException {
        if (jSONObject == null || !jSONObject.has("status_code")) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, "response has no status_code");
        } else if (jSONObject.getInt("status_code") != 0) {
            throw new BaseRequestException(ErrorCode.SERVER_ERROR, jSONObject.optString("message"));
        } else if (!jSONObject.isNull("data")) {
            String jSONObject2 = jSONObject.toString();
            hasUpdate(jSONObject2);
            JSONObject optJSONObject = jSONObject.optJSONObject("data");
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArray = optJSONObject.getJSONArray("effects");
            if (jSONArray != null) {
                arrayList.ensureCapacity(jSONArray.length());
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject3 = jSONArray.getJSONObject(i);
                    LiveStickerInfo liveStickerInfo = new LiveStickerInfo();
                    liveStickerInfo.id = jSONObject3.optString("id");
                    liveStickerInfo.name = jSONObject3.optString("name");
                    liveStickerInfo.icon = jSONObject3.getJSONObject("icon_url").getJSONArray("url_list").optString(0);
                    liveStickerInfo.url = jSONObject3.getJSONObject("file_url").getJSONArray("url_list").optString(0);
                    liveStickerInfo.hash = jSONObject3.getJSONObject("file_url").optString("uri");
                    liveStickerInfo.hint = jSONObject3.optString("hint");
                    liveStickerInfo.hintIcon = jSONObject3.getJSONObject("hint_icon").getJSONArray("url_list").optString(0);
                    arrayList.add(liveStickerInfo);
                }
            }
            CameraSettings.setTTLiveStickerJsonCache(jSONObject2);
            CameraSettings.setLiveStickerLastCacheTime(System.currentTimeMillis());
            return arrayList;
        } else {
            throw new BaseRequestException(ErrorCode.BODY_EMPTY, "response empty data");
        }
    }
}
