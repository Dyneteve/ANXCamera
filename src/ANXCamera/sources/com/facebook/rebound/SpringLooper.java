package com.facebook.rebound;

public abstract class SpringLooper {
    protected BaseSpringSystem mSpringSystem;

    public void setSpringSystem(BaseSpringSystem baseSpringSystem) {
        this.mSpringSystem = baseSpringSystem;
    }

    public abstract void start();

    public abstract void stop();
}
