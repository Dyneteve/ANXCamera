package com.bumptech.glide;

import android.app.Activity;
import android.app.Fragment;
import android.content.ComponentCallbacks2;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.a.k;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.prefill.a;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.model.r;
import com.bumptech.glide.load.model.s;
import com.bumptech.glide.load.model.u;
import com.bumptech.glide.load.model.w;
import com.bumptech.glide.load.resource.a.a.C0009a;
import com.bumptech.glide.load.resource.b.e;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.load.resource.bitmap.i;
import com.bumptech.glide.load.resource.bitmap.m;
import com.bumptech.glide.load.resource.bitmap.n;
import com.bumptech.glide.load.resource.bitmap.t;
import com.bumptech.glide.load.resource.bitmap.v;
import com.bumptech.glide.load.resource.bitmap.x;
import com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder;
import com.bumptech.glide.manager.l;
import com.bumptech.glide.request.f;
import java.io.File;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* compiled from: Glide */
public class c implements ComponentCallbacks2 {
    private static final String TAG = "Glide";
    private static final String bi = "image_manager_disk_cache";
    private static volatile c bj;
    private static volatile boolean bk;
    private final Engine bl;
    private final d bm;
    private final j bn;
    private final a bo;
    private final e bp;
    private final Registry bq;
    private final b br;
    private final l bs;
    private final com.bumptech.glide.manager.d bt;
    private final List<i> bu = new ArrayList();
    private MemoryCategory bv = MemoryCategory.NORMAL;

