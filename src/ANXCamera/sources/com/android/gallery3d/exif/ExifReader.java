package com.android.gallery3d.exif;

import com.android.camera.log.Log;
import java.io.IOException;
import java.io.InputStream;

class ExifReader {
    private static final String TAG = "ExifReader";
    private final ExifInterface mInterface;

    ExifReader(ExifInterface exifInterface) {
        this.mInterface = exifInterface;
    }

    /* access modifiers changed from: protected */
    public ExifData read(InputStream inputStream) throws ExifInvalidFormatException, IOException {
        ExifParser parse = ExifParser.parse(inputStream, this.mInterface);
        ExifData exifData = new ExifData(parse.getByteOrder());
        for (int next = parse.next(); next != 5; next = parse.next()) {
            switch (next) {
                case 0:
                    exifData.addIfdData(new IfdData(parse.getCurrentIfd()));
                    break;
                case 1:
                    ExifTag tag = parse.getTag();
                    if (tag.hasValue()) {
                        exifData.getIfdData(tag.getIfd()).setTag(tag);
                        break;
                    } else {
                        parse.registerForTagValue(tag);
                        break;
                    }
                case 2:
                    ExifTag tag2 = parse.getTag();
                    if (tag2.getDataType() == 7) {
                        parse.readFullTagValue(tag2);
                    }
                    exifData.getIfdData(tag2.getIfd()).setTag(tag2);
                    break;
                case 3:
                    int compressedImageSize = parse.getCompressedImageSize();
                    if (compressedImageSize <= 0) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("compressedImageSize=");
                        sb.append(compressedImageSize);
                        Log.d(str, sb.toString());
                        break;
                    } else {
                        byte[] bArr = new byte[compressedImageSize];
                        if (bArr.length != parse.read(bArr)) {
                            Log.w(TAG, "Failed to read the compressed thumbnail");
                            break;
                        } else {
                            exifData.setCompressedThumbnail(bArr);
                            break;
                        }
                    }
                case 4:
                    byte[] bArr2 = new byte[parse.getStripSize()];
                    if (bArr2.length != parse.read(bArr2)) {
                        Log.w(TAG, "Failed to read the strip bytes");
                        break;
                    } else {
                        exifData.setStripBytes(parse.getStripIndex(), bArr2);
                        break;
                    }
            }
        }
        return exifData;
    }
}
