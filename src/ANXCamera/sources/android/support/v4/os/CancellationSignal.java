package android.support.v4.os;

import android.os.Build.VERSION;

public final class CancellationSignal {
    private boolean mCancelInProgress;
    private Object mCancellationSignalObj;
    private boolean mIsCanceled;
    private OnCancelListener mOnCancelListener;

    public interface OnCancelListener {
        void onCancel();
    }

    private void waitForCancelFinishedLocked() {
        while (this.mCancelInProgress) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0014, code lost:
        if (r1 == null) goto L_0x001c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:?, code lost:
        r1.onCancel();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x001a, code lost:
        r3 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x001c, code lost:
        if (r0 == null) goto L_0x002d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x001e, code lost:
        android.support.v4.os.CancellationSignalCompatJellybean.cancel(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0022, code lost:
        monitor-enter(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:?, code lost:
        r5.mCancelInProgress = false;
        notifyAll();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0029, code lost:
        throw r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x002d, code lost:
        monitor-enter(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:?, code lost:
        r5.mCancelInProgress = false;
        notifyAll();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0033, code lost:
        monitor-exit(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x0035, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void cancel() {
        synchronized (this) {
            try {
                if (!this.mIsCanceled) {
                    this.mIsCanceled = true;
                    this.mCancelInProgress = true;
                    OnCancelListener onCancelListener = this.mOnCancelListener;
                    try {
                        Object obj = this.mCancellationSignalObj;
                    } catch (Throwable th) {
                        OnCancelListener onCancelListener2 = onCancelListener;
                        th = th;
                        while (true) {
                            try {
                                break;
                            } catch (Throwable th2) {
                                th = th2;
                            }
                        }
                        throw th;
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                while (true) {
                    break;
                }
                throw th;
            }
        }
    }

    public Object getCancellationSignalObject() {
        Object obj;
        if (VERSION.SDK_INT < 16) {
            return null;
        }
        synchronized (this) {
            if (this.mCancellationSignalObj == null) {
                this.mCancellationSignalObj = CancellationSignalCompatJellybean.create();
                if (this.mIsCanceled) {
                    CancellationSignalCompatJellybean.cancel(this.mCancellationSignalObj);
                }
            }
            obj = this.mCancellationSignalObj;
        }
        return obj;
    }

    public boolean isCanceled() {
        boolean z;
        synchronized (this) {
            z = this.mIsCanceled;
        }
        return z;
    }

    public void setOnCancelListener(OnCancelListener onCancelListener) {
        synchronized (this) {
            waitForCancelFinishedLocked();
            if (this.mOnCancelListener != onCancelListener) {
                this.mOnCancelListener = onCancelListener;
                if (this.mIsCanceled) {
                    if (onCancelListener != null) {
                        onCancelListener.onCancel();
                    }
                }
            }
        }
    }

    public void throwIfCanceled() {
        if (isCanceled()) {
            throw new OperationCanceledException();
        }
    }
}
