package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;

/* compiled from: DiskCacheStrategy */
public abstract class g {
    public static final g fU = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean aU() {
            return true;
        }

        public boolean aV() {
            return true;
        }

        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }
    };
    public static final g fV = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean aU() {
            return false;
        }

        public boolean aV() {
            return false;
        }

        public boolean b(DataSource dataSource) {
            return false;
        }
    };
    public static final g fW = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        public boolean aU() {
            return false;
        }

        public boolean aV() {
            return true;
        }

        public boolean b(DataSource dataSource) {
            return (dataSource == DataSource.DATA_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }
    };
    public static final g fX = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return (dataSource == DataSource.RESOURCE_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) ? false : true;
        }

        public boolean aU() {
            return true;
        }

        public boolean aV() {
            return false;
        }

        public boolean b(DataSource dataSource) {
            return false;
        }
    };
    public static final g fY = new g() {
        public boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return ((z && dataSource == DataSource.DATA_DISK_CACHE) || dataSource == DataSource.LOCAL) && encodeStrategy == EncodeStrategy.TRANSFORMED;
        }

        public boolean aU() {
            return true;
        }

        public boolean aV() {
            return true;
        }

        public boolean b(DataSource dataSource) {
            return dataSource == DataSource.REMOTE;
        }
    };

    public abstract boolean a(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy);

    public abstract boolean aU();

    public abstract boolean aV();

    public abstract boolean b(DataSource dataSource);
}
