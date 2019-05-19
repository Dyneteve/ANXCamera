package miui.util.concurrent;

import java.util.concurrent.atomic.AtomicInteger;
import miui.util.concurrent.Queue.Predicate;

public class ConcurrentRingQueue<T> implements Queue<T> {
    private int Mk;
    private final boolean Ml;
    private final boolean Mm;
    private final AtomicInteger Mn = new AtomicInteger(0);
    private volatile Node<T> Mo = new Node<>();
    private final AtomicInteger Mp = new AtomicInteger(0);
    private volatile Node<T> Mq = this.Mo;
    private volatile int Mr;

    private static class Node<T> {
        Node<T> Ms;
        T element;

        private Node() {
        }
    }

    public ConcurrentRingQueue(int i, boolean z, boolean z2) {
        this.Mk = i;
        this.Ml = z;
        this.Mm = z2;
        Node<T> node = this.Mo;
        for (int i2 = 0; i2 < i; i2++) {
            node.Ms = new Node<>();
            node = node.Ms;
        }
        node.Ms = this.Mo;
    }

    public boolean put(T t) {
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.Mp.get() == 0 && this.Mp.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.Mo;
        Node<T> node2 = this.Mq;
        int i = this.Mr;
        boolean z = true;
        if (node2.Ms != node) {
            node2.element = t;
            if (node2.Ms.Ms != node && this.Mm && i > 0) {
                node2.Ms = node2.Ms.Ms;
                this.Mr = i - 1;
            }
            this.Mq = node2.Ms;
        } else if (this.Ml || i < 0) {
            node2.Ms = new Node<>();
            node2.Ms.Ms = node;
            node2.element = t;
            this.Mr = i + 1;
            this.Mq = node2.Ms;
        } else {
            z = false;
        }
        this.Mp.set(0);
        return z;
    }

    public T get() {
        while (true) {
            if (this.Mn.get() == 0 && this.Mn.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.Mo;
        Node<T> node2 = this.Mq;
        Node<T> node3 = node;
        T t = null;
        while (t == null && node3 != node2) {
            t = node3.element;
            node3.element = null;
            node3 = node3.Ms;
            node2 = this.Mq;
        }
        if (t != null) {
            this.Mo = node3;
        }
        this.Mn.set(0);
        return t;
    }

    public boolean remove(T t) {
        boolean z;
        if (t == null) {
            return false;
        }
        while (true) {
            if (this.Mn.get() == 0 && this.Mn.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.Mo;
        while (true) {
            if (node == this.Mq) {
                z = false;
                break;
            } else if (t.equals(node.element)) {
                node.element = null;
                z = true;
                break;
            } else {
                node = node.Ms;
            }
        }
        this.Mn.set(0);
        return z;
    }

    public int remove(Predicate<T> predicate) {
        if (predicate == null) {
            return 0;
        }
        while (true) {
            if (this.Mn.get() != 0 || !this.Mn.compareAndSet(0, -1)) {
                Thread.yield();
            } else {
                try {
                    break;
                } finally {
                    this.Mn.set(0);
                }
            }
        }
        int i = 0;
        for (Node<T> node = this.Mo; node != this.Mq; node = node.Ms) {
            if (predicate.apply(node.element)) {
                node.element = null;
                i++;
            }
        }
        return i;
    }

    public int clear() {
        while (true) {
            if (this.Mn.get() == 0 && this.Mn.compareAndSet(0, -1)) {
                break;
            }
            Thread.yield();
        }
        Node<T> node = this.Mo;
        int i = 0;
        while (node != this.Mq) {
            node.element = null;
            i++;
            node = node.Ms;
        }
        this.Mo = node;
        this.Mn.set(0);
        return i;
    }

    public boolean isEmpty() {
        return this.Mq == this.Mo;
    }

    public int getCapacity() {
        int i = this.Mr;
        return i > 0 ? this.Mk + i : this.Mk;
    }

    public void increaseCapacity(int i) {
        if (!this.Ml && i > 0) {
            while (true) {
                if (this.Mp.get() != 0 || !this.Mp.compareAndSet(0, -1)) {
                    Thread.yield();
                } else {
                    this.Mr = -i;
                    this.Mk += i;
                    this.Mp.set(0);
                    return;
                }
            }
        }
    }

    public void decreaseCapacity(int i) {
        if (this.Mm && i > 0) {
            while (true) {
                if (this.Mp.get() != 0 || !this.Mp.compareAndSet(0, -1)) {
                    Thread.yield();
                } else {
                    this.Mk -= i;
                    this.Mr = i;
                    this.Mp.set(0);
                    return;
                }
            }
        }
    }
}
