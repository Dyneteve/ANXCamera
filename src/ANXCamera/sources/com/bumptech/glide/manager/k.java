package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@Deprecated
/* compiled from: RequestManagerFragment */
public class k extends Fragment {
    private static final String TAG = "RMFragment";
    @Nullable
    private i aI;
    private final a na;
    private final m nb;
    private final Set<k> nc;
    @Nullable
    private k nd;
    @Nullable
    private Fragment ne;

    /* compiled from: RequestManagerFragment */
    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> cW() {
            Set<k> da = k.this.da();
            HashSet hashSet = new HashSet(da.size());
            for (k kVar : da) {
                if (kVar.cY() != null) {
                    hashSet.add(kVar.cY());
                }
            }
            return hashSet;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(super.toString());
            sb.append("{fragment=");
            sb.append(k.this);
            sb.append("}");
            return sb.toString();
        }
    }

    public k() {
        this(new a());
    }

    @VisibleForTesting
    @SuppressLint({"ValidFragment"})
    k(@NonNull a aVar) {
        this.nb = new a();
        this.nc = new HashSet();
        this.na = aVar;
    }

    private void a(k kVar) {
        this.nc.add(kVar);
    }

    private void b(@NonNull Activity activity) {
        dc();
        this.nd = c.c(activity).q().e(activity);
        if (!equals(this.nd)) {
            this.nd.a(this);
        }
    }

    private void b(k kVar) {
        this.nc.remove(kVar);
    }

    @TargetApi(17)
    private boolean c(@NonNull Fragment fragment) {
        Fragment parentFragment = getParentFragment();
        while (true) {
            Fragment parentFragment2 = fragment.getParentFragment();
            if (parentFragment2 == null) {
                return false;
            }
            if (parentFragment2.equals(parentFragment)) {
                return true;
            }
            fragment = fragment.getParentFragment();
        }
    }

    @Nullable
    @TargetApi(17)
    private Fragment db() {
        Fragment parentFragment = VERSION.SDK_INT >= 17 ? getParentFragment() : null;
        return parentFragment != null ? parentFragment : this.ne;
    }

    private void dc() {
        if (this.nd != null) {
            this.nd.b(this);
            this.nd = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void b(@Nullable Fragment fragment) {
        this.ne = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            b(fragment.getActivity());
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
    @TargetApi(17)
    @NonNull
    public Set<k> da() {
        if (equals(this.nd)) {
            return Collections.unmodifiableSet(this.nc);
        }
        if (this.nd == null || VERSION.SDK_INT < 17) {
            return Collections.emptySet();
        }
        HashSet hashSet = new HashSet();
        for (k kVar : this.nd.da()) {
            if (c(kVar.getParentFragment())) {
                hashSet.add(kVar);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            b(activity);
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
        sb.append(db());
        sb.append("}");
        return sb.toString();
    }
}
