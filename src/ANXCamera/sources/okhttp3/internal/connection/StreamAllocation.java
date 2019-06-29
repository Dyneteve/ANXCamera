package okhttp3.internal.connection;

import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.net.Socket;
import java.util.List;
import okhttp3.Address;
import okhttp3.Call;
import okhttp3.ConnectionPool;
import okhttp3.EventListener;
import okhttp3.Interceptor.Chain;
import okhttp3.OkHttpClient;
import okhttp3.Route;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.connection.RouteSelector.Selection;
import okhttp3.internal.http.HttpCodec;
import okhttp3.internal.http2.ConnectionShutdownException;
import okhttp3.internal.http2.ErrorCode;
import okhttp3.internal.http2.StreamResetException;

public final class StreamAllocation {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public final Address address;
    public final Call call;
    private final Object callStackTrace;
    private boolean canceled;
    private HttpCodec codec;
    private RealConnection connection;
    private final ConnectionPool connectionPool;
    public final EventListener eventListener;
    private int refusedStreamCount;
    private boolean released;
    private boolean reportedAcquired;
    private Route route;
    private Selection routeSelection;
    private final RouteSelector routeSelector;

    public static final class StreamAllocationReference extends WeakReference<StreamAllocation> {
        public final Object callStackTrace;

        StreamAllocationReference(StreamAllocation streamAllocation, Object obj) {
            super(streamAllocation);
            this.callStackTrace = obj;
        }
    }

    public StreamAllocation(ConnectionPool connectionPool2, Address address2, Call call2, EventListener eventListener2, Object obj) {
        this.connectionPool = connectionPool2;
        this.address = address2;
        this.call = call2;
        this.eventListener = eventListener2;
        this.routeSelector = new RouteSelector(address2, routeDatabase(), call2, eventListener2);
        this.callStackTrace = obj;
    }

    private Socket deallocate(boolean z, boolean z2, boolean z3) {
        Socket socket;
        if (z3) {
            this.codec = null;
        }
        if (z2) {
            this.released = true;
        }
        if (this.connection != null) {
            if (z) {
                this.connection.noNewStreams = true;
            }
            if (this.codec == null && (this.released || this.connection.noNewStreams)) {
                release(this.connection);
                if (this.connection.allocations.isEmpty()) {
                    this.connection.idleAtNanos = System.nanoTime();
                    if (Internal.instance.connectionBecameIdle(this.connectionPool, this.connection)) {
                        socket = this.connection.socket();
                        this.connection = null;
                        return socket;
                    }
                }
                socket = null;
                this.connection = null;
                return socket;
            }
        }
        return null;
    }

