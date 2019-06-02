package android.support.v4.app;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Parcelable;
import android.support.annotation.StringRes;
import android.support.v4.content.IntentCompat;
import android.text.Html;
import android.text.Spanned;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import java.util.ArrayList;

public class ShareCompat {
    public static final String EXTRA_CALLING_ACTIVITY = "android.support.v4.app.EXTRA_CALLING_ACTIVITY";
    public static final String EXTRA_CALLING_PACKAGE = "android.support.v4.app.EXTRA_CALLING_PACKAGE";
    /* access modifiers changed from: private */
    public static ShareCompatImpl IMPL;

    public static class IntentBuilder {
        private Activity mActivity;
        private ArrayList<String> mBccAddresses;
        private ArrayList<String> mCcAddresses;
        private CharSequence mChooserTitle;
        private Intent mIntent = new Intent().setAction("android.intent.action.SEND");
        private ArrayList<Uri> mStreams;
        private ArrayList<String> mToAddresses;

        private IntentBuilder(Activity activity) {
            this.mActivity = activity;
            this.mIntent.putExtra(ShareCompat.EXTRA_CALLING_PACKAGE, activity.getPackageName());
            this.mIntent.putExtra(ShareCompat.EXTRA_CALLING_ACTIVITY, activity.getComponentName());
            this.mIntent.addFlags(524288);
        }

        private void combineArrayExtra(String str, ArrayList<String> arrayList) {
            String[] stringArrayExtra = this.mIntent.getStringArrayExtra(str);
            int length = stringArrayExtra != null ? stringArrayExtra.length : 0;
            String[] strArr = new String[(arrayList.size() + length)];
            arrayList.toArray(strArr);
            if (stringArrayExtra != null) {
                System.arraycopy(stringArrayExtra, 0, strArr, arrayList.size(), length);
            }
            this.mIntent.putExtra(str, strArr);
        }

        private void combineArrayExtra(String str, String[] strArr) {
            Intent intent = getIntent();
            String[] stringArrayExtra = intent.getStringArrayExtra(str);
            int length = stringArrayExtra != null ? stringArrayExtra.length : 0;
            String[] strArr2 = new String[(strArr.length + length)];
            if (stringArrayExtra != null) {
                System.arraycopy(stringArrayExtra, 0, strArr2, 0, length);
            }
            System.arraycopy(strArr, 0, strArr2, length, strArr.length);
            intent.putExtra(str, strArr2);
        }

        public static IntentBuilder from(Activity activity) {
            return new IntentBuilder(activity);
        }

