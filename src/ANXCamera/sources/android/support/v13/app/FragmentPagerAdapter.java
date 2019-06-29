package android.support.v13.app;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Parcelable;
import android.support.v4.view.PagerAdapter;
import android.view.View;
import android.view.ViewGroup;

@Deprecated
public abstract class FragmentPagerAdapter extends PagerAdapter {
    private static final boolean DEBUG = false;
    private static final String TAG = "FragmentPagerAdapter";
    private FragmentTransaction mCurTransaction = null;
    private Fragment mCurrentPrimaryItem = null;
    private final FragmentManager mFragmentManager;

    @Deprecated
    public FragmentPagerAdapter(FragmentManager fragmentManager) {
        this.mFragmentManager = fragmentManager;
    }

    private static String makeFragmentName(int i, long j) {
        StringBuilder sb = new StringBuilder();
        sb.append("android:switcher:");
        sb.append(i);
        sb.append(":");
        sb.append(j);
        return sb.toString();
    }

    @Deprecated
    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        if (this.mCurTransaction == null) {
            this.mCurTransaction = this.mFragmentManager.beginTransaction();
        }
        this.mCurTransaction.detach((Fragment) obj);
    }

    @Deprecated
    public void finishUpdate(ViewGroup viewGroup) {
        if (this.mCurTransaction != null) {
            this.mCurTransaction.commitAllowingStateLoss();
            this.mCurTransaction = null;
            this.mFragmentManager.executePendingTransactions();
        }
    }

    @Deprecated
    public abstract Fragment getItem(int i);

    @Deprecated
    public long getItemId(int i) {
        return (long) i;
    }

    @Deprecated
    public Object instantiateItem(ViewGroup viewGroup, int i) {
        if (this.mCurTransaction == null) {
            this.mCurTransaction = this.mFragmentManager.beginTransaction();
        }
        long itemId = getItemId(i);
        Fragment findFragmentByTag = this.mFragmentManager.findFragmentByTag(makeFragmentName(viewGroup.getId(), itemId));
        if (findFragmentByTag != null) {
            this.mCurTransaction.attach(findFragmentByTag);
        } else {
            findFragmentByTag = getItem(i);
            this.mCurTransaction.add(viewGroup.getId(), findFragmentByTag, makeFragmentName(viewGroup.getId(), itemId));
        }
        if (findFragmentByTag != this.mCurrentPrimaryItem) {
            findFragmentByTag.setMenuVisibility(false);
            FragmentCompat.setUserVisibleHint(findFragmentByTag, false);
        }
        return findFragmentByTag;
    }

    @Deprecated
    public boolean isViewFromObject(View view, Object obj) {
        return ((Fragment) obj).getView() == view;
    }

    @Deprecated
    public void restoreState(Parcelable parcelable, ClassLoader classLoader) {
    }

    @Deprecated
    public Parcelable saveState() {
        return null;
    }

    @Deprecated
    public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
        Fragment fragment = (Fragment) obj;
        if (fragment != this.mCurrentPrimaryItem) {
            if (this.mCurrentPrimaryItem != null) {
                this.mCurrentPrimaryItem.setMenuVisibility(false);
                FragmentCompat.setUserVisibleHint(this.mCurrentPrimaryItem, false);
            }
            if (fragment != null) {
                fragment.setMenuVisibility(true);
                FragmentCompat.setUserVisibleHint(fragment, true);
            }
            this.mCurrentPrimaryItem = fragment;
        }
    }

    @Deprecated
    public void startUpdate(ViewGroup viewGroup) {
        if (viewGroup.getId() == -1) {
            StringBuilder sb = new StringBuilder();
            sb.append("ViewPager with adapter ");
            sb.append(this);
            sb.append(" requires a view id");
            throw new IllegalStateException(sb.toString());
        }
    }
}
