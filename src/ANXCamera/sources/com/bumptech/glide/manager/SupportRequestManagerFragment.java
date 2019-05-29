package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class SupportRequestManagerFragment extends Fragment {
    private static final String TAG = "SupportRMFragment";
    @Nullable
    private i aI;
    private final a na;
    private final m nb;
    private final Set<SupportRequestManagerFragment> nc;
    @Nullable
    private SupportRequestManagerFragment ns;
    @Nullable
    private Fragment nt;

    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> cW() {
            Set<SupportRequestManagerFragment> da = SupportRequestManagerFragment.this.da();
            HashSet hashSet = new HashSet(da.size());
            for (SupportRequestManagerFragment supportRequestManagerFragment : da) {
                if (supportRequestManagerFragment.cY() != null) {
                    hashSet.add(supportRequestManagerFragment.cY());
                }
            }
            return hashSet;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(super.toString());
            sb.append("{fragment=");
            sb.append(SupportRequestManagerFragment.this);
            sb.append("}");
            return sb.toString();
        }
    }

    public SupportRequestManagerFragment() {
        this(new a());
    }

    @VisibleForTesting
    @SuppressLint({"ValidFragment"})
    public SupportRequestManagerFragment(@NonNull a aVar) {
        this.nb = new a();
        this.nc = new HashSet();
        this.na = aVar;
    }

    private void a(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nc.add(supportRequestManagerFragment);
    }

    private void b(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nc.remove(supportRequestManagerFragment);
    }

    private void d(@NonNull FragmentActivity fragmentActivity) {
        dc();
        this.ns = c.c(fragmentActivity).q().c(fragmentActivity);
        if (!equals(this.ns)) {
            this.ns.a(this);
        }
    }

    private boolean d(@NonNull Fragment fragment) {
        Fragment df = df();
        while (true) {
            Fragment parentFragment = fragment.getParentFragment();
            if (parentFragment == null) {
                return false;
            }
            if (parentFragment.equals(df)) {
                return true;
            }
            fragment = fragment.getParentFragment();
        }
    }

    private void dc() {
        if (this.ns != null) {
            this.ns.b(this);
            this.ns = null;
        }
    }

    @Nullable
    private Fragment df() {
        Fragment parentFragment = getParentFragment();
        return parentFragment != null ? parentFragment : this.nt;
    }

    /* access modifiers changed from: 0000 */
    public void c(@Nullable Fragment fragment) {
        this.nt = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            d(fragment.getActivity());
        }
    }

    public void c(@Nullable i iVar) {
        this.aI = iVar;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public a cX() {
        return this.na;
    }

    @Nullable
    public i cY() {
        return this.aI;
    }

    @NonNull
    public m cZ() {
        return this.nb;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public Set<SupportRequestManagerFragment> da() {
        if (this.ns == null) {
            return Collections.emptySet();
        }
        if (equals(this.ns)) {
            return Collections.unmodifiableSet(this.nc);
        }
        HashSet hashSet = new HashSet();
        for (SupportRequestManagerFragment supportRequestManagerFragment : this.ns.da()) {
            if (d(supportRequestManagerFragment.df())) {
                hashSet.add(supportRequestManagerFragment);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        try {
            d(getActivity());
        } catch (IllegalStateException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to register fragment with root", e);
            }
        }
    }

    public void onDestroy() {
        super.onDestroy();
        this.na.onDestroy();
        dc();
    }

    public void onDetach() {
        super.onDetach();
        this.nt = null;
        dc();
    }

    public void onStart() {
        super.onStart();
        this.na.onStart();
    }

    public void onStop() {
        super.onStop();
        this.na.onStop();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{parent=");
        sb.append(df());
        sb.append("}");
        return sb.toString();
    }
}
