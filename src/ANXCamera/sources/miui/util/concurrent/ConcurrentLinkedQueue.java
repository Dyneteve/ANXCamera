package miui.util.concurrent;

import java.util.Iterator;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentLinkedQueue<T> implements Queue<T> {
    private final java.util.concurrent.ConcurrentLinkedQueue<T> Mj = new java.util.concurrent.ConcurrentLinkedQueue<>();

    public boolean put(T t) {
        return this.Mj.offer(t);
    }

    public T get() {
        return this.Mj.poll();
    }

    public boolean remove(T t) {
        return this.Mj.remove(t);
    }

    public int remove(Predicate<T> predicate) {
        Iterator it = this.Mj.iterator();
        int i = 0;
        while (it.hasNext()) {
            if (predicate.apply(it.next())) {
                it.remove();
                i++;
            }
        }
        return i;
    }

    public int clear() {
        int size = this.Mj.size();
        this.Mj.clear();
        return size;
    }

    public boolean isEmpty() {
        return this.Mj.isEmpty();
    }

    public int getCapacity() {
        return -1;
    }
}
