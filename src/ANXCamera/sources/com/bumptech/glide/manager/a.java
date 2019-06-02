package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: ActivityFragmentLifecycle */
class a implements h {
    private final Set<i> mS = Collections.newSetFromMap(new WeakHashMap());
    private boolean mT;
    private boolean mn;

    a() {
    }

    public void a(@NonNull i iVar) {
        this.mS.add(iVar);
        if (this.mT) {
            iVar.onDestroy();
        } else if (this.mn) {
            iVar.onStart();
        } else {
            iVar.onStop();
        }
    }

    public void b(@NonNull i iVar) {
        this.mS.remove(iVar);
    }

    /* access modifiers changed from: 0000 */
    public void onDestroy() {
        this.mT = true;
        for (i onDestroy : k.c(this.mS)) {
            onDestroy.onDestroy();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStart() {
        this.mn = true;
        for (i onStart : k.c(this.mS)) {
            onStart.onStart();
        }
    }

    /* access modifiers changed from: 0000 */
    public void onStop() {
        this.mn = false;
        for (i onStop : k.c(this.mS)) {
            onStop.onStop();
        }
    }
}
