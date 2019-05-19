package android.support.v4.app;

import android.os.Bundle;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.Loader;
import android.support.v4.content.Loader.OnLoadCanceledListener;
import android.support.v4.content.Loader.OnLoadCompleteListener;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.SparseArrayCompat;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Modifier;

/* compiled from: LoaderManager */
class LoaderManagerImpl extends LoaderManager {
    static boolean DEBUG = false;
    static final String TAG = "LoaderManager";
    boolean mCreatingLoader;
    /* access modifiers changed from: private */
    public FragmentHostCallback mHost;
    final SparseArrayCompat<LoaderInfo> mInactiveLoaders = new SparseArrayCompat<>();
    final SparseArrayCompat<LoaderInfo> mLoaders = new SparseArrayCompat<>();
    boolean mRetaining;
    boolean mRetainingStarted;
    boolean mStarted;
    final String mWho;

    /* compiled from: LoaderManager */
    final class LoaderInfo implements OnLoadCompleteListener<Object>, OnLoadCanceledListener<Object> {
        final Bundle mArgs;
        LoaderCallbacks<Object> mCallbacks;
        Object mData;
        boolean mDeliveredData;
        boolean mDestroyed;
        boolean mHaveData;
        final int mId;
        boolean mListenerRegistered;
        Loader<Object> mLoader;
        LoaderInfo mPendingLoader;
        boolean mReportNextStart;
        boolean mRetaining;
        boolean mRetainingStarted;
        boolean mStarted;

        public LoaderInfo(int id, Bundle args, LoaderCallbacks<Object> callbacks) {
            this.mId = id;
            this.mArgs = args;
            this.mCallbacks = callbacks;
        }

