package com.facebook.rebound;

public class SpringSystem extends BaseSpringSystem {
    private SpringSystem(SpringLooper springLooper) {
        super(springLooper);
    }

    public static SpringSystem create() {
        return new SpringSystem(AndroidSpringLooperFactory.createSpringLooper());
    }
}
