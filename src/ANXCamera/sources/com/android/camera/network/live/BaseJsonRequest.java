package com.android.camera.network.live;

import com.android.camera.network.net.base.ErrorCode;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class BaseJsonRequest<T> extends BaseRequest<T> {
    public BaseJsonRequest(String str) {
        super(str);
    }

    /* access modifiers changed from: protected */
    public T process(String str) throws BaseRequestException {
        try {
            return processJson(new JSONObject(str));
        } catch (JSONException e) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, e.getMessage(), e);
        }
    }

    public abstract T processJson(JSONObject jSONObject) throws BaseRequestException, JSONException;
}
