package com.bumptech.glide.manager;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import android.view.View;
import com.bumptech.glide.c;
import com.bumptech.glide.i;
import com.bumptech.glide.util.k;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/* compiled from: RequestManagerRetriever */
public class l implements Callback {
    @VisibleForTesting
    static final String FRAGMENT_TAG = "com.bumptech.glide.manager";
    private static final String TAG = "RMRetriever";
    private static final int ng = 1;
    private static final int nh = 2;
    private static final String ni = "key";
    private static final a no = new a() {
        @NonNull
        public i a(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context) {
            return new i(cVar, hVar, mVar, context);
        }
    };
    private final Handler handler;
    private volatile i nj;
    private final a nk;
    private final ArrayMap<View, Fragment> nl = new ArrayMap<>();
    private final ArrayMap<View, android.app.Fragment> nm = new ArrayMap<>();
    private final Bundle nn = new Bundle();
    @VisibleForTesting
    final Map<FragmentManager, k> pendingRequestManagerFragments = new HashMap();
    @VisibleForTesting
    final Map<android.support.v4.app.FragmentManager, SupportRequestManagerFragment> pendingSupportRequestManagerFragments = new HashMap();

    /* compiled from: RequestManagerRetriever */
    public interface a {
        @NonNull
        i a(@NonNull c cVar, @NonNull h hVar, @NonNull m mVar, @NonNull Context context);
    }

    public l(@Nullable a aVar) {
        if (aVar == null) {
            aVar = no;
        }
        this.nk = aVar;
        this.handler = new Handler(Looper.getMainLooper(), this);
    }

    @Nullable
    @Deprecated
    private android.app.Fragment a(@NonNull View view, @NonNull Activity activity) {
        this.nm.clear();
        a(activity.getFragmentManager(), this.nm);
        View findViewById = activity.findViewById(16908290);
        android.app.Fragment fragment = null;
        while (!view.equals(findViewById)) {
            fragment = (android.app.Fragment) this.nm.get(view);
            if (fragment != null || !(view.getParent() instanceof View)) {
                break;
            }
            view = (View) view.getParent();
        }
        this.nm.clear();
        return fragment;
    }

    @Nullable
    private Fragment a(@NonNull View view, @NonNull FragmentActivity fragmentActivity) {
        this.nl.clear();
        a((Collection<Fragment>) fragmentActivity.getSupportFragmentManager().getFragments(), (Map<View, Fragment>) this.nl);
        View findViewById = fragmentActivity.findViewById(16908290);
        Fragment fragment = null;
        while (!view.equals(findViewById)) {
            fragment = (Fragment) this.nl.get(view);
            if (fragment != null || !(view.getParent() instanceof View)) {
                break;
            }
            view = (View) view.getParent();
        }
        this.nl.clear();
        return fragment;
    }

    @Deprecated
    @NonNull
    private i a(@NonNull Context context, @NonNull FragmentManager fragmentManager, @Nullable android.app.Fragment fragment, boolean z) {
        k a2 = a(fragmentManager, fragment, z);
        i cY = a2.cY();
        if (cY != null) {
            return cY;
        }
        i a3 = this.nk.a(c.c(context), a2.cX(), a2.cZ(), context);
        a2.c(a3);
        return a3;
    }

    @NonNull
    private i a(@NonNull Context context, @NonNull android.support.v4.app.FragmentManager fragmentManager, @Nullable Fragment fragment, boolean z) {
        SupportRequestManagerFragment a2 = a(fragmentManager, fragment, z);
        i cY = a2.cY();
        if (cY != null) {
            return cY;
        }
        i a3 = this.nk.a(c.c(context), a2.cX(), a2.cZ(), context);
        a2.c(a3);
        return a3;
    }

