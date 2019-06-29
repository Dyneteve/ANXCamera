package io.reactivex.exceptions;

import io.reactivex.annotations.NonNull;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;

public final class CompositeException extends RuntimeException {
    private static final long serialVersionUID = 3026362227162912146L;
    private Throwable cause;
    private final List<Throwable> exceptions;
    private final String message;

    static final class CompositeExceptionCausalChain extends RuntimeException {
        static final String MESSAGE = "Chain of Causes for CompositeException In Order Received =>";
        private static final long serialVersionUID = 3875212506787802066L;

        CompositeExceptionCausalChain() {
        }

        public String getMessage() {
            return MESSAGE;
        }
    }

    static abstract class PrintStreamOrWriter {
        PrintStreamOrWriter() {
        }

        /* access modifiers changed from: 0000 */
        public abstract void println(Object obj);
    }

    static final class WrappedPrintStream extends PrintStreamOrWriter {
        private final PrintStream printStream;

        WrappedPrintStream(PrintStream printStream2) {
            this.printStream = printStream2;
        }

        /* access modifiers changed from: 0000 */
        public void println(Object obj) {
            this.printStream.println(obj);
        }
    }

    static final class WrappedPrintWriter extends PrintStreamOrWriter {
        private final PrintWriter printWriter;

        WrappedPrintWriter(PrintWriter printWriter2) {
            this.printWriter = printWriter2;
        }

        /* access modifiers changed from: 0000 */
        public void println(Object obj) {
            this.printWriter.println(obj);
        }
    }

    public CompositeException(@NonNull Iterable<? extends Throwable> iterable) {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ArrayList arrayList = new ArrayList();
        if (iterable != null) {
            for (Throwable th : iterable) {
                if (th instanceof CompositeException) {
                    linkedHashSet.addAll(((CompositeException) th).getExceptions());
                } else if (th != null) {
                    linkedHashSet.add(th);
                } else {
                    linkedHashSet.add(new NullPointerException("Throwable was null!"));
                }
            }
        } else {
            linkedHashSet.add(new NullPointerException("errors was null"));
        }
        if (!linkedHashSet.isEmpty()) {
            arrayList.addAll(linkedHashSet);
            this.exceptions = Collections.unmodifiableList(arrayList);
            StringBuilder sb = new StringBuilder();
            sb.append(this.exceptions.size());
            sb.append(" exceptions occurred. ");
            this.message = sb.toString();
            return;
        }
        throw new IllegalArgumentException("errors is empty");
    }

    public CompositeException(@NonNull Throwable... thArr) {
        this((Iterable<? extends Throwable>) thArr == null ? Collections.singletonList(new NullPointerException("exceptions was null")) : Arrays.asList(thArr));
    }

    private void appendStackTrace(StringBuilder sb, Throwable th, String str) {
        StackTraceElement[] stackTrace;
        sb.append(str);
        sb.append(th);
        sb.append(10);
        for (StackTraceElement stackTraceElement : th.getStackTrace()) {
            sb.append("\t\tat ");
            sb.append(stackTraceElement);
            sb.append(10);
        }
        if (th.getCause() != null) {
            sb.append("\tCaused by: ");
            appendStackTrace(sb, th.getCause(), "");
        }
    }

    private List<Throwable> getListOfCauses(Throwable th) {
        ArrayList arrayList = new ArrayList();
        Throwable cause2 = th.getCause();
        if (cause2 == null || cause2 == th) {
            return arrayList;
        }
        while (true) {
            arrayList.add(cause2);
            Throwable cause3 = cause2.getCause();
            if (cause3 == null || cause3 == cause2) {
                return arrayList;
            }
            cause2 = cause3;
        }
        return arrayList;
    }

    private Throwable getRootCause(Throwable th) {
        Throwable cause2 = th.getCause();
        if (cause2 == null || this.cause == cause2) {
            return th;
        }
        while (true) {
            Throwable cause3 = cause2.getCause();
            if (cause3 == null || cause3 == cause2) {
                return cause2;
            }
            cause2 = cause3;
        }
        return cause2;
    }

    private void printStackTrace(PrintStreamOrWriter printStreamOrWriter) {
        StackTraceElement[] stackTrace;
        StringBuilder sb = new StringBuilder(128);
        sb.append(this);
        sb.append(10);
        for (StackTraceElement stackTraceElement : getStackTrace()) {
            sb.append("\tat ");
            sb.append(stackTraceElement);
            sb.append(10);
        }
        int i = 1;
        for (Throwable th : this.exceptions) {
            sb.append("  ComposedException ");
            sb.append(i);
            sb.append(" :\n");
            appendStackTrace(sb, th, "\t");
            i++;
        }
        printStreamOrWriter.println(sb.toString());
    }

    @NonNull
    public synchronized Throwable getCause() {
        if (this.cause == null) {
            Throwable compositeExceptionCausalChain = new CompositeExceptionCausalChain();
            HashSet hashSet = new HashSet();
            Throwable th = compositeExceptionCausalChain;
            for (Throwable th2 : this.exceptions) {
                if (!hashSet.contains(th2)) {
                    hashSet.add(th2);
                    for (Throwable th3 : getListOfCauses(th2)) {
                        if (hashSet.contains(th3)) {
                            th2 = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
                        } else {
                            hashSet.add(th3);
                        }
                    }
                    try {
                        th.initCause(th2);
                    } catch (Throwable th4) {
                    }
                    th = getRootCause(th);
                }
            }
            this.cause = compositeExceptionCausalChain;
        }
        return this.cause;
    }

    @NonNull
    public List<Throwable> getExceptions() {
        return this.exceptions;
    }

    @NonNull
    public String getMessage() {
        return this.message;
    }

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream printStream) {
        printStackTrace((PrintStreamOrWriter) new WrappedPrintStream(printStream));
    }

    public void printStackTrace(PrintWriter printWriter) {
        printStackTrace((PrintStreamOrWriter) new WrappedPrintWriter(printWriter));
    }

    public int size() {
        return this.exceptions.size();
    }
}
