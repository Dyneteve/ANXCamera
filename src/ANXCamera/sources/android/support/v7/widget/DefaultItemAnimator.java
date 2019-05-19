package android.support.v7.widget;

import android.support.v4.animation.AnimatorCompatHelper;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DefaultItemAnimator extends ItemAnimator {
    private static final boolean DEBUG = false;
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mAddAnimations = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ArrayList<ViewHolder>> mAdditionsList = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mChangeAnimations = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ArrayList<ChangeInfo>> mChangesList = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mMoveAnimations = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ArrayList<MoveInfo>> mMovesList = new ArrayList<>();
    private ArrayList<ViewHolder> mPendingAdditions = new ArrayList<>();
    private ArrayList<ChangeInfo> mPendingChanges = new ArrayList<>();
    private ArrayList<MoveInfo> mPendingMoves = new ArrayList<>();
    private ArrayList<ViewHolder> mPendingRemovals = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<ViewHolder> mRemoveAnimations = new ArrayList<>();

    private static class ChangeInfo {
        public int fromX;
        public int fromY;
        public ViewHolder newHolder;
        public ViewHolder oldHolder;
        public int toX;
        public int toY;

        private ChangeInfo(ViewHolder oldHolder2, ViewHolder newHolder2) {
            this.oldHolder = oldHolder2;
            this.newHolder = newHolder2;
        }

        private ChangeInfo(ViewHolder oldHolder2, ViewHolder newHolder2, int fromX2, int fromY2, int toX2, int toY2) {
            this(oldHolder2, newHolder2);
            this.fromX = fromX2;
            this.fromY = fromY2;
            this.toX = toX2;
            this.toY = toY2;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("ChangeInfo{oldHolder=");
            sb.append(this.oldHolder);
            sb.append(", newHolder=");
            sb.append(this.newHolder);
            sb.append(", fromX=");
            sb.append(this.fromX);
            sb.append(", fromY=");
            sb.append(this.fromY);
            sb.append(", toX=");
            sb.append(this.toX);
            sb.append(", toY=");
            sb.append(this.toY);
            sb.append('}');
            return sb.toString();
        }
    }

    private static class MoveInfo {
        public int fromX;
        public int fromY;
        public ViewHolder holder;
        public int toX;
        public int toY;

        private MoveInfo(ViewHolder holder2, int fromX2, int fromY2, int toX2, int toY2) {
            this.holder = holder2;
            this.fromX = fromX2;
            this.fromY = fromY2;
            this.toX = toX2;
            this.toY = toY2;
        }
    }

    private static class VpaListenerAdapter implements ViewPropertyAnimatorListener {
        private VpaListenerAdapter() {
        }

        public void onAnimationStart(View view) {
        }

        public void onAnimationEnd(View view) {
        }

        public void onAnimationCancel(View view) {
        }
    }

    public void runPendingAnimations() {
        boolean removalsPending = !this.mPendingRemovals.isEmpty();
        boolean movesPending = !this.mPendingMoves.isEmpty();
        boolean changesPending = !this.mPendingChanges.isEmpty();
        boolean additionsPending = !this.mPendingAdditions.isEmpty();
        if (removalsPending || movesPending || additionsPending || changesPending) {
            Iterator i$ = this.mPendingRemovals.iterator();
            while (i$.hasNext()) {
                animateRemoveImpl((ViewHolder) i$.next());
            }
            this.mPendingRemovals.clear();
            if (movesPending) {
                final ArrayList<MoveInfo> moves = new ArrayList<>();
                moves.addAll(this.mPendingMoves);
                this.mMovesList.add(moves);
                this.mPendingMoves.clear();
                Runnable mover = new Runnable() {
                    public void run() {
                        Iterator i$ = moves.iterator();
                        while (i$.hasNext()) {
                            MoveInfo moveInfo = (MoveInfo) i$.next();
                            DefaultItemAnimator.this.animateMoveImpl(moveInfo.holder, moveInfo.fromX, moveInfo.fromY, moveInfo.toX, moveInfo.toY);
                        }
                        moves.clear();
                        DefaultItemAnimator.this.mMovesList.remove(moves);
                    }
                };
                if (removalsPending) {
                    ViewCompat.postOnAnimationDelayed(((MoveInfo) moves.get(0)).holder.itemView, mover, getRemoveDuration());
                } else {
                    mover.run();
                }
            }
            if (changesPending) {
                final ArrayList<ChangeInfo> changes = new ArrayList<>();
                changes.addAll(this.mPendingChanges);
                this.mChangesList.add(changes);
                this.mPendingChanges.clear();
                Runnable changer = new Runnable() {
                    public void run() {
                        Iterator i$ = changes.iterator();
                        while (i$.hasNext()) {
                            DefaultItemAnimator.this.animateChangeImpl((ChangeInfo) i$.next());
                        }
                        changes.clear();
                        DefaultItemAnimator.this.mChangesList.remove(changes);
                    }
                };
                if (removalsPending) {
                    ViewCompat.postOnAnimationDelayed(((ChangeInfo) changes.get(0)).oldHolder.itemView, changer, getRemoveDuration());
                } else {
                    changer.run();
                }
            }
            if (additionsPending) {
                final ArrayList<ViewHolder> additions = new ArrayList<>();
                additions.addAll(this.mPendingAdditions);
                this.mAdditionsList.add(additions);
                this.mPendingAdditions.clear();
                Runnable adder = new Runnable() {
                    public void run() {
                        Iterator i$ = additions.iterator();
                        while (i$.hasNext()) {
                            DefaultItemAnimator.this.animateAddImpl((ViewHolder) i$.next());
                        }
                        additions.clear();
                        DefaultItemAnimator.this.mAdditionsList.remove(additions);
                    }
                };
                if (removalsPending || movesPending || changesPending) {
                    long changeDuration = 0;
                    long removeDuration = removalsPending ? getRemoveDuration() : 0;
                    long moveDuration = movesPending ? getMoveDuration() : 0;
                    if (changesPending) {
                        changeDuration = getChangeDuration();
                    }
                    ViewCompat.postOnAnimationDelayed(((ViewHolder) additions.get(0)).itemView, adder, Math.max(moveDuration, changeDuration) + removeDuration);
                } else {
                    adder.run();
                }
            }
        }
    }

    public boolean animateRemove(ViewHolder holder) {
        resetAnimation(holder);
        this.mPendingRemovals.add(holder);
        return true;
    }

    private void animateRemoveImpl(final ViewHolder holder) {
        final ViewPropertyAnimatorCompat animation = ViewCompat.animate(holder.itemView);
        this.mRemoveAnimations.add(holder);
        animation.setDuration(getRemoveDuration()).alpha(0.0f).setListener(new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchRemoveStarting(holder);
            }

            public void onAnimationEnd(View view) {
                animation.setListener(null);
                ViewCompat.setAlpha(view, 1.0f);
                DefaultItemAnimator.this.dispatchRemoveFinished(holder);
                DefaultItemAnimator.this.mRemoveAnimations.remove(holder);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        }).start();
    }

    public boolean animateAdd(ViewHolder holder) {
        resetAnimation(holder);
        ViewCompat.setAlpha(holder.itemView, 0.0f);
        this.mPendingAdditions.add(holder);
        return true;
    }

    /* access modifiers changed from: private */
    public void animateAddImpl(final ViewHolder holder) {
        final ViewPropertyAnimatorCompat animation = ViewCompat.animate(holder.itemView);
        this.mAddAnimations.add(holder);
        animation.alpha(1.0f).setDuration(getAddDuration()).setListener(new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchAddStarting(holder);
            }

            public void onAnimationCancel(View view) {
                ViewCompat.setAlpha(view, 1.0f);
            }

            public void onAnimationEnd(View view) {
                animation.setListener(null);
                DefaultItemAnimator.this.dispatchAddFinished(holder);
                DefaultItemAnimator.this.mAddAnimations.remove(holder);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        }).start();
    }

    public boolean animateMove(ViewHolder holder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = holder;
        View view = viewHolder.itemView;
        int fromX2 = (int) (((float) fromX) + ViewCompat.getTranslationX(viewHolder.itemView));
        int fromY2 = (int) (((float) fromY) + ViewCompat.getTranslationY(viewHolder.itemView));
        resetAnimation(holder);
        int deltaX = toX - fromX2;
        int deltaY = toY - fromY2;
        if (deltaX == 0 && deltaY == 0) {
            dispatchMoveFinished(holder);
            return false;
        }
        if (deltaX != 0) {
            ViewCompat.setTranslationX(view, (float) (-deltaX));
        }
        if (deltaY != 0) {
            ViewCompat.setTranslationY(view, (float) (-deltaY));
        }
        MoveInfo moveInfo = r0;
        View view2 = view;
        ArrayList<MoveInfo> arrayList = this.mPendingMoves;
        MoveInfo moveInfo2 = new MoveInfo(viewHolder, fromX2, fromY2, toX, toY);
        arrayList.add(moveInfo);
        return true;
    }

    /* access modifiers changed from: private */
    public void animateMoveImpl(ViewHolder holder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = holder;
        View view = viewHolder.itemView;
        int deltaX = toX - fromX;
        int deltaY = toY - fromY;
        if (deltaX != 0) {
            ViewCompat.animate(view).translationX(0.0f);
        }
        if (deltaY != 0) {
            ViewCompat.animate(view).translationY(0.0f);
        }
        ViewPropertyAnimatorCompat animation = ViewCompat.animate(view);
        this.mMoveAnimations.add(viewHolder);
        final ViewHolder viewHolder2 = viewHolder;
        final int i = deltaX;
        AnonymousClass6 r6 = r0;
        final int i2 = deltaY;
        View view2 = view;
        ViewPropertyAnimatorCompat duration = animation.setDuration(getMoveDuration());
        final ViewPropertyAnimatorCompat viewPropertyAnimatorCompat = animation;
        AnonymousClass6 r0 = new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchMoveStarting(viewHolder2);
            }

            public void onAnimationCancel(View view) {
                if (i != 0) {
                    ViewCompat.setTranslationX(view, 0.0f);
                }
                if (i2 != 0) {
                    ViewCompat.setTranslationY(view, 0.0f);
                }
            }

            public void onAnimationEnd(View view) {
                viewPropertyAnimatorCompat.setListener(null);
                DefaultItemAnimator.this.dispatchMoveFinished(viewHolder2);
                DefaultItemAnimator.this.mMoveAnimations.remove(viewHolder2);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        };
        duration.setListener(r6).start();
    }

    public boolean animateChange(ViewHolder oldHolder, ViewHolder newHolder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = oldHolder;
        ViewHolder viewHolder2 = newHolder;
        float prevTranslationX = ViewCompat.getTranslationX(viewHolder.itemView);
        float prevTranslationY = ViewCompat.getTranslationY(viewHolder.itemView);
        float prevAlpha = ViewCompat.getAlpha(viewHolder.itemView);
        resetAnimation(oldHolder);
        int deltaX = (int) (((float) (toX - fromX)) - prevTranslationX);
        int deltaY = (int) (((float) (toY - fromY)) - prevTranslationY);
        ViewCompat.setTranslationX(viewHolder.itemView, prevTranslationX);
        ViewCompat.setTranslationY(viewHolder.itemView, prevTranslationY);
        ViewCompat.setAlpha(viewHolder.itemView, prevAlpha);
        if (!(viewHolder2 == null || viewHolder2.itemView == null)) {
            resetAnimation(viewHolder2);
            ViewCompat.setTranslationX(viewHolder2.itemView, (float) (-deltaX));
            ViewCompat.setTranslationY(viewHolder2.itemView, (float) (-deltaY));
            ViewCompat.setAlpha(viewHolder2.itemView, 0.0f);
        }
        ChangeInfo changeInfo = r1;
        ArrayList<ChangeInfo> arrayList = this.mPendingChanges;
        int i = deltaY;
        int i2 = deltaX;
        ChangeInfo changeInfo2 = new ChangeInfo(viewHolder, viewHolder2, fromX, fromY, toX, toY);
        arrayList.add(changeInfo);
        return true;
    }

    /* access modifiers changed from: private */
    public void animateChangeImpl(final ChangeInfo changeInfo) {
        ViewHolder holder = changeInfo.oldHolder;
        final View newView = null;
        View view = holder == null ? null : holder.itemView;
        ViewHolder newHolder = changeInfo.newHolder;
        if (newHolder != null) {
            newView = newHolder.itemView;
        }
        if (view != null) {
            final ViewPropertyAnimatorCompat oldViewAnim = ViewCompat.animate(view).setDuration(getChangeDuration());
            this.mChangeAnimations.add(changeInfo.oldHolder);
            oldViewAnim.translationX((float) (changeInfo.toX - changeInfo.fromX));
            oldViewAnim.translationY((float) (changeInfo.toY - changeInfo.fromY));
            oldViewAnim.alpha(0.0f).setListener(new VpaListenerAdapter() {
                public void onAnimationStart(View view) {
                    DefaultItemAnimator.this.dispatchChangeStarting(changeInfo.oldHolder, true);
                }

                public void onAnimationEnd(View view) {
                    oldViewAnim.setListener(null);
                    ViewCompat.setAlpha(view, 1.0f);
                    ViewCompat.setTranslationX(view, 0.0f);
                    ViewCompat.setTranslationY(view, 0.0f);
                    DefaultItemAnimator.this.dispatchChangeFinished(changeInfo.oldHolder, true);
                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.oldHolder);
                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                }
            }).start();
        }
        if (newView != null) {
            final ViewPropertyAnimatorCompat newViewAnimation = ViewCompat.animate(newView);
            this.mChangeAnimations.add(changeInfo.newHolder);
            newViewAnimation.translationX(0.0f).translationY(0.0f).setDuration(getChangeDuration()).alpha(1.0f).setListener(new VpaListenerAdapter() {
                public void onAnimationStart(View view) {
                    DefaultItemAnimator.this.dispatchChangeStarting(changeInfo.newHolder, false);
                }

                public void onAnimationEnd(View view) {
                    newViewAnimation.setListener(null);
                    ViewCompat.setAlpha(newView, 1.0f);
                    ViewCompat.setTranslationX(newView, 0.0f);
                    ViewCompat.setTranslationY(newView, 0.0f);
                    DefaultItemAnimator.this.dispatchChangeFinished(changeInfo.newHolder, false);
                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.newHolder);
                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                }
            }).start();
        }
    }

    private void endChangeAnimation(List<ChangeInfo> infoList, ViewHolder item) {
        for (int i = infoList.size() - 1; i >= 0; i--) {
            ChangeInfo changeInfo = (ChangeInfo) infoList.get(i);
            if (endChangeAnimationIfNecessary(changeInfo, item) && changeInfo.oldHolder == null && changeInfo.newHolder == null) {
                infoList.remove(changeInfo);
            }
        }
    }

    private void endChangeAnimationIfNecessary(ChangeInfo changeInfo) {
        if (changeInfo.oldHolder != null) {
            endChangeAnimationIfNecessary(changeInfo, changeInfo.oldHolder);
        }
        if (changeInfo.newHolder != null) {
            endChangeAnimationIfNecessary(changeInfo, changeInfo.newHolder);
        }
    }

    private boolean endChangeAnimationIfNecessary(ChangeInfo changeInfo, ViewHolder item) {
        boolean oldItem = false;
        if (changeInfo.newHolder == item) {
            changeInfo.newHolder = null;
        } else if (changeInfo.oldHolder != item) {
            return false;
        } else {
            changeInfo.oldHolder = null;
            oldItem = true;
        }
        ViewCompat.setAlpha(item.itemView, 1.0f);
        ViewCompat.setTranslationX(item.itemView, 0.0f);
        ViewCompat.setTranslationY(item.itemView, 0.0f);
        dispatchChangeFinished(item, oldItem);
        return true;
    }

    public void endAnimation(ViewHolder item) {
        View view = item.itemView;
        ViewCompat.animate(view).cancel();
        int i = this.mPendingMoves.size();
        while (true) {
            i--;
            if (i < 0) {
                break;
            } else if (((MoveInfo) this.mPendingMoves.get(i)).holder == item) {
                ViewCompat.setTranslationY(view, 0.0f);
                ViewCompat.setTranslationX(view, 0.0f);
                dispatchMoveFinished(item);
                this.mPendingMoves.remove(i);
            }
        }
        endChangeAnimation(this.mPendingChanges, item);
        if (this.mPendingRemovals.remove(item)) {
            ViewCompat.setAlpha(view, 1.0f);
            dispatchRemoveFinished(item);
        }
        if (this.mPendingAdditions.remove(item)) {
            ViewCompat.setAlpha(view, 1.0f);
            dispatchAddFinished(item);
        }
        for (int i2 = this.mChangesList.size() - 1; i2 >= 0; i2--) {
            ArrayList<ChangeInfo> changes = (ArrayList) this.mChangesList.get(i2);
            endChangeAnimation(changes, item);
            if (changes.isEmpty()) {
                this.mChangesList.remove(i2);
            }
        }
        for (int i3 = this.mMovesList.size() - 1; i3 >= 0; i3--) {
            ArrayList<MoveInfo> moves = (ArrayList) this.mMovesList.get(i3);
            int j = moves.size() - 1;
            while (true) {
                if (j < 0) {
                    break;
                } else if (((MoveInfo) moves.get(j)).holder == item) {
                    ViewCompat.setTranslationY(view, 0.0f);
                    ViewCompat.setTranslationX(view, 0.0f);
                    dispatchMoveFinished(item);
                    moves.remove(j);
                    if (moves.isEmpty()) {
                        this.mMovesList.remove(i3);
                    }
                } else {
                    j--;
                }
            }
        }
        for (int i4 = this.mAdditionsList.size() - 1; i4 >= 0; i4--) {
            ArrayList<ViewHolder> additions = (ArrayList) this.mAdditionsList.get(i4);
            if (additions.remove(item)) {
                ViewCompat.setAlpha(view, 1.0f);
                dispatchAddFinished(item);
                if (additions.isEmpty()) {
                    this.mAdditionsList.remove(i4);
                }
            }
        }
        this.mRemoveAnimations.remove(item);
        this.mAddAnimations.remove(item);
        this.mChangeAnimations.remove(item);
        this.mMoveAnimations.remove(item);
        dispatchFinishedWhenDone();
    }

    private void resetAnimation(ViewHolder holder) {
        AnimatorCompatHelper.clearInterpolator(holder.itemView);
        endAnimation(holder);
    }

    public boolean isRunning() {
        return !this.mPendingAdditions.isEmpty() || !this.mPendingChanges.isEmpty() || !this.mPendingMoves.isEmpty() || !this.mPendingRemovals.isEmpty() || !this.mMoveAnimations.isEmpty() || !this.mRemoveAnimations.isEmpty() || !this.mAddAnimations.isEmpty() || !this.mChangeAnimations.isEmpty() || !this.mMovesList.isEmpty() || !this.mAdditionsList.isEmpty() || !this.mChangesList.isEmpty();
    }

    /* access modifiers changed from: private */
    public void dispatchFinishedWhenDone() {
        if (!isRunning()) {
            dispatchAnimationsFinished();
        }
    }

    public void endAnimations() {
        for (int i = this.mPendingMoves.size() - 1; i >= 0; i--) {
            MoveInfo item = (MoveInfo) this.mPendingMoves.get(i);
            View view = item.holder.itemView;
            ViewCompat.setTranslationY(view, 0.0f);
            ViewCompat.setTranslationX(view, 0.0f);
            dispatchMoveFinished(item.holder);
            this.mPendingMoves.remove(i);
        }
        for (int i2 = this.mPendingRemovals.size() - 1; i2 >= 0; i2--) {
            dispatchRemoveFinished((ViewHolder) this.mPendingRemovals.get(i2));
            this.mPendingRemovals.remove(i2);
        }
        for (int i3 = this.mPendingAdditions.size() - 1; i3 >= 0; i3--) {
            ViewHolder item2 = (ViewHolder) this.mPendingAdditions.get(i3);
            ViewCompat.setAlpha(item2.itemView, 1.0f);
            dispatchAddFinished(item2);
            this.mPendingAdditions.remove(i3);
        }
        for (int i4 = this.mPendingChanges.size() - 1; i4 >= 0; i4--) {
            endChangeAnimationIfNecessary((ChangeInfo) this.mPendingChanges.get(i4));
        }
        this.mPendingChanges.clear();
        if (isRunning()) {
            for (int i5 = this.mMovesList.size() - 1; i5 >= 0; i5--) {
                ArrayList<MoveInfo> moves = (ArrayList) this.mMovesList.get(i5);
                for (int j = moves.size() - 1; j >= 0; j--) {
                    MoveInfo moveInfo = (MoveInfo) moves.get(j);
                    View view2 = moveInfo.holder.itemView;
                    ViewCompat.setTranslationY(view2, 0.0f);
                    ViewCompat.setTranslationX(view2, 0.0f);
                    dispatchMoveFinished(moveInfo.holder);
                    moves.remove(j);
                    if (moves.isEmpty()) {
                        this.mMovesList.remove(moves);
                    }
                }
            }
            for (int i6 = this.mAdditionsList.size() - 1; i6 >= 0; i6--) {
                ArrayList<ViewHolder> additions = (ArrayList) this.mAdditionsList.get(i6);
                for (int j2 = additions.size() - 1; j2 >= 0; j2--) {
                    ViewHolder item3 = (ViewHolder) additions.get(j2);
                    ViewCompat.setAlpha(item3.itemView, 1.0f);
                    dispatchAddFinished(item3);
                    additions.remove(j2);
                    if (additions.isEmpty()) {
                        this.mAdditionsList.remove(additions);
                    }
                }
            }
            for (int i7 = this.mChangesList.size() - 1; i7 >= 0; i7--) {
                ArrayList<ChangeInfo> changes = (ArrayList) this.mChangesList.get(i7);
                for (int j3 = changes.size() - 1; j3 >= 0; j3--) {
                    endChangeAnimationIfNecessary((ChangeInfo) changes.get(j3));
                    if (changes.isEmpty()) {
                        this.mChangesList.remove(changes);
                    }
                }
            }
            cancelAll(this.mRemoveAnimations);
            cancelAll(this.mMoveAnimations);
            cancelAll(this.mAddAnimations);
            cancelAll(this.mChangeAnimations);
            dispatchAnimationsFinished();
        }
    }

    /* access modifiers changed from: 0000 */
    public void cancelAll(List<ViewHolder> viewHolders) {
        for (int i = viewHolders.size() - 1; i >= 0; i--) {
            ViewCompat.animate(((ViewHolder) viewHolders.get(i)).itemView).cancel();
        }
    }
}
