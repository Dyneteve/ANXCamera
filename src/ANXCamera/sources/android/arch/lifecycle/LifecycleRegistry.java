package android.arch.lifecycle;

import android.arch.core.b.a;
import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.Lifecycle.State;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map.Entry;

public class LifecycleRegistry extends Lifecycle {
    private static final String LOG_TAG = "LifecycleRegistry";
    private int mAddingObserverCounter = 0;
    private boolean mHandlingEvent = false;
    private final WeakReference<LifecycleOwner> mLifecycleOwner;
    private boolean mNewEventOccurred = false;
    private a<LifecycleObserver, ObserverWithState> mObserverMap = new a<>();
    private ArrayList<State> mParentStates = new ArrayList<>();
    private State mState;

    static class ObserverWithState {
        GenericLifecycleObserver mLifecycleObserver;
        State mState;

        ObserverWithState(LifecycleObserver lifecycleObserver, State state) {
            this.mLifecycleObserver = Lifecycling.getCallback(lifecycleObserver);
            this.mState = state;
        }

        /* access modifiers changed from: 0000 */
        public void dispatchEvent(LifecycleOwner lifecycleOwner, Event event) {
            State stateAfter = LifecycleRegistry.getStateAfter(event);
            this.mState = LifecycleRegistry.min(this.mState, stateAfter);
            this.mLifecycleObserver.onStateChanged(lifecycleOwner, event);
            this.mState = stateAfter;
        }
    }

    public LifecycleRegistry(@NonNull LifecycleOwner lifecycleOwner) {
        this.mLifecycleOwner = new WeakReference<>(lifecycleOwner);
        this.mState = State.INITIALIZED;
    }

    private void backwardPass(LifecycleOwner lifecycleOwner) {
        Iterator descendingIterator = this.mObserverMap.descendingIterator();
        while (descendingIterator.hasNext() && !this.mNewEventOccurred) {
            Entry entry = (Entry) descendingIterator.next();
            ObserverWithState observerWithState = (ObserverWithState) entry.getValue();
            while (observerWithState.mState.compareTo(this.mState) > 0 && !this.mNewEventOccurred && this.mObserverMap.contains(entry.getKey())) {
                Event downEvent = downEvent(observerWithState.mState);
                pushParentState(getStateAfter(downEvent));
                observerWithState.dispatchEvent(lifecycleOwner, downEvent);
                popParentState();
            }
        }
    }

    private State calculateTargetState(LifecycleObserver lifecycleObserver) {
        Entry b = this.mObserverMap.b(lifecycleObserver);
        State state = null;
        State state2 = b != null ? ((ObserverWithState) b.getValue()).mState : null;
        if (!this.mParentStates.isEmpty()) {
            state = (State) this.mParentStates.get(this.mParentStates.size() - 1);
        }
        return min(min(this.mState, state2), state);
    }

