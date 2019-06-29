package android.support.v4.media.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.media.session.MediaSession;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.mediacompat.R;
import android.support.v4.app.BundleCompat;
import android.support.v4.app.NotificationBuilderWithBuilderAccessor;
import android.support.v4.app.NotificationCompat.Action;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.NotificationCompat.Style;
import android.support.v4.media.session.MediaSessionCompat.Token;
import android.widget.RemoteViews;

public class NotificationCompat {

    public static class DecoratedMediaCustomViewStyle extends MediaStyle {
        private void setBackgroundColor(RemoteViews remoteViews) {
            remoteViews.setInt(R.id.status_bar_latest_event_content, "setBackgroundColor", this.mBuilder.getColor() != 0 ? this.mBuilder.getColor() : this.mBuilder.mContext.getResources().getColor(R.color.notification_material_background_media_default_color));
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public void apply(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 24) {
                notificationBuilderWithBuilderAccessor.getBuilder().setStyle(fillInMediaStyle(new android.app.Notification.DecoratedMediaCustomViewStyle()));
            } else {
                super.apply(notificationBuilderWithBuilderAccessor);
            }
        }

        /* access modifiers changed from: 0000 */
        public int getBigContentViewLayoutResource(int i) {
            return i <= 3 ? R.layout.notification_template_big_media_narrow_custom : R.layout.notification_template_big_media_custom;
        }

        /* access modifiers changed from: 0000 */
        public int getContentViewLayoutResource() {
            return this.mBuilder.getContentView() != null ? R.layout.notification_template_media_custom : super.getContentViewLayoutResource();
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public RemoteViews makeBigContentView(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 24) {
                return null;
            }
            RemoteViews bigContentView = this.mBuilder.getBigContentView() != null ? this.mBuilder.getBigContentView() : this.mBuilder.getContentView();
            if (bigContentView == null) {
                return null;
            }
            RemoteViews generateBigContentView = generateBigContentView();
            buildIntoRemoteViews(generateBigContentView, bigContentView);
            if (VERSION.SDK_INT >= 21) {
                setBackgroundColor(generateBigContentView);
            }
            return generateBigContentView;
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public RemoteViews makeContentView(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 24) {
                return null;
            }
            boolean z = false;
            boolean z2 = this.mBuilder.getContentView() != null;
            if (VERSION.SDK_INT >= 21) {
                if (z2 || this.mBuilder.getBigContentView() != null) {
                    z = true;
                }
                if (z) {
                    RemoteViews generateContentView = generateContentView();
                    if (z2) {
                        buildIntoRemoteViews(generateContentView, this.mBuilder.getContentView());
                    }
                    setBackgroundColor(generateContentView);
                    return generateContentView;
                }
            } else {
                RemoteViews generateContentView2 = generateContentView();
                if (z2) {
                    buildIntoRemoteViews(generateContentView2, this.mBuilder.getContentView());
                    return generateContentView2;
                }
            }
            return null;
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public RemoteViews makeHeadsUpContentView(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 24) {
                return null;
            }
            RemoteViews headsUpContentView = this.mBuilder.getHeadsUpContentView() != null ? this.mBuilder.getHeadsUpContentView() : this.mBuilder.getContentView();
            if (headsUpContentView == null) {
                return null;
            }
            RemoteViews generateBigContentView = generateBigContentView();
            buildIntoRemoteViews(generateBigContentView, headsUpContentView);
            if (VERSION.SDK_INT >= 21) {
                setBackgroundColor(generateBigContentView);
            }
            return generateBigContentView;
        }
    }

    public static class MediaStyle extends Style {
        private static final int MAX_MEDIA_BUTTONS = 5;
        private static final int MAX_MEDIA_BUTTONS_IN_COMPACT = 3;
        int[] mActionsToShowInCompact = null;
        PendingIntent mCancelButtonIntent;
        boolean mShowCancelButton;
        Token mToken;

        public MediaStyle() {
        }

        public MediaStyle(Builder builder) {
            setBuilder(builder);
        }

        private RemoteViews generateMediaActionButton(Action action) {
            boolean z = action.getActionIntent() == null;
            RemoteViews remoteViews = new RemoteViews(this.mBuilder.mContext.getPackageName(), R.layout.notification_media_action);
            remoteViews.setImageViewResource(R.id.action0, action.getIcon());
            if (!z) {
                remoteViews.setOnClickPendingIntent(R.id.action0, action.getActionIntent());
            }
            if (VERSION.SDK_INT >= 15) {
                remoteViews.setContentDescription(R.id.action0, action.getTitle());
            }
            return remoteViews;
        }

        public static Token getMediaSession(Notification notification) {
            Bundle extras = android.support.v4.app.NotificationCompat.getExtras(notification);
            if (extras != null) {
                if (VERSION.SDK_INT >= 21) {
                    Parcelable parcelable = extras.getParcelable(android.support.v4.app.NotificationCompat.EXTRA_MEDIA_SESSION);
                    if (parcelable != null) {
                        return Token.fromToken(parcelable);
                    }
                } else {
                    IBinder binder = BundleCompat.getBinder(extras, android.support.v4.app.NotificationCompat.EXTRA_MEDIA_SESSION);
                    if (binder != null) {
                        Parcel obtain = Parcel.obtain();
                        obtain.writeStrongBinder(binder);
                        obtain.setDataPosition(0);
                        Token token = (Token) Token.CREATOR.createFromParcel(obtain);
                        obtain.recycle();
                        return token;
                    }
                }
            }
            return null;
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public void apply(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 21) {
                notificationBuilderWithBuilderAccessor.getBuilder().setStyle(fillInMediaStyle(new android.app.Notification.MediaStyle()));
            } else if (this.mShowCancelButton) {
                notificationBuilderWithBuilderAccessor.getBuilder().setOngoing(true);
            }
        }

