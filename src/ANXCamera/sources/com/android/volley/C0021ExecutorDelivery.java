package com.android.volley;

import android.os.Handler;
import java.util.concurrent.Executor;

/* renamed from: com.android.volley.ExecutorDelivery reason: case insensitive filesystem */
public class C0021ExecutorDelivery implements C0031ResponseDelivery {
    private final Executor mResponsePoster;

    /* renamed from: com.android.volley.ExecutorDelivery$ResponseDeliveryRunnable */
    private class ResponseDeliveryRunnable implements Runnable {
        private final C0028Request mRequest;
        private final C0030Response mResponse;
        private final Runnable mRunnable;

        public ResponseDeliveryRunnable(C0028Request request, C0030Response response, Runnable runnable) {
            this.mRequest = request;
            this.mResponse = response;
            this.mRunnable = runnable;
        }

        public void run() {
            if (this.mRequest.isCanceled()) {
                this.mRequest.finish("canceled-at-delivery");
                return;
            }
            if (this.mResponse.isSuccess()) {
                this.mRequest.deliverResponse(this.mResponse.result);
            } else {
                this.mRequest.deliverError(this.mResponse.error);
            }
            if (this.mResponse.intermediate) {
                this.mRequest.addMarker("intermediate-response");
            } else {
                this.mRequest.finish("done");
            }
            if (this.mRunnable != null) {
                this.mRunnable.run();
            }
        }
    }

    public C0021ExecutorDelivery(final Handler handler) {
        this.mResponsePoster = new Executor() {
            public void execute(Runnable runnable) {
                handler.post(runnable);
            }
        };
    }

    public C0021ExecutorDelivery(Executor executor) {
        this.mResponsePoster = executor;
    }

    public void postError(C0028Request<?> request, C0035VolleyError volleyError) {
        request.addMarker("post-error");
        this.mResponsePoster.execute(new ResponseDeliveryRunnable(request, C0030Response.error(volleyError), null));
    }

    public void postResponse(C0028Request<?> request, C0030Response<?> response) {
        postResponse(request, response, null);
    }

    public void postResponse(C0028Request<?> request, C0030Response<?> response, Runnable runnable) {
        request.markDelivered();
        request.addMarker("post-response");
        this.mResponsePoster.execute(new ResponseDeliveryRunnable(request, response, runnable));
    }
}