        public IntentBuilder addEmailBcc(String str) {
            if (this.mBccAddresses == null) {
                this.mBccAddresses = new ArrayList<>();
            }
            this.mBccAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailBcc(String[] strArr) {
            combineArrayExtra("android.intent.extra.BCC", strArr);
            return this;
        }

        public IntentBuilder addEmailCc(String str) {
            if (this.mCcAddresses == null) {
                this.mCcAddresses = new ArrayList<>();
            }
            this.mCcAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailCc(String[] strArr) {
            combineArrayExtra("android.intent.extra.CC", strArr);
            return this;
        }

        public IntentBuilder addEmailTo(String str) {
            if (this.mToAddresses == null) {
                this.mToAddresses = new ArrayList<>();
            }
            this.mToAddresses.add(str);
            return this;
        }

        public IntentBuilder addEmailTo(String[] strArr) {
            combineArrayExtra("android.intent.extra.EMAIL", strArr);
            return this;
        }

        public IntentBuilder addStream(Uri uri) {
            Uri uri2 = (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
            if (uri2 == null) {
                return setStream(uri);
            }
            if (this.mStreams == null) {
                this.mStreams = new ArrayList<>();
            }
            if (uri2 != null) {
                this.mIntent.removeExtra("android.intent.extra.STREAM");
                this.mStreams.add(uri2);
            }
            this.mStreams.add(uri);
            return this;
        }

        public Intent createChooserIntent() {
            return Intent.createChooser(getIntent(), this.mChooserTitle);
        }

        /* access modifiers changed from: 0000 */
        public Activity getActivity() {
            return this.mActivity;
        }

        public Intent getIntent() {
            if (this.mToAddresses != null) {
                combineArrayExtra("android.intent.extra.EMAIL", this.mToAddresses);
                this.mToAddresses = null;
            }
            if (this.mCcAddresses != null) {
                combineArrayExtra("android.intent.extra.CC", this.mCcAddresses);
                this.mCcAddresses = null;
            }
            if (this.mBccAddresses != null) {
                combineArrayExtra("android.intent.extra.BCC", this.mBccAddresses);
                this.mBccAddresses = null;
            }
            boolean z = true;
            if (this.mStreams == null || this.mStreams.size() <= 1) {
                z = false;
            }
            boolean z2 = z;
            boolean equals = this.mIntent.getAction().equals("android.intent.action.SEND_MULTIPLE");
            if (!z2 && equals) {
                this.mIntent.setAction("android.intent.action.SEND");
                if (this.mStreams == null || this.mStreams.isEmpty()) {
                    this.mIntent.removeExtra("android.intent.extra.STREAM");
                } else {
                    this.mIntent.putExtra("android.intent.extra.STREAM", (Parcelable) this.mStreams.get(0));
                }
                this.mStreams = null;
            }
            if (z2 && !equals) {
                this.mIntent.setAction("android.intent.action.SEND_MULTIPLE");
                if (this.mStreams == null || this.mStreams.isEmpty()) {
                    this.mIntent.removeExtra("android.intent.extra.STREAM");
                } else {
                    this.mIntent.putParcelableArrayListExtra("android.intent.extra.STREAM", this.mStreams);
                }
            }
            return this.mIntent;
        }

        public IntentBuilder setChooserTitle(@StringRes int i) {
            return setChooserTitle(this.mActivity.getText(i));
        }

        public IntentBuilder setChooserTitle(CharSequence charSequence) {
            this.mChooserTitle = charSequence;
            return this;
        }

        public IntentBuilder setEmailBcc(String[] strArr) {
            this.mIntent.putExtra("android.intent.extra.BCC", strArr);
            return this;
        }

        public IntentBuilder setEmailCc(String[] strArr) {
            this.mIntent.putExtra("android.intent.extra.CC", strArr);
            return this;
        }

        public IntentBuilder setEmailTo(String[] strArr) {
            if (this.mToAddresses != null) {
                this.mToAddresses = null;
            }
            this.mIntent.putExtra("android.intent.extra.EMAIL", strArr);
            return this;
        }

        public IntentBuilder setHtmlText(String str) {
            this.mIntent.putExtra(IntentCompat.EXTRA_HTML_TEXT, str);
            if (!this.mIntent.hasExtra("android.intent.extra.TEXT")) {
                setText(Html.fromHtml(str));
            }
            return this;
        }

        public IntentBuilder setStream(Uri uri) {
            if (!this.mIntent.getAction().equals("android.intent.action.SEND")) {
                this.mIntent.setAction("android.intent.action.SEND");
            }
            this.mStreams = null;
            this.mIntent.putExtra("android.intent.extra.STREAM", uri);
            return this;
        }

        public IntentBuilder setSubject(String str) {
            this.mIntent.putExtra("android.intent.extra.SUBJECT", str);
            return this;
        }

        public IntentBuilder setText(CharSequence charSequence) {
            this.mIntent.putExtra("android.intent.extra.TEXT", charSequence);
            return this;
        }

        public IntentBuilder setType(String str) {
            this.mIntent.setType(str);
            return this;
        }

        public void startChooser() {
            this.mActivity.startActivity(createChooserIntent());
        }
    }

    public static class IntentReader {
        private static final String TAG = "IntentReader";
        private Activity mActivity;
        private ComponentName mCallingActivity;
        private String mCallingPackage;
        private Intent mIntent;
        private ArrayList<Uri> mStreams;

        private IntentReader(Activity activity) {
            this.mActivity = activity;
            this.mIntent = activity.getIntent();
            this.mCallingPackage = ShareCompat.getCallingPackage(activity);
            this.mCallingActivity = ShareCompat.getCallingActivity(activity);
        }

        public static IntentReader from(Activity activity) {
            return new IntentReader(activity);
        }

        public ComponentName getCallingActivity() {
            return this.mCallingActivity;
        }

        public Drawable getCallingActivityIcon() {
            if (this.mCallingActivity == null) {
                return null;
            }
            try {
                return this.mActivity.getPackageManager().getActivityIcon(this.mCallingActivity);
            } catch (NameNotFoundException e) {
                Log.e(TAG, "Could not retrieve icon for calling activity", e);
                return null;
            }
        }

        public Drawable getCallingApplicationIcon() {
            if (this.mCallingPackage == null) {
                return null;
            }
            try {
                return this.mActivity.getPackageManager().getApplicationIcon(this.mCallingPackage);
            } catch (NameNotFoundException e) {
                Log.e(TAG, "Could not retrieve icon for calling application", e);
                return null;
            }
        }

        public CharSequence getCallingApplicationLabel() {
            if (this.mCallingPackage == null) {
                return null;
            }
            PackageManager packageManager = this.mActivity.getPackageManager();
            try {
                return packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.mCallingPackage, 0));
            } catch (NameNotFoundException e) {
                Log.e(TAG, "Could not retrieve label for calling application", e);
                return null;
            }
        }

        public String getCallingPackage() {
            return this.mCallingPackage;
        }

        public String[] getEmailBcc() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.BCC");
        }

        public String[] getEmailCc() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.CC");
        }

        public String[] getEmailTo() {
            return this.mIntent.getStringArrayExtra("android.intent.extra.EMAIL");
        }

        public String getHtmlText() {
            String stringExtra = this.mIntent.getStringExtra(IntentCompat.EXTRA_HTML_TEXT);
            if (stringExtra != null) {
                return stringExtra;
            }
            CharSequence text = getText();
            return text instanceof Spanned ? Html.toHtml((Spanned) text) : text != null ? ShareCompat.IMPL.escapeHtml(text) : stringExtra;
        }

