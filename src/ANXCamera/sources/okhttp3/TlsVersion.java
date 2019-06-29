package okhttp3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public enum TlsVersion {
    TLS_1_3("TLSv1.3"),
    TLS_1_2("TLSv1.2"),
    TLS_1_1("TLSv1.1"),
    TLS_1_0("TLSv1"),
    SSL_3_0("SSLv3");
    
    final String javaName;

    private TlsVersion(String str) {
        this.javaName = str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0062  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0065  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0068  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x006b  */
    public static TlsVersion forJavaName(String str) {
        char c;
        int hashCode = str.hashCode();
        if (hashCode == 79201641) {
            if (str.equals("SSLv3")) {
                c = 4;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                }
            }
        } else if (hashCode != 79923350) {
            switch (hashCode) {
                case -503070503:
                    if (str.equals("TLSv1.1")) {
                        c = 2;
                        break;
                    }
                case -503070502:
                    if (str.equals("TLSv1.2")) {
                        c = 1;
                        break;
                    }
                case -503070501:
                    if (str.equals("TLSv1.3")) {
                        c = 0;
                        break;
                    }
            }
        } else if (str.equals("TLSv1")) {
            c = 3;
            switch (c) {
                case 0:
                    return TLS_1_3;
                case 1:
                    return TLS_1_2;
                case 2:
                    return TLS_1_1;
                case 3:
                    return TLS_1_0;
                case 4:
                    return SSL_3_0;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unexpected TLS version: ");
                    sb.append(str);
                    throw new IllegalArgumentException(sb.toString());
            }
        }
        c = 65535;
        switch (c) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
        }
    }

    static List<TlsVersion> forJavaNames(String... strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String forJavaName : strArr) {
            arrayList.add(forJavaName(forJavaName));
        }
        return Collections.unmodifiableList(arrayList);
    }

    public String javaName() {
        return this.javaName;
    }
}
