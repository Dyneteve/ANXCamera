package android.support.v4.media.subtitle;

import android.content.Context;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.media.subtitle.SubtitleTrack.RenderingWidget;
import android.view.accessibility.CaptioningManager;
import android.view.accessibility.CaptioningManager.CaptioningChangeListener;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;

@RequiresApi(28)
@RestrictTo({Scope.LIBRARY_GROUP})
public class SubtitleController {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int WHAT_HIDE = 2;
    private static final int WHAT_SELECT_DEFAULT_TRACK = 4;
    private static final int WHAT_SELECT_TRACK = 3;
    private static final int WHAT_SHOW = 1;
    private Anchor mAnchor;
    private final Callback mCallback;
    private CaptioningChangeListener mCaptioningChangeListener;
    private CaptioningManager mCaptioningManager;
    private Handler mHandler;
    private Listener mListener;
    private ArrayList<Renderer> mRenderers;
    private final Object mRenderersLock;
    private SubtitleTrack mSelectedTrack;
    private boolean mShowing;
    private MediaTimeProvider mTimeProvider;
    private boolean mTrackIsExplicit;
    private ArrayList<SubtitleTrack> mTracks;
    private final Object mTracksLock;
    private boolean mVisibilityIsExplicit;

    public interface Anchor {
        Looper getSubtitleLooper();

        void setSubtitleWidget(RenderingWidget renderingWidget);
    }

    interface Listener {
        void onSubtitleTrackSelected(SubtitleTrack subtitleTrack);
    }

    static class MediaFormatUtil {
        MediaFormatUtil() {
        }

        static int getInteger(MediaFormat mediaFormat, String str, int i) {
            try {
                return mediaFormat.getInteger(str);
            } catch (ClassCastException | NullPointerException e) {
                return i;
            }
        }
    }

    public static abstract class Renderer {
        public abstract SubtitleTrack createTrack(MediaFormat mediaFormat);

        public abstract boolean supports(MediaFormat mediaFormat);
    }

    public SubtitleController(Context context) {
        this(context, null, null);
    }

