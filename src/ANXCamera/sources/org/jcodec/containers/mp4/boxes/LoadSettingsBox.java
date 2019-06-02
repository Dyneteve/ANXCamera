package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class LoadSettingsBox extends Box {
    private int defaultHints;
    private int preloadDuration;
    private int preloadFlags;
    private int preloadStartTime;

    public LoadSettingsBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "load";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(this.preloadStartTime);
        byteBuffer.putInt(this.preloadDuration);
        byteBuffer.putInt(this.preloadFlags);
        byteBuffer.putInt(this.defaultHints);
    }

    public int estimateSize() {
        return 24;
    }

    public int getDefaultHints() {
        return this.defaultHints;
    }

    public int getPreloadDuration() {
        return this.preloadDuration;
    }

    public int getPreloadFlags() {
        return this.preloadFlags;
    }

    public int getPreloadStartTime() {
        return this.preloadStartTime;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.preloadStartTime = byteBuffer.getInt();
        this.preloadDuration = byteBuffer.getInt();
        this.preloadFlags = byteBuffer.getInt();
        this.defaultHints = byteBuffer.getInt();
    }
}
