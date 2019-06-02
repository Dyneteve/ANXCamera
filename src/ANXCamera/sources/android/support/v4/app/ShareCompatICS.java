package android.support.v4.app;

import android.app.Activity;
import android.content.Intent;
import android.view.ActionProvider;
import android.view.MenuItem;
import android.widget.ShareActionProvider;

class ShareCompatICS {
    private static final String HISTORY_FILENAME_PREFIX = ".sharecompat_";

    ShareCompatICS() {
    }

    public static void configureMenuItem(MenuItem menuItem, Activity activity, Intent intent) {
        ActionProvider actionProvider = menuItem.getActionProvider();
        ShareActionProvider shareActionProvider = !(actionProvider instanceof ShareActionProvider) ? new ShareActionProvider(activity) : (ShareActionProvider) actionProvider;
        StringBuilder sb = new StringBuilder();
        sb.append(HISTORY_FILENAME_PREFIX);
        sb.append(activity.getClass().getName());
        shareActionProvider.setShareHistoryFileName(sb.toString());
        shareActionProvider.setShareIntent(intent);
        menuItem.setActionProvider(shareActionProvider);
    }
}
