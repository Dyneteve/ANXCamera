package org.greenrobot.greendao.internal;

import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.Property;

public class SqlUtils {
    private static final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();

    public static StringBuilder appendColumn(StringBuilder sb, String str) {
        sb.append('\"');
        sb.append(str);
        sb.append('\"');
        return sb;
    }

    public static StringBuilder appendColumn(StringBuilder sb, String str, String str2) {
        sb.append(str);
        sb.append(".\"");
        sb.append(str2);
        sb.append('\"');
        return sb;
    }

    public static StringBuilder appendColumns(StringBuilder sb, String str, String[] strArr) {
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            appendColumn(sb, str, strArr[i]);
            if (i < length - 1) {
                sb.append(',');
            }
        }
        return sb;
    }

    public static StringBuilder appendColumns(StringBuilder sb, String[] strArr) {
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            sb.append('\"');
            sb.append(strArr[i]);
            sb.append('\"');
            if (i < length - 1) {
                sb.append(',');
            }
        }
        return sb;
    }

    public static StringBuilder appendColumnsEqValue(StringBuilder sb, String str, String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            appendColumn(sb, str, strArr[i]).append("=?");
            if (i < strArr.length - 1) {
                sb.append(',');
            }
        }
        return sb;
    }

    public static StringBuilder appendColumnsEqualPlaceholders(StringBuilder sb, String[] strArr) {
        for (int i = 0; i < strArr.length; i++) {
            appendColumn(sb, strArr[i]).append("=?");
            if (i < strArr.length - 1) {
                sb.append(',');
            }
        }
        return sb;
    }

    public static StringBuilder appendPlaceholders(StringBuilder sb, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 < i - 1) {
                sb.append("?,");
            } else {
                sb.append('?');
            }
        }
        return sb;
    }

    public static StringBuilder appendProperty(StringBuilder sb, String str, Property property) {
        if (str != null) {
            sb.append(str);
            sb.append('.');
        }
        sb.append('\"');
        sb.append(property.columnName);
        sb.append('\"');
        return sb;
    }

    public static String createSqlCount(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT COUNT(*) FROM \"");
        sb.append(str);
        sb.append('\"');
        return sb.toString();
    }

    public static String createSqlDelete(String str, String[] strArr) {
        StringBuilder sb = new StringBuilder();
        sb.append('\"');
        sb.append(str);
        sb.append('\"');
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder("DELETE FROM ");
        sb3.append(sb2);
        if (strArr != null && strArr.length > 0) {
            sb3.append(" WHERE ");
            appendColumnsEqValue(sb3, sb2, strArr);
        }
        return sb3.toString();
    }

    public static String createSqlInsert(String str, String str2, String[] strArr) {
        StringBuilder sb = new StringBuilder(str);
        sb.append('\"');
        sb.append(str2);
        sb.append('\"');
        sb.append(" (");
        appendColumns(sb, strArr);
        sb.append(") VALUES (");
        appendPlaceholders(sb, strArr.length);
        sb.append(')');
        return sb.toString();
    }

    public static String createSqlSelect(String str, String str2, String[] strArr, boolean z) {
        if (str2 == null || str2.length() < 0) {
            throw new DaoException("Table alias required");
        }
        StringBuilder sb = new StringBuilder(z ? "SELECT DISTINCT " : "SELECT ");
        appendColumns(sb, str2, strArr).append(" FROM ");
        sb.append('\"');
        sb.append(str);
        sb.append('\"');
        sb.append(' ');
        sb.append(str2);
        sb.append(' ');
        return sb.toString();
    }

    public static String createSqlSelectCountStar(String str, String str2) {
        StringBuilder sb = new StringBuilder("SELECT COUNT(*) FROM ");
        sb.append('\"');
        sb.append(str);
        sb.append('\"');
        sb.append(' ');
        if (str2 != null) {
            sb.append(str2);
            sb.append(' ');
        }
        return sb.toString();
    }

    public static String createSqlUpdate(String str, String[] strArr, String[] strArr2) {
        StringBuilder sb = new StringBuilder();
        sb.append('\"');
        sb.append(str);
        sb.append('\"');
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder("UPDATE ");
        sb3.append(sb2);
        sb3.append(" SET ");
        appendColumnsEqualPlaceholders(sb3, strArr);
        sb3.append(" WHERE ");
        appendColumnsEqValue(sb3, sb2, strArr2);
        return sb3.toString();
    }

    public static String escapeBlobArgument(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("X'");
        sb.append(toHex(bArr));
        sb.append('\'');
        return sb.toString();
    }

    public static String toHex(byte[] bArr) {
        char[] cArr = new char[(bArr.length * 2)];
        for (int i = 0; i < bArr.length; i++) {
            byte b = bArr[i] & -1;
            int i2 = i * 2;
            cArr[i2] = HEX_ARRAY[b >>> 4];
            cArr[i2 + 1] = HEX_ARRAY[b & 15];
        }
        return new String(cArr);
    }
}
