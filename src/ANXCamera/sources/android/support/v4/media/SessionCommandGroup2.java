package android.support.v4.media;

import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public final class SessionCommandGroup2 {
    private static final String KEY_COMMANDS = "android.media.mediasession2.commandgroup.commands";
    private static final String PREFIX_COMMAND_CODE = "COMMAND_CODE_";
    private static final String PREFIX_COMMAND_CODE_PLAYBACK = "COMMAND_CODE_PLAYBACK_";
    private static final String PREFIX_COMMAND_CODE_PLAYLIST = "COMMAND_CODE_PLAYLIST_";
    private static final String PREFIX_COMMAND_CODE_VOLUME = "COMMAND_CODE_VOLUME_";
    private static final String TAG = "SessionCommandGroup2";
    private Set<SessionCommand2> mCommands = new HashSet();

    public SessionCommandGroup2() {
    }

    public SessionCommandGroup2(@Nullable SessionCommandGroup2 sessionCommandGroup2) {
        if (sessionCommandGroup2 != null) {
            this.mCommands.addAll(sessionCommandGroup2.mCommands);
        }
    }

    private void addCommandsWithPrefix(String str) {
        Field[] fields = SessionCommand2.class.getFields();
        if (fields != null) {
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getName().startsWith(str) && !fields[i].getName().equals("COMMAND_CODE_CUSTOM")) {
                    try {
                        this.mCommands.add(new SessionCommand2(fields[i].getInt(null)));
                    } catch (IllegalAccessException e) {
                        String str2 = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Unexpected ");
                        sb.append(fields[i]);
                        sb.append(" in MediaSession2");
                        Log.w(str2, sb.toString());
                    }
                }
            }
        }
    }

    @Nullable
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static SessionCommandGroup2 fromBundle(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        ArrayList parcelableArrayList = bundle.getParcelableArrayList(KEY_COMMANDS);
        if (parcelableArrayList == null) {
            return null;
        }
        SessionCommandGroup2 sessionCommandGroup2 = new SessionCommandGroup2();
        for (int i = 0; i < parcelableArrayList.size(); i++) {
            Parcelable parcelable = (Parcelable) parcelableArrayList.get(i);
            if (parcelable instanceof Bundle) {
                SessionCommand2 fromBundle = SessionCommand2.fromBundle((Bundle) parcelable);
                if (fromBundle != null) {
                    sessionCommandGroup2.addCommand(fromBundle);
                }
            }
        }
        return sessionCommandGroup2;
    }

    /* access modifiers changed from: 0000 */
    public void addAllPlaybackCommands() {
        addCommandsWithPrefix(PREFIX_COMMAND_CODE_PLAYBACK);
    }

    /* access modifiers changed from: 0000 */
    public void addAllPlaylistCommands() {
        addCommandsWithPrefix(PREFIX_COMMAND_CODE_PLAYLIST);
    }

    public void addAllPredefinedCommands() {
        addCommandsWithPrefix(PREFIX_COMMAND_CODE);
    }

    /* access modifiers changed from: 0000 */
    public void addAllVolumeCommands() {
        addCommandsWithPrefix(PREFIX_COMMAND_CODE_VOLUME);
    }

    public void addCommand(int i) {
        if (i != 0) {
            this.mCommands.add(new SessionCommand2(i));
            return;
        }
        throw new IllegalArgumentException("command shouldn't be null");
    }

    public void addCommand(@NonNull SessionCommand2 sessionCommand2) {
        if (sessionCommand2 != null) {
            this.mCommands.add(sessionCommand2);
            return;
        }
        throw new IllegalArgumentException("command shouldn't be null");
    }

    @NonNull
    public Set<SessionCommand2> getCommands() {
        return new HashSet(this.mCommands);
    }

    public boolean hasCommand(int i) {
        if (i != 0) {
            for (SessionCommand2 commandCode : this.mCommands) {
                if (commandCode.getCommandCode() == i) {
                    return true;
                }
            }
            return false;
        }
        throw new IllegalArgumentException("Use hasCommand(Command) for custom command");
    }

    public boolean hasCommand(@NonNull SessionCommand2 sessionCommand2) {
        if (sessionCommand2 != null) {
            return this.mCommands.contains(sessionCommand2);
        }
        throw new IllegalArgumentException("command shouldn't be null");
    }

    public void removeCommand(int i) {
        if (i != 0) {
            this.mCommands.remove(new SessionCommand2(i));
            return;
        }
        throw new IllegalArgumentException("commandCode shouldn't be COMMAND_CODE_CUSTOM");
    }

    public void removeCommand(@NonNull SessionCommand2 sessionCommand2) {
        if (sessionCommand2 != null) {
            this.mCommands.remove(sessionCommand2);
            return;
        }
        throw new IllegalArgumentException("command shouldn't be null");
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @NonNull
    public Bundle toBundle() {
        ArrayList arrayList = new ArrayList();
        for (SessionCommand2 bundle : this.mCommands) {
            arrayList.add(bundle.toBundle());
        }
        Bundle bundle2 = new Bundle();
        bundle2.putParcelableArrayList(KEY_COMMANDS, arrayList);
        return bundle2;
    }
}
