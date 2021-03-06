package com.bumptech.glide.load.resource.bitmap;

public abstract class DownsampleStrategy {
    public static final DownsampleStrategy mc = new e();
    public static final DownsampleStrategy md = new d();
    public static final DownsampleStrategy me = new a();
    public static final DownsampleStrategy mf = new b();
    public static final DownsampleStrategy mg = new c();
    public static final DownsampleStrategy mh = new f();
    public static final DownsampleStrategy mi = md;
    public static final com.bumptech.glide.load.e<DownsampleStrategy> mj = com.bumptech.glide.load.e.a("com.bumptech.glide.load.resource.bitmap.Downsampler.DownsampleStrategy", mi);

    public enum SampleSizeRounding {
        MEMORY,
        QUALITY
    }

    private static class a extends DownsampleStrategy {
        a() {
        }

        public float a(int i, int i2, int i3, int i4) {
            int min = Math.min(i2 / i4, i / i3);
            if (min == 0) {
                return 1.0f;
            }
            return 1.0f / ((float) Integer.highestOneBit(min));
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    private static class b extends DownsampleStrategy {
        b() {
        }

        public float a(int i, int i2, int i3, int i4) {
            int ceil = (int) Math.ceil((double) Math.max(((float) i2) / ((float) i4), ((float) i) / ((float) i3)));
            int i5 = 1;
            int max = Math.max(1, Integer.highestOneBit(ceil));
            if (max >= ceil) {
                i5 = 0;
            }
            return 1.0f / ((float) (max << i5));
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.MEMORY;
        }
    }

    private static class c extends DownsampleStrategy {
        c() {
        }

        public float a(int i, int i2, int i3, int i4) {
            return Math.min(1.0f, mc.a(i, i2, i3, i4));
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    private static class d extends DownsampleStrategy {
        d() {
        }

        public float a(int i, int i2, int i3, int i4) {
            return Math.max(((float) i3) / ((float) i), ((float) i4) / ((float) i2));
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    private static class e extends DownsampleStrategy {
        e() {
        }

        public float a(int i, int i2, int i3, int i4) {
            return Math.min(((float) i3) / ((float) i), ((float) i4) / ((float) i2));
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    private static class f extends DownsampleStrategy {
        f() {
        }

        public float a(int i, int i2, int i3, int i4) {
            return 1.0f;
        }

        public SampleSizeRounding b(int i, int i2, int i3, int i4) {
            return SampleSizeRounding.QUALITY;
        }
    }

    public abstract float a(int i, int i2, int i3, int i4);

    public abstract SampleSizeRounding b(int i, int i2, int i3, int i4);
}