    c(@NonNull Context context, @NonNull Engine engine, @NonNull j jVar, @NonNull d dVar, @NonNull b bVar, @NonNull l lVar, @NonNull com.bumptech.glide.manager.d dVar2, int i, @NonNull f fVar, @NonNull Map<Class<?>, j<?, ?>> map) {
        Context context2 = context;
        j jVar2 = jVar;
        d dVar3 = dVar;
        b bVar2 = bVar;
        this.bl = engine;
        this.bm = dVar3;
        this.br = bVar2;
        this.bn = jVar2;
        this.bs = lVar;
        this.bt = dVar2;
        this.bo = new a(jVar2, dVar3, (DecodeFormat) fVar.aZ().a(n.mn));
        Resources resources = context.getResources();
        this.bq = new Registry();
        this.bq.a((ImageHeaderParser) new m());
        n nVar = new n(this.bq.W(), resources.getDisplayMetrics(), dVar3, bVar2);
        ByteBufferGifDecoder byteBufferGifDecoder = new ByteBufferGifDecoder(context2, this.bq.W(), dVar3, bVar2);
        g c = VideoDecoder.c(dVar);
        i iVar = new i(nVar);
        v vVar = new v(nVar, bVar2);
        e eVar = new e(context2);
        com.bumptech.glide.load.model.r.c cVar = new com.bumptech.glide.load.model.r.c(resources);
        r.d dVar4 = new r.d(resources);
        r.b bVar3 = new r.b(resources);
        r.a aVar = new r.a(resources);
        com.bumptech.glide.load.resource.bitmap.e eVar2 = new com.bumptech.glide.load.resource.bitmap.e(bVar2);
        com.bumptech.glide.load.resource.d.a aVar2 = new com.bumptech.glide.load.resource.d.a();
        com.bumptech.glide.load.resource.d.d dVar5 = new com.bumptech.glide.load.resource.d.d();
        r.b bVar4 = bVar3;
        r.d dVar6 = dVar4;
        r.a aVar3 = aVar;
        Context context3 = context;
        ContentResolver contentResolver = context.getContentResolver();
        com.bumptech.glide.load.resource.d.a aVar4 = aVar2;
        com.bumptech.glide.load.resource.d.d dVar7 = dVar5;
        this.bq.b(ByteBuffer.class, (com.bumptech.glide.load.a<Data>) new com.bumptech.glide.load.model.c<Data>()).b(InputStream.class, (com.bumptech.glide.load.a<Data>) new s<Data>(bVar2)).a(Registry.cd, ByteBuffer.class, Bitmap.class, iVar).a(Registry.cd, InputStream.class, Bitmap.class, vVar).a(Registry.cd, ParcelFileDescriptor.class, Bitmap.class, c).a(Registry.cd, AssetFileDescriptor.class, Bitmap.class, VideoDecoder.b(dVar)).a(Bitmap.class, Bitmap.class, (com.bumptech.glide.load.model.n<Model, Data>) u.a.cN()).a(Registry.cd, Bitmap.class, Bitmap.class, new x()).b(Bitmap.class, (h<TResource>) eVar2).a(Registry.ce, ByteBuffer.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, (g<DataType, Bitmap>) iVar)).a(Registry.ce, InputStream.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, (g<DataType, Bitmap>) vVar)).a(Registry.ce, ParcelFileDescriptor.class, BitmapDrawable.class, new com.bumptech.glide.load.resource.bitmap.a(resources, c)).b(BitmapDrawable.class, (h<TResource>) new com.bumptech.glide.load.resource.bitmap.b<TResource>(dVar3, eVar2)).a(Registry.cc, InputStream.class, com.bumptech.glide.load.resource.gif.b.class, new com.bumptech.glide.load.resource.gif.h(this.bq.W(), byteBufferGifDecoder, bVar2)).a(Registry.cc, ByteBuffer.class, com.bumptech.glide.load.resource.gif.b.class, byteBufferGifDecoder).b(com.bumptech.glide.load.resource.gif.b.class, (h<TResource>) new com.bumptech.glide.load.resource.gif.c<TResource>()).a(com.bumptech.glide.b.a.class, com.bumptech.glide.b.a.class, (com.bumptech.glide.load.model.n<Model, Data>) u.a.cN()).a(Registry.cd, com.bumptech.glide.b.a.class, Bitmap.class, new com.bumptech.glide.load.resource.gif.f(dVar3)).a(Uri.class, Drawable.class, (g<Data, TResource>) eVar).a(Uri.class, Bitmap.class, (g<Data, TResource>) new t<Data,TResource>(eVar, dVar3)).a((com.bumptech.glide.load.a.e.a<?>) new C0009a<Object>()).a(File.class, ByteBuffer.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.d.b<Model,Data>()).a(File.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.f.e<Model,Data>()).a(File.class, File.class, (g<Data, TResource>) new com.bumptech.glide.load.resource.c.a<Data,TResource>()).a(File.class, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.f.b<Model,Data>()).a(File.class, File.class, (com.bumptech.glide.load.model.n<Model, Data>) u.a.cN()).a((com.bumptech.glide.load.a.e.a<?>) new k.a<Object>(bVar2)).a(Integer.TYPE, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) cVar).a(Integer.TYPE, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) bVar4).a(Integer.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) cVar).a(Integer.class, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) bVar4).a(Integer.class, Uri.class, (com.bumptech.glide.load.model.n<Model, Data>) dVar6).a(Integer.TYPE, AssetFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) aVar3).a(Integer.class, AssetFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) aVar3).a(Integer.TYPE, Uri.class, (com.bumptech.glide.load.model.n<Model, Data>) dVar6).a(String.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.e.c<Model,Data>()).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.e.c<Model,Data>()).a(String.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.t.c<Model,Data>()).a(String.class, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.t.b<Model,Data>()).a(String.class, AssetFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.t.a<Model,Data>()).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.c.a<Model,Data>()).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.c<Model,Data>(context.getAssets())).a(Uri.class, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.b<Model,Data>(context.getAssets())).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.d.a<Model,Data>(context3)).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.e.a<Model,Data>(context3)).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.v.d<Model,Data>(contentResolver)).a(Uri.class, ParcelFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.v.b<Model,Data>(contentResolver)).a(Uri.class, AssetFileDescriptor.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.v.a<Model,Data>(contentResolver)).a(Uri.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new w.a<Model,Data>()).a(URL.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.f.a<Model,Data>()).a(Uri.class, File.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.k.a<Model,Data>(context3)).a(com.bumptech.glide.load.model.g.class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.a.b.a<Model,Data>()).a(byte[].class, ByteBuffer.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.b.a<Model,Data>()).a(byte[].class, InputStream.class, (com.bumptech.glide.load.model.n<Model, Data>) new com.bumptech.glide.load.model.b.d<Model,Data>()).a(Uri.class, Uri.class, (com.bumptech.glide.load.model.n<Model, Data>) u.a.cN()).a(Drawable.class, Drawable.class, (com.bumptech.glide.load.model.n<Model, Data>) u.a.cN()).a(Drawable.class, Drawable.class, (g<Data, TResource>) new com.bumptech.glide.load.resource.b.f<Data,TResource>()).a(Bitmap.class, BitmapDrawable.class, (com.bumptech.glide.load.resource.d.e<TResource, Transcode>) new com.bumptech.glide.load.resource.d.b<TResource,Transcode>(resources)).a(Bitmap.class, byte[].class, (com.bumptech.glide.load.resource.d.e<TResource, Transcode>) aVar4).a(Drawable.class, byte[].class, (com.bumptech.glide.load.resource.d.e<TResource, Transcode>) new com.bumptech.glide.load.resource.d.c<TResource,Transcode>(dVar3, aVar4, dVar7)).a(com.bumptech.glide.load.resource.gif.b.class, byte[].class, (com.bumptech.glide.load.resource.d.e<TResource, Transcode>) dVar7);
        e eVar3 = new e(context3, bVar2, this.bq, new com.bumptech.glide.request.target.i(), fVar, map, engine, i);
        this.bp = eVar3;
    }

    @Nullable
    private static a J() {
        try {
            return (a) Class.forName("com.bumptech.glide.GeneratedAppGlideModuleImpl").getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
        } catch (ClassNotFoundException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Failed to find GeneratedAppGlideModule. You should include an annotationProcessor compile dependency on com.github.bumptech.glide:compiler in your application and a @GlideModule annotated AppGlideModule implementation or LibraryGlideModules will be silently ignored");
            }
        } catch (InstantiationException e2) {
            a((Exception) e2);
        } catch (IllegalAccessException e3) {
            a((Exception) e3);
        } catch (NoSuchMethodException e4) {
            a((Exception) e4);
        } catch (InvocationTargetException e5) {
            a((Exception) e5);
        }
        return null;
    }

    @NonNull
    public static i a(@NonNull Activity activity) {
        return f(activity).c(activity);
    }

    @Deprecated
    @NonNull
    public static i a(@NonNull Fragment fragment) {
        return f(fragment.getActivity()).d(fragment);
    }

    @NonNull
    public static i a(@NonNull android.support.v4.app.Fragment fragment) {
        return f(fragment.getActivity()).b(fragment);
    }

    @NonNull
    public static i a(@NonNull FragmentActivity fragmentActivity) {
        return f(fragmentActivity).b(fragmentActivity);
    }

    @NonNull
    public static i a(@NonNull View view) {
        return f(view.getContext()).c(view);
    }

    @Nullable
    public static File a(@NonNull Context context, @NonNull String str) {
        File cacheDir = context.getCacheDir();
        if (cacheDir != null) {
            File file = new File(cacheDir, str);
            if (file.mkdirs() || (file.exists() && file.isDirectory())) {
                return file;
            }
            return null;
        }
        if (Log.isLoggable(TAG, 6)) {
            Log.e(TAG, "default disk cache dir is null");
        }
        return null;
    }

    private static void a(@NonNull Context context, @NonNull d dVar) {
        Context applicationContext = context.getApplicationContext();
        a J = J();
        List<com.bumptech.glide.c.c> emptyList = Collections.emptyList();
        if (J == null || J.dI()) {
            emptyList = new com.bumptech.glide.c.e(applicationContext).dJ();
        }
        if (J != null && !J.G().isEmpty()) {
            Set G = J.G();
            Iterator it = emptyList.iterator();
            while (it.hasNext()) {
                com.bumptech.glide.c.c cVar = (com.bumptech.glide.c.c) it.next();
                if (G.contains(cVar.getClass())) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("AppGlideModule excludes manifest GlideModule: ");
                        sb.append(cVar);
                        Log.d(str, sb.toString());
                    }
                    it.remove();
                }
            }
        }
        if (Log.isLoggable(TAG, 3)) {
            for (com.bumptech.glide.c.c cVar2 : emptyList) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Discovered GlideModule from manifest: ");
                sb2.append(cVar2.getClass());
                Log.d(str2, sb2.toString());
            }
        }
        dVar.a(J != null ? J.H() : null);
        for (com.bumptech.glide.c.c b : emptyList) {
            b.b(applicationContext, dVar);
        }
        if (J != null) {
            J.b(applicationContext, dVar);
        }
        c h = dVar.h(applicationContext);
        for (com.bumptech.glide.c.c a : emptyList) {
            a.a(applicationContext, h, h.bq);
        }
        if (J != null) {
            J.a(applicationContext, h, h.bq);
        }
        applicationContext.registerComponentCallbacks(h);
        bj = h;
    }

    private static void a(Exception exc) {
        throw new IllegalStateException("GeneratedAppGlideModuleImpl is implemented incorrectly. If you've manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation.", exc);
    }

    @Nullable
    public static File b(@NonNull Context context) {
        return a(context, "image_manager_disk_cache");
    }

    @NonNull
    public static c c(@NonNull Context context) {
        if (bj == null) {
            synchronized (c.class) {
                if (bj == null) {
                    d(context);
                }
            }
        }
        return bj;
    }

    private static void d(@NonNull Context context) {
        if (!bk) {
            bk = true;
            e(context);
            bk = false;
            return;
        }
        throw new IllegalStateException("You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead");
    }

    private static void e(@NonNull Context context) {
        a(context, new d());
    }

    @NonNull
    private static l f(@Nullable Context context) {
        com.bumptech.glide.util.i.a(context, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed).");
        return c(context).Q();
    }

    @NonNull
    public static i g(@NonNull Context context) {
        return f(context).j(context);
    }

    @VisibleForTesting
    public static synchronized void init(@NonNull Context context, @NonNull d dVar) {
        synchronized (c.class) {
            if (bj != null) {
                tearDown();
            }
            a(context, dVar);
        }
    }

    @VisibleForTesting
    @Deprecated
    public static synchronized void init(c cVar) {
        synchronized (c.class) {
            if (bj != null) {
                tearDown();
            }
            bj = cVar;
        }
    }

    @VisibleForTesting
    public static synchronized void tearDown() {
        synchronized (c.class) {
            if (bj != null) {
                bj.getContext().getApplicationContext().unregisterComponentCallbacks(bj);
                bj.bl.shutdown();
            }
            bj = null;
        }
    }

    @NonNull
    public d K() {
        return this.bm;
    }

    @NonNull
    public b L() {
        return this.br;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.manager.d M() {
        return this.bt;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public e N() {
        return this.bp;
    }

    public void O() {
        com.bumptech.glide.util.k.fn();
        this.bn.O();
        this.bm.O();
        this.br.O();
    }

    public void P() {
        com.bumptech.glide.util.k.fo();
        this.bl.P();
    }

    @NonNull
    public l Q() {
        return this.bs;
    }

    @NonNull
    public Registry R() {
        return this.bq;
    }

    @NonNull
    public MemoryCategory a(@NonNull MemoryCategory memoryCategory) {
        com.bumptech.glide.util.k.fn();
        this.bn.b(memoryCategory.V());
        this.bm.b(memoryCategory.V());
        MemoryCategory memoryCategory2 = this.bv;
        this.bv = memoryCategory;
        return memoryCategory2;
    }

    /* access modifiers changed from: 0000 */
    public void a(i iVar) {
        synchronized (this.bu) {
            if (!this.bu.contains(iVar)) {
                this.bu.add(iVar);
            } else {
                throw new IllegalStateException("Cannot register already registered manager");
            }
        }
    }

    public void a(@NonNull com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        this.bo.b(aVarArr);
    }

    /* access modifiers changed from: 0000 */
    public boolean a(@NonNull com.bumptech.glide.request.target.n<?> nVar) {
        synchronized (this.bu) {
            for (i f : this.bu) {
                if (f.f(nVar)) {
                    return true;
                }
            }
            return false;
        }
    }

    /* access modifiers changed from: 0000 */
    public void b(i iVar) {
        synchronized (this.bu) {
            if (this.bu.contains(iVar)) {
                this.bu.remove(iVar);
            } else {
                throw new IllegalStateException("Cannot unregister not yet registered manager");
            }
        }
    }

    @NonNull
    public Context getContext() {
        return this.bp.getBaseContext();
    }

    public void onConfigurationChanged(Configuration configuration) {
    }

    public void onLowMemory() {
        O();
    }

    public void onTrimMemory(int i) {
        trimMemory(i);
    }

    public void trimMemory(int i) {
        com.bumptech.glide.util.k.fn();
        this.bn.trimMemory(i);
        this.bm.trimMemory(i);
        this.br.trimMemory(i);
    }
}
