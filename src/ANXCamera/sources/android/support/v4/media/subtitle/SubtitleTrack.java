package android.support.v4.media.subtitle;

import android.graphics.Canvas;
import android.media.MediaFormat;
import android.os.Handler;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.media.SubtitleData2;
import android.support.v4.media.subtitle.MediaTimeProvider.OnMediaTimeListener;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.Pair;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.SortedMap;
import java.util.TreeMap;

@RequiresApi(28)
@RestrictTo({Scope.LIBRARY_GROUP})
public abstract class SubtitleTrack implements OnMediaTimeListener {
    private static final String TAG = "SubtitleTrack";
    public boolean DEBUG = false;
    /* access modifiers changed from: private */
    public final ArrayList<Cue> mActiveCues = new ArrayList<>();
    private CueList mCues;
    private MediaFormat mFormat;
    protected Handler mHandler = new Handler();
    private long mLastTimeMs;
    private long mLastUpdateTimeMs;
    private long mNextScheduledTimeMs = -1;
    /* access modifiers changed from: private */
    public Runnable mRunnable;
    private final LongSparseArray<Run> mRunsByEndTime = new LongSparseArray<>();
    private final LongSparseArray<Run> mRunsByID = new LongSparseArray<>();
    protected MediaTimeProvider mTimeProvider;
    protected boolean mVisible;

    static class Cue {
        public long mEndTimeMs;
        public long[] mInnerTimesMs;
        public Cue mNextInRun;
        public long mRunID;
        public long mStartTimeMs;

        Cue() {
        }

        public void onTime(long j) {
        }
    }

    static class CueList {
        private static final String TAG = "CueList";
        public boolean DEBUG = false;
        /* access modifiers changed from: private */
        public SortedMap<Long, ArrayList<Cue>> mCues = new TreeMap();

        class EntryIterator implements Iterator<Pair<Long, Cue>> {
            private long mCurrentTimeMs;
            private boolean mDone;
            private Pair<Long, Cue> mLastEntry;
            private Iterator<Cue> mLastListIterator;
            private Iterator<Cue> mListIterator;
            private SortedMap<Long, ArrayList<Cue>> mRemainingCues;

            EntryIterator(SortedMap<Long, ArrayList<Cue>> sortedMap) {
                if (CueList.this.DEBUG) {
                    String str = CueList.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append(sortedMap);
                    sb.append("");
                    Log.v(str, sb.toString());
                }
                this.mRemainingCues = sortedMap;
                this.mLastListIterator = null;
                nextKey();
            }

            private void nextKey() {
                do {
                    try {
                        if (this.mRemainingCues != null) {
                            this.mCurrentTimeMs = ((Long) this.mRemainingCues.firstKey()).longValue();
                            this.mListIterator = ((ArrayList) this.mRemainingCues.get(Long.valueOf(this.mCurrentTimeMs))).iterator();
                            try {
                                this.mRemainingCues = this.mRemainingCues.tailMap(Long.valueOf(this.mCurrentTimeMs + 1));
                            } catch (IllegalArgumentException e) {
                                this.mRemainingCues = null;
                            }
                            this.mDone = false;
                        } else {
                            throw new NoSuchElementException("");
                        }
                    } catch (NoSuchElementException e2) {
                        this.mDone = true;
                        this.mRemainingCues = null;
                        this.mListIterator = null;
                        return;
                    }
                } while (!this.mListIterator.hasNext());
            }

            public boolean hasNext() {
                return !this.mDone;
            }

            public Pair<Long, Cue> next() {
                if (!this.mDone) {
                    this.mLastEntry = new Pair<>(Long.valueOf(this.mCurrentTimeMs), this.mListIterator.next());
                    this.mLastListIterator = this.mListIterator;
                    if (!this.mListIterator.hasNext()) {
                        nextKey();
                    }
                    return this.mLastEntry;
                }
                throw new NoSuchElementException("");
            }