        /* access modifiers changed from: 0000 */
        @RequiresApi(21)
        public android.app.Notification.MediaStyle fillInMediaStyle(android.app.Notification.MediaStyle mediaStyle) {
            if (this.mActionsToShowInCompact != null) {
                mediaStyle.setShowActionsInCompactView(this.mActionsToShowInCompact);
            }
            if (this.mToken != null) {
                mediaStyle.setMediaSession((MediaSession.Token) this.mToken.getToken());
            }
            return mediaStyle;
        }

        /* access modifiers changed from: 0000 */
        public RemoteViews generateBigContentView() {
            int min = Math.min(this.mBuilder.mActions.size(), 5);
            RemoteViews applyStandardTemplate = applyStandardTemplate(false, getBigContentViewLayoutResource(min), false);
            applyStandardTemplate.removeAllViews(R.id.media_actions);
            if (min > 0) {
                for (int i = 0; i < min; i++) {
                    applyStandardTemplate.addView(R.id.media_actions, generateMediaActionButton((Action) this.mBuilder.mActions.get(i)));
                }
            }
            if (this.mShowCancelButton) {
                applyStandardTemplate.setViewVisibility(R.id.cancel_action, 0);
                applyStandardTemplate.setInt(R.id.cancel_action, "setAlpha", this.mBuilder.mContext.getResources().getInteger(R.integer.cancel_button_image_alpha));
                applyStandardTemplate.setOnClickPendingIntent(R.id.cancel_action, this.mCancelButtonIntent);
            } else {
                applyStandardTemplate.setViewVisibility(R.id.cancel_action, 8);
            }
            return applyStandardTemplate;
        }

        /* access modifiers changed from: 0000 */
        public RemoteViews generateContentView() {
            RemoteViews applyStandardTemplate = applyStandardTemplate(false, getContentViewLayoutResource(), true);
            int size = this.mBuilder.mActions.size();
            int min = this.mActionsToShowInCompact == null ? 0 : Math.min(this.mActionsToShowInCompact.length, 3);
            applyStandardTemplate.removeAllViews(R.id.media_actions);
            if (min > 0) {
                int i = 0;
                while (i < min) {
                    if (i < size) {
                        applyStandardTemplate.addView(R.id.media_actions, generateMediaActionButton((Action) this.mBuilder.mActions.get(this.mActionsToShowInCompact[i])));
                        i++;
                    } else {
                        throw new IllegalArgumentException(String.format("setShowActionsInCompactView: action %d out of bounds (max %d)", new Object[]{Integer.valueOf(i), Integer.valueOf(size - 1)}));
                    }
                }
            }
            if (this.mShowCancelButton) {
                applyStandardTemplate.setViewVisibility(R.id.end_padder, 8);
                applyStandardTemplate.setViewVisibility(R.id.cancel_action, 0);
                applyStandardTemplate.setOnClickPendingIntent(R.id.cancel_action, this.mCancelButtonIntent);
                applyStandardTemplate.setInt(R.id.cancel_action, "setAlpha", this.mBuilder.mContext.getResources().getInteger(R.integer.cancel_button_image_alpha));
            } else {
                applyStandardTemplate.setViewVisibility(R.id.end_padder, 0);
                applyStandardTemplate.setViewVisibility(R.id.cancel_action, 8);
            }
            return applyStandardTemplate;
        }

        /* access modifiers changed from: 0000 */
        public int getBigContentViewLayoutResource(int i) {
            return i <= 3 ? R.layout.notification_template_big_media_narrow : R.layout.notification_template_big_media;
        }

        /* access modifiers changed from: 0000 */
        public int getContentViewLayoutResource() {
            return R.layout.notification_template_media;
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public RemoteViews makeBigContentView(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 21) {
                return null;
            }
            return generateBigContentView();
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public RemoteViews makeContentView(NotificationBuilderWithBuilderAccessor notificationBuilderWithBuilderAccessor) {
            if (VERSION.SDK_INT >= 21) {
                return null;
            }
            return generateContentView();
        }

        public MediaStyle setCancelButtonIntent(PendingIntent pendingIntent) {
            this.mCancelButtonIntent = pendingIntent;
            return this;
        }

        public MediaStyle setMediaSession(Token token) {
            this.mToken = token;
            return this;
        }

        public MediaStyle setShowActionsInCompactView(int... iArr) {
            this.mActionsToShowInCompact = iArr;
            return this;
        }

        public MediaStyle setShowCancelButton(boolean z) {
            if (VERSION.SDK_INT < 21) {
                this.mShowCancelButton = z;
            }
            return this;
        }
    }

    private NotificationCompat() {
    }
}
