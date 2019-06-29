package com.arcsoft.avatar.recoder;

import android.opengl.GLES30;
import com.arcsoft.avatar.gl.GLFramebuffer;
import com.arcsoft.avatar.util.CodecLog;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class FrameQueue {
    private static final String a = FrameQueue.class.getSimpleName();
    private FrameItem b = null;
    private FrameItem c = null;
    private List<FrameItem> d = new ArrayList();
    private Queue<FrameItem> e = new LinkedList();
    private boolean f;

    public void addEmptyFrameForConsumer() {
        if (this.c != null) {
            this.d.add(this.c);
            this.c = null;
        }
    }

    public void addFrameForProducer() {
        if (this.b != null) {
            this.e.offer(this.b);
            this.b = null;
        }
    }

    public void deleteSync(FrameItem frameItem) {
        try {
            if (0 != frameItem.a) {
                String str = a;
                StringBuilder sb = new StringBuilder();
                sb.append("deleteSync delete_a_sync : ");
                sb.append(frameItem.a);
                CodecLog.d(str, sb.toString());
                GLES30.glDeleteSync(frameItem.a);
            }
        } catch (Exception e2) {
            e2.printStackTrace();
            String str2 = a;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("deleteSync meet error : ");
            sb2.append(e2.getMessage());
            CodecLog.e(str2, sb2.toString());
        } catch (Throwable th) {
            frameItem.a = 0;
            throw th;
        }
        frameItem.a = 0;
    }

    public FrameItem getFrameForConsumer() {
        if (this.c != null) {
            return this.c;
        }
        if (this.e.isEmpty()) {
            return null;
        }
        this.c = (FrameItem) this.e.poll();
        return this.c;
    }

    public FrameItem getFrameForProducer() {
        if (this.b != null) {
            return this.b;
        }
        if (!this.d.isEmpty()) {
            this.b = (FrameItem) this.d.remove(0);
        } else if (this.e.isEmpty()) {
            return null;
        } else {
            this.b = (FrameItem) this.e.poll();
        }
        return this.b;
    }

    public void init(int i, int i2, int i3, boolean z) {
        unInit();
        for (int i4 = 0; i4 < i; i4++) {
            FrameItem frameItem = new FrameItem();
            frameItem.mIsEmpty = true;
            frameItem.mIsInited = true;
            frameItem.mFrameIndex = i4;
            frameItem.mFramebuffer = new GLFramebuffer();
            frameItem.mFramebuffer.init(i2, i3, z);
            this.d.add(frameItem);
        }
        this.f = true;
    }

    public boolean isIsInited() {
        return this.f;
    }

    public int queueSize() {
        return this.e.size();
    }

    public void unInit() {
        if (!(this.b == null || this.b.mFramebuffer == null)) {
            this.b.mFramebuffer.unInit();
            deleteSync(this.b);
            this.b.mFramebuffer = null;
            this.b = null;
        }
        if (!(this.c == null || this.c.mFramebuffer == null)) {
            this.c.mFramebuffer.unInit();
            deleteSync(this.c);
            this.c.mFramebuffer = null;
            this.c = null;
        }
        if (!this.d.isEmpty()) {
            for (FrameItem frameItem : this.d) {
                if (frameItem.mFramebuffer != null) {
                    frameItem.mFramebuffer.unInit();
                    deleteSync(frameItem);
                    frameItem.mFramebuffer = null;
                }
            }
        }
        this.d.clear();
        while (!this.e.isEmpty()) {
            FrameItem frameItem2 = (FrameItem) this.e.poll();
            if (!(frameItem2 == null || frameItem2.mFramebuffer == null)) {
                frameItem2.mFramebuffer.unInit();
                deleteSync(frameItem2);
                frameItem2.mFramebuffer = null;
            }
        }
        this.e.clear();
        this.f = false;
    }
}
