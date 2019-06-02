package com.google.zxing;

import com.google.zxing.common.detector.MathUtils;

public class ResultPoint {
    private final float x;
    private final float y;

    public ResultPoint(float f, float f2) {
        this.x = f;
        this.y = f2;
    }

    private static float crossProductZ(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3) {
        float f = resultPoint2.x;
        float f2 = resultPoint2.y;
        return ((resultPoint3.x - f) * (resultPoint.y - f2)) - ((resultPoint3.y - f2) * (resultPoint.x - f));
    }

    public static float distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        return MathUtils.distance(resultPoint.x, resultPoint.y, resultPoint2.x, resultPoint2.y);
    }

    public static void orderBestPatterns(ResultPoint[] resultPointArr) {
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        float distance = distance(resultPointArr[0], resultPointArr[1]);
        float distance2 = distance(resultPointArr[1], resultPointArr[2]);
        float distance3 = distance(resultPointArr[0], resultPointArr[2]);
        if (distance2 >= distance && distance2 >= distance3) {
            resultPoint3 = resultPointArr[0];
            resultPoint2 = resultPointArr[1];
            resultPoint = resultPointArr[2];
        } else if (distance3 < distance2 || distance3 < distance) {
            resultPoint3 = resultPointArr[2];
            resultPoint2 = resultPointArr[0];
            resultPoint = resultPointArr[1];
        } else {
            resultPoint3 = resultPointArr[1];
            resultPoint2 = resultPointArr[0];
            resultPoint = resultPointArr[2];
        }
        if (crossProductZ(resultPoint2, resultPoint3, resultPoint) < 0.0f) {
            ResultPoint resultPoint4 = resultPoint2;
            resultPoint2 = resultPoint;
            resultPoint = resultPoint4;
        }
        resultPointArr[0] = resultPoint2;
        resultPointArr[1] = resultPoint3;
        resultPointArr[2] = resultPoint;
    }

    public final boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof ResultPoint)) {
            return false;
        }
        ResultPoint resultPoint = (ResultPoint) obj;
        if (this.x == resultPoint.x && this.y == resultPoint.y) {
            z = true;
        }
        return z;
    }

    public final float getX() {
        return this.x;
    }

    public final float getY() {
        return this.y;
    }

    public final int hashCode() {
        return (31 * Float.floatToIntBits(this.x)) + Float.floatToIntBits(this.y);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(25);
        sb.append('(');
        sb.append(this.x);
        sb.append(',');
        sb.append(this.y);
        sb.append(')');
        return sb.toString();
    }
}
