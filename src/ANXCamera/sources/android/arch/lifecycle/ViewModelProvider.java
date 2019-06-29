package android.arch.lifecycle;

import android.app.Application;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import java.lang.reflect.InvocationTargetException;

public class ViewModelProvider {
    private static final String DEFAULT_KEY = "android.arch.lifecycle.ViewModelProvider.DefaultKey";
    private final Factory mFactory;
    private final ViewModelStore mViewModelStore;

    public static class AndroidViewModelFactory extends NewInstanceFactory {
        private static AndroidViewModelFactory sInstance;
        private Application mApplication;

        public AndroidViewModelFactory(@NonNull Application application) {
            this.mApplication = application;
        }

        @NonNull
        public static AndroidViewModelFactory getInstance(@NonNull Application application) {
            if (sInstance == null) {
                sInstance = new AndroidViewModelFactory(application);
            }
            return sInstance;
        }

        @NonNull
        public <T extends ViewModel> T create(@NonNull Class<T> cls) {
            if (!AndroidViewModel.class.isAssignableFrom(cls)) {
                return super.create(cls);
            }
            try {
                return (ViewModel) cls.getConstructor(new Class[]{Application.class}).newInstance(new Object[]{this.mApplication});
            } catch (NoSuchMethodException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Cannot create an instance of ");
                sb.append(cls);
                throw new RuntimeException(sb.toString(), e);
            } catch (IllegalAccessException e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Cannot create an instance of ");
                sb2.append(cls);
                throw new RuntimeException(sb2.toString(), e2);
            } catch (InstantiationException e3) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Cannot create an instance of ");
                sb3.append(cls);
                throw new RuntimeException(sb3.toString(), e3);
            } catch (InvocationTargetException e4) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Cannot create an instance of ");
                sb4.append(cls);
                throw new RuntimeException(sb4.toString(), e4);
            }
        }
    }

    public interface Factory {
        @NonNull
        <T extends ViewModel> T create(@NonNull Class<T> cls);
    }

    public static class NewInstanceFactory implements Factory {
        @NonNull
        public <T extends ViewModel> T create(@NonNull Class<T> cls) {
            try {
                return (ViewModel) cls.newInstance();
            } catch (InstantiationException e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Cannot create an instance of ");
                sb.append(cls);
                throw new RuntimeException(sb.toString(), e);
            } catch (IllegalAccessException e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Cannot create an instance of ");
                sb2.append(cls);
                throw new RuntimeException(sb2.toString(), e2);
            }
        }
    }

    public ViewModelProvider(@NonNull ViewModelStore viewModelStore, @NonNull Factory factory) {
        this.mFactory = factory;
        this.mViewModelStore = viewModelStore;
    }

    public ViewModelProvider(@NonNull ViewModelStoreOwner viewModelStoreOwner, @NonNull Factory factory) {
        this(viewModelStoreOwner.getViewModelStore(), factory);
    }

    @MainThread
    @NonNull
    public <T extends ViewModel> T get(@NonNull Class<T> cls) {
        String canonicalName = cls.getCanonicalName();
        if (canonicalName != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("android.arch.lifecycle.ViewModelProvider.DefaultKey:");
            sb.append(canonicalName);
            return get(sb.toString(), cls);
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }

    @MainThread
    @NonNull
    public <T extends ViewModel> T get(@NonNull String str, @NonNull Class<T> cls) {
        T t = this.mViewModelStore.get(str);
        if (cls.isInstance(t)) {
            return t;
        }
        T create = this.mFactory.create(cls);
        this.mViewModelStore.put(str, create);
        return create;
    }
}
