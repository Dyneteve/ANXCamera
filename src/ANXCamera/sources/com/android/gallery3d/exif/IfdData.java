package com.android.gallery3d.exif;

import java.util.HashMap;
import java.util.Map;

class IfdData {
    private static final int[] sIfds = {0, 1, 2, 3, 4};
    private final Map<Short, ExifTag> mExifTags = new HashMap();
    private final int mIfdId;
    private int mOffsetToNextIfd = 0;

    IfdData(int i) {
        this.mIfdId = i;
    }

    protected static int[] getIfds() {
        return sIfds;
    }

    /* access modifiers changed from: protected */
    public boolean checkCollision(short s) {
        return this.mExifTags.get(Short.valueOf(s)) != null;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof IfdData)) {
            IfdData ifdData = (IfdData) obj;
            if (ifdData.getId() == this.mIfdId && ifdData.getTagCount() == getTagCount()) {
                ExifTag[] allTags = ifdData.getAllTags();
                int length = allTags.length;
                for (int i = 0; i < length; i++) {
                    ExifTag exifTag = allTags[i];
                    if (!ExifInterface.isOffsetTag(exifTag.getTagId()) && !exifTag.equals((ExifTag) this.mExifTags.get(Short.valueOf(exifTag.getTagId())))) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public ExifTag[] getAllTags() {
        return (ExifTag[]) this.mExifTags.values().toArray(new ExifTag[this.mExifTags.size()]);
    }

    /* access modifiers changed from: protected */
    public int getId() {
        return this.mIfdId;
    }

    /* access modifiers changed from: protected */
    public int getOffsetToNextIfd() {
        return this.mOffsetToNextIfd;
    }

    /* access modifiers changed from: protected */
    public ExifTag getTag(short s) {
        return (ExifTag) this.mExifTags.get(Short.valueOf(s));
    }

    /* access modifiers changed from: protected */
    public int getTagCount() {
        return this.mExifTags.size();
    }

    /* access modifiers changed from: protected */
    public void removeTag(short s) {
        this.mExifTags.remove(Short.valueOf(s));
    }

    /* access modifiers changed from: protected */
    public void setOffsetToNextIfd(int i) {
        this.mOffsetToNextIfd = i;
    }

    /* access modifiers changed from: protected */
    public ExifTag setTag(ExifTag exifTag) {
        exifTag.setIfd(this.mIfdId);
        return (ExifTag) this.mExifTags.put(Short.valueOf(exifTag.getTagId()), exifTag);
    }
}
