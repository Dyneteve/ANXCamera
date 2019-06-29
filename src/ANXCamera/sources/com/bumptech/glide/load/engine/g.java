package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;

/* compiled from: DiskCacheStrategy */
public abstract class g {
    public static final g gU = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }

        public boolean bv() {
            return true;
        }

        public boolean bw() {
            return true;
        }
    };
    public static final g gV = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean b(DataSource dataSource) {
            return false;
        }

        public boolean bv() {
            return false;
        }

        public boolean bw() {
            return false;
        }
    };
    public static final g gW = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean b(DataSource dataSource) {
            return (dataSource == DataSource.DATA_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean bv() {
            return false;
        }

        public boolean bw() {
            return true;
        }
    };
    public static final g gX = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean b(DataSource dataSource) {
            return false;
        }

        public boolean bv() {
            return true;
        }

        public boolean bw() {
            return false;
        }
    };
    public static final g gY = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return ((z && dataSource == DataSource.DATA_DISK_CACHE) || dataSource == DataSource.LOCAL) && encodeStrategy == EncodeStrategy.TRANSFORMED;
        }

        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }

        public boolean bv() {
            return true;
        }

        public boolean bw() {
            return true;
        }
    };

    public abstract boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy);

    public abstract boolean b(DataSource dataSource);

    public abstract boolean bv();

    public abstract boolean bw();
}