    public SubtitleController(Context context, MediaTimeProvider mediaTimeProvider, Listener listener) {
        this.mRenderersLock = new Object();
        this.mTracksLock = new Object();
        this.mCallback = new Callback() {
            public boolean handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        SubtitleController.this.doShow();
                        return true;
                    case 2:
                        SubtitleController.this.doHide();
                        return true;
                    case 3:
                        SubtitleController.this.doSelectTrack((SubtitleTrack) message.obj);
                        return true;
                    case 4:
                        SubtitleController.this.doSelectDefaultTrack();
                        return true;
                    default:
                        return false;
                }
            }
        };
        this.mCaptioningChangeListener = new CaptioningChangeListener() {
            public void onEnabledChanged(boolean z) {
                SubtitleController.this.selectDefaultTrack();
            }

            public void onLocaleChanged(Locale locale) {
                SubtitleController.this.selectDefaultTrack();
            }
        };
        this.mTrackIsExplicit = false;
        this.mVisibilityIsExplicit = false;
        this.mTimeProvider = mediaTimeProvider;
        this.mListener = listener;
        this.mRenderers = new ArrayList<>();
        this.mShowing = false;
        this.mTracks = new ArrayList<>();
        this.mCaptioningManager = (CaptioningManager) context.getSystemService("captioning");
    }

    private void checkAnchorLooper() {
    }

    /* access modifiers changed from: private */
    public void doHide() {
        this.mVisibilityIsExplicit = true;
        if (this.mSelectedTrack != null) {
            this.mSelectedTrack.hide();
        }
        this.mShowing = false;
    }

    /* access modifiers changed from: private */
    public void doSelectDefaultTrack() {
        if (this.mTrackIsExplicit) {
            if (!this.mVisibilityIsExplicit) {
                if (this.mCaptioningManager.isEnabled() || !(this.mSelectedTrack == null || MediaFormatUtil.getInteger(this.mSelectedTrack.getFormat(), "is-forced-subtitle", 0) == 0)) {
                    show();
                } else if (this.mSelectedTrack != null && this.mSelectedTrack.getTrackType() == 4) {
                    hide();
                }
                this.mVisibilityIsExplicit = false;
            } else {
                return;
            }
        }
        SubtitleTrack defaultTrack = getDefaultTrack();
        if (defaultTrack != null) {
            selectTrack(defaultTrack);
            this.mTrackIsExplicit = false;
            if (!this.mVisibilityIsExplicit) {
                show();
                this.mVisibilityIsExplicit = false;
            }
        }
    }

    /* access modifiers changed from: private */
    public void doSelectTrack(SubtitleTrack subtitleTrack) {
        this.mTrackIsExplicit = true;
        if (this.mSelectedTrack != subtitleTrack) {
            if (this.mSelectedTrack != null) {
                this.mSelectedTrack.hide();
                this.mSelectedTrack.setTimeProvider(null);
            }
            this.mSelectedTrack = subtitleTrack;
            if (this.mAnchor != null) {
                this.mAnchor.setSubtitleWidget(getRenderingWidget());
            }
            if (this.mSelectedTrack != null) {
                this.mSelectedTrack.setTimeProvider(this.mTimeProvider);
                this.mSelectedTrack.show();
            }
            if (this.mListener != null) {
                this.mListener.onSubtitleTrackSelected(subtitleTrack);
            }
        }
    }

    /* access modifiers changed from: private */
    public void doShow() {
        this.mShowing = true;
        this.mVisibilityIsExplicit = true;
        if (this.mSelectedTrack != null) {
            this.mSelectedTrack.show();
        }
    }

    private RenderingWidget getRenderingWidget() {
        if (this.mSelectedTrack == null) {
            return null;
        }
        return this.mSelectedTrack.getRenderingWidget();
    }

    private void processOnAnchor(Message message) {
        if (Looper.myLooper() == this.mHandler.getLooper()) {
            this.mHandler.dispatchMessage(message);
        } else {
            this.mHandler.sendMessage(message);
        }
    }

    public SubtitleTrack addTrack(MediaFormat mediaFormat) {
        synchronized (this.mRenderersLock) {
            Iterator it = this.mRenderers.iterator();
            while (it.hasNext()) {
                Renderer renderer = (Renderer) it.next();
                if (renderer.supports(mediaFormat)) {
                    SubtitleTrack createTrack = renderer.createTrack(mediaFormat);
                    if (createTrack != null) {
                        synchronized (this.mTracksLock) {
                            if (this.mTracks.size() == 0) {
                                this.mCaptioningManager.addCaptioningChangeListener(this.mCaptioningChangeListener);
                            }
                            this.mTracks.add(createTrack);
                        }
                        return createTrack;
                    }
                }
            }
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        this.mCaptioningManager.removeCaptioningChangeListener(this.mCaptioningChangeListener);
        super.finalize();
    }

    /* JADX WARNING: Removed duplicated region for block: B:33:0x0089  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x008b  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0097  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0098  */
    public SubtitleTrack getDefaultTrack() {
        SubtitleTrack subtitleTrack;
        int i;
        int i2;
        Locale locale = this.mCaptioningManager.getLocale();
        Locale locale2 = locale == null ? Locale.getDefault() : locale;
        boolean z = !this.mCaptioningManager.isEnabled();
        synchronized (this.mTracksLock) {
            Iterator it = this.mTracks.iterator();
            subtitleTrack = null;
            int i3 = -1;
            while (it.hasNext()) {
                SubtitleTrack subtitleTrack2 = (SubtitleTrack) it.next();
                MediaFormat format = subtitleTrack2.getFormat();
                String string = format.getString(EffectConfiguration.KEY_SYS_LANGUAGE);
                int i4 = 0;
                boolean z2 = MediaFormatUtil.getInteger(format, "is-forced-subtitle", 0) != 0;
                boolean z3 = MediaFormatUtil.getInteger(format, "is-autoselect", 1) != 0;
                boolean z4 = MediaFormatUtil.getInteger(format, "is-default", 0) != 0;
                if (locale2 != null && !locale2.getLanguage().equals("") && !locale2.getISO3Language().equals(string)) {
                    if (!locale2.getLanguage().equals(string)) {
                        i = 0;
                        int i5 = (!z2 ? 0 : 8) + ((locale == null || !z4) ? 0 : 4);
                        if (z3) {
                            i4 = 2;
                        }
                        i2 = i5 + i4 + i;
                        if (z || z2) {
                            if (((locale == null && z4) || (i != 0 && (z3 || z2 || locale != null))) && i2 > i3) {
                                subtitleTrack = subtitleTrack2;
                                i3 = i2;
                            }
                        }
                    }
                }
                i = 1;
                int i52 = (!z2 ? 0 : 8) + ((locale == null || !z4) ? 0 : 4);
                if (z3) {
                }
                i2 = i52 + i4 + i;
                if (z) {
                }
                subtitleTrack = subtitleTrack2;
                i3 = i2;
            }
        }
        return subtitleTrack;
    }

    public SubtitleTrack getSelectedTrack() {
        return this.mSelectedTrack;
    }

    public SubtitleTrack[] getTracks() {
        SubtitleTrack[] subtitleTrackArr;
        synchronized (this.mTracksLock) {
            subtitleTrackArr = new SubtitleTrack[this.mTracks.size()];
            this.mTracks.toArray(subtitleTrackArr);
        }
        return subtitleTrackArr;
    }

    public boolean hasRendererFor(MediaFormat mediaFormat) {
        synchronized (this.mRenderersLock) {
            Iterator it = this.mRenderers.iterator();
            while (it.hasNext()) {
                if (((Renderer) it.next()).supports(mediaFormat)) {
                    return true;
                }
            }
            return false;
        }
    }

    public void hide() {
        processOnAnchor(this.mHandler.obtainMessage(2));
    }

    public void registerRenderer(Renderer renderer) {
        synchronized (this.mRenderersLock) {
            if (!this.mRenderers.contains(renderer)) {
                this.mRenderers.add(renderer);
            }
        }
    }

    public void reset() {
        checkAnchorLooper();
        hide();
        selectTrack(null);
        this.mTracks.clear();
        this.mTrackIsExplicit = false;
        this.mVisibilityIsExplicit = false;
        this.mCaptioningManager.removeCaptioningChangeListener(this.mCaptioningChangeListener);
    }

    public void selectDefaultTrack() {
        processOnAnchor(this.mHandler.obtainMessage(4));
    }

    public boolean selectTrack(SubtitleTrack subtitleTrack) {
        if (subtitleTrack != null && !this.mTracks.contains(subtitleTrack)) {
            return false;
        }
        processOnAnchor(this.mHandler.obtainMessage(3, subtitleTrack));
        return true;
    }

    public void setAnchor(Anchor anchor) {
        if (this.mAnchor != anchor) {
            if (this.mAnchor != null) {
                checkAnchorLooper();
                this.mAnchor.setSubtitleWidget(null);
            }
            this.mAnchor = anchor;
            this.mHandler = null;
            if (this.mAnchor != null) {
                this.mHandler = new Handler(this.mAnchor.getSubtitleLooper(), this.mCallback);
                checkAnchorLooper();
                this.mAnchor.setSubtitleWidget(getRenderingWidget());
            }
        }
    }

    public void show() {
        processOnAnchor(this.mHandler.obtainMessage(1));
    }
}