            public void remove() {
                if (this.mLastListIterator == null || ((Cue) this.mLastEntry.second).mEndTimeMs != ((Long) this.mLastEntry.first).longValue()) {
                    throw new IllegalStateException("");
                }
                this.mLastListIterator.remove();
                this.mLastListIterator = null;
                if (((ArrayList) CueList.this.mCues.get(this.mLastEntry.first)).size() == 0) {
                    CueList.this.mCues.remove(this.mLastEntry.first);
                }
                Cue cue = (Cue) this.mLastEntry.second;
                CueList.this.removeEvent(cue, cue.mStartTimeMs);
                if (cue.mInnerTimesMs != null) {
                    for (long access$400 : cue.mInnerTimesMs) {
                        CueList.this.removeEvent(cue, access$400);
                    }
                }
            }
        }

        CueList() {
        }

        private boolean addEvent(Cue cue, long j) {
            ArrayList arrayList = (ArrayList) this.mCues.get(Long.valueOf(j));
            if (arrayList == null) {
                arrayList = new ArrayList(2);
                this.mCues.put(Long.valueOf(j), arrayList);
            } else if (arrayList.contains(cue)) {
                return false;
            }
            arrayList.add(cue);
            return true;
        }

        /* access modifiers changed from: private */
        public void removeEvent(Cue cue, long j) {
            ArrayList arrayList = (ArrayList) this.mCues.get(Long.valueOf(j));
            if (arrayList != null) {
                arrayList.remove(cue);
                if (arrayList.size() == 0) {
                    this.mCues.remove(Long.valueOf(j));
                }
            }
        }

        public void add(Cue cue) {
            long[] jArr;
            if (cue.mStartTimeMs < cue.mEndTimeMs && addEvent(cue, cue.mStartTimeMs)) {
                long j = cue.mStartTimeMs;
                if (cue.mInnerTimesMs != null) {
                    for (long j2 : cue.mInnerTimesMs) {
                        if (j2 > j && j2 < cue.mEndTimeMs) {
                            addEvent(cue, j2);
                            j = j2;
                        }
                    }
                }
                addEvent(cue, cue.mEndTimeMs);
            }
        }

        public Iterable<Pair<Long, Cue>> entriesBetween(long j, long j2) {
            final long j3 = j;
            final long j4 = j2;
            AnonymousClass1 r0 = new Iterable<Pair<Long, Cue>>() {
                public Iterator<Pair<Long, Cue>> iterator() {
                    if (CueList.this.DEBUG) {
                        String str = CueList.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("slice (");
                        sb.append(j3);
                        sb.append(", ");
                        sb.append(j4);
                        sb.append("]=");
                        Log.d(str, sb.toString());
                    }
                    try {
                        return new EntryIterator(CueList.this.mCues.subMap(Long.valueOf(j3 + 1), Long.valueOf(j4 + 1)));
                    } catch (IllegalArgumentException e) {
                        return new EntryIterator(null);
                    }
                }
            };
            return r0;
        }

        public long nextTimeAfter(long j) {
            try {
                SortedMap tailMap = this.mCues.tailMap(Long.valueOf(j + 1));
                if (tailMap != null) {
                    return ((Long) tailMap.firstKey()).longValue();
                }
                return -1;
            } catch (IllegalArgumentException e) {
                return -1;
            } catch (NoSuchElementException e2) {
                return -1;
            }
        }

        public void remove(Cue cue) {
            removeEvent(cue, cue.mStartTimeMs);
            if (cue.mInnerTimesMs != null) {
                for (long removeEvent : cue.mInnerTimesMs) {
                    removeEvent(cue, removeEvent);
                }
            }
            removeEvent(cue, cue.mEndTimeMs);
        }
    }

    public interface RenderingWidget {

        public interface OnChangedListener {
            void onChanged(RenderingWidget renderingWidget);
        }

        void draw(Canvas canvas);

        void onAttachedToWindow();

        void onDetachedFromWindow();

        void setOnChangedListener(OnChangedListener onChangedListener);

        void setSize(int i, int i2);