    private static Event downEvent(State state) {
        switch (state) {
            case INITIALIZED:
                throw new IllegalArgumentException();
            case CREATED:
                return Event.ON_DESTROY;
            case STARTED:
                return Event.ON_STOP;
            case RESUMED:
                return Event.ON_PAUSE;
            case DESTROYED:
                throw new IllegalArgumentException();
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unexpected state value ");
                sb.append(state);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    private void forwardPass(LifecycleOwner lifecycleOwner) {
        d l = this.mObserverMap.l();
        while (l.hasNext() && !this.mNewEventOccurred) {
            Entry entry = (Entry) l.next();
            ObserverWithState observerWithState = (ObserverWithState) entry.getValue();
            while (observerWithState.mState.compareTo(this.mState) < 0 && !this.mNewEventOccurred && this.mObserverMap.contains(entry.getKey())) {
                pushParentState(observerWithState.mState);
                observerWithState.dispatchEvent(lifecycleOwner, upEvent(observerWithState.mState));
                popParentState();
            }
        }
    }

    static State getStateAfter(Event event) {
        switch (event) {
            case ON_CREATE:
            case ON_STOP:
                return State.CREATED;
            case ON_START:
            case ON_PAUSE:
                return State.STARTED;
            case ON_RESUME:
                return State.RESUMED;
            case ON_DESTROY:
                return State.DESTROYED;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unexpected event value ");
                sb.append(event);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    private boolean isSynced() {
        boolean z = true;
        if (this.mObserverMap.size() == 0) {
            return true;
        }
        State state = ((ObserverWithState) this.mObserverMap.eldest().getValue()).mState;
        State state2 = ((ObserverWithState) this.mObserverMap.m().getValue()).mState;
        if (!(state == state2 && this.mState == state2)) {
            z = false;
        }
        return z;
    }

    static State min(@NonNull State state, @Nullable State state2) {
        return (state2 == null || state2.compareTo(state) >= 0) ? state : state2;
    }

    private void moveToState(State state) {
        if (this.mState != state) {
            this.mState = state;
            if (this.mHandlingEvent || this.mAddingObserverCounter != 0) {
                this.mNewEventOccurred = true;
                return;
            }
            this.mHandlingEvent = true;
            sync();
            this.mHandlingEvent = false;
        }
    }

    private void popParentState() {
        this.mParentStates.remove(this.mParentStates.size() - 1);
    }

    private void pushParentState(State state) {
        this.mParentStates.add(state);
    }

    private void sync() {
        LifecycleOwner lifecycleOwner = (LifecycleOwner) this.mLifecycleOwner.get();
        if (lifecycleOwner == null) {
            Log.w(LOG_TAG, "LifecycleOwner is garbage collected, you shouldn't try dispatch new events from it.");
            return;
        }
        while (!isSynced()) {
            this.mNewEventOccurred = false;
            if (this.mState.compareTo(((ObserverWithState) this.mObserverMap.eldest().getValue()).mState) < 0) {
                backwardPass(lifecycleOwner);
            }
            Entry m = this.mObserverMap.m();
            if (!this.mNewEventOccurred && m != null && this.mState.compareTo(((ObserverWithState) m.getValue()).mState) > 0) {
                forwardPass(lifecycleOwner);
            }
        }
        this.mNewEventOccurred = false;
    }

    private static Event upEvent(State state) {
        switch (state) {
            case INITIALIZED:
            case DESTROYED:
                return Event.ON_CREATE;
            case CREATED:
                return Event.ON_START;
            case STARTED:
                return Event.ON_RESUME;
            case RESUMED:
                throw new IllegalArgumentException();
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unexpected state value ");
                sb.append(state);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    public void addObserver(@NonNull LifecycleObserver lifecycleObserver) {
        ObserverWithState observerWithState = new ObserverWithState(lifecycleObserver, this.mState == State.DESTROYED ? State.DESTROYED : State.INITIALIZED);
        if (((ObserverWithState) this.mObserverMap.putIfAbsent(lifecycleObserver, observerWithState)) == null) {
            LifecycleOwner lifecycleOwner = (LifecycleOwner) this.mLifecycleOwner.get();
            if (lifecycleOwner != null) {
                boolean z = this.mAddingObserverCounter != 0 || this.mHandlingEvent;
                State calculateTargetState = calculateTargetState(lifecycleObserver);
                this.mAddingObserverCounter++;
                while (observerWithState.mState.compareTo(calculateTargetState) < 0 && this.mObserverMap.contains(lifecycleObserver)) {
                    pushParentState(observerWithState.mState);
                    observerWithState.dispatchEvent(lifecycleOwner, upEvent(observerWithState.mState));
                    popParentState();
                    calculateTargetState = calculateTargetState(lifecycleObserver);
                }
                if (!z) {
                    sync();
                }
                this.mAddingObserverCounter--;
            }
        }
    }

    @NonNull
    public State getCurrentState() {
        return this.mState;
    }

    public int getObserverCount() {
        return this.mObserverMap.size();
    }

    public void handleLifecycleEvent(@NonNull Event event) {
        moveToState(getStateAfter(event));
    }

    @MainThread
    public void markState(@NonNull State state) {
        moveToState(state);
    }

    public void removeObserver(@NonNull LifecycleObserver lifecycleObserver) {
        this.mObserverMap.remove(lifecycleObserver);
    }
}
