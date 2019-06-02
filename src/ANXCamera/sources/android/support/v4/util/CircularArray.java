package android.support.v4.util;

public final class CircularArray<E> {
    private int mCapacityBitmask;
    private E[] mElements;
    private int mHead;
    private int mTail;

    public CircularArray() {
        this(8);
    }

    public CircularArray(int i) {
        if (i > 0) {
            int i2 = i;
            if (Integer.bitCount(i) != 1) {
                i2 = 1 << (Integer.highestOneBit(i) + 1);
            }
            this.mCapacityBitmask = i2 - 1;
            this.mElements = (Object[]) new Object[i2];
            return;
        }
        throw new IllegalArgumentException("capacity must be positive");
    }

    private void doubleCapacity() {
        int length = this.mElements.length;
        int i = length - this.mHead;
        int i2 = length << 1;
        if (i2 >= 0) {
            Object[] objArr = new Object[i2];
            System.arraycopy(this.mElements, this.mHead, objArr, 0, i);
            System.arraycopy(this.mElements, 0, objArr, i, this.mHead);
            this.mElements = objArr;
            this.mHead = 0;
            this.mTail = length;
            this.mCapacityBitmask = i2 - 1;
            return;
        }
        throw new RuntimeException("Max array capacity exceeded");
    }

    public void addFirst(E e) {
        this.mHead = (this.mHead - 1) & this.mCapacityBitmask;
        this.mElements[this.mHead] = e;
        if (this.mHead == this.mTail) {
            doubleCapacity();
        }
    }

    public void addLast(E e) {
        this.mElements[this.mTail] = e;
        this.mTail = (this.mTail + 1) & this.mCapacityBitmask;
        if (this.mTail == this.mHead) {
            doubleCapacity();
        }
    }

    public void clear() {
        removeFromStart(size());
    }

    public E get(int i) {
        if (i >= 0 && i < size()) {
            return this.mElements[(this.mHead + i) & this.mCapacityBitmask];
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public E getFirst() {
        if (this.mHead != this.mTail) {
            return this.mElements[this.mHead];
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public E getLast() {
        if (this.mHead != this.mTail) {
            return this.mElements[(this.mTail - 1) & this.mCapacityBitmask];
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public boolean isEmpty() {
        return this.mHead == this.mTail;
    }

    public E popFirst() {
        if (this.mHead != this.mTail) {
            E e = this.mElements[this.mHead];
            this.mElements[this.mHead] = null;
            this.mHead = (this.mHead + 1) & this.mCapacityBitmask;
            return e;
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public E popLast() {
        if (this.mHead != this.mTail) {
            int i = (this.mTail - 1) & this.mCapacityBitmask;
            E e = this.mElements[i];
            this.mElements[i] = null;
            this.mTail = i;
            return e;
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    public void removeFromEnd(int i) {
        if (i > 0) {
            if (i <= size()) {
                int i2 = 0;
                if (i < this.mTail) {
                    i2 = this.mTail - i;
                }
                for (int i3 = i2; i3 < this.mTail; i3++) {
                    this.mElements[i3] = null;
                }
                int i4 = this.mTail - i2;
                int i5 = i - i4;
                this.mTail -= i4;
                if (i5 > 0) {
                    this.mTail = this.mElements.length;
                    int i6 = this.mTail - i5;
                    for (int i7 = i6; i7 < this.mTail; i7++) {
                        this.mElements[i7] = null;
                    }
                    this.mTail = i6;
                }
                return;
            }
            throw new ArrayIndexOutOfBoundsException();
        }
    }

    public void removeFromStart(int i) {
        if (i > 0) {
            if (i <= size()) {
                int length = this.mElements.length;
                if (i < length - this.mHead) {
                    length = this.mHead + i;
                }
                for (int i2 = this.mHead; i2 < length; i2++) {
                    this.mElements[i2] = null;
                }
                int i3 = length - this.mHead;
                int i4 = i - i3;
                this.mHead = (this.mHead + i3) & this.mCapacityBitmask;
                if (i4 > 0) {
                    for (int i5 = 0; i5 < i4; i5++) {
                        this.mElements[i5] = null;
                    }
                    this.mHead = i4;
                }
                return;
            }
            throw new ArrayIndexOutOfBoundsException();
        }
    }

    public int size() {
        return (this.mTail - this.mHead) & this.mCapacityBitmask;
    }
}
