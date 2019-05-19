package com.bumptech.glide.load.engine.a;

import com.bumptech.glide.util.i;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* compiled from: DiskCacheWriteLocker */
final class c {
    private final Map<String, a> hP = new HashMap();
    private final b hQ = new b();

    /* compiled from: DiskCacheWriteLocker */
    private static class a {
        int hR;
        final Lock lock = new ReentrantLock();

        a() {
        }
    }

    /* compiled from: DiskCacheWriteLocker */
    private static class b {
        private static final int hS = 10;
        private final Queue<a> hT = new ArrayDeque();

        b() {
        }

        /* access modifiers changed from: 0000 */
        public void a(a aVar) {
            synchronized (this.hT) {
                if (this.hT.size() < 10) {
                    this.hT.offer(aVar);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public a bA() {
            a aVar;
            synchronized (this.hT) {
                aVar = (a) this.hT.poll();
            }
            return aVar == null ? new a() : aVar;
        }
    }

    c() {
    }

    /* access modifiers changed from: 0000 */
    public void t(String str) {
        a aVar;
        synchronized (this) {
            aVar = (a) this.hP.get(str);
            if (aVar == null) {
                aVar = this.hQ.bA();
                this.hP.put(str, aVar);
            }
            aVar.hR++;
        }
        aVar.lock.lock();
    }

    /* access modifiers changed from: 0000 */
    public void u(String str) {
        a aVar;
        synchronized (this) {
            aVar = (a) i.checkNotNull(this.hP.get(str));
            if (aVar.hR >= 1) {
                aVar.hR--;
                if (aVar.hR == 0) {
                    a aVar2 = (a) this.hP.remove(str);
                    if (aVar2.equals(aVar)) {
                        this.hQ.a(aVar2);
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Removed the wrong lock, expected to remove: ");
                        sb.append(aVar);
                        sb.append(", but actually removed: ");
                        sb.append(aVar2);
                        sb.append(", safeKey: ");
                        sb.append(str);
                        throw new IllegalStateException(sb.toString());
                    }
                }
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Cannot release a lock that is not held, safeKey: ");
                sb2.append(str);
                sb2.append(", interestedThreads: ");
                sb2.append(aVar.hR);
                throw new IllegalStateException(sb2.toString());
            }
        }
        aVar.lock.unlock();
    }
}
