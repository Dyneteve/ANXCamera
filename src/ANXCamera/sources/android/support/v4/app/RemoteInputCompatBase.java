package android.support.v4.app;

import android.os.Bundle;

class RemoteInputCompatBase {

    public static abstract class RemoteInput {

        public interface Factory {
            RemoteInput build(String str, CharSequence charSequence, CharSequence[] charSequenceArr, boolean z, Bundle bundle);

            RemoteInput[] newArray(int i);
        }

        public abstract boolean getAllowFreeFormInput();

        public abstract CharSequence[] getChoices();

        public abstract Bundle getExtras();

        public abstract CharSequence getLabel();

        public abstract String getResultKey();
    }

    RemoteInputCompatBase() {
    }
}
