package com.android.camera.network.resource;

import com.android.camera.network.download.Request;
import com.android.camera.network.resource.LiveResource;

public interface LiveDownloadHelper<T extends LiveResource> {
    Request createDownloadRequest(T t);

    boolean isDownloaded(T t);
}
