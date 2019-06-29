package com.google.zxing.multi;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import java.util.Map;

public final class ByQuadrantReader implements Reader {
    private final Reader delegate;

    public ByQuadrantReader(Reader reader) {
        this.delegate = reader;
    }

    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, ChecksumException, FormatException {
        return decode(binaryBitmap, null);
    }

    public Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        int width = binaryBitmap.getWidth() / 2;
        int height = binaryBitmap.getHeight() / 2;
        try {
            return this.delegate.decode(binaryBitmap.crop(0, 0, width, height), map);
        } catch (NotFoundException e) {
            try {
                return this.delegate.decode(binaryBitmap.crop(width, 0, width, height), map);
            } catch (NotFoundException e2) {
                try {
                    return this.delegate.decode(binaryBitmap.crop(0, height, width, height), map);
                } catch (NotFoundException e3) {
                    try {
                        return this.delegate.decode(binaryBitmap.crop(width, height, width, height), map);
                    } catch (NotFoundException e4) {
                        return this.delegate.decode(binaryBitmap.crop(width / 2, height / 2, width, height), map);
                    }
                }
            }
        }
    }

    public void reset() {
        this.delegate.reset();
    }
}