        void setVisible(boolean z);
    }

    private static class Run {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        public long mEndTimeMs;
        public Cue mFirstCue;
        public Run mNextRunAtEndTimeMs;
        public Run mPrevRunAtEndTimeMs;
        public long mRunID;
        private long mStoredEndTimeMs;

        static {
            Class<SubtitleTrack> cls = SubtitleTrack.class;
        }

        private Run() {
            this.mEndTimeMs = -1;
            this.mRunID = 0;
            this.mStoredEndTimeMs = -1;
        }

        public void removeAtEndTimeMs() {
            Run run = this.mPrevRunAtEndTimeMs;
            if (this.mPrevRunAtEndTimeMs != null) {
                this.mPrevRunAtEndTimeMs.mNextRunAtEndTimeMs = this.mNextRunAtEndTimeMs;
                this.mPrevRunAtEndTimeMs = null;
            }
            if (this.mNextRunAtEndTimeMs != null) {
                this.mNextRunAtEndTimeMs.mPrevRunAtEndTimeMs = run;
                this.mNextRunAtEndTimeMs = null;
            }
        }

        public void storeByEndTimeMs(LongSparseArray<Run> longSparseArray) {
            int indexOfKey = longSparseArray.indexOfKey(this.mStoredEndTimeMs);
            if (indexOfKey >= 0) {
                if (this.mPrevRunAtEndTimeMs == null) {
                    if (this.mNextRunAtEndTimeMs == null) {
                        longSparseArray.removeAt(indexOfKey);
                    } else {
                        longSparseArray.setValueAt(indexOfKey, this.mNextRunAtEndTimeMs);
                    }
                }
                removeAtEndTimeMs();
            }
            if (this.mEndTimeMs >= 0) {
                this.mPrevRunAtEndTimeMs = null;
                this.mNextRunAtEndTimeMs = (Run) longSparseArray.get(this.mEndTimeMs);
                if (this.mNextRunAtEndTimeMs != null) {
                    this.mNextRunAtEndTimeMs.mPrevRunAtEndTimeMs = this;
                }
                longSparseArray.put(this.mEndTimeMs, this);
                this.mStoredEndTimeMs = this.mEndTimeMs;
            }
        }
    }

    public SubtitleTrack(MediaFormat mediaFormat) {
        this.mFormat = mediaFormat;
        this.mCues = new CueList();
        clearActiveCues();
        this.mLastTimeMs = -1;
    }

    private void removeRunsByEndTimeIndex(int i) {
        Run run = (Run) this.mRunsByEndTime.valueAt(i);
        while (run != null) {
            Cue cue = run.mFirstCue;
            while (cue != null) {
                this.mCues.remove(cue);
                Cue cue2 = cue.mNextInRun;
                cue.mNextInRun = null;
                cue = cue2;
            }
            this.mRunsByID.remove(run.mRunID);
            Run run2 = run.mNextRunAtEndTimeMs;
            run.mPrevRunAtEndTimeMs = null;
            run.mNextRunAtEndTimeMs = null;
            run = run2;
        }
        this.mRunsByEndTime.removeAt(i);
    }

