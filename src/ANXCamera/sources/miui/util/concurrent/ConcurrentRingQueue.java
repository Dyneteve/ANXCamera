package miui.util.concurrent;

import java.util.concurrent.atomic.AtomicInteger;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentRingQueue<T> implements Queue<T> {
    private int OF;
    private final boolean OG;
    private final boolean OH;
    private final AtomicInteger OI = new AtomicInteger(0);
    private volatile Node<T> OJ = new Node<>();
    private final AtomicInteger OK = new AtomicInteger(0);
    private volatile Node<T> OL = this.OJ;
    private volatile int ON;

    private static class Node<T> {
        Node<T> OO;
        T element;

        private Node() {
        }
    }

    public ConcurrentRingQueue(int i, boolean z, boolean z2) {
        this.OF = i;
        this.OG = z;
        this.OH = z2;
        Node<T> node = this.OJ;
        for (int i2 = 0; i2 < i; i2++) {
            node.OO = new Node<>();
            node = node.OO;
        }
        node.OO = this.OJ;
    }

    public int clear() {
        while (true) {
            if (this.OI.get() == 0 && this.OI.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.OJ;
        int i = 0;
        while (node != this.OL) {
            node.element = null;
            i++;
            node = node.OO;
        }
        this.OJ = node;
        this.OI.set(0);
        return i;
    }

    public void decreaseCapacity(int i) {
        if (this.OH && i > 0) {
            while (true) {
                if (this.OK.get() != 0 || !this.OK.compareAndSet(0, -1)) {
                    Thread.yield();
                } else {
                    this.OF -= i;
                    this.ON = i;
                    this.OK.set(0);
                    return;
                }
            }
        }
    }

    public T get() {
        while (true) {
            if (this.OI.get() == 0 && this.OI.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.OJ;
        Node<T> node2 = this.OL;
        Node<T> node3 = node;
        T t = null;
        while (t == null && node3 != node2) {
            t = node3.element;
            node3.element = null;
            node3 = node3.OO;
            node2 = this.OL;
        }
        if (t != null) {
            this.OJ = node3;
        }
        this.OI.set(0);
        return t;
    }

    public int getCapacity() {
        int i = this.ON;
        return i > 0 ? this.OF + i : this.OF;
    }

    public void increaseCapacity(int i) {
        if (!this.OG && i > 0) {
            while (true) {
                if (this.OK.get() != 0 || !this.OK.compareAndSet(0, -1)) {
                    Thread.yield();
                } else {
                    this.ON = -i;
                    this.OF += i;
                    this.OK.set(0);
                    return;
                }
            }
        }
    }

    public boolean isEmpty() {
        return this.OL == this.OJ;
    }

    public boolean put(T t) {
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.OK.get() == 0 && this.OK.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.OJ;
        Node<T> node2 = this.OL;
        int i = this.ON;
        boolean z = true;
        if (node2.OO != node) {
            node2.element = t;
            if (node2.OO.OO != node && this.OH && i > 0) {
                node2.OO = node2.OO.OO;
                this.ON = i - 1;
            }
            this.OL = node2.OO;
        } else if (this.OG || i < 0) {
            node2.OO = new Node<>();
            node2.OO.OO = node;
            node2.element = t;
            this.ON = i + 1;
            this.OL = node2.OO;
        } else {
            z = false;
        }
        this.OK.set(0);
        return z;
    }

    public int remove(Predicate<T> predicate) {
        if (predicate == null) {
            return 0;
        }
        while (true) {
            if (this.OI.get() != 0 || !this.OI.compareAndSet(0, -1)) {
                Thread.yield();
            } else {
                try {
                    break;
                } finally {
                    this.OI.set(0);
                }
            }
        }
        int i = 0;
        for (Node<T> node = this.OJ; node != this.OL; node = node.OO) {
            if (predicate.apply(node.element)) {
                node.element = null;
                i++;
            }
        }
        return i;
    }

    public boolean remove(T t) {
        boolean z;
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.OI.get() == 0 && this.OI.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.OJ;
        while (true) {
            if (node == this.OL) {
                z = false;
                break;
            } else if (t.equals(node.element)) {
                node.element = null;
                z = true;
                break;
            } else {
                node = node.OO;
            }
        }
        this.OI.set(0);
        return z;
    }
}
