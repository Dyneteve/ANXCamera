package org.greenrobot.greendao.identityscope;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.concurrent.locks.ReentrantLock;
import org.greenrobot.greendao.internal.LongHashMap;

public class IdentityScopeLong<T> implements IdentityScope<Long, T> {
    private final ReentrantLock lock = new ReentrantLock();
    private final LongHashMap<Reference<T>> map = new LongHashMap<>();

    public void clear() {
        this.lock.lock();
        try {
            this.map.clear();
        } finally {
            this.lock.unlock();
        }
    }

    public boolean detach(Long l, T t) {
        boolean z;
        this.lock.lock();
        try {
            if (get(l) != t || t == null) {
                z = false;
            } else {
                remove(l);
                z = true;
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    public T get(Long l) {
        return get2(l.longValue());
    }

    public T get2(long j) {
        this.lock.lock();
        try {
            Reference reference = (Reference) this.map.get(j);
            if (reference != null) {
                return reference.get();
            }
            return null;
        } finally {
            this.lock.unlock();
        }
    }

    public T get2NoLock(long j) {
        Reference reference = (Reference) this.map.get(j);
        if (reference != null) {
            return reference.get();
        }
        return null;
    }

    public T getNoLock(Long l) {
        return get2NoLock(l.longValue());
    }

    public void lock() {
        this.lock.lock();
    }

    public void put(Long l, T t) {
        put2(l.longValue(), t);
    }

    public void put2(long j, T t) {
        this.lock.lock();
        try {
            this.map.put(j, new WeakReference(t));
        } finally {
            this.lock.unlock();
        }
    }

    public void put2NoLock(long j, T t) {
        this.map.put(j, new WeakReference(t));
    }

    public void putNoLock(Long l, T t) {
        put2NoLock(l.longValue(), t);
    }

    public void remove(Iterable<Long> iterable) {
        this.lock.lock();
        try {
            for (Long longValue : iterable) {
                this.map.remove(longValue.longValue());
            }
        } finally {
            this.lock.unlock();
        }
    }

    public void remove(Long l) {
        this.lock.lock();
        try {
            this.map.remove(l.longValue());
        } finally {
            this.lock.unlock();
        }
    }

    public void reserveRoom(int i) {
        this.map.reserveRoom(i);
    }

    public void unlock() {
        this.lock.unlock();
    }
}
