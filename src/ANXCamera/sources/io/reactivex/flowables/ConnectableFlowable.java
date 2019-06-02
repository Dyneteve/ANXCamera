package io.reactivex.flowables;

import io.reactivex.Flowable;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.operators.flowable.FlowableAutoConnect;
import io.reactivex.internal.operators.flowable.FlowableRefCount;
import io.reactivex.internal.util.ConnectConsumer;
import io.reactivex.plugins.RxJavaPlugins;

public abstract class ConnectableFlowable<T> extends Flowable<T> {
    @NonNull
    public Flowable<T> autoConnect() {
        return autoConnect(1);
    }

    @NonNull
    public Flowable<T> autoConnect(int i) {
        return autoConnect(i, Functions.emptyConsumer());
    }

    @NonNull
    public Flowable<T> autoConnect(int i, @NonNull Consumer<? super Disposable> consumer) {
        if (i > 0) {
            return RxJavaPlugins.onAssembly((Flowable<T>) new FlowableAutoConnect<T>(this, i, consumer));
        }
        connect(consumer);
        return RxJavaPlugins.onAssembly(this);
    }

    public final Disposable connect() {
        ConnectConsumer connectConsumer = new ConnectConsumer();
        connect(connectConsumer);
        return connectConsumer.disposable;
    }

    public abstract void connect(@NonNull Consumer<? super Disposable> consumer);

    @NonNull
    public Flowable<T> refCount() {
        return RxJavaPlugins.onAssembly((Flowable<T>) new FlowableRefCount<T>(this));
    }
}
