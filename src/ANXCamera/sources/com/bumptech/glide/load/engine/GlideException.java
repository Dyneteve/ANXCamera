package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class GlideException extends Exception {
    private static final StackTraceElement[] gK = new StackTraceElement[0];
    private static final long serialVersionUID = 1;
    private final List<Throwable> causes;
    private Class<?> dataClass;
    private DataSource dataSource;
    private String detailMessage;
    private c key;

    private static final class a implements Appendable {
        private static final String INDENT = "  ";
        private static final String gL = "";
        private final Appendable gM;
        private boolean gN = true;

        a(Appendable appendable) {
            this.gM = appendable;
        }

        @NonNull
        private CharSequence a(@Nullable CharSequence charSequence) {
            return charSequence == null ? "" : charSequence;
        }

        public Appendable append(char c) throws IOException {
            boolean z = false;
            if (this.gN) {
                this.gN = false;
                this.gM.append(INDENT);
            }
            if (c == 10) {
                z = true;
            }
            this.gN = z;
            this.gM.append(c);
            return this;
        }

        public Appendable append(@Nullable CharSequence charSequence) throws IOException {
            CharSequence a = a(charSequence);
            return append(a, 0, a.length());
        }

        public Appendable append(@Nullable CharSequence charSequence, int i, int i2) throws IOException {
            CharSequence a = a(charSequence);
            boolean z = false;
            if (this.gN) {
                this.gN = false;
                this.gM.append(INDENT);
            }
            if (a.length() > 0 && a.charAt(i2 - 1) == 10) {
                z = true;
            }
            this.gN = z;
            this.gM.append(a, i, i2);
            return this;
        }
    }

    public GlideException(String str) {
        this(str, Collections.emptyList());
    }

    public GlideException(String str, Throwable th) {
        this(str, Collections.singletonList(th));
    }

    public GlideException(String str, List<Throwable> list) {
        this.detailMessage = str;
        setStackTrace(gK);
        this.causes = list;
    }

    private void a(Appendable appendable) {
        a((Throwable) this, appendable);
        a(bg(), (Appendable) new a(appendable));
    }

    private static void a(Throwable th, Appendable appendable) {
        try {
            appendable.append(th.getClass().toString()).append(": ").append(th.getMessage()).append(10);
        } catch (IOException e) {
            throw new RuntimeException(th);
        }
    }

    private void a(Throwable th, List<Throwable> list) {
        if (th instanceof GlideException) {
            for (Throwable a2 : ((GlideException) th).bg()) {
                a(a2, list);
            }
            return;
        }
        list.add(th);
    }

    private static void a(List<Throwable> list, Appendable appendable) {
        try {
            b(list, appendable);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static void b(List<Throwable> list, Appendable appendable) throws IOException {
        int size = list.size();
        int i = 0;
        while (i < size) {
            int i2 = i + 1;
            appendable.append("Cause (").append(String.valueOf(i2)).append(" of ").append(String.valueOf(size)).append("): ");
            Throwable th = (Throwable) list.get(i);
            if (th instanceof GlideException) {
                ((GlideException) th).a(appendable);
            } else {
                a(th, appendable);
            }
            i = i2;
        }
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, DataSource dataSource2) {
        a(cVar, dataSource2, null);
    }

    /* access modifiers changed from: 0000 */
    public void a(c cVar, DataSource dataSource2, Class<?> cls) {
        this.key = cVar;
        this.dataSource = dataSource2;
        this.dataClass = cls;
    }

    public List<Throwable> bg() {
        return this.causes;
    }

    public List<Throwable> bh() {
        ArrayList arrayList = new ArrayList();
        a((Throwable) this, (List<Throwable>) arrayList);
        return arrayList;
    }

    public Throwable fillInStackTrace() {
        return this;
    }

    public String getMessage() {
        String str;
        String str2;
        String str3;
        StringBuilder sb = new StringBuilder(71);
        sb.append(this.detailMessage);
        if (this.dataClass != null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(", ");
            sb2.append(this.dataClass);
            str = sb2.toString();
        } else {
            str = "";
        }
        sb.append(str);
        if (this.dataSource != null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(", ");
            sb3.append(this.dataSource);
            str2 = sb3.toString();
        } else {
            str2 = "";
        }
        sb.append(str2);
        if (this.key != null) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append(", ");
            sb4.append(this.key);
            str3 = sb4.toString();
        } else {
            str3 = "";
        }
        sb.append(str3);
        List<Throwable> bh = bh();
        if (bh.isEmpty()) {
            return sb.toString();
        }
        if (bh.size() == 1) {
            sb.append("\nThere was 1 cause:");
        } else {
            sb.append("\nThere were ");
            sb.append(bh.size());
            sb.append(" causes:");
        }
        for (Throwable th : bh) {
            sb.append(10);
            sb.append(th.getClass().getName());
            sb.append('(');
            sb.append(th.getMessage());
            sb.append(')');
        }
        sb.append("\n call GlideException#logRootCauses(String) for more detail");
        return sb.toString();
    }

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream printStream) {
        a(printStream);
    }

    public void printStackTrace(PrintWriter printWriter) {
        a(printWriter);
    }

    public void s(String str) {
        List bh = bh();
        int size = bh.size();
        int i = 0;
        while (i < size) {
            StringBuilder sb = new StringBuilder();
            sb.append("Root cause (");
            int i2 = i + 1;
            sb.append(i2);
            sb.append(" of ");
            sb.append(size);
            sb.append(")");
            Log.i(str, sb.toString(), (Throwable) bh.get(i));
            i = i2;
        }
    }
}
