package com.facebook.rebound;

import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

public class Spring {
    private static int ID = 0;
    private static final double MAX_DELTA_TIME_SEC = 0.064d;
    private static final double SOLVER_TIMESTEP_SEC = 0.001d;
    private final PhysicsState mCurrentState = new PhysicsState();
    private double mDisplacementFromRestThreshold = 0.005d;
    private double mEndValue;
    private final String mId;
    private CopyOnWriteArraySet<SpringListener> mListeners = new CopyOnWriteArraySet<>();
    private boolean mOvershootClampingEnabled;
    private final PhysicsState mPreviousState = new PhysicsState();
    private double mRestSpeedThreshold = 0.005d;
    private SpringConfig mSpringConfig;
    private final BaseSpringSystem mSpringSystem;
    private double mStartValue;
    private final PhysicsState mTempState = new PhysicsState();
    private double mTimeAccumulator = 0.0d;
    private boolean mWasAtRest = true;

    private static class PhysicsState {
        double position;
        double velocity;

        private PhysicsState() {
        }
    }

    Spring(BaseSpringSystem baseSpringSystem) {
        if (baseSpringSystem != null) {
            this.mSpringSystem = baseSpringSystem;
            StringBuilder sb = new StringBuilder();
            sb.append("spring:");
            int i = ID;
            ID = i + 1;
            sb.append(i);
            this.mId = sb.toString();
            setSpringConfig(SpringConfig.defaultConfig);
            return;
        }
        throw new IllegalArgumentException("Spring cannot be created outside of a BaseSpringSystem");
    }

    private double getDisplacementDistanceForState(PhysicsState physicsState) {
        return Math.abs(this.mEndValue - physicsState.position);
    }

    private void interpolate(double d) {
        double d2 = 1.0d - d;
        this.mCurrentState.position = (this.mCurrentState.position * d) + (this.mPreviousState.position * d2);
        this.mCurrentState.velocity = (this.mCurrentState.velocity * d) + (this.mPreviousState.velocity * d2);
    }

    public Spring addListener(SpringListener springListener) {
        if (springListener != null) {
            this.mListeners.add(springListener);
            return this;
        }
        throw new IllegalArgumentException("newListener is required");
    }

    /* access modifiers changed from: 0000 */
    public void advance(double d) {
        boolean z;
        boolean isAtRest = isAtRest();
        if (!isAtRest || !this.mWasAtRest) {
            double d2 = MAX_DELTA_TIME_SEC;
            if (d <= MAX_DELTA_TIME_SEC) {
                d2 = d;
            }
            this.mTimeAccumulator += d2;
            double d3 = this.mSpringConfig.tension;
            double d4 = this.mSpringConfig.friction;
            double d5 = this.mCurrentState.position;
            double d6 = this.mCurrentState.velocity;
            double d7 = this.mTempState.position;
            double d8 = this.mTempState.velocity;
            while (this.mTimeAccumulator >= SOLVER_TIMESTEP_SEC) {
                this.mTimeAccumulator -= SOLVER_TIMESTEP_SEC;
                if (this.mTimeAccumulator < SOLVER_TIMESTEP_SEC) {
                    this.mPreviousState.position = d5;
                    this.mPreviousState.velocity = d6;
                }
                double d9 = ((this.mEndValue - d7) * d3) - (d4 * d6);
                double d10 = d6 + (d9 * SOLVER_TIMESTEP_SEC * 0.5d);
                double d11 = ((this.mEndValue - (((d6 * SOLVER_TIMESTEP_SEC) * 0.5d) + d5)) * d3) - (d4 * d10);
                double d12 = d6 + (d11 * SOLVER_TIMESTEP_SEC * 0.5d);
                double d13 = d9;
                double d14 = ((this.mEndValue - (((d10 * SOLVER_TIMESTEP_SEC) * 0.5d) + d5)) * d3) - (d4 * d12);
                d7 = (d12 * SOLVER_TIMESTEP_SEC) + d5;
                double d15 = d6 + (d14 * SOLVER_TIMESTEP_SEC);
                d5 += (d6 + ((d10 + d12) * 2.0d) + d15) * 0.16666666666666666d * SOLVER_TIMESTEP_SEC;
                d6 += 0.16666666666666666d * (d13 + (2.0d * (d11 + d14)) + (((this.mEndValue - d7) * d3) - (d4 * d15))) * SOLVER_TIMESTEP_SEC;
                d8 = d15;
            }
            double d16 = d5;
            this.mTempState.position = d7;
            this.mTempState.velocity = d8;
            this.mCurrentState.position = d5;
            this.mCurrentState.velocity = d6;
            if (this.mTimeAccumulator > 0.0d) {
                interpolate(this.mTimeAccumulator / SOLVER_TIMESTEP_SEC);
            }
            if (isAtRest() || (this.mOvershootClampingEnabled && isOvershooting())) {
                if (d3 > 0.0d) {
                    this.mStartValue = this.mEndValue;
                    this.mCurrentState.position = this.mEndValue;
                } else {
                    this.mEndValue = this.mCurrentState.position;
                    this.mStartValue = this.mEndValue;
                }
                setVelocity(0.0d);
                isAtRest = true;
            }
            boolean z2 = false;
            if (this.mWasAtRest) {
                this.mWasAtRest = false;
                z = true;
            } else {
                z = false;
            }
            if (isAtRest) {
                this.mWasAtRest = true;
                z2 = true;
            }
            Iterator it = this.mListeners.iterator();
            while (it.hasNext()) {
                SpringListener springListener = (SpringListener) it.next();
                if (z) {
                    springListener.onSpringActivate(this);
                }
                springListener.onSpringUpdate(this);
                if (z2) {
                    springListener.onSpringAtRest(this);
                }
            }
        }
    }

