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
    private final Set<c> oq = Collections.newSetFromMap(new WeakHashMap());
    private final List<c> or = new ArrayList();
    private boolean os;

    private boolean a(@Nullable c cVar, boolean z) {
        boolean z2 = true;
        if (cVar == null) {
            return true;
        }
        boolean remove = this.oq.remove(cVar);
        if (!this.or.remove(cVar) && !remove) {
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

    public void a(@NonNull c cVar) {
        this.oq.add(cVar);
        if (!this.os) {
            cVar.begin();
            return;
        }
        if (Log.isLoggable(TAG, 2)) {
            Log.v(TAG, "Paused, delaying request");
        }
        this.or.add(cVar);
    }

    public void ac() {
        this.os = true;
        for (c cVar : k.c(this.oq)) {
            if (cVar.isRunning()) {
                cVar.pause();
                this.or.add(cVar);
            }
        }
    }

    public void ad() {
        this.os = true;
        for (c cVar : k.c(this.oq)) {
            if (cVar.isRunning() || cVar.isComplete()) {
                cVar.pause();
                this.or.add(cVar);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void addRequest(c cVar) {
        this.oq.add(cVar);
    }

    public void af() {
        this.os = false;
        for (c cVar : k.c(this.oq)) {
            if (!cVar.isComplete() && !cVar.isCancelled() && !cVar.isRunning()) {
                cVar.begin();
            }
        }
        this.or.clear();
    }

    public boolean b(@Nullable c cVar) {
        return a(cVar, true);
    }

    public void dF() {
        for (c a : k.c(this.oq)) {
            a(a, false);
        }
        this.or.clear();
    }

    public void dG() {
        for (c cVar : k.c(this.oq)) {
            if (!cVar.isComplete() && !cVar.isCancelled()) {
                cVar.pause();
                if (!this.os) {
                    cVar.begin();
                } else {
                    this.or.add(cVar);
                }
            }
        }
    }

    public boolean isPaused() {
        return this.os;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("{numRequests=");
        sb.append(this.oq.size());
        sb.append(", isPaused=");
        sb.append(this.os);
        sb.append("}");
        return sb.toString();
    }
}
