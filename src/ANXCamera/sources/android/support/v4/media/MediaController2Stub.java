package android.support.v4.media;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.v4.media.IMediaController2.Stub;
import android.support.v4.media.MediaController2.PlaybackInfo;
import android.support.v4.media.MediaSession2.CommandButton;
import android.text.TextUtils;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

class MediaController2Stub extends Stub {
    private static final boolean DEBUG = true;
    private static final String TAG = "MediaController2Stub";
    private final WeakReference<MediaController2ImplBase> mController;

    MediaController2Stub(MediaController2ImplBase mediaController2ImplBase) {
        this.mController = new WeakReference<>(mediaController2ImplBase);
    }

    private MediaBrowser2 getBrowser() throws IllegalStateException {
        MediaController2ImplBase controller = getController();
        if (controller.getInstance() instanceof MediaBrowser2) {
            return (MediaBrowser2) controller.getInstance();
        }
        return null;
    }

    private MediaController2ImplBase getController() throws IllegalStateException {
        MediaController2ImplBase mediaController2ImplBase = (MediaController2ImplBase) this.mController.get();
        if (mediaController2ImplBase != null) {
            return mediaController2ImplBase;
        }
        throw new IllegalStateException("Controller is released");
    }

    public void destroy() {
        this.mController.clear();
    }