    @NonNull
    private SupportRequestManagerFragment a(@NonNull android.support.v4.app.FragmentManager fragmentManager, @Nullable Fragment fragment, boolean z) {
        SupportRequestManagerFragment supportRequestManagerFragment = (SupportRequestManagerFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (supportRequestManagerFragment == null) {
            supportRequestManagerFragment = (SupportRequestManagerFragment) this.pendingSupportRequestManagerFragments.get(fragmentManager);
            if (supportRequestManagerFragment == null) {
                supportRequestManagerFragment = new SupportRequestManagerFragment();
                supportRequestManagerFragment.c(fragment);
                if (z) {
                    supportRequestManagerFragment.cX().onStart();
                }
                this.pendingSupportRequestManagerFragments.put(fragmentManager, supportRequestManagerFragment);
                fragmentManager.beginTransaction().add((Fragment) supportRequestManagerFragment, FRAGMENT_TAG).commitAllowingStateLoss();
                this.handler.obtainMessage(2, fragmentManager).sendToTarget();
            }
        }
        return supportRequestManagerFragment;
    }

    @NonNull
    private k a(@NonNull FragmentManager fragmentManager, @Nullable android.app.Fragment fragment, boolean z) {
        k kVar = (k) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
        if (kVar == null) {
            kVar = (k) this.pendingRequestManagerFragments.get(fragmentManager);
            if (kVar == null) {
                kVar = new k();
                kVar.b(fragment);
                if (z) {
                    kVar.cX().onStart();
                }
                this.pendingRequestManagerFragments.put(fragmentManager, kVar);
                fragmentManager.beginTransaction().add(kVar, FRAGMENT_TAG).commitAllowingStateLoss();
                this.handler.obtainMessage(1, fragmentManager).sendToTarget();
            }
        }
        return kVar;
    }

    @TargetApi(26)
    @Deprecated
    private void a(@NonNull FragmentManager fragmentManager, @NonNull ArrayMap<View, android.app.Fragment> arrayMap) {
        if (VERSION.SDK_INT >= 26) {
            for (android.app.Fragment fragment : fragmentManager.getFragments()) {
                if (fragment.getView() != null) {
                    arrayMap.put(fragment.getView(), fragment);
                    a(fragment.getChildFragmentManager(), arrayMap);
                }
            }
            return;
        }
        b(fragmentManager, arrayMap);
    }

    private static void a(@Nullable Collection<Fragment> collection, @NonNull Map<View, Fragment> map) {
        if (collection != null) {
            for (Fragment fragment : collection) {
                if (fragment != null) {
                    if (fragment.getView() != null) {
                        map.put(fragment.getView(), fragment);
                        a((Collection<Fragment>) fragment.getChildFragmentManager().getFragments(), map);
                    }
                }
            }
        }
    }

    @Deprecated
    private void b(@NonNull FragmentManager fragmentManager, @NonNull ArrayMap<View, android.app.Fragment> arrayMap) {
        int i = 0;
        while (true) {
            int i2 = i + 1;
            this.nn.putInt(ni, i);
            android.app.Fragment fragment = null;
            try {
                fragment = fragmentManager.getFragment(this.nn, ni);
            } catch (Exception e) {
            }
            if (fragment != null) {
                if (fragment.getView() != null) {
                    arrayMap.put(fragment.getView(), fragment);
                    if (VERSION.SDK_INT >= 17) {
                        a(fragment.getChildFragmentManager(), arrayMap);
                    }
                }
                i = i2;
            } else {
                return;
            }
        }
    }

    @TargetApi(17)
    private static void d(@NonNull Activity activity) {
        if (VERSION.SDK_INT >= 17 && activity.isDestroyed()) {
            throw new IllegalArgumentException("You cannot start a load for a destroyed activity");
        }
    }

    private static boolean f(Activity activity) {
        return !activity.isFinishing();
    }

    @NonNull
    private i i(@NonNull Context context) {
        if (this.nj == null) {
            synchronized (this) {
                if (this.nj == null) {
                    this.nj = this.nk.a(c.c(context.getApplicationContext()), new b(), new g(), context.getApplicationContext());
                }
            }
        }
        return this.nj;
    }

    @Nullable
    private Activity k(@NonNull Context context) {
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof ContextWrapper) {
            return k(((ContextWrapper) context).getBaseContext());
        }
        return null;
    }

