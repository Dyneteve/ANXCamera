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
    private i aJ;
    private final a nb;
    private final m nc;
    private final Set<SupportRequestManagerFragment> nd;
    @Nullable
    private SupportRequestManagerFragment nt;
    @Nullable
    private Fragment nu;

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
        this.nc = new a();
        this.nd = new HashSet();
        this.nb = aVar;
    }

    private void a(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nd.add(supportRequestManagerFragment);
    }

    private void b(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nd.remove(supportRequestManagerFragment);
    }

    private void d(@NonNull FragmentActivity fragmentActivity) {
        dc();
        this.nt = c.c(fragmentActivity).q().c(fragmentActivity);
        if (!equals(this.nt)) {
            this.nt.a(this);
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
        if (this.nt != null) {
            this.nt.b(this);
            this.nt = null;
        }
    }

    @Nullable
    private Fragment df() {
        Fragment parentFragment = getParentFragment();
        return parentFragment != null ? parentFragment : this.nu;
    }

    /* access modifiers changed from: 0000 */
    public void c(@Nullable Fragment fragment) {
        this.nu = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            d(fragment.getActivity());
        }
    }

    public void c(@Nullable i iVar) {
        this.aJ = iVar;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public a cX() {
        return this.nb;
    }

    @Nullable
    public i cY() {
        return this.aJ;
    }

    @NonNull
    public m cZ() {
        return this.nc;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public Set<SupportRequestManagerFragment> da() {
        if (this.nt == null) {
            return Collections.emptySet();
        }
        if (equals(this.nt)) {
            return Collections.unmodifiableSet(this.nd);
        }
        HashSet hashSet = new HashSet();
        for (SupportRequestManagerFragment supportRequestManagerFragment : this.nt.da()) {
            if (d(supportRequestManagerFragment.df())) {
                hashSet.add(supportRequestManagerFragment);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    public void onAttach(Context context) {
        SupportRequestManagerFragment.super.onAttach(context);
        try {
            d(getActivity());
        } catch (IllegalStateException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to register fragment with root", e);
            }
        }
    }

    public void onDestroy() {
        SupportRequestManagerFragment.super.onDestroy();
        this.nb.onDestroy();
        dc();
    }

    public void onDetach() {
        SupportRequestManagerFragment.super.onDetach();
        this.nu = null;
        dc();
    }

    public void onStart() {
        SupportRequestManagerFragment.super.onStart();
        this.nb.onStart();
    }

    public void onStop() {
        SupportRequestManagerFragment.super.onStop();
        this.nb.onStop();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(SupportRequestManagerFragment.super.toString());
        sb.append("{parent=");
        sb.append(df());
        sb.append("}");
        return sb.toString();
    }
}