    public void onAllowedCommandsChanged(Bundle bundle) {
        try {
            MediaController2ImplBase controller = getController();
            if (controller != null) {
                SessionCommandGroup2 fromBundle = SessionCommandGroup2.fromBundle(bundle);
                if (fromBundle == null) {
                    Log.w(TAG, "onAllowedCommandsChanged(): Ignoring null commands");
                } else {
                    controller.onAllowedCommandsChanged(fromBundle);
                }
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onBufferingStateChanged(Bundle bundle, int i, long j) {
        try {
            getController().notifyBufferingStateChanged(MediaItem2.fromBundle(bundle), i, j);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onChildrenChanged(String str, int i, Bundle bundle) {
        if (str == null) {
            Log.w(TAG, "onChildrenChanged(): Ignoring null parentId");
            return;
        }
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                Executor callbackExecutor = browser.getCallbackExecutor();
                final String str2 = str;
                final int i2 = i;
                final Bundle bundle2 = bundle;
                AnonymousClass6 r0 = new Runnable() {
                    public void run() {
                        browser.getCallback().onChildrenChanged(browser, str2, i2, bundle2);
                    }
                };
                callbackExecutor.execute(r0);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onConnected(IMediaSession2 iMediaSession2, Bundle bundle, int i, Bundle bundle2, long j, long j2, float f, long j3, Bundle bundle3, int i2, int i3, List<Bundle> list, PendingIntent pendingIntent) {
        List<Bundle> list2 = list;
        MediaController2ImplBase mediaController2ImplBase = (MediaController2ImplBase) this.mController.get();
        if (mediaController2ImplBase == null) {
            Log.d(TAG, "onConnected after MediaController2.close()");
            return;
        }
        ArrayList arrayList = null;
        if (list2 != null) {
            arrayList = new ArrayList();
            for (int i4 = 0; i4 < list.size(); i4++) {
                MediaItem2 fromBundle = MediaItem2.fromBundle((Bundle) list2.get(i4));
                if (fromBundle != null) {
                    arrayList.add(fromBundle);
                }
            }
        }
        IMediaSession2 iMediaSession22 = iMediaSession2;
        int i5 = i;
        long j4 = j;
        long j5 = j2;
        float f2 = f;
        long j6 = j3;
        mediaController2ImplBase.onConnectedNotLocked(iMediaSession22, SessionCommandGroup2.fromBundle(bundle), i5, MediaItem2.fromBundle(bundle2), j4, j5, f2, j6, PlaybackInfo.fromBundle(bundle3), i3, i2, arrayList, pendingIntent);
    }

    public void onCurrentMediaItemChanged(Bundle bundle) {
        try {
            getController().notifyCurrentMediaItemChanged(MediaItem2.fromBundle(bundle));
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onCustomCommand(Bundle bundle, Bundle bundle2, ResultReceiver resultReceiver) {
        try {
            MediaController2ImplBase controller = getController();
            SessionCommand2 fromBundle = SessionCommand2.fromBundle(bundle);
            if (fromBundle == null) {
                Log.w(TAG, "onCustomCommand(): Ignoring null command");
            } else {
                controller.onCustomCommand(fromBundle, bundle2, resultReceiver);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onCustomLayoutChanged(List<Bundle> list) {
        if (list == null) {
            Log.w(TAG, "onCustomLayoutChanged(): Ignoring null commandButtonlist");
            return;
        }
        try {
            MediaController2ImplBase controller = getController();
            if (controller != null) {
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < list.size(); i++) {
                    CommandButton fromBundle = CommandButton.fromBundle((Bundle) list.get(i));
                    if (fromBundle != null) {
                        arrayList.add(fromBundle);
                    }
                }
                controller.onCustomLayoutChanged(arrayList);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onDisconnected() {
        MediaController2ImplBase mediaController2ImplBase = (MediaController2ImplBase) this.mController.get();
        if (mediaController2ImplBase == null) {
            Log.d(TAG, "onDisconnected after MediaController2.close()");
        } else {
            mediaController2ImplBase.getInstance().close();
        }
    }

    public void onError(int i, Bundle bundle) {
        try {
            getController().notifyError(i, bundle);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onGetChildrenDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RuntimeException {
        if (str == null) {
            Log.w(TAG, "onGetChildrenDone(): Ignoring null parentId");
            return;
        }
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                Executor callbackExecutor = browser.getCallbackExecutor();
                final String str2 = str;
                final int i3 = i;
                final int i4 = i2;
                final List<Bundle> list2 = list;
                final Bundle bundle2 = bundle;
                AnonymousClass3 r0 = new Runnable() {
                    public void run() {
                        browser.getCallback().onGetChildrenDone(browser, str2, i3, i4, MediaUtils2.convertBundleListToMediaItem2List(list2), bundle2);
                    }
                };
                callbackExecutor.execute(r0);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onGetItemDone(final String str, final Bundle bundle) throws RuntimeException {
        if (str == null) {
            Log.w(TAG, "onGetItemDone(): Ignoring null mediaId");
            return;
        }
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                browser.getCallbackExecutor().execute(new Runnable() {
                    public void run() {
                        browser.getCallback().onGetItemDone(browser, str, MediaItem2.fromBundle(bundle));
                    }
                });
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onGetLibraryRootDone(Bundle bundle, String str, Bundle bundle2) throws RuntimeException {
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                Executor callbackExecutor = browser.getCallbackExecutor();
                final Bundle bundle3 = bundle;
                final String str2 = str;
                final Bundle bundle4 = bundle2;
                AnonymousClass1 r0 = new Runnable() {
                    public void run() {
                        browser.getCallback().onGetLibraryRootDone(browser, bundle3, str2, bundle4);
                    }
                };
                callbackExecutor.execute(r0);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onGetSearchResultDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RuntimeException {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "onGetSearchResultDone(): Ignoring empty query");
            return;
        }
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                Executor callbackExecutor = browser.getCallbackExecutor();
                final String str2 = str;
                final int i3 = i;
                final int i4 = i2;
                final List<Bundle> list2 = list;
                final Bundle bundle2 = bundle;
                AnonymousClass5 r0 = new Runnable() {
                    public void run() {
                        browser.getCallback().onGetSearchResultDone(browser, str2, i3, i4, MediaUtils2.convertBundleListToMediaItem2List(list2), bundle2);
                    }
                };
                callbackExecutor.execute(r0);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onPlaybackInfoChanged(Bundle bundle) throws RuntimeException {
        Log.d(TAG, "onPlaybackInfoChanged");
        try {
            MediaController2ImplBase controller = getController();
            PlaybackInfo fromBundle = PlaybackInfo.fromBundle(bundle);
            if (fromBundle == null) {
                Log.w(TAG, "onPlaybackInfoChanged(): Ignoring null playbackInfo");
            } else {
                controller.notifyPlaybackInfoChanges(fromBundle);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onPlaybackSpeedChanged(long j, long j2, float f) {
        try {
            getController().notifyPlaybackSpeedChanges(j, j2, f);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onPlayerStateChanged(long j, long j2, int i) {
        try {
            getController().notifyPlayerStateChanges(j, j2, i);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onPlaylistChanged(List<Bundle> list, Bundle bundle) {
        try {
            MediaController2ImplBase controller = getController();
            if (list == null) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onPlaylistChanged(): Ignoring null playlist from ");
                sb.append(controller);
                Log.w(str, sb.toString());
                return;
            }
            ArrayList arrayList = new ArrayList();
            for (Bundle fromBundle : list) {
                MediaItem2 fromBundle2 = MediaItem2.fromBundle(fromBundle);
                if (fromBundle2 == null) {
                    Log.w(TAG, "onPlaylistChanged(): Ignoring null item in playlist");
                } else {
                    arrayList.add(fromBundle2);
                }
            }
            controller.notifyPlaylistChanges(arrayList, MediaMetadata2.fromBundle(bundle));
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onPlaylistMetadataChanged(Bundle bundle) throws RuntimeException {
        try {
            getController().notifyPlaylistMetadataChanges(MediaMetadata2.fromBundle(bundle));
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onRepeatModeChanged(int i) {
        try {
            getController().notifyRepeatModeChanges(i);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onRoutesInfoChanged(List<Bundle> list) {
        try {
            getController().notifyRoutesInfoChanged(list);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onSearchResultChanged(String str, int i, Bundle bundle) throws RuntimeException {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "onSearchResultChanged(): Ignoring empty query");
            return;
        }
        try {
            final MediaBrowser2 browser = getBrowser();
            if (browser != null) {
                Executor callbackExecutor = browser.getCallbackExecutor();
                final String str2 = str;
                final int i2 = i;
                final Bundle bundle2 = bundle;
                AnonymousClass4 r0 = new Runnable() {
                    public void run() {
                        browser.getCallback().onSearchResultChanged(browser, str2, i2, bundle2);
                    }
                };
                callbackExecutor.execute(r0);
            }
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onSeekCompleted(long j, long j2, long j3) {
        try {
            getController().notifySeekCompleted(j, j2, j3);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }

    public void onShuffleModeChanged(int i) {
        try {
            getController().notifyShuffleModeChanges(i);
        } catch (IllegalStateException e) {
            Log.w(TAG, "Don't fail silently here. Highly likely a bug");
        }
    }
}
