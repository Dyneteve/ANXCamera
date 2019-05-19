package com.android.volley;

import android.os.Handler;
import java.util.concurrent.Executor;

/* renamed from: com.android.volley.ExecutorDelivery reason: case insensitive filesystem */
public class C0017ExecutorDelivery implements C0027ResponseDelivery {
    private final Executor mResponsePoster;

    /* renamed from: com.android.volley.ExecutorDelivery$ResponseDeliveryRunnable */
    private class ResponseDeliveryRunnable implements Runnable {
        private final C0024Request mRequest;
        private final C0026Response mResponse;
        private final Runnable mRunnable;

        public ResponseDeliveryRunnable(C0024Request request, C0026Response response, Runnable runnable) {
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

    public C0017ExecutorDelivery(final Handler handler) {
        this.mResponsePoster = new Executor() {
            public void execute(Runnable command) {
                handler.post(command);
            }
        };
    }

    public C0017ExecutorDelivery(Executor executor) {
        this.mResponsePoster = executor;
    }

    public void postResponse(C0024Request<?> request, C0026Response<?> response) {
        postResponse(request, response, null);
    }

    public void postResponse(C0024Request<?> request, C0026Response<?> response, Runnable runnable) {
        request.markDelivered();
        request.addMarker("post-response");
        this.mResponsePoster.execute(new ResponseDeliveryRunnable(request, response, runnable));
    }

    public void postError(C0024Request<?> request, C0031VolleyError error) {
        request.addMarker("post-error");
        this.mResponsePoster.execute(new ResponseDeliveryRunnable(request, C0026Response.error(error), null));
    }
}
