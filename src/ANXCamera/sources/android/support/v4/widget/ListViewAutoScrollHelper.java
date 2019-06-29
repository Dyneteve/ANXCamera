package android.support.v4.widget;

import android.support.annotation.NonNull;
import android.widget.ListView;

public class ListViewAutoScrollHelper extends AutoScrollHelper {
    private final ListView mTarget;

    public ListViewAutoScrollHelper(@NonNull ListView listView) {
        super(listView);
        this.mTarget = listView;
    }

    public boolean canTargetScrollHorizontally(int i) {
        return false;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x003a A[RETURN] */
    public boolean canTargetScrollVertically(int i) {
        ListView listView = this.mTarget;
        int count = listView.getCount();
        if (count == 0) {
            return false;
        }
        int childCount = listView.getChildCount();
        int firstVisiblePosition = listView.getFirstVisiblePosition();
        int i2 = firstVisiblePosition + childCount;
        if (i > 0) {
            return i2 < count || listView.getChildAt(childCount - 1).getBottom() > listView.getHeight();
        }
        if (i >= 0) {
            return false;
        }
        if (firstVisiblePosition <= 0 && listView.getChildAt(0).getTop() >= 0) {
            return false;
        }
    }

    public void scrollTargetBy(int i, int i2) {
        ListViewCompat.scrollListBy(this.mTarget, i2);
    }
}
