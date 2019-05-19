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
    private final Set<c> no = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> np = new ArrayList();
    private boolean nq;

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.no.remove(cVar);
        if (!this.np.remove(cVar) && !remove) {
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
        this.nq = true;
        for (c cVar : k.c(this.no)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.np.add(cVar);
            }
        }
    }

    public void D() {
        this.nq = true;
        for (c cVar : k.c(this.no)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.np.add(cVar);
            }
        }
    }

    public void F() {
        this.nq = false;
        for (c cVar : k.c(this.no)) {
            if (!cVar.isComplete() && !cVar.isCancelled() && !cVar.isRunning()) {
                cVar.begin();
            }
        }
        this.np.clear();
    }

    public void a(@NonNull c cVar) {
        this.no.add(cVar);
        if (!this.nq) {
            cVar.begin();
            return;
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Paused, delaying request");
        }
        this.np.add(cVar);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void addRequest(c cVar) {
        this.no.add(cVar);
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    public void dd() {
        for (c a : k.c(this.no)) {
            a(a, false);
        }
        this.np.clear();
    }

    public void de() {
        for (c cVar : k.c(this.no)) {
            if (!cVar.isComplete() && !cVar.isCancelled()) {
                cVar.pause();
                if (!this.nq) {
                    cVar.begin();
                } else {
                    this.np.add(cVar);
                }
            }
        }
    }

    public boolean isPaused() {
        return this.nq;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{numRequests=");
        sb.append(this.no.size());
        sb.append(", isPaused=");
        sb.append(this.nq);
        sb.append("}");
        return sb.toString();
    }
}