    @NonNull
    public i b(@NonNull Fragment fragment) {
        com.bumptech.glide.util.i.a(fragment.getActivity(), "You cannot start a load on a fragment before it is attached or after it is destroyed");
        if (k.eO()) {
            return j(fragment.getActivity().getApplicationContext());
        }
        return a((Context) fragment.getActivity(), fragment.getChildFragmentManager(), fragment, fragment.isVisible());
    }

    @NonNull
    public i b(@NonNull FragmentActivity fragmentActivity) {
        if (k.eO()) {
            return j(fragmentActivity.getApplicationContext());
        }
        d((Activity) fragmentActivity);
        return a((Context) fragmentActivity, fragmentActivity.getSupportFragmentManager(), (Fragment) null, f(fragmentActivity));
    }

    @NonNull
    public i c(@NonNull Activity activity) {
        if (k.eO()) {
            return j(activity.getApplicationContext());
        }
        d(activity);
        return a((Context) activity, activity.getFragmentManager(), (android.app.Fragment) null, f(activity));
    }

    @NonNull
    public i c(@NonNull View view) {
        if (k.eO()) {
            return j(view.getContext().getApplicationContext());
        }
        com.bumptech.glide.util.i.checkNotNull(view);
        com.bumptech.glide.util.i.a(view.getContext(), "Unable to obtain a request manager for a view without a Context");
        Activity k = k(view.getContext());
        if (k == null) {
            return j(view.getContext().getApplicationContext());
        }
        if (k instanceof FragmentActivity) {
            Fragment a2 = a(view, (FragmentActivity) k);
            return a2 != null ? b(a2) : c(k);
        }
        android.app.Fragment a3 = a(view, k);
        return a3 == null ? c(k) : d(a3);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public SupportRequestManagerFragment c(FragmentActivity fragmentActivity) {
        return a(fragmentActivity.getSupportFragmentManager(), (Fragment) null, f(fragmentActivity));
    }

    @TargetApi(17)
    @Deprecated
    @NonNull
    public i d(@NonNull android.app.Fragment fragment) {
        if (fragment.getActivity() == null) {
            throw new IllegalArgumentException("You cannot start a load on a fragment before it is attached");
        } else if (k.eO() || VERSION.SDK_INT < 17) {
            return j(fragment.getActivity().getApplicationContext());
        } else {
            return a((Context) fragment.getActivity(), fragment.getChildFragmentManager(), fragment, fragment.isVisible());
        }
    }

    /* access modifiers changed from: 0000 */
    @Deprecated
    @NonNull
    public k e(Activity activity) {
        return a(activity.getFragmentManager(), (android.app.Fragment) null, f(activity));
    }

    public boolean handleMessage(Message message) {
        Object obj;
        Object obj2 = null;
        boolean z = true;
        switch (message.what) {
            case 1:
                obj2 = (FragmentManager) message.obj;
                obj = this.pendingRequestManagerFragments.remove(obj2);
                break;
            case 2:
                obj2 = (android.support.v4.app.FragmentManager) message.obj;
                obj = this.pendingSupportRequestManagerFragments.remove(obj2);
                break;
            default:
                z = false;
                obj = null;
                break;
        }
        if (z && obj == null && Log.isLoggable(TAG, 5)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to remove expected request manager fragment, manager: ");
            sb.append(obj2);
            Log.w(str, sb.toString());
        }
        return z;
    }

    @NonNull
    public i j(@NonNull Context context) {
        if (context != null) {
            if (k.eN() && !(context instanceof Application)) {
                if (context instanceof FragmentActivity) {
                    return b((FragmentActivity) context);
                }
                if (context instanceof Activity) {
                    return c((Activity) context);
                }
                if (context instanceof ContextWrapper) {
                    return j(((ContextWrapper) context).getBaseContext());
                }
            }
            return i(context);
        }
        throw new IllegalArgumentException("You cannot start a load on a null Context");
    }
}
