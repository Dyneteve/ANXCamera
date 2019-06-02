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
    private final Set<c> nq = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> nr = new ArrayList();
    private boolean ns;

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.nq.remove(cVar);
        if (!this.nr.remove(cVar) && !remove) {
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
        this.ns = true;
        for (c cVar : k.c(this.nq)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.nr.add(cVar);
            }
        }
    }

    public void D() {
        this.ns = true;
        for (c cVar : k.c(this.nq)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.nr.add(cVar);
            }
        }
    }

    public void F() {
        this.ns = false;
        for (c cVar : k.c(this.nq)) {
            if (!cVar.isComplete() && !cVar.isCancelled() && !cVar.isRunning()) {
                cVar.begin();
            }
        }
        this.nr.clear();
    }

    public void a(@NonNull c cVar) {
        this.nq.add(cVar);
        if (!this.ns) {
            cVar.begin();
            return;
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Paused, delaying request");
        }
        this.nr.add(cVar);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void addRequest(c cVar) {
        this.nq.add(cVar);
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    public void dd() {
        for (c a : k.c(this.nq)) {
            a(a, false);
        }
        this.nr.clear();
    }

    public void de() {
        for (c cVar : k.c(this.nq)) {
            if (!cVar.isComplete() && !cVar.isCancelled()) {
                cVar.pause();
                if (!this.ns) {
                    cVar.begin();
                } else {
                    this.nr.add(cVar);
                }
            }
        }
    }

    public boolean isPaused() {
        return this.ns;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{numRequests=");
        sb.append(this.nq.size());
        sb.append(", isPaused=");
        sb.append(this.ns);
        sb.append("}");
        return sb.toString();
    }
}
