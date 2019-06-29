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
    private i bJ;
    private final a oa;
    private final m ob;
    private final Set<k> oc;
    @Nullable
    private k od;
    @Nullable
    private Fragment oe;

    /* compiled from: RequestManagerFragment */
    private class a implements m {
        a() {
        }

        @NonNull
        public Set<i> dy() {
            Set<k> dC = k.this.dC();
            HashSet hashSet = new HashSet(dC.size());
            for (k kVar : dC) {
                if (kVar.dA() != null) {
                    hashSet.add(kVar.dA());
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
        this.ob = new a();
        this.oc = new HashSet();
        this.oa = aVar;
    }

    private void a(k kVar) {
        this.oc.add(kVar);
    }

    private void b(@NonNull Activity activity) {
        dE();
        this.od = c.c(activity).Q().e(activity);
        if (!equals(this.od)) {
            this.od.a(this);
        }
    }

    private void b(k kVar) {
        this.oc.remove(kVar);
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
    private Fragment dD() {
        Fragment parentFragment = VERSION.SDK_INT >= 17 ? getParentFragment() : null;
        return parentFragment != null ? parentFragment : this.oe;
    }

    private void dE() {
        if (this.od != null) {
            this.od.b(this);
            this.od = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void b(@Nullable Fragment fragment) {
        this.oe = fragment;
        if (fragment != null && fragment.getActivity() != null) {
            b(fragment.getActivity());
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
    @TargetApi(17)
    @NonNull
    public Set<k> dC() {
        if (equals(this.od)) {
            return Collections.unmodifiableSet(this.oc);
        }
        if (this.od == null || VERSION.SDK_INT < 17) {
            return Collections.emptySet();
        }
        HashSet hashSet = new HashSet();
        for (k kVar : this.od.dC()) {
            if (c(kVar.getParentFragment())) {
                hashSet.add(kVar);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public a dz() {
        return this.oa;
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
        this.oa.onDestroy();
        dE();
    }

    public void onDetach() {
        super.onDetach();
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
        sb.append(dD());
        sb.append("}");
        return sb.toString();
    }
}
