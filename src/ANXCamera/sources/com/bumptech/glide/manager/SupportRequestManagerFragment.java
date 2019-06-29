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
    private i bJ;
    private final a oa;
    private final m ob;
    private final Set<SupportRequestManagerFragment> oc;
    @Nullable
    private SupportRequestManagerFragment ot;
    @Nullable
    private Fragment ou;

    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> dy() {
            Set<SupportRequestManagerFragment> dC = SupportRequestManagerFragment.this.dC();
            HashSet hashSet = new HashSet(dC.size());
            for (SupportRequestManagerFragment supportRequestManagerFragment : dC) {
                if (supportRequestManagerFragment.dA() != null) {
                    hashSet.add(supportRequestManagerFragment.dA());
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
        this.ob = new a();
        this.oc = new HashSet();
        this.oa = aVar;
    }

    private void a(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.oc.add(supportRequestManagerFragment);
    }

    private void b(SupportRequestManagerFragment supportRequestManagerFragment) {
        this.oc.remove(supportRequestManagerFragment);
    }

    private void d(@NonNull FragmentActivity fragmentActivity) {
        dE();
        this.ot = c.c(fragmentActivity).Q().c(fragmentActivity);
        if (!equals(this.ot)) {
            this.ot.a(this);
        }
    }

    private boolean d(@NonNull Fragment fragment) {
        Fragment dH = dH();
        while (true) {
            Fragment parentFragment = fragment.getParentFragment();
            if (parentFragment == null) {
                return false;
            }
            if (parentFragment.equals(dH)) {
                return true;
            }
            fragment = fragment.getParentFragment();
        }
    }

    private void dE() {
        if (this.ot != null) {
            this.ot.b(this);
            this.ot = null;
        }
    }

    @Nullable
    private Fragment dH() {
        Fragment parentFragment = getParentFragment();
        return parentFragment != null ? parentFragment : this.ou;
    }

    /* access modifiers changed from: 0000 */
    public void c(@Nullable Fragment fragment) {
        this.ou = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            d(fragment.getActivity());
        }
    }

    public void c(@Nullable i iVar) {
        this.bJ = iVar;
    }

    @Nullable
    public i dA() {
        return this.bJ;
    }

    @NonNull
    public m dB() {
        return this.ob;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public Set<SupportRequestManagerFragment> dC() {
        if (this.ot == null) {
            return Collections.emptySet();
        }
        if (equals(this.ot)) {
            return Collections.unmodifiableSet(this.oc);
        }
        HashSet hashSet = new HashSet();
        for (SupportRequestManagerFragment supportRequestManagerFragment : this.ot.dC()) {
            if (d(supportRequestManagerFragment.dH())) {
                hashSet.add(supportRequestManagerFragment);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public a dz() {
        return this.oa;
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
        this.oa.onDestroy();
        dE();
    }

    public void onDetach() {
        super.onDetach();
        this.ou = null;
        dE();
    }

    public void onStart() {
        super.onStart();
        this.oa.onStart();
    }

    public void onStop() {
        super.onStop();
        this.oa.onStop();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{parent=");
        sb.append(dH());
        sb.append("}");
        return sb.toString();
    }
}