        /* access modifiers changed from: 0000 */
        public void start() {
            if (this.mRetaining && this.mRetainingStarted) {
                this.mStarted = true;
            } else if (!this.mStarted) {
                this.mStarted = true;
                if (LoaderManagerImpl.DEBUG) {
                    String str = LoaderManagerImpl.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("  Starting: ");
                    sb.append(this);
                    Log.v(str, sb.toString());
                }
                if (this.mLoader == null && this.mCallbacks != null) {
                    this.mLoader = this.mCallbacks.onCreateLoader(this.mId, this.mArgs);
                }
                if (this.mLoader != null) {
                    if (!this.mLoader.getClass().isMemberClass() || Modifier.isStatic(this.mLoader.getClass().getModifiers())) {
                        if (!this.mListenerRegistered) {
                            this.mLoader.registerListener(this.mId, this);
                            this.mLoader.registerOnLoadCanceledListener(this);
                            this.mListenerRegistered = true;
                        }
                        this.mLoader.startLoading();
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Object returned from onCreateLoader must not be a non-static inner member class: ");
                        sb2.append(this.mLoader);
                        throw new IllegalArgumentException(sb2.toString());
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void retain() {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("  Retaining: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            this.mRetaining = true;
            this.mRetainingStarted = this.mStarted;
            this.mStarted = false;
            this.mCallbacks = null;
        }

        /* access modifiers changed from: 0000 */
        public void finishRetain() {
            if (this.mRetaining) {
                if (LoaderManagerImpl.DEBUG) {
                    String str = LoaderManagerImpl.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("  Finished Retaining: ");
                    sb.append(this);
                    Log.v(str, sb.toString());
                }
                this.mRetaining = false;
                if (this.mStarted != this.mRetainingStarted && !this.mStarted) {
                    stop();
                }
            }
            if (this.mStarted && this.mHaveData && !this.mReportNextStart) {
                callOnLoadFinished(this.mLoader, this.mData);
            }
        }

        /* access modifiers changed from: 0000 */
        public void reportStart() {
            if (this.mStarted && this.mReportNextStart) {
                this.mReportNextStart = false;
                if (this.mHaveData) {
                    callOnLoadFinished(this.mLoader, this.mData);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void stop() {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("  Stopping: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            this.mStarted = false;
            if (!this.mRetaining && this.mLoader != null && this.mListenerRegistered) {
                this.mListenerRegistered = false;
                this.mLoader.unregisterListener(this);
                this.mLoader.unregisterOnLoadCanceledListener(this);
                this.mLoader.stopLoading();
            }
        }

        /* access modifiers changed from: 0000 */
        public void cancel() {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("  Canceling: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            if (this.mStarted && this.mLoader != null && this.mListenerRegistered && !this.mLoader.cancelLoad()) {
                onLoadCanceled(this.mLoader);
            }
        }

        /* access modifiers changed from: 0000 */
        public void destroy() {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("  Destroying: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            this.mDestroyed = true;
            boolean needReset = this.mDeliveredData;
            this.mDeliveredData = false;
            if (this.mCallbacks != null && this.mLoader != null && this.mHaveData && needReset) {
                if (LoaderManagerImpl.DEBUG) {
                    String str2 = LoaderManagerImpl.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("  Reseting: ");
                    sb2.append(this);
                    Log.v(str2, sb2.toString());
                }
                String lastBecause = null;
                if (LoaderManagerImpl.this.mHost != null) {
                    lastBecause = LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause;
                    LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = "onLoaderReset";
                }
                try {
                    this.mCallbacks.onLoaderReset(this.mLoader);
                } finally {
                    if (LoaderManagerImpl.this.mHost != null) {
                        LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = lastBecause;
                    }
                }
            }
            this.mCallbacks = null;
            this.mData = null;
            this.mHaveData = false;
            if (this.mLoader != null) {
                if (this.mListenerRegistered) {
                    this.mListenerRegistered = false;
                    this.mLoader.unregisterListener(this);
                    this.mLoader.unregisterOnLoadCanceledListener(this);
                }
                this.mLoader.reset();
            }
            if (this.mPendingLoader != null) {
                this.mPendingLoader.destroy();
            }
        }

        public void onLoadCanceled(Loader<Object> loader) {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onLoadCanceled: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            if (this.mDestroyed) {
                if (LoaderManagerImpl.DEBUG) {
                    Log.v(LoaderManagerImpl.TAG, "  Ignoring load canceled -- destroyed");
                }
            } else if (LoaderManagerImpl.this.mLoaders.get(this.mId) != this) {
                if (LoaderManagerImpl.DEBUG) {
                    Log.v(LoaderManagerImpl.TAG, "  Ignoring load canceled -- not active");
                }
            } else {
                LoaderInfo pending = this.mPendingLoader;
                if (pending != null) {
                    if (LoaderManagerImpl.DEBUG) {
                        String str2 = LoaderManagerImpl.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Switching to pending loader: ");
                        sb2.append(pending);
                        Log.v(str2, sb2.toString());
                    }
                    this.mPendingLoader = null;
                    LoaderManagerImpl.this.mLoaders.put(this.mId, null);
                    destroy();
                    LoaderManagerImpl.this.installLoader(pending);
                }
            }
        }

        public void onLoadComplete(Loader<Object> loader, Object data) {
            if (LoaderManagerImpl.DEBUG) {
                String str = LoaderManagerImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onLoadComplete: ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            if (this.mDestroyed) {
                if (LoaderManagerImpl.DEBUG) {
                    Log.v(LoaderManagerImpl.TAG, "  Ignoring load complete -- destroyed");
                }
            } else if (LoaderManagerImpl.this.mLoaders.get(this.mId) != this) {
                if (LoaderManagerImpl.DEBUG) {
                    Log.v(LoaderManagerImpl.TAG, "  Ignoring load complete -- not active");
                }
            } else {
                LoaderInfo pending = this.mPendingLoader;
                if (pending != null) {
                    if (LoaderManagerImpl.DEBUG) {
                        String str2 = LoaderManagerImpl.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Switching to pending loader: ");
                        sb2.append(pending);
                        Log.v(str2, sb2.toString());
                    }
                    this.mPendingLoader = null;
                    LoaderManagerImpl.this.mLoaders.put(this.mId, null);
                    destroy();
                    LoaderManagerImpl.this.installLoader(pending);
                    return;
                }
                if (this.mData != data || !this.mHaveData) {
                    this.mData = data;
                    this.mHaveData = true;
                    if (this.mStarted) {
                        callOnLoadFinished(loader, data);
                    }
                }
                LoaderInfo info = (LoaderInfo) LoaderManagerImpl.this.mInactiveLoaders.get(this.mId);
                if (!(info == null || info == this)) {
                    info.mDeliveredData = false;
                    info.destroy();
                    LoaderManagerImpl.this.mInactiveLoaders.remove(this.mId);
                }
                if (LoaderManagerImpl.this.mHost != null && !LoaderManagerImpl.this.hasRunningLoaders()) {
                    LoaderManagerImpl.this.mHost.mFragmentManager.startPendingDeferredFragments();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void callOnLoadFinished(Loader<Object> loader, Object data) {
            if (this.mCallbacks != null) {
                String lastBecause = null;
                if (LoaderManagerImpl.this.mHost != null) {
                    lastBecause = LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause;
                    LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = "onLoadFinished";
                }
                try {
                    if (LoaderManagerImpl.DEBUG) {
                        String str = LoaderManagerImpl.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("  onLoadFinished in ");
                        sb.append(loader);
                        sb.append(": ");
                        sb.append(loader.dataToString(data));
                        Log.v(str, sb.toString());
                    }
                    this.mCallbacks.onLoadFinished(loader, data);
                    this.mDeliveredData = true;
                } finally {
                    if (LoaderManagerImpl.this.mHost != null) {
                        LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = lastBecause;
                    }
                }
            }
        }

        public String toString() {
            StringBuilder sb = new StringBuilder(64);
            sb.append("LoaderInfo{");
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append(" #");
            sb.append(this.mId);
            sb.append(" : ");
            DebugUtils.buildShortClassTag(this.mLoader, sb);
            sb.append("}}");
            return sb.toString();
        }

        public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
            writer.print(prefix);
            writer.print("mId=");
            writer.print(this.mId);
            writer.print(" mArgs=");
            writer.println(this.mArgs);
            writer.print(prefix);
            writer.print("mCallbacks=");
            writer.println(this.mCallbacks);
            writer.print(prefix);
            writer.print("mLoader=");
            writer.println(this.mLoader);
            if (this.mLoader != null) {
                Loader<Object> loader = this.mLoader;
                StringBuilder sb = new StringBuilder();
                sb.append(prefix);
                sb.append("  ");
                loader.dump(sb.toString(), fd, writer, args);
            }
            if (this.mHaveData || this.mDeliveredData) {
                writer.print(prefix);
                writer.print("mHaveData=");
                writer.print(this.mHaveData);
                writer.print("  mDeliveredData=");
                writer.println(this.mDeliveredData);
                writer.print(prefix);
                writer.print("mData=");
                writer.println(this.mData);
            }
            writer.print(prefix);
            writer.print("mStarted=");
            writer.print(this.mStarted);
            writer.print(" mReportNextStart=");
            writer.print(this.mReportNextStart);
            writer.print(" mDestroyed=");
            writer.println(this.mDestroyed);
            writer.print(prefix);
            writer.print("mRetaining=");
            writer.print(this.mRetaining);
            writer.print(" mRetainingStarted=");
            writer.print(this.mRetainingStarted);
            writer.print(" mListenerRegistered=");
            writer.println(this.mListenerRegistered);
            if (this.mPendingLoader != null) {
                writer.print(prefix);
                writer.println("Pending Loader ");
                writer.print(this.mPendingLoader);
                writer.println(":");
                LoaderInfo loaderInfo = this.mPendingLoader;
                StringBuilder sb2 = new StringBuilder();
                sb2.append(prefix);
                sb2.append("  ");
                loaderInfo.dump(sb2.toString(), fd, writer, args);
            }
        }
    }

    LoaderManagerImpl(String who, FragmentHostCallback host, boolean started) {
        this.mWho = who;
        this.mHost = host;
        this.mStarted = started;
    }

    /* access modifiers changed from: 0000 */
    public void updateHostController(FragmentHostCallback host) {
        this.mHost = host;
    }

    private LoaderInfo createLoader(int id, Bundle args, LoaderCallbacks<Object> callback) {
        LoaderInfo info = new LoaderInfo(id, args, callback);
        info.mLoader = callback.onCreateLoader(id, args);
        return info;
    }

    private LoaderInfo createAndInstallLoader(int id, Bundle args, LoaderCallbacks<Object> callback) {
        try {
            this.mCreatingLoader = true;
            LoaderInfo info = createLoader(id, args, callback);
            installLoader(info);
            return info;
        } finally {
            this.mCreatingLoader = false;
        }
    }

    /* access modifiers changed from: 0000 */
    public void installLoader(LoaderInfo info) {
        this.mLoaders.put(info.mId, info);
        if (this.mStarted) {
            info.start();
        }
    }

    public <D> Loader<D> initLoader(int id, Bundle args, LoaderCallbacks<D> callback) {
        if (!this.mCreatingLoader) {
            LoaderInfo info = (LoaderInfo) this.mLoaders.get(id);
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("initLoader in ");
                sb.append(this);
                sb.append(": args=");
                sb.append(args);
                Log.v(str, sb.toString());
            }
            if (info == null) {
                info = createAndInstallLoader(id, args, callback);
                if (DEBUG) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("  Created new loader ");
                    sb2.append(info);
                    Log.v(str2, sb2.toString());
                }
            } else {
                if (DEBUG) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("  Re-using existing loader ");
                    sb3.append(info);
                    Log.v(str3, sb3.toString());
                }
                info.mCallbacks = callback;
            }
            if (info.mHaveData && this.mStarted) {
                info.callOnLoadFinished(info.mLoader, info.mData);
            }
            return info.mLoader;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    public <D> Loader<D> restartLoader(int id, Bundle args, LoaderCallbacks<D> callback) {
        if (!this.mCreatingLoader) {
            LoaderInfo info = (LoaderInfo) this.mLoaders.get(id);
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("restartLoader in ");
                sb.append(this);
                sb.append(": args=");
                sb.append(args);
                Log.v(str, sb.toString());
            }
            if (info != null) {
                LoaderInfo inactive = (LoaderInfo) this.mInactiveLoaders.get(id);
                if (inactive == null) {
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Making last loader inactive: ");
                        sb2.append(info);
                        Log.v(str2, sb2.toString());
                    }
                    info.mLoader.abandon();
                    this.mInactiveLoaders.put(id, info);
                } else if (info.mHaveData) {
                    if (DEBUG) {
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("  Removing last inactive loader: ");
                        sb3.append(info);
                        Log.v(str3, sb3.toString());
                    }
                    inactive.mDeliveredData = false;
                    inactive.destroy();
                    info.mLoader.abandon();
                    this.mInactiveLoaders.put(id, info);
                } else if (!info.mStarted) {
                    if (DEBUG) {
                        Log.v(TAG, "  Current loader is stopped; replacing");
                    }
                    this.mLoaders.put(id, null);
                    info.destroy();
                } else {
                    if (DEBUG) {
                        Log.v(TAG, "  Current loader is running; attempting to cancel");
                    }
                    info.cancel();
                    if (info.mPendingLoader != null) {
                        if (DEBUG) {
                            String str4 = TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("  Removing pending loader: ");
                            sb4.append(info.mPendingLoader);
                            Log.v(str4, sb4.toString());
                        }
                        info.mPendingLoader.destroy();
                        info.mPendingLoader = null;
                    }
                    if (DEBUG) {
                        Log.v(TAG, "  Enqueuing as new pending loader");
                    }
                    info.mPendingLoader = createLoader(id, args, callback);
                    return info.mPendingLoader.mLoader;
                }
            }
            return createAndInstallLoader(id, args, callback).mLoader;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    public void destroyLoader(int id) {
        if (!this.mCreatingLoader) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("destroyLoader in ");
                sb.append(this);
                sb.append(" of ");
                sb.append(id);
                Log.v(str, sb.toString());
            }
            int idx = this.mLoaders.indexOfKey(id);
            if (idx >= 0) {
                LoaderInfo info = (LoaderInfo) this.mLoaders.valueAt(idx);
                this.mLoaders.removeAt(idx);
                info.destroy();
            }
            int idx2 = this.mInactiveLoaders.indexOfKey(id);
            if (idx2 >= 0) {
                LoaderInfo info2 = (LoaderInfo) this.mInactiveLoaders.valueAt(idx2);
                this.mInactiveLoaders.removeAt(idx2);
                info2.destroy();
            }
            if (this.mHost != null && !hasRunningLoaders()) {
                this.mHost.mFragmentManager.startPendingDeferredFragments();
                return;
            }
            return;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    public <D> Loader<D> getLoader(int id) {
        if (!this.mCreatingLoader) {
            LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.get(id);
            if (loaderInfo == null) {
                return null;
            }
            if (loaderInfo.mPendingLoader != null) {
                return loaderInfo.mPendingLoader.mLoader;
            }
            return loaderInfo.mLoader;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    /* access modifiers changed from: 0000 */
    public void doStart() {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Starting in ");
            sb.append(this);
            Log.v(str, sb.toString());
        }
        if (this.mStarted) {
            RuntimeException e = new RuntimeException("here");
            e.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doStart when already started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), e);
            return;
        }
        this.mStarted = true;
        int i = this.mLoaders.size() - 1;
        while (true) {
            int i2 = i;
            if (i2 >= 0) {
                ((LoaderInfo) this.mLoaders.valueAt(i2)).start();
                i = i2 - 1;
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void doStop() {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Stopping in ");
            sb.append(this);
            Log.v(str, sb.toString());
        }
        if (!this.mStarted) {
            RuntimeException e = new RuntimeException("here");
            e.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doStop when not started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), e);
            return;
        }
        for (int i = this.mLoaders.size() - 1; i >= 0; i--) {
            ((LoaderInfo) this.mLoaders.valueAt(i)).stop();
        }
        this.mStarted = false;
    }

    /* access modifiers changed from: 0000 */
    public void doRetain() {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Retaining in ");
            sb.append(this);
            Log.v(str, sb.toString());
        }
        if (!this.mStarted) {
            RuntimeException e = new RuntimeException("here");
            e.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doRetain when not started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), e);
            return;
        }
        this.mRetaining = true;
        this.mStarted = false;
        int i = this.mLoaders.size() - 1;
        while (true) {
            int i2 = i;
            if (i2 >= 0) {
                ((LoaderInfo) this.mLoaders.valueAt(i2)).retain();
                i = i2 - 1;
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void finishRetain() {
        if (this.mRetaining) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Finished Retaining in ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            this.mRetaining = false;
            for (int i = this.mLoaders.size() - 1; i >= 0; i--) {
                ((LoaderInfo) this.mLoaders.valueAt(i)).finishRetain();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void doReportNextStart() {
        for (int i = this.mLoaders.size() - 1; i >= 0; i--) {
            ((LoaderInfo) this.mLoaders.valueAt(i)).mReportNextStart = true;
        }
    }

    /* access modifiers changed from: 0000 */
    public void doReportStart() {
        for (int i = this.mLoaders.size() - 1; i >= 0; i--) {
            ((LoaderInfo) this.mLoaders.valueAt(i)).reportStart();
        }
    }

    /* access modifiers changed from: 0000 */
    public void doDestroy() {
        if (!this.mRetaining) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Destroying Active in ");
                sb.append(this);
                Log.v(str, sb.toString());
            }
            for (int i = this.mLoaders.size() - 1; i >= 0; i--) {
                ((LoaderInfo) this.mLoaders.valueAt(i)).destroy();
            }
            this.mLoaders.clear();
        }
        if (DEBUG) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Destroying Inactive in ");
            sb2.append(this);
            Log.v(str2, sb2.toString());
        }
        for (int i2 = this.mInactiveLoaders.size() - 1; i2 >= 0; i2--) {
            ((LoaderInfo) this.mInactiveLoaders.valueAt(i2)).destroy();
        }
        this.mInactiveLoaders.clear();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("LoaderManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        DebugUtils.buildShortClassTag(this.mHost, sb);
        sb.append("}}");
        return sb.toString();
    }

    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        if (this.mLoaders.size() > 0) {
            writer.print(prefix);
            writer.println("Active Loaders:");
            StringBuilder sb = new StringBuilder();
            sb.append(prefix);
            sb.append("    ");
            String innerPrefix = sb.toString();
            for (int i = 0; i < this.mLoaders.size(); i++) {
                LoaderInfo li = (LoaderInfo) this.mLoaders.valueAt(i);
                writer.print(prefix);
                writer.print("  #");
                writer.print(this.mLoaders.keyAt(i));
                writer.print(": ");
                writer.println(li.toString());
                li.dump(innerPrefix, fd, writer, args);
            }
        }
        if (this.mInactiveLoaders.size() > 0) {
            writer.print(prefix);
            writer.println("Inactive Loaders:");
            StringBuilder sb2 = new StringBuilder();
            sb2.append(prefix);
            sb2.append("    ");
            String innerPrefix2 = sb2.toString();
            for (int i2 = 0; i2 < this.mInactiveLoaders.size(); i2++) {
                LoaderInfo li2 = (LoaderInfo) this.mInactiveLoaders.valueAt(i2);
                writer.print(prefix);
                writer.print("  #");
                writer.print(this.mInactiveLoaders.keyAt(i2));
                writer.print(": ");
                writer.println(li2.toString());
                li2.dump(innerPrefix2, fd, writer, args);
            }
        }
    }

    public boolean hasRunningLoaders() {
        int count = this.mLoaders.size();
        boolean loadersRunning = false;
        for (int i = 0; i < count; i++) {
            LoaderInfo li = (LoaderInfo) this.mLoaders.valueAt(i);
            boolean z = li.mStarted && !li.mDeliveredData;
            loadersRunning |= z;
        }
        return loadersRunning;
    }
}