    private RealConnection findConnection(int i, int i2, int i3, boolean z) throws IOException {
        Socket releaseIfNoNewStreams;
        Socket socket;
        RealConnection realConnection;
        RealConnection realConnection2;
        Route route2;
        RealConnection realConnection3;
        boolean z2;
        boolean z3;
        synchronized (this.connectionPool) {
            if (this.released) {
                throw new IllegalStateException("released");
            } else if (this.codec != null) {
                throw new IllegalStateException("codec != null");
            } else if (!this.canceled) {
                RealConnection realConnection4 = this.connection;
                releaseIfNoNewStreams = releaseIfNoNewStreams();
                socket = null;
                if (this.connection != null) {
                    realConnection2 = this.connection;
                    realConnection = null;
                } else {
                    realConnection = realConnection4;
                    realConnection2 = null;
                }
                if (!this.reportedAcquired) {
                    realConnection = null;
                }
                if (realConnection2 == null) {
                    Internal.instance.get(this.connectionPool, this.address, this, null);
                    if (this.connection != null) {
                        realConnection3 = this.connection;
                        route2 = null;
                        z2 = true;
                    } else {
                        route2 = this.route;
                        realConnection3 = realConnection2;
                    }
                } else {
                    realConnection3 = realConnection2;
                    route2 = null;
                }
                z2 = false;
            } else {
                throw new IOException("Canceled");
            }
        }
        Util.closeQuietly(releaseIfNoNewStreams);
        if (realConnection != null) {
            this.eventListener.connectionReleased(this.call, realConnection);
        }
        if (z2) {
            this.eventListener.connectionAcquired(this.call, realConnection3);
        }
        if (realConnection3 != null) {
            return realConnection3;
        }
        if (route2 != null || (this.routeSelection != null && this.routeSelection.hasNext())) {
            z3 = false;
        } else {
            this.routeSelection = this.routeSelector.next();
            z3 = true;
        }
        synchronized (this.connectionPool) {
            if (!this.canceled) {
                if (z3) {
                    List all = this.routeSelection.getAll();
                    int size = all.size();
                    int i4 = 0;
                    while (true) {
                        if (i4 >= size) {
                            break;
                        }
                        Route route3 = (Route) all.get(i4);
                        Internal.instance.get(this.connectionPool, this.address, this, route3);
                        if (this.connection != null) {
                            realConnection3 = this.connection;
                            this.route = route3;
                            z2 = true;
                            break;
                        }
                        i4++;
                    }
                }
                if (!z2) {
                    if (route2 == null) {
                        route2 = this.routeSelection.next();
                    }
                    this.route = route2;
                    this.refusedStreamCount = 0;
                    realConnection3 = new RealConnection(this.connectionPool, route2);
                    acquire(realConnection3, false);
                }
            } else {
                throw new IOException("Canceled");
            }
        }
        if (z2) {
            this.eventListener.connectionAcquired(this.call, realConnection3);
            return realConnection3;
        }
        realConnection3.connect(i, i2, i3, z, this.call, this.eventListener);
        routeDatabase().connected(realConnection3.route());
        synchronized (this.connectionPool) {
            this.reportedAcquired = true;
            Internal.instance.put(this.connectionPool, realConnection3);
            if (realConnection3.isMultiplexed()) {
                socket = Internal.instance.deduplicate(this.connectionPool, this.address, this);
                realConnection3 = this.connection;
            }
        }
        Util.closeQuietly(socket);
        this.eventListener.connectionAcquired(this.call, realConnection3);
        return realConnection3;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0018, code lost:
        return r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0012, code lost:
        if (r0.isHealthy(r8) != false) goto L_0x0018;
     */
    private RealConnection findHealthyConnection(int i, int i2, int i3, boolean z, boolean z2) throws IOException {
        while (true) {
            RealConnection findConnection = findConnection(i, i2, i3, z);
            synchronized (this.connectionPool) {
                if (findConnection.successCount == 0) {
                    return findConnection;
                }
            }
            noNewStreams();
        }
        while (true) {
        }
    }

    private void release(RealConnection realConnection) {
        int size = realConnection.allocations.size();
        for (int i = 0; i < size; i++) {
            if (((Reference) realConnection.allocations.get(i)).get() == this) {
                realConnection.allocations.remove(i);
                return;
            }
        }
        throw new IllegalStateException();
    }

    private Socket releaseIfNoNewStreams() {
        RealConnection realConnection = this.connection;
        if (realConnection == null || !realConnection.noNewStreams) {
            return null;
        }
        return deallocate(false, false, true);
    }

    private RouteDatabase routeDatabase() {
        return Internal.instance.routeDatabase(this.connectionPool);
    }

    public void acquire(RealConnection realConnection, boolean z) {
        if (this.connection == null) {
            this.connection = realConnection;
            this.reportedAcquired = z;
            realConnection.allocations.add(new StreamAllocationReference(this, this.callStackTrace));
            return;
        }
        throw new IllegalStateException();
    }

    public void cancel() {
        HttpCodec httpCodec;
        RealConnection realConnection;
        synchronized (this.connectionPool) {
            this.canceled = true;
            httpCodec = this.codec;
            realConnection = this.connection;
        }
        if (httpCodec != null) {
            httpCodec.cancel();
        } else if (realConnection != null) {
            realConnection.cancel();
        }
    }

    public HttpCodec codec() {
        HttpCodec httpCodec;
        synchronized (this.connectionPool) {
            httpCodec = this.codec;
        }
        return httpCodec;
    }

    public synchronized RealConnection connection() {
        return this.connection;
    }

    public boolean hasMoreRoutes() {
        return this.route != null || (this.routeSelection != null && this.routeSelection.hasNext()) || this.routeSelector.hasNext();
    }

    public HttpCodec newStream(OkHttpClient okHttpClient, Chain chain, boolean z) {
        try {
            HttpCodec newCodec = findHealthyConnection(chain.connectTimeoutMillis(), chain.readTimeoutMillis(), chain.writeTimeoutMillis(), okHttpClient.retryOnConnectionFailure(), z).newCodec(okHttpClient, chain, this);
            synchronized (this.connectionPool) {
                this.codec = newCodec;
            }
            return newCodec;
        } catch (IOException e) {
            throw new RouteException(e);
        }
    }

    public void noNewStreams() {
        RealConnection realConnection;
        Socket deallocate;
        synchronized (this.connectionPool) {
            realConnection = this.connection;
            deallocate = deallocate(true, false, false);
            if (this.connection != null) {
                realConnection = null;
            }
        }
        Util.closeQuietly(deallocate);
        if (realConnection != null) {
            this.eventListener.connectionReleased(this.call, realConnection);
        }
    }

    public void release() {
        RealConnection realConnection;
        Socket deallocate;
        synchronized (this.connectionPool) {
            realConnection = this.connection;
            deallocate = deallocate(false, true, false);
            if (this.connection != null) {
                realConnection = null;
            }
        }
        Util.closeQuietly(deallocate);
        if (realConnection != null) {
            this.eventListener.connectionReleased(this.call, realConnection);
        }
    }

    public Socket releaseAndAcquire(RealConnection realConnection) {
        if (this.codec == null && this.connection.allocations.size() == 1) {
            Reference reference = (Reference) this.connection.allocations.get(0);
            Socket deallocate = deallocate(true, false, false);
            this.connection = realConnection;
            realConnection.allocations.add(reference);
            return deallocate;
        }
        throw new IllegalStateException();
    }

    public void streamFailed(IOException iOException) {
        boolean z;
        RealConnection realConnection;
        Socket deallocate;
        synchronized (this.connectionPool) {
            if (iOException instanceof StreamResetException) {
                StreamResetException streamResetException = (StreamResetException) iOException;
                if (streamResetException.errorCode == ErrorCode.REFUSED_STREAM) {
                    this.refusedStreamCount++;
                }
                if (streamResetException.errorCode == ErrorCode.REFUSED_STREAM) {
                    if (this.refusedStreamCount <= 1) {
                        z = false;
                    }
                }
                this.route = null;
                z = true;
            } else if (this.connection == null || (this.connection.isMultiplexed() && !(iOException instanceof ConnectionShutdownException))) {
                z = false;
            } else {
                if (this.connection.successCount == 0) {
                    if (!(this.route == null || iOException == null)) {
                        this.routeSelector.connectFailed(this.route, iOException);
                    }
                    this.route = null;
                }
                z = true;
            }
            realConnection = this.connection;
            deallocate = deallocate(z, false, true);
            if (this.connection != null || !this.reportedAcquired) {
                realConnection = null;
            }
        }
        Util.closeQuietly(deallocate);
        if (realConnection != null) {
            this.eventListener.connectionReleased(this.call, realConnection);
        }
    }

    public void streamFinished(boolean z, HttpCodec httpCodec, long j, IOException iOException) {
        RealConnection realConnection;
        Socket deallocate;
        boolean z2;
        this.eventListener.responseBodyEnd(this.call, j);
        synchronized (this.connectionPool) {
            if (httpCodec != null) {
                if (httpCodec == this.codec) {
                    if (!z) {
                        this.connection.successCount++;
                    }
                    realConnection = this.connection;
                    deallocate = deallocate(z, false, true);
                    if (this.connection != null) {
                        realConnection = null;
                    }
                    z2 = this.released;
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("expected ");
            sb.append(this.codec);
            sb.append(" but was ");
            sb.append(httpCodec);
            throw new IllegalStateException(sb.toString());
        }
        Util.closeQuietly(deallocate);
        if (realConnection != null) {
            this.eventListener.connectionReleased(this.call, realConnection);
        }
        if (iOException != null) {
            this.eventListener.callFailed(this.call, iOException);
        } else if (z2) {
            this.eventListener.callEnd(this.call);
        }
    }

    public String toString() {
        RealConnection connection2 = connection();
        return connection2 != null ? connection2.toString() : this.address.toString();
    }
}
