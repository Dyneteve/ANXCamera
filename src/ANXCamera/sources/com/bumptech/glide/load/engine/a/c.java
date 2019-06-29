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
    private final Map<String, a> iZ = new HashMap();
    private final b ja = new b();

    /* compiled from: DiskCacheWriteLocker */
    private static class a {
        int jb;
        final Lock lock = new ReentrantLock();

        a() {
        }
    }

    /* compiled from: DiskCacheWriteLocker */
    private static class b {
        private static final int jc = 10;
        private final Queue<a> jd = new ArrayDeque();

        b() {
        }

        /* access modifiers changed from: 0000 */
        public void a(a aVar) {
            synchronized (this.jd) {
                if (this.jd.size() < 10) {
                    this.jd.offer(aVar);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public a cb() {
            a aVar;
            synchronized (this.jd) {
                aVar = (a) this.jd.poll();
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
            aVar = (a) this.iZ.get(str);
            if (aVar == null) {
                aVar = this.ja.cb();
                this.iZ.put(str, aVar);
            }
            aVar.jb++;
        }
        aVar.lock.lock();
    }

    /* access modifiers changed from: 0000 */
    public void u(String str) {
        a aVar;
        synchronized (this) {
            aVar = (a) i.checkNotNull(this.iZ.get(str));
            if (aVar.jb >= 1) {
                aVar.jb--;
                if (aVar.jb == 0) {
                    a aVar2 = (a) this.iZ.remove(str);
                    if (aVar2.equals(aVar)) {
                        this.ja.a(aVar2);
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
                sb2.append(aVar.jb);
                throw new IllegalStateException(sb2.toString());
            }
        }
        aVar.lock.unlock();
    }
}
