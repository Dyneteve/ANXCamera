package io.reactivex.internal.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import java.util.concurrent.atomic.AtomicInteger;

public final class VolatileSizeArrayList<T> extends AtomicInteger implements List<T>, RandomAccess {
    private static final long serialVersionUID = 3972397474470203923L;
    final ArrayList<T> list;

    public VolatileSizeArrayList() {
        this.list = new ArrayList<>();
    }

    public VolatileSizeArrayList(int i) {
        this.list = new ArrayList<>(i);
    }

    public void add(int i, T t) {
        this.list.add(i, t);
        lazySet(this.list.size());
    }

    public boolean add(T t) {
        boolean add = this.list.add(t);
        lazySet(this.list.size());
        return add;
    }

    public boolean addAll(int i, Collection<? extends T> collection) {
        boolean addAll = this.list.addAll(i, collection);
        lazySet(this.list.size());
        return addAll;
    }

    public boolean addAll(Collection<? extends T> collection) {
        boolean addAll = this.list.addAll(collection);
        lazySet(this.list.size());
        return addAll;
    }

    public void clear() {
        this.list.clear();
        lazySet(0);
    }

    public boolean contains(Object obj) {
        return this.list.contains(obj);
    }

    public boolean containsAll(Collection<?> collection) {
        return this.list.containsAll(collection);
    }

    public boolean equals(Object obj) {
        return obj instanceof VolatileSizeArrayList ? this.list.equals(((VolatileSizeArrayList) obj).list) : this.list.equals(obj);
    }

    public T get(int i) {
        return this.list.get(i);
    }

    public int hashCode() {
        return this.list.hashCode();
    }

    public int indexOf(Object obj) {
        return this.list.indexOf(obj);
    }

    public boolean isEmpty() {
        return get() == 0;
    }

    public Iterator<T> iterator() {
        return this.list.iterator();
    }

    public int lastIndexOf(Object obj) {
        return this.list.lastIndexOf(obj);
    }

    public ListIterator<T> listIterator() {
        return this.list.listIterator();
    }

    public ListIterator<T> listIterator(int i) {
        return this.list.listIterator(i);
    }

    public T remove(int i) {
        T remove = this.list.remove(i);
        lazySet(this.list.size());
        return remove;
    }

    public boolean remove(Object obj) {
        boolean remove = this.list.remove(obj);
        lazySet(this.list.size());
        return remove;
    }

    public boolean removeAll(Collection<?> collection) {
        boolean removeAll = this.list.removeAll(collection);
        lazySet(this.list.size());
        return removeAll;
    }

    public boolean retainAll(Collection<?> collection) {
        boolean retainAll = this.list.retainAll(collection);
        lazySet(this.list.size());
        return retainAll;
    }

    public T set(int i, T t) {
        return this.list.set(i, t);
    }

    public int size() {
        return get();
    }

    public List<T> subList(int i, int i2) {
        return this.list.subList(i, i2);
    }

    public Object[] toArray() {
        return this.list.toArray();
    }

    public <E> E[] toArray(E[] eArr) {
        return this.list.toArray(eArr);
    }

    public String toString() {
        return this.list.toString();
    }
}