        public Uri getStream() {
            return (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
        }

        public Uri getStream(int i) {
            if (this.mStreams == null && isMultipleShare()) {
                this.mStreams = this.mIntent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            }
            if (this.mStreams != null) {
                return (Uri) this.mStreams.get(i);
            }
            if (i == 0) {
                return (Uri) this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Stream items available: ");
            sb.append(getStreamCount());
            sb.append(" index requested: ");
            sb.append(i);
            throw new IndexOutOfBoundsException(sb.toString());
        }

        public int getStreamCount() {
            if (this.mStreams == null && isMultipleShare()) {
                this.mStreams = this.mIntent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            }
            return this.mStreams != null ? this.mStreams.size() : this.mIntent.hasExtra("android.intent.extra.STREAM") ? 1 : 0;
        }

        public String getSubject() {
            return this.mIntent.getStringExtra("android.intent.extra.SUBJECT");
        }

        public CharSequence getText() {
            return this.mIntent.getCharSequenceExtra("android.intent.extra.TEXT");
        }

        public String getType() {
            return this.mIntent.getType();
        }

        public boolean isMultipleShare() {
            return "android.intent.action.SEND_MULTIPLE".equals(this.mIntent.getAction());
        }

        public boolean isShareIntent() {
            String action = this.mIntent.getAction();
            return "android.intent.action.SEND".equals(action) || "android.intent.action.SEND_MULTIPLE".equals(action);
        }

        public boolean isSingleShare() {
            return "android.intent.action.SEND".equals(this.mIntent.getAction());
        }
    }

    interface ShareCompatImpl {
        void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder);

        String escapeHtml(CharSequence charSequence);
    }

    static class ShareCompatImplBase implements ShareCompatImpl {
        ShareCompatImplBase() {
        }

        private static void withinStyle(StringBuilder sb, CharSequence charSequence, int i, int i2) {
            int i3;
            int i4 = i;
            while (i3 < i2) {
                char charAt = charSequence.charAt(i3);
                if (charAt == '<') {
                    sb.append("&lt;");
                } else if (charAt == '>') {
                    sb.append("&gt;");
                } else if (charAt == '&') {
                    sb.append("&amp;");
                } else if (charAt > '~' || charAt < ' ') {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("&#");
                    sb2.append(charAt);
                    sb2.append(";");
                    sb.append(sb2.toString());
                } else if (charAt == ' ') {
                    while (i3 + 1 < i2 && charSequence.charAt(i3 + 1) == ' ') {
                        sb.append("&nbsp;");
                        i3++;
                    }
                    sb.append(' ');
                } else {
                    sb.append(charAt);
                }
                i4 = i3 + 1;
            }
        }

        public void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
            menuItem.setIntent(intentBuilder.createChooserIntent());
        }

        public String escapeHtml(CharSequence charSequence) {
            StringBuilder sb = new StringBuilder();
            withinStyle(sb, charSequence, 0, charSequence.length());
            return sb.toString();
        }
    }

    static class ShareCompatImplICS extends ShareCompatImplBase {
        ShareCompatImplICS() {
        }

        public void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
            ShareCompatICS.configureMenuItem(menuItem, intentBuilder.getActivity(), intentBuilder.getIntent());
            if (shouldAddChooserIntent(menuItem)) {
                menuItem.setIntent(intentBuilder.createChooserIntent());
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean shouldAddChooserIntent(MenuItem menuItem) {
            return !menuItem.hasSubMenu();
        }
    }

    static class ShareCompatImplJB extends ShareCompatImplICS {
        ShareCompatImplJB() {
        }

        public String escapeHtml(CharSequence charSequence) {
            return ShareCompatJB.escapeHtml(charSequence);
        }

        /* access modifiers changed from: 0000 */
        public boolean shouldAddChooserIntent(MenuItem menuItem) {
            return false;
        }
    }

    static {
        if (VERSION.SDK_INT >= 16) {
            IMPL = new ShareCompatImplJB();
        } else if (VERSION.SDK_INT >= 14) {
            IMPL = new ShareCompatImplICS();
        } else {
            IMPL = new ShareCompatImplBase();
        }
    }

    public static void configureMenuItem(Menu menu, int i, IntentBuilder intentBuilder) {
        MenuItem findItem = menu.findItem(i);
        if (findItem != null) {
            configureMenuItem(findItem, intentBuilder);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Could not find menu item with id ");
        sb.append(i);
        sb.append(" in the supplied menu");
        throw new IllegalArgumentException(sb.toString());
    }

    public static void configureMenuItem(MenuItem menuItem, IntentBuilder intentBuilder) {
        IMPL.configureMenuItem(menuItem, intentBuilder);
    }

    public static ComponentName getCallingActivity(Activity activity) {
        ComponentName callingActivity = activity.getCallingActivity();
        return callingActivity == null ? (ComponentName) activity.getIntent().getParcelableExtra(EXTRA_CALLING_ACTIVITY) : callingActivity;
    }

    public static String getCallingPackage(Activity activity) {
        String callingPackage = activity.getCallingPackage();
        return callingPackage == null ? activity.getIntent().getStringExtra(EXTRA_CALLING_PACKAGE) : callingPackage;
    }
}