    public boolean currentValueIsApproximately(double d) {
        return Math.abs(getCurrentValue() - d) <= getRestDisplacementThreshold();
    }

    public void destroy() {
        this.mListeners.clear();
        this.mSpringSystem.deregisterSpring(this);
    }

    public double getCurrentDisplacementDistance() {
        return getDisplacementDistanceForState(this.mCurrentState);
    }

    public double getCurrentValue() {
        return this.mCurrentState.position;
    }

    public double getEndValue() {
        return this.mEndValue;
    }

    public String getId() {
        return this.mId;
    }

    public double getRestDisplacementThreshold() {
        return this.mDisplacementFromRestThreshold;
    }

    public double getRestSpeedThreshold() {
        return this.mRestSpeedThreshold;
    }

    public SpringConfig getSpringConfig() {
        return this.mSpringConfig;
    }

    public double getStartValue() {
        return this.mStartValue;
    }

    public double getVelocity() {
        return this.mCurrentState.velocity;
    }

    public boolean isAtRest() {
        return Math.abs(this.mCurrentState.velocity) <= this.mRestSpeedThreshold && (getDisplacementDistanceForState(this.mCurrentState) <= this.mDisplacementFromRestThreshold || this.mSpringConfig.tension == 0.0d);
    }

    public boolean isOvershootClampingEnabled() {
        return this.mOvershootClampingEnabled;
    }

    public boolean isOvershooting() {
        return this.mSpringConfig.tension > 0.0d && ((this.mStartValue < this.mEndValue && getCurrentValue() > this.mEndValue) || (this.mStartValue > this.mEndValue && getCurrentValue() < this.mEndValue));
    }

    public Spring removeAllListeners() {
        this.mListeners.clear();
        return this;
    }

    public Spring removeListener(SpringListener springListener) {
        if (springListener != null) {
            this.mListeners.remove(springListener);
            return this;
        }
        throw new IllegalArgumentException("listenerToRemove is required");
    }

    public Spring setAtRest() {
        this.mEndValue = this.mCurrentState.position;
        this.mTempState.position = this.mCurrentState.position;
        this.mCurrentState.velocity = 0.0d;
        return this;
    }

    public Spring setCurrentValue(double d) {
        return setCurrentValue(d, true);
    }

    public Spring setCurrentValue(double d, boolean z) {
        this.mStartValue = d;
        this.mCurrentState.position = d;
        this.mSpringSystem.activateSpring(getId());
        Iterator it = this.mListeners.iterator();
        while (it.hasNext()) {
            ((SpringListener) it.next()).onSpringUpdate(this);
        }
        if (z) {
            setAtRest();
        }
        return this;
    }

    public Spring setEndValue(double d) {
        if (this.mEndValue == d && isAtRest()) {
            return this;
        }
        this.mStartValue = getCurrentValue();
        this.mEndValue = d;
        this.mSpringSystem.activateSpring(getId());
        Iterator it = this.mListeners.iterator();
        while (it.hasNext()) {
            ((SpringListener) it.next()).onSpringEndStateChange(this);
        }
        return this;
    }

    public Spring setOvershootClampingEnabled(boolean z) {
        this.mOvershootClampingEnabled = z;
        return this;
    }

    public Spring setRestDisplacementThreshold(double d) {
        this.mDisplacementFromRestThreshold = d;
        return this;
    }

    public Spring setRestSpeedThreshold(double d) {
        this.mRestSpeedThreshold = d;
        return this;
    }

    public Spring setSpringConfig(SpringConfig springConfig) {
        if (springConfig != null) {
            this.mSpringConfig = springConfig;
            return this;
        }
        throw new IllegalArgumentException("springConfig is required");
    }

    public Spring setVelocity(double d) {
        if (d == this.mCurrentState.velocity) {
            return this;
        }
        this.mCurrentState.velocity = d;
        this.mSpringSystem.activateSpring(getId());
        return this;
    }

    public boolean systemShouldAdvance() {
        return !isAtRest() || !wasAtRest();
    }

    public boolean wasAtRest() {
        return this.mWasAtRest;
    }
}