    private synchronized void takeTime(long j) {
        this.mLastTimeMs = j;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00df, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00fe, code lost:
        return false;
     */
    public synchronized boolean addCue(Cue cue) {
        this.mCues.add(cue);
        if (cue.mRunID != 0) {
            Run run = (Run) this.mRunsByID.get(cue.mRunID);
            if (run == null) {
                run = new Run();
                this.mRunsByID.put(cue.mRunID, run);
                run.mEndTimeMs = cue.mEndTimeMs;
            } else if (run.mEndTimeMs < cue.mEndTimeMs) {
                run.mEndTimeMs = cue.mEndTimeMs;
            }
            cue.mNextInRun = run.mFirstCue;
            run.mFirstCue = cue;
        }
        final long j = -1;
        if (this.mTimeProvider != null) {
            try {
                j = this.mTimeProvider.getCurrentTimeUs(false, true) / 1000;
            } catch (IllegalStateException e) {
            }
        }
        if (this.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mVisible=");
            sb.append(this.mVisible);
            sb.append(", ");
            sb.append(cue.mStartTimeMs);
            sb.append(" <= ");
            sb.append(j);
            sb.append(", ");
            sb.append(cue.mEndTimeMs);
            sb.append(" >= ");
            sb.append(this.mLastTimeMs);
            Log.v(str, sb.toString());
        }
        if (this.mVisible && cue.mStartTimeMs <= j && cue.mEndTimeMs >= this.mLastTimeMs) {
            if (this.mRunnable != null) {
                this.mHandler.removeCallbacks(this.mRunnable);
            }
            this.mRunnable = new Runnable() {
                public void run() {
                    synchronized (this) {
                        SubtitleTrack.this.mRunnable = null;
                        SubtitleTrack.this.updateActiveCues(true, j);
                        SubtitleTrack.this.updateView(SubtitleTrack.this.mActiveCues);
                    }
                }
            };
            if (this.mHandler.postDelayed(this.mRunnable, 10)) {
                if (this.DEBUG) {
                    Log.v(TAG, "scheduling update");
                }
            } else if (this.DEBUG) {
                Log.w(TAG, "failed to schedule subtitle view update");
            }
        } else if (this.mVisible && cue.mEndTimeMs >= this.mLastTimeMs && (cue.mStartTimeMs < this.mNextScheduledTimeMs || this.mNextScheduledTimeMs < 0)) {
            scheduleTimedEvents();
        }
    }

    /* access modifiers changed from: protected */
    public synchronized void clearActiveCues() {
        if (this.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Clearing ");
            sb.append(this.mActiveCues.size());
            sb.append(" active cues");
            Log.v(str, sb.toString());
        }
        this.mActiveCues.clear();
        this.mLastUpdateTimeMs = -1;
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        for (int size = this.mRunsByEndTime.size() - 1; size >= 0; size--) {
            removeRunsByEndTimeIndex(size);
        }
        super.finalize();
    }

    /* access modifiers changed from: protected */
    public void finishedRun(long j) {
        if (j != 0 && j != -1) {
            Run run = (Run) this.mRunsByID.get(j);
            if (run != null) {
                run.storeByEndTimeMs(this.mRunsByEndTime);
            }
        }
    }

    public final MediaFormat getFormat() {
        return this.mFormat;
    }

    public abstract RenderingWidget getRenderingWidget();

    public int getTrackType() {
        return getRenderingWidget() == null ? 3 : 4;
    }

    public void hide() {
        if (this.mVisible) {
            if (this.mTimeProvider != null) {
                this.mTimeProvider.cancelNotifications(this);
            }
            RenderingWidget renderingWidget = getRenderingWidget();
            if (renderingWidget != null) {
                renderingWidget.setVisible(false);
            }
            this.mVisible = false;
        }
    }

    public void onData(SubtitleData2 subtitleData2) {
        long startTimeUs = subtitleData2.getStartTimeUs() + 1;
        onData(subtitleData2.getData(), true, startTimeUs);
        setRunDiscardTimeMs(startTimeUs, (subtitleData2.getStartTimeUs() + subtitleData2.getDurationUs()) / 1000);
    }

    /* access modifiers changed from: protected */
    public abstract void onData(byte[] bArr, boolean z, long j);

    public void onSeek(long j) {
        if (this.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onSeek ");
            sb.append(j);
            Log.d(str, sb.toString());
        }
        synchronized (this) {
            long j2 = j / 1000;
            updateActiveCues(true, j2);
            takeTime(j2);
        }
        updateView(this.mActiveCues);
        scheduleTimedEvents();
    }

    public void onStop() {
        synchronized (this) {
            if (this.DEBUG) {
                Log.d(TAG, "onStop");
            }
            clearActiveCues();
            this.mLastTimeMs = -1;
        }
        updateView(this.mActiveCues);
        this.mNextScheduledTimeMs = -1;
        this.mTimeProvider.notifyAt(-1, this);
    }

    public void onTimedEvent(long j) {
        if (this.DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onTimedEvent ");
            sb.append(j);
            Log.d(str, sb.toString());
        }
        synchronized (this) {
            long j2 = j / 1000;
            updateActiveCues(false, j2);
            takeTime(j2);
        }
        updateView(this.mActiveCues);
        scheduleTimedEvents();
    }

    /* access modifiers changed from: protected */
    public void scheduleTimedEvents() {
        if (this.mTimeProvider != null) {
            this.mNextScheduledTimeMs = this.mCues.nextTimeAfter(this.mLastTimeMs);
            if (this.DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("sched @");
                sb.append(this.mNextScheduledTimeMs);
                sb.append(" after ");
                sb.append(this.mLastTimeMs);
                Log.d(str, sb.toString());
            }
            this.mTimeProvider.notifyAt(this.mNextScheduledTimeMs >= 0 ? this.mNextScheduledTimeMs * 1000 : -1, this);
        }
    }

    public void setRunDiscardTimeMs(long j, long j2) {
        if (j != 0 && j != -1) {
            Run run = (Run) this.mRunsByID.get(j);
            if (run != null) {
                run.mEndTimeMs = j2;
                run.storeByEndTimeMs(this.mRunsByEndTime);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x001c, code lost:
        return;
     */
    public synchronized void setTimeProvider(MediaTimeProvider mediaTimeProvider) {
        if (this.mTimeProvider != mediaTimeProvider) {
            if (this.mTimeProvider != null) {
                this.mTimeProvider.cancelNotifications(this);
            }
            this.mTimeProvider = mediaTimeProvider;
            if (this.mTimeProvider != null) {
                this.mTimeProvider.scheduleUpdate(this);
            }
        }
    }

    public void show() {
        if (!this.mVisible) {
            this.mVisible = true;
            RenderingWidget renderingWidget = getRenderingWidget();
            if (renderingWidget != null) {
                renderingWidget.setVisible(true);
            }
            if (this.mTimeProvider != null) {
                this.mTimeProvider.scheduleUpdate(this);
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0022 A[Catch:{ all -> 0x000a }] */
    public synchronized void updateActiveCues(boolean z, long j) {
        Iterator it;
        if (!z) {
            try {
                if (this.mLastUpdateTimeMs > j) {
                }
                it = this.mCues.entriesBetween(this.mLastUpdateTimeMs, j).iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    Cue cue = (Cue) pair.second;
                    if (cue.mEndTimeMs == ((Long) pair.first).longValue()) {
                        if (this.DEBUG) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Removing ");
                            sb.append(cue);
                            Log.v(str, sb.toString());
                        }
                        this.mActiveCues.remove(cue);
                        if (cue.mRunID == 0) {
                            it.remove();
                        }
                    } else if (cue.mStartTimeMs == ((Long) pair.first).longValue()) {
                        if (this.DEBUG) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Adding ");
                            sb2.append(cue);
                            Log.v(str2, sb2.toString());
                        }
                        if (cue.mInnerTimesMs != null) {
                            cue.onTime(j);
                        }
                        this.mActiveCues.add(cue);
                    } else if (cue.mInnerTimesMs != null) {
                        cue.onTime(j);
                    }
                }
                while (this.mRunsByEndTime.size() > 0 && this.mRunsByEndTime.keyAt(0) <= j) {
                    removeRunsByEndTimeIndex(0);
                }
                this.mLastUpdateTimeMs = j;
            } finally {
            }
        }
        clearActiveCues();
        it = this.mCues.entriesBetween(this.mLastUpdateTimeMs, j).iterator();
        while (it.hasNext()) {
        }
        while (this.mRunsByEndTime.size() > 0) {
            removeRunsByEndTimeIndex(0);
        }
        this.mLastUpdateTimeMs = j;
    }

    public abstract void updateView(ArrayList<Cue> arrayList);
}
