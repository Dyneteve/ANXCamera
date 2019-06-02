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

        public LoaderInfo(int i, Bundle bundle, LoaderCallbacks<Object> loaderCallbacks) {
            this.mId = i;
            this.mArgs = bundle;
            this.mCallbacks = loaderCallbacks;
        }

        /* access modifiers changed from: 0000 */
        public void callOnLoadFinished(Loader<Object> loader, Object obj) {
            if (this.mCallbacks != null) {
                String str = null;
                if (LoaderManagerImpl.this.mHost != null) {
                    str = LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause;
                    LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = "onLoadFinished";
                }
                try {
                    if (LoaderManagerImpl.DEBUG) {
                        String str2 = LoaderManagerImpl.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("  onLoadFinished in ");
                        sb.append(loader);
                        sb.append(": ");
                        sb.append(loader.dataToString(obj));
                        Log.v(str2, sb.toString());
                    }
                    this.mCallbacks.onLoadFinished(loader, obj);
                    this.mDeliveredData = true;
                } finally {
                    if (LoaderManagerImpl.this.mHost != null) {
                        LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = str;
                    }
                }
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
            boolean z = this.mDeliveredData;
            this.mDeliveredData = false;
            if (this.mCallbacks != null && this.mLoader != null && this.mHaveData && z) {
                if (LoaderManagerImpl.DEBUG) {
                    String str2 = LoaderManagerImpl.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("  Reseting: ");
                    sb2.append(this);
                    Log.v(str2, sb2.toString());
                }
                String str3 = null;
                if (LoaderManagerImpl.this.mHost != null) {
                    str3 = LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause;
                    LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = "onLoaderReset";
                }
                try {
                    this.mCallbacks.onLoaderReset(this.mLoader);
                } finally {
                    if (LoaderManagerImpl.this.mHost != null) {
                        LoaderManagerImpl.this.mHost.mFragmentManager.mNoTransactionsBecause = str3;
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

        public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
            printWriter.print(str);
            printWriter.print("mId=");
            printWriter.print(this.mId);
            printWriter.print(" mArgs=");
            printWriter.println(this.mArgs);
            printWriter.print(str);
            printWriter.print("mCallbacks=");
            printWriter.println(this.mCallbacks);
            printWriter.print(str);
            printWriter.print("mLoader=");
            printWriter.println(this.mLoader);
            if (this.mLoader != null) {
                Loader<Object> loader = this.mLoader;
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("  ");
                loader.dump(sb.toString(), fileDescriptor, printWriter, strArr);
            }
            if (this.mHaveData || this.mDeliveredData) {
                printWriter.print(str);
                printWriter.print("mHaveData=");
                printWriter.print(this.mHaveData);
                printWriter.print("  mDeliveredData=");
                printWriter.println(this.mDeliveredData);
                printWriter.print(str);
                printWriter.print("mData=");
                printWriter.println(this.mData);
            }
            printWriter.print(str);
            printWriter.print("mStarted=");
            printWriter.print(this.mStarted);
            printWriter.print(" mReportNextStart=");
            printWriter.print(this.mReportNextStart);
            printWriter.print(" mDestroyed=");
            printWriter.println(this.mDestroyed);
            printWriter.print(str);
            printWriter.print("mRetaining=");
            printWriter.print(this.mRetaining);
            printWriter.print(" mRetainingStarted=");
            printWriter.print(this.mRetainingStarted);
            printWriter.print(" mListenerRegistered=");
            printWriter.println(this.mListenerRegistered);
            if (this.mPendingLoader != null) {
                printWriter.print(str);
                printWriter.println("Pending Loader ");
                printWriter.print(this.mPendingLoader);
                printWriter.println(":");
                LoaderInfo loaderInfo = this.mPendingLoader;
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append("  ");
                loaderInfo.dump(sb2.toString(), fileDescriptor, printWriter, strArr);
            }
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
                LoaderInfo loaderInfo = this.mPendingLoader;
                if (loaderInfo != null) {
                    if (LoaderManagerImpl.DEBUG) {
                        String str2 = LoaderManagerImpl.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Switching to pending loader: ");
                        sb2.append(loaderInfo);
                        Log.v(str2, sb2.toString());
                    }
                    this.mPendingLoader = null;
                    LoaderManagerImpl.this.mLoaders.put(this.mId, null);
                    destroy();
                    LoaderManagerImpl.this.installLoader(loaderInfo);
                }
            }
        }

        public void onLoadComplete(Loader<Object> loader, Object obj) {
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
                LoaderInfo loaderInfo = this.mPendingLoader;
                if (loaderInfo != null) {
                    if (LoaderManagerImpl.DEBUG) {
                        String str2 = LoaderManagerImpl.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Switching to pending loader: ");
                        sb2.append(loaderInfo);
                        Log.v(str2, sb2.toString());
                    }
                    this.mPendingLoader = null;
                    LoaderManagerImpl.this.mLoaders.put(this.mId, null);
                    destroy();
                    LoaderManagerImpl.this.installLoader(loaderInfo);
                    return;
                }
                if (this.mData != obj || !this.mHaveData) {
                    this.mData = obj;
                    this.mHaveData = true;
                    if (this.mStarted) {
                        callOnLoadFinished(loader, obj);
                    }
                }
                LoaderInfo loaderInfo2 = (LoaderInfo) LoaderManagerImpl.this.mInactiveLoaders.get(this.mId);
                if (!(loaderInfo2 == null || loaderInfo2 == this)) {
                    loaderInfo2.mDeliveredData = false;
                    loaderInfo2.destroy();
                    LoaderManagerImpl.this.mInactiveLoaders.remove(this.mId);
                }
                if (LoaderManagerImpl.this.mHost != null && !LoaderManagerImpl.this.hasRunningLoaders()) {
                    LoaderManagerImpl.this.mHost.mFragmentManager.startPendingDeferredFragments();
                }
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
    }

    LoaderManagerImpl(String str, FragmentHostCallback fragmentHostCallback, boolean z) {
        this.mWho = str;
        this.mHost = fragmentHostCallback;
        this.mStarted = z;
    }

    private LoaderInfo createAndInstallLoader(int i, Bundle bundle, LoaderCallbacks<Object> loaderCallbacks) {
        try {
            this.mCreatingLoader = true;
            LoaderInfo createLoader = createLoader(i, bundle, loaderCallbacks);
            installLoader(createLoader);
            return createLoader;
        } finally {
            this.mCreatingLoader = false;
        }
    }

    private LoaderInfo createLoader(int i, Bundle bundle, LoaderCallbacks<Object> loaderCallbacks) {
        LoaderInfo loaderInfo = new LoaderInfo(i, bundle, loaderCallbacks);
        loaderInfo.mLoader = loaderCallbacks.onCreateLoader(i, bundle);
        return loaderInfo;
    }

    public void destroyLoader(int i) {
        if (!this.mCreatingLoader) {
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("destroyLoader in ");
                sb.append(this);
                sb.append(" of ");
                sb.append(i);
                Log.v(str, sb.toString());
            }
            int indexOfKey = this.mLoaders.indexOfKey(i);
            if (indexOfKey >= 0) {
                LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.valueAt(indexOfKey);
                this.mLoaders.removeAt(indexOfKey);
                loaderInfo.destroy();
            }
            int indexOfKey2 = this.mInactiveLoaders.indexOfKey(i);
            if (indexOfKey2 >= 0) {
                LoaderInfo loaderInfo2 = (LoaderInfo) this.mInactiveLoaders.valueAt(indexOfKey2);
                this.mInactiveLoaders.removeAt(indexOfKey2);
                loaderInfo2.destroy();
            }
            if (this.mHost != null && !hasRunningLoaders()) {
                this.mHost.mFragmentManager.startPendingDeferredFragments();
                return;
            }
            return;
        }
        throw new IllegalStateException("Called while creating a loader");
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
            for (int size = this.mLoaders.size() - 1; size >= 0; size--) {
                ((LoaderInfo) this.mLoaders.valueAt(size)).destroy();
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
        for (int size2 = this.mInactiveLoaders.size() - 1; size2 >= 0; size2--) {
            ((LoaderInfo) this.mInactiveLoaders.valueAt(size2)).destroy();
        }
        this.mInactiveLoaders.clear();
    }

    /* access modifiers changed from: 0000 */
    public void doReportNextStart() {
        for (int size = this.mLoaders.size() - 1; size >= 0; size--) {
            ((LoaderInfo) this.mLoaders.valueAt(size)).mReportNextStart = true;
        }
    }

    /* access modifiers changed from: 0000 */
    public void doReportStart() {
        for (int size = this.mLoaders.size() - 1; size >= 0; size--) {
            ((LoaderInfo) this.mLoaders.valueAt(size)).reportStart();
        }
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
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doRetain when not started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), runtimeException);
            return;
        }
        this.mRetaining = true;
        this.mStarted = false;
        int size = this.mLoaders.size() - 1;
        while (true) {
            int i = size;
            if (i >= 0) {
                ((LoaderInfo) this.mLoaders.valueAt(i)).retain();
                size = i - 1;
            } else {
                return;
            }
        }
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
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doStart when already started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), runtimeException);
            return;
        }
        this.mStarted = true;
        int size = this.mLoaders.size() - 1;
        while (true) {
            int i = size;
            if (i >= 0) {
                ((LoaderInfo) this.mLoaders.valueAt(i)).start();
                size = i - 1;
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
            RuntimeException runtimeException = new RuntimeException("here");
            runtimeException.fillInStackTrace();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Called doStop when not started: ");
            sb2.append(this);
            Log.w(str2, sb2.toString(), runtimeException);
            return;
        }
        for (int size = this.mLoaders.size() - 1; size >= 0; size--) {
            ((LoaderInfo) this.mLoaders.valueAt(size)).stop();
        }
        this.mStarted = false;
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        if (this.mLoaders.size() > 0) {
            printWriter.print(str);
            printWriter.println("Active Loaders:");
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("    ");
            String sb2 = sb.toString();
            for (int i = 0; i < this.mLoaders.size(); i++) {
                LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.valueAt(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.mLoaders.keyAt(i));
                printWriter.print(": ");
                printWriter.println(loaderInfo.toString());
                loaderInfo.dump(sb2, fileDescriptor, printWriter, strArr);
            }
        }
        if (this.mInactiveLoaders.size() > 0) {
            printWriter.print(str);
            printWriter.println("Inactive Loaders:");
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str);
            sb3.append("    ");
            String sb4 = sb3.toString();
            for (int i2 = 0; i2 < this.mInactiveLoaders.size(); i2++) {
                LoaderInfo loaderInfo2 = (LoaderInfo) this.mInactiveLoaders.valueAt(i2);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(this.mInactiveLoaders.keyAt(i2));
                printWriter.print(": ");
                printWriter.println(loaderInfo2.toString());
                loaderInfo2.dump(sb4, fileDescriptor, printWriter, strArr);
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
            for (int size = this.mLoaders.size() - 1; size >= 0; size--) {
                ((LoaderInfo) this.mLoaders.valueAt(size)).finishRetain();
            }
        }
    }

    public <D> Loader<D> getLoader(int i) {
        if (!this.mCreatingLoader) {
            LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.get(i);
            if (loaderInfo != null) {
                return loaderInfo.mPendingLoader != null ? loaderInfo.mPendingLoader.mLoader : loaderInfo.mLoader;
            }
            return null;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    public boolean hasRunningLoaders() {
        int size = this.mLoaders.size();
        boolean z = false;
        for (int i = 0; i < size; i++) {
            LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.valueAt(i);
            boolean z2 = loaderInfo.mStarted && !loaderInfo.mDeliveredData;
            z |= z2;
        }
        return z;
    }

    public <D> Loader<D> initLoader(int i, Bundle bundle, LoaderCallbacks<D> loaderCallbacks) {
        if (!this.mCreatingLoader) {
            LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.get(i);
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("initLoader in ");
                sb.append(this);
                sb.append(": args=");
                sb.append(bundle);
                Log.v(str, sb.toString());
            }
            if (loaderInfo == null) {
                loaderInfo = createAndInstallLoader(i, bundle, loaderCallbacks);
                if (DEBUG) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("  Created new loader ");
                    sb2.append(loaderInfo);
                    Log.v(str2, sb2.toString());
                }
            } else {
                if (DEBUG) {
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("  Re-using existing loader ");
                    sb3.append(loaderInfo);
                    Log.v(str3, sb3.toString());
                }
                loaderInfo.mCallbacks = loaderCallbacks;
            }
            if (loaderInfo.mHaveData && this.mStarted) {
                loaderInfo.callOnLoadFinished(loaderInfo.mLoader, loaderInfo.mData);
            }
            return loaderInfo.mLoader;
        }
        throw new IllegalStateException("Called while creating a loader");
    }

    /* access modifiers changed from: 0000 */
    public void installLoader(LoaderInfo loaderInfo) {
        this.mLoaders.put(loaderInfo.mId, loaderInfo);
        if (this.mStarted) {
            loaderInfo.start();
        }
    }

    public <D> Loader<D> restartLoader(int i, Bundle bundle, LoaderCallbacks<D> loaderCallbacks) {
        if (!this.mCreatingLoader) {
            LoaderInfo loaderInfo = (LoaderInfo) this.mLoaders.get(i);
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("restartLoader in ");
                sb.append(this);
                sb.append(": args=");
                sb.append(bundle);
                Log.v(str, sb.toString());
            }
            if (loaderInfo != null) {
                LoaderInfo loaderInfo2 = (LoaderInfo) this.mInactiveLoaders.get(i);
                if (loaderInfo2 == null) {
                    if (DEBUG) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("  Making last loader inactive: ");
                        sb2.append(loaderInfo);
                        Log.v(str2, sb2.toString());
                    }
                    loaderInfo.mLoader.abandon();
                    this.mInactiveLoaders.put(i, loaderInfo);
                } else if (loaderInfo.mHaveData) {
                    if (DEBUG) {
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("  Removing last inactive loader: ");
                        sb3.append(loaderInfo);
                        Log.v(str3, sb3.toString());
                    }
                    loaderInfo2.mDeliveredData = false;
                    loaderInfo2.destroy();
                    loaderInfo.mLoader.abandon();
                    this.mInactiveLoaders.put(i, loaderInfo);
                } else if (!loaderInfo.mStarted) {
                    if (DEBUG) {
                        Log.v(TAG, "  Current loader is stopped; replacing");
                    }
                    this.mLoaders.put(i, null);
                    loaderInfo.destroy();
                } else {
                    if (DEBUG) {
                        Log.v(TAG, "  Current loader is running; attempting to cancel");
                    }
                    loaderInfo.cancel();
                    if (loaderInfo.mPendingLoader != null) {
                        if (DEBUG) {
                            String str4 = TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("  Removing pending loader: ");
                            sb4.append(loaderInfo.mPendingLoader);
                            Log.v(str4, sb4.toString());
                        }
                        loaderInfo.mPendingLoader.destroy();
                        loaderInfo.mPendingLoader = null;
                    }
                    if (DEBUG) {
                        Log.v(TAG, "  Enqueuing as new pending loader");
                    }
                    loaderInfo.mPendingLoader = createLoader(i, bundle, loaderCallbacks);
                    return loaderInfo.mPendingLoader.mLoader;
                }
            }
            return createAndInstallLoader(i, bundle, loaderCallbacks).mLoader;
        }
        throw new IllegalStateException("Called while creating a loader");
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

    /* access modifiers changed from: 0000 */
    public void updateHostController(FragmentHostCallback fragmentHostCallback) {
        this.mHost = fragmentHostCallback;
    }
}
