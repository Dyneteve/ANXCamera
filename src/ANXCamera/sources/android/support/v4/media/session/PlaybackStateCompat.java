package android.support.v4.media.session;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public final class PlaybackStateCompat implements Parcelable {
    public static final long ACTION_FAST_FORWARD = 64;
    public static final long ACTION_PAUSE = 2;
    public static final long ACTION_PLAY = 4;
    public static final long ACTION_PLAY_FROM_MEDIA_ID = 1024;
    public static final long ACTION_PLAY_FROM_SEARCH = 2048;
    public static final long ACTION_PLAY_FROM_URI = 8192;
    public static final long ACTION_PLAY_PAUSE = 512;
    public static final long ACTION_REWIND = 8;
    public static final long ACTION_SEEK_TO = 256;
    public static final long ACTION_SET_RATING = 128;
    public static final long ACTION_SKIP_TO_NEXT = 32;
    public static final long ACTION_SKIP_TO_PREVIOUS = 16;
    public static final long ACTION_SKIP_TO_QUEUE_ITEM = 4096;
    public static final long ACTION_STOP = 1;
    public static final Creator<PlaybackStateCompat> CREATOR = new Creator<PlaybackStateCompat>() {
        public PlaybackStateCompat createFromParcel(Parcel in) {
            return new PlaybackStateCompat(in);
        }

        public PlaybackStateCompat[] newArray(int size) {
            return new PlaybackStateCompat[size];
        }
    };
    public static final long PLAYBACK_POSITION_UNKNOWN = -1;
    public static final int STATE_BUFFERING = 6;
    public static final int STATE_CONNECTING = 8;
    public static final int STATE_ERROR = 7;
    public static final int STATE_FAST_FORWARDING = 4;
    public static final int STATE_NONE = 0;
    public static final int STATE_PAUSED = 2;
    public static final int STATE_PLAYING = 3;
    public static final int STATE_REWINDING = 5;
    public static final int STATE_SKIPPING_TO_NEXT = 10;
    public static final int STATE_SKIPPING_TO_PREVIOUS = 9;
    public static final int STATE_SKIPPING_TO_QUEUE_ITEM = 11;
    public static final int STATE_STOPPED = 1;
    /* access modifiers changed from: private */
    public final long mActions;
    /* access modifiers changed from: private */
    public final long mActiveItemId;
    /* access modifiers changed from: private */
    public final long mBufferedPosition;
    /* access modifiers changed from: private */
    public List<CustomAction> mCustomActions;
    /* access modifiers changed from: private */
    public final CharSequence mErrorMessage;
    /* access modifiers changed from: private */
    public final Bundle mExtras;
    /* access modifiers changed from: private */
    public final long mPosition;
    /* access modifiers changed from: private */
    public final float mSpeed;
    /* access modifiers changed from: private */
    public final int mState;
    private Object mStateObj;
    /* access modifiers changed from: private */
    public final long mUpdateTime;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Actions {
    }

    public static final class Builder {
        private long mActions;
        private long mActiveItemId = -1;
        private long mBufferedPosition;
        private final List<CustomAction> mCustomActions = new ArrayList();
        private CharSequence mErrorMessage;
        private Bundle mExtras;
        private long mPosition;
        private float mRate;
        private int mState;
        private long mUpdateTime;

        public Builder() {
        }

        public Builder(PlaybackStateCompat source) {
            this.mState = source.mState;
            this.mPosition = source.mPosition;
            this.mRate = source.mSpeed;
            this.mUpdateTime = source.mUpdateTime;
            this.mBufferedPosition = source.mBufferedPosition;
            this.mActions = source.mActions;
            this.mErrorMessage = source.mErrorMessage;
            if (source.mCustomActions != null) {
                this.mCustomActions.addAll(source.mCustomActions);
            }
            this.mActiveItemId = source.mActiveItemId;
            this.mExtras = source.mExtras;
        }

        public Builder setState(int state, long position, float playbackSpeed) {
            return setState(state, position, playbackSpeed, SystemClock.elapsedRealtime());
        }

        public Builder setState(int state, long position, float playbackSpeed, long updateTime) {
            this.mState = state;
            this.mPosition = position;
            this.mUpdateTime = updateTime;
            this.mRate = playbackSpeed;
            return this;
        }

        public Builder setBufferedPosition(long bufferPosition) {
            this.mBufferedPosition = bufferPosition;
            return this;
        }

        public Builder setActions(long capabilities) {
            this.mActions = capabilities;
            return this;
        }

        public Builder addCustomAction(String action, String name, int icon) {
            CustomAction customAction = new CustomAction(action, name, icon, null);
            return addCustomAction(customAction);
        }

        public Builder addCustomAction(CustomAction customAction) {
            if (customAction != null) {
                this.mCustomActions.add(customAction);
                return this;
            }
            throw new IllegalArgumentException("You may not add a null CustomAction to PlaybackStateCompat.");
        }

        public Builder setActiveQueueItemId(long id) {
            this.mActiveItemId = id;
            return this;
        }

        public Builder setErrorMessage(CharSequence errorMessage) {
            this.mErrorMessage = errorMessage;
            return this;
        }

        public Builder setExtras(Bundle extras) {
            this.mExtras = extras;
            return this;
        }

        public PlaybackStateCompat build() {
            PlaybackStateCompat playbackStateCompat = new PlaybackStateCompat(this.mState, this.mPosition, this.mBufferedPosition, this.mRate, this.mActions, this.mErrorMessage, this.mUpdateTime, this.mCustomActions, this.mActiveItemId, this.mExtras);
            return playbackStateCompat;
        }
    }

    public static final class CustomAction implements Parcelable {
        public static final Creator<CustomAction> CREATOR = new Creator<CustomAction>() {
            public CustomAction createFromParcel(Parcel p) {
                return new CustomAction(p);
            }

            public CustomAction[] newArray(int size) {
                return new CustomAction[size];
            }
        };
        private final String mAction;
        private Object mCustomActionObj;
        private final Bundle mExtras;
        private final int mIcon;
        private final CharSequence mName;

        public static final class Builder {
            private final String mAction;
            private Bundle mExtras;
            private final int mIcon;
            private final CharSequence mName;

            public Builder(String action, CharSequence name, int icon) {
                if (TextUtils.isEmpty(action)) {
                    throw new IllegalArgumentException("You must specify an action to build a CustomAction.");
                } else if (TextUtils.isEmpty(name)) {
                    throw new IllegalArgumentException("You must specify a name to build a CustomAction.");
                } else if (icon != 0) {
                    this.mAction = action;
                    this.mName = name;
                    this.mIcon = icon;
                } else {
                    throw new IllegalArgumentException("You must specify an icon resource id to build a CustomAction.");
                }
            }

            public Builder setExtras(Bundle extras) {
                this.mExtras = extras;
                return this;
            }

            public CustomAction build() {
                CustomAction customAction = new CustomAction(this.mAction, this.mName, this.mIcon, this.mExtras);
                return customAction;
            }
        }

        private CustomAction(String action, CharSequence name, int icon, Bundle extras) {
            this.mAction = action;
            this.mName = name;
            this.mIcon = icon;
            this.mExtras = extras;
        }

        private CustomAction(Parcel in) {
            this.mAction = in.readString();
            this.mName = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);
            this.mIcon = in.readInt();
            this.mExtras = in.readBundle();
        }

        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.mAction);
            TextUtils.writeToParcel(this.mName, dest, flags);
            dest.writeInt(this.mIcon);
            dest.writeBundle(this.mExtras);
        }

        public int describeContents() {
            return 0;
        }

        public static CustomAction fromCustomAction(Object customActionObj) {
            if (customActionObj == null || VERSION.SDK_INT < 21) {
                return null;
            }
            CustomAction customAction = new CustomAction(CustomAction.getAction(customActionObj), CustomAction.getName(customActionObj), CustomAction.getIcon(customActionObj), CustomAction.getExtras(customActionObj));
            customAction.mCustomActionObj = customActionObj;
            return customAction;
        }

        public Object getCustomAction() {
            if (this.mCustomActionObj != null || VERSION.SDK_INT < 21) {
                return this.mCustomActionObj;
            }
            this.mCustomActionObj = CustomAction.newInstance(this.mAction, this.mName, this.mIcon, this.mExtras);
            return this.mCustomActionObj;
        }

        public String getAction() {
            return this.mAction;
        }

        public CharSequence getName() {
            return this.mName;
        }

        public int getIcon() {
            return this.mIcon;
        }

        public Bundle getExtras() {
            return this.mExtras;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Action:mName='");
            sb.append(this.mName);
            sb.append(", mIcon=");
            sb.append(this.mIcon);
            sb.append(", mExtras=");
            sb.append(this.mExtras);
            return sb.toString();
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface State {
    }

    private PlaybackStateCompat(int state, long position, long bufferedPosition, float rate, long actions, CharSequence errorMessage, long updateTime, List<CustomAction> customActions, long activeItemId, Bundle extras) {
        this.mState = state;
        this.mPosition = position;
        this.mBufferedPosition = bufferedPosition;
        this.mSpeed = rate;
        this.mActions = actions;
        this.mErrorMessage = errorMessage;
        this.mUpdateTime = updateTime;
        this.mCustomActions = new ArrayList(customActions);
        this.mActiveItemId = activeItemId;
        this.mExtras = extras;
    }

    private PlaybackStateCompat(Parcel in) {
        this.mState = in.readInt();
        this.mPosition = in.readLong();
        this.mSpeed = in.readFloat();
        this.mUpdateTime = in.readLong();
        this.mBufferedPosition = in.readLong();
        this.mActions = in.readLong();
        this.mErrorMessage = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(in);
        this.mCustomActions = in.createTypedArrayList(CustomAction.CREATOR);
        this.mActiveItemId = in.readLong();
        this.mExtras = in.readBundle();
    }

    public String toString() {
        StringBuilder bob = new StringBuilder("PlaybackState {");
        bob.append("state=");
        bob.append(this.mState);
        bob.append(", position=");
        bob.append(this.mPosition);
        bob.append(", buffered position=");
        bob.append(this.mBufferedPosition);
        bob.append(", speed=");
        bob.append(this.mSpeed);
        bob.append(", updated=");
        bob.append(this.mUpdateTime);
        bob.append(", actions=");
        bob.append(this.mActions);
        bob.append(", error=");
        bob.append(this.mErrorMessage);
        bob.append(", custom actions=");
        bob.append(this.mCustomActions);
        bob.append(", active item id=");
        bob.append(this.mActiveItemId);
        bob.append("}");
        return bob.toString();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.mState);
        dest.writeLong(this.mPosition);
        dest.writeFloat(this.mSpeed);
        dest.writeLong(this.mUpdateTime);
        dest.writeLong(this.mBufferedPosition);
        dest.writeLong(this.mActions);
        TextUtils.writeToParcel(this.mErrorMessage, dest, flags);
        dest.writeTypedList(this.mCustomActions);
        dest.writeLong(this.mActiveItemId);
        dest.writeBundle(this.mExtras);
    }

    public int getState() {
        return this.mState;
    }

    public long getPosition() {
        return this.mPosition;
    }

    public long getBufferedPosition() {
        return this.mBufferedPosition;
    }

    public float getPlaybackSpeed() {
        return this.mSpeed;
    }

    public long getActions() {
        return this.mActions;
    }

    public List<CustomAction> getCustomActions() {
        return this.mCustomActions;
    }

    public CharSequence getErrorMessage() {
        return this.mErrorMessage;
    }

    public long getLastPositionUpdateTime() {
        return this.mUpdateTime;
    }

    public long getActiveQueueItemId() {
        return this.mActiveItemId;
    }

    @Nullable
    public Bundle getExtras() {
        return this.mExtras;
    }

    public static PlaybackStateCompat fromPlaybackState(Object stateObj) {
        Object obj = stateObj;
        Bundle bundle = null;
        if (obj == null || VERSION.SDK_INT < 21) {
            return null;
        }
        List<Object> customActionObjs = PlaybackStateCompatApi21.getCustomActions(stateObj);
        List<CustomAction> customActions = null;
        if (customActionObjs != null) {
            customActions = new ArrayList<>(customActionObjs.size());
            for (Object customActionObj : customActionObjs) {
                customActions.add(CustomAction.fromCustomAction(customActionObj));
            }
        }
        if (VERSION.SDK_INT >= 22) {
            bundle = PlaybackStateCompatApi22.getExtras(stateObj);
        }
        PlaybackStateCompat playbackStateCompat = new PlaybackStateCompat(PlaybackStateCompatApi21.getState(stateObj), PlaybackStateCompatApi21.getPosition(stateObj), PlaybackStateCompatApi21.getBufferedPosition(stateObj), PlaybackStateCompatApi21.getPlaybackSpeed(stateObj), PlaybackStateCompatApi21.getActions(stateObj), PlaybackStateCompatApi21.getErrorMessage(stateObj), PlaybackStateCompatApi21.getLastPositionUpdateTime(stateObj), customActions, PlaybackStateCompatApi21.getActiveQueueItemId(stateObj), bundle);
        playbackStateCompat.mStateObj = obj;
        return playbackStateCompat;
    }

    public Object getPlaybackState() {
        if (this.mStateObj != null || VERSION.SDK_INT < 21) {
            return this.mStateObj;
        }
        List<Object> customActions = null;
        if (this.mCustomActions != null) {
            customActions = new ArrayList<>(this.mCustomActions.size());
            for (CustomAction customAction : this.mCustomActions) {
                customActions.add(customAction.getCustomAction());
            }
        }
        if (VERSION.SDK_INT >= 22) {
            this.mStateObj = PlaybackStateCompatApi22.newInstance(this.mState, this.mPosition, this.mBufferedPosition, this.mSpeed, this.mActions, this.mErrorMessage, this.mUpdateTime, customActions, this.mActiveItemId, this.mExtras);
        } else {
            this.mStateObj = PlaybackStateCompatApi21.newInstance(this.mState, this.mPosition, this.mBufferedPosition, this.mSpeed, this.mActions, this.mErrorMessage, this.mUpdateTime, customActions, this.mActiveItemId);
        }
        return this.mStateObj;
    }
}
