package com.android.volley.toolbox;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

/* renamed from: com.android.volley.toolbox.ByteArrayPool reason: case insensitive filesystem */
public class C0036ByteArrayPool {
    protected static final Comparator<byte[]> BUF_COMPARATOR = new Comparator<byte[]>() {
        public int compare(byte[] lhs, byte[] rhs) {
            return lhs.length - rhs.length;
        }
    };
    private List<byte[]> mBuffersByLastUse = new LinkedList();
    private List<byte[]> mBuffersBySize = new ArrayList(64);
    private int mCurrentSize = 0;
    private final int mSizeLimit;

    public C0036ByteArrayPool(int sizeLimit) {
        this.mSizeLimit = sizeLimit;
    }

    public synchronized byte[] getBuf(int len) {
        for (int i = 0; i < this.mBuffersBySize.size(); i++) {
            byte[] buf = (byte[]) this.mBuffersBySize.get(i);
            if (buf.length >= len) {
                this.mCurrentSize -= buf.length;
                this.mBuffersBySize.remove(i);
                this.mBuffersByLastUse.remove(buf);
                return buf;
            }
        }
        return new byte[len];
    }

    /* Debug info: failed to restart local var, previous not found, register: 3 */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x002f, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void returnBuf(byte[] buf) {
        if (buf != null) {
            if (buf.length <= this.mSizeLimit) {
                this.mBuffersByLastUse.add(buf);
                int pos = Collections.binarySearch(this.mBuffersBySize, buf, BUF_COMPARATOR);
                if (pos < 0) {
                    pos = (-pos) - 1;
                }
                this.mBuffersBySize.add(pos, buf);
                this.mCurrentSize += buf.length;
                trim();
            }
        }
    }

    private synchronized void trim() {
        while (this.mCurrentSize > this.mSizeLimit) {
            byte[] buf = (byte[]) this.mBuffersByLastUse.remove(0);
            this.mBuffersBySize.remove(buf);
            this.mCurrentSize -= buf.length;
        }
    }
}
