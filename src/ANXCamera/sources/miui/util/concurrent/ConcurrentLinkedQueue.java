package miui.util.concurrent;

import java.util.Iterator;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentLinkedQueue<T> implements Queue<T> {
    private final java.util.concurrent.ConcurrentLinkedQueue<T> OE = new java.util.concurrent.ConcurrentLinkedQueue<>();

    public int clear() {
        int size = this.OE.size();
        this.OE.clear();
        return size;
    }

    public T get() {
        return this.OE.poll();
    }

    public int getCapacity() {
        return -1;
    }

    public boolean isEmpty() {
        return this.OE.isEmpty();
    }

    public boolean put(T t) {
        return this.OE.offer(t);
    }

    public int remove(Predicate<T> predicate) {
        Iterator it = this.OE.iterator();
        int i = 0;
        while (it.hasNext()) {
            if (predicate.apply(it.next())) {
                it.remove();
                i++;
            }
        }
        return i;
    }

    public boolean remove(T t) {
        return this.OE.remove(t);
    }
}
