package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.request.c;
import com.bumptech.glide.util.k;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: RequestTracker */
public class n {
    private static final String TAG = "RequestTracker";
    private final Set<c> np = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> nq = new ArrayList();
    private boolean nr;

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.np.remove(cVar);
        if (!this.nq.remove(cVar) && !remove) {
            z2 = false;
        }
        if (z2) {
            cVar.clear();
            if (z) {
                cVar.recycle();
            }
        }
        return z2;
    }

    public void C() {
        this.nr = true;
        for (c cVar : k.c(this.np)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.nq.add(cVar);
            }
        }
    }

    public void D() {
        this.nr = true;
        for (c cVar : k.c(this.np)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.nq.add(cVar);
            }
        }
    }

    public void F() {
        this.nr = false;
        for (c cVar : k.c(this.np)) {
            if (!cVar.isComplete() && !cVar.isCancelled() && !cVar.isRunning()) {
                cVar.begin();
            }
        }
        this.nq.clear();
    }

    public void a(@NonNull c cVar) {
        this.np.add(cVar);
        if (!this.nr) {
            cVar.begin();
            return;
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Paused, delaying request");
        }
        this.nq.add(cVar);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void addRequest(c cVar) {
        this.np.add(cVar);
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    public void dd() {
        for (c a : k.c(this.np)) {
            a(a, false);
        }
        this.nq.clear();
    }

    public void de() {
        for (c cVar : k.c(this.np)) {
            if (!cVar.isComplete() && !cVar.isCancelled()) {
                cVar.pause();
                if (!this.nr) {
                    cVar.begin();
                } else {
                    this.nq.add(cVar);
                }
            }
        }
    }

    public boolean isPaused() {
        return this.nr;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{numRequests=");
        sb.append(this.np.size());
        sb.append(", isPaused=");
        sb.append(this.nr);
        sb.append("}");
        return sb.toString();
    }
}
