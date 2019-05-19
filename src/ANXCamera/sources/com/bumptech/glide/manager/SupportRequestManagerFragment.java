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
    private i aH;
    private final a mZ;
    private final m na;
    private final Set<SupportRequestManagerFragment> nb;
    @Nullable
    private SupportRequestManagerFragment nr;
    @Nullable
    private Fragment ns;

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
        this.na = new a();
        this.nb = new HashSet();
        this.mZ = aVar;
    }

    private void a(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nb.add(supportRequestManagerFragment);
    }

    private void b(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.nb.remove(supportRequestManagerFragment);
    }

    private void d(@NonNull FragmentActivity fragmentActivity) {
        dc();
        this.nr = c.c(fragmentActivity).q().c(fragmentActivity);
        if (!equals(this.nr)) {
            this.nr.a(this);
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
        if (this.nr != null) {
            this.nr.b(this);
            this.nr = null;
        }
    }

    @Nullable
    private Fragment df() {
        Fragment parentFragment = getParentFragment();
        return parentFragment != null ? parentFragment : this.ns;
    }

    /* access modifiers changed from: 0000 */
    public void c(@Nullable Fragment fragment) {
        this.ns = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            d(fragment.getActivity());
        }
    }

    public void c(@Nullable i iVar) {
        this.aH = iVar;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public a cX() {
        return this.mZ;
    }

    @Nullable
    public i cY() {
        return this.aH;
    }

    @NonNull
    public m cZ() {
        return this.na;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public Set<SupportRequestManagerFragment> da() {
        if (this.nr == null) {
            return Collections.emptySet();
        }
        if (equals(this.nr)) {
            return Collections.unmodifiableSet(this.nb);
        }
        HashSet hashSet = new HashSet();
        for (SupportRequestManagerFragment supportRequestManagerFragment : this.nr.da()) {
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
        this.mZ.onDestroy();
        dc();
    }

    public void onDetach() {
        super.onDetach();
        this.ns = null;
        dc();
    }

    public void onStart() {
        super.onStart();
        this.mZ.onStart();
    }

    public void onStop() {
        super.onStop();
        this.mZ.onStop();
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
