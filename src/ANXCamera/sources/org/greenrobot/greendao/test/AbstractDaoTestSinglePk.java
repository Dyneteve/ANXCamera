package org.greenrobot.greendao.test;

import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.SQLException;
import com.android.gallery3d.exif.ExifInterface.GpsTrackRef;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoLog;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.internal.SqlUtils;

public abstract class AbstractDaoTestSinglePk<D extends AbstractDao<T, K>, T, K> extends AbstractDaoTest<D, T, K> {
    private Property pkColumn;
    protected Set<K> usedPks = new HashSet();

    public AbstractDaoTestSinglePk(Class<D> cls) {
        super(cls);
    }

    /* access modifiers changed from: protected */
    public boolean checkKeyIsNullable() {
        if (createEntity(null) != null) {
            return true;
        }
        DaoLog.d("Test is not available for entities with non-null keys");
        return false;
    }

    public abstract T createEntity(K k);

    /* access modifiers changed from: protected */
    public T createEntityWithRandomPk() {
        return createEntity(nextPk());
    }

    public abstract K createRandomPk();

    /* access modifiers changed from: protected */
    public K nextPk() {
        for (int i = 0; i < 100000; i++) {
            K createRandomPk = createRandomPk();
            if (this.usedPks.add(createRandomPk)) {
                return createRandomPk;
            }
        }
        throw new IllegalStateException("Could not find a new PK");
    }

    /* access modifiers changed from: protected */
    public Cursor queryWithDummyColumnsInFront(int i, String str, K k) {
        StringBuilder sb = new StringBuilder("SELECT ");
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            sb.append(str);
            sb.append(",");
        }
        SqlUtils.appendColumns(sb, GpsTrackRef.TRUE_DIRECTION, this.dao.getAllColumns()).append(" FROM ");
        sb.append('\"');
        sb.append(this.dao.getTablename());
        sb.append('\"');
        sb.append(" T");
        if (k != null) {
            sb.append(" WHERE ");
            assertEquals(1, this.dao.getPkColumns().length);
            sb.append(this.dao.getPkColumns()[0]);
            sb.append("=");
            DatabaseUtils.appendValueToSql(sb, k);
        }
        Cursor rawQuery = this.db.rawQuery(sb.toString(), null);
        assertTrue(rawQuery.moveToFirst());
        while (i2 < i) {
            try {
                assertEquals(str, rawQuery.getString(i2));
                i2++;
            } catch (RuntimeException e) {
                rawQuery.close();
                throw e;
            }
        }
        if (k != null) {
            assertEquals(1, rawQuery.getCount());
        }
        return rawQuery;
    }

    /* access modifiers changed from: protected */
    public void runLoadPkTest(int i) {
        Object nextPk = nextPk();
        this.dao.insert(createEntity(nextPk));
        Cursor queryWithDummyColumnsInFront = queryWithDummyColumnsInFront(i, "42", nextPk);
        try {
            assertEquals(nextPk, this.daoAccess.readKey(queryWithDummyColumnsInFront, i));
        } finally {
            queryWithDummyColumnsInFront.close();
        }
    }

    /* access modifiers changed from: protected */
    public void setUp() throws Exception {
        Property[] properties;
        super.setUp();
        for (Property property : this.daoAccess.getProperties()) {
            if (property.primaryKey) {
                if (this.pkColumn == null) {
                    this.pkColumn = property;
                } else {
                    throw new RuntimeException("Test does not work with multiple PK columns");
                }
            }
        }
        if (this.pkColumn == null) {
            throw new RuntimeException("Test does not work without a PK column");
        }
    }

    public void testCount() {
        this.dao.deleteAll();
        assertEquals(0, this.dao.count());
        this.dao.insert(createEntityWithRandomPk());
        assertEquals(1, this.dao.count());
        this.dao.insert(createEntityWithRandomPk());
        assertEquals(2, this.dao.count());
    }

    public void testDelete() {
        Object nextPk = nextPk();
        this.dao.deleteByKey(nextPk);
        this.dao.insert(createEntity(nextPk));
        assertNotNull(this.dao.load(nextPk));
        this.dao.deleteByKey(nextPk);
        assertNull(this.dao.load(nextPk));
    }

    public void testDeleteAll() {
        ArrayList<Object> arrayList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            arrayList.add(createEntityWithRandomPk());
        }
        this.dao.insertInTx((Iterable<T>) arrayList);
        this.dao.deleteAll();
        assertEquals(0, this.dao.count());
        for (Object key : arrayList) {
            Object key2 = this.daoAccess.getKey(key);
            assertNotNull(key2);
            assertNull(this.dao.load(key2));
        }
    }

    public void testDeleteByKeyInTx() {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 10; i++) {
            arrayList.add(createEntityWithRandomPk());
        }
        this.dao.insertInTx((Iterable<T>) arrayList);
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(this.daoAccess.getKey(arrayList.get(0)));
        arrayList2.add(this.daoAccess.getKey(arrayList.get(3)));
        arrayList2.add(this.daoAccess.getKey(arrayList.get(4)));
        arrayList2.add(this.daoAccess.getKey(arrayList.get(8)));
        this.dao.deleteByKeyInTx((Iterable<K>) arrayList2);
        assertEquals((long) (arrayList.size() - arrayList2.size()), this.dao.count());
        for (Object next : arrayList2) {
            assertNotNull(next);
            assertNull(this.dao.load(next));
        }
    }

    public void testDeleteInTx() {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 10; i++) {
            arrayList.add(createEntityWithRandomPk());
        }
        this.dao.insertInTx((Iterable<T>) arrayList);
        ArrayList<Object> arrayList2 = new ArrayList<>();
        arrayList2.add(arrayList.get(0));
        arrayList2.add(arrayList.get(3));
        arrayList2.add(arrayList.get(4));
        arrayList2.add(arrayList.get(8));
        this.dao.deleteInTx((Iterable<T>) arrayList2);
        assertEquals((long) (arrayList.size() - arrayList2.size()), this.dao.count());
        for (Object key : arrayList2) {
            Object key2 = this.daoAccess.getKey(key);
            assertNotNull(key2);
            assertNull(this.dao.load(key2));
        }
    }

    public void testInsertAndLoad() {
        Object nextPk = nextPk();
        Object createEntity = createEntity(nextPk);
        this.dao.insert(createEntity);
        assertEquals(nextPk, this.daoAccess.getKey(createEntity));
        Object load = this.dao.load(nextPk);
        assertNotNull(load);
        assertEquals(this.daoAccess.getKey(createEntity), this.daoAccess.getKey(load));
    }

    public void testInsertInTx() {
        this.dao.deleteAll();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 20; i++) {
            arrayList.add(createEntityWithRandomPk());
        }
        this.dao.insertInTx((Iterable<T>) arrayList);
        assertEquals((long) arrayList.size(), this.dao.count());
    }

    public void testInsertOrReplaceInTx() {
        this.dao.deleteAll();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (int i = 0; i < 20; i++) {
            Object createEntityWithRandomPk = createEntityWithRandomPk();
            if (i % 2 == 0) {
                arrayList.add(createEntityWithRandomPk);
            }
            arrayList2.add(createEntityWithRandomPk);
        }
        this.dao.insertOrReplaceInTx((Iterable<T>) arrayList);
        this.dao.insertOrReplaceInTx((Iterable<T>) arrayList2);
        assertEquals((long) arrayList2.size(), this.dao.count());
    }

    public void testInsertOrReplaceTwice() {
        Object createEntityWithRandomPk = createEntityWithRandomPk();
        long insert = this.dao.insert(createEntityWithRandomPk);
        long insertOrReplace = this.dao.insertOrReplace(createEntityWithRandomPk);
        if (this.dao.getPkProperty().type == Long.class) {
            assertEquals(insert, insertOrReplace);
        }
    }

    public void testInsertTwice() {
        Object createEntity = createEntity(nextPk());
        this.dao.insert(createEntity);
        try {
            this.dao.insert(createEntity);
            fail("Inserting twice should not work");
        } catch (SQLException e) {
        }
    }

    public void testLoadAll() {
        this.dao.deleteAll();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < 15; i++) {
            arrayList.add(createEntity(nextPk()));
        }
        this.dao.insertInTx((Iterable<T>) arrayList);
        assertEquals(arrayList.size(), this.dao.loadAll().size());
    }

    public void testLoadPk() {
        runLoadPkTest(0);
    }

    public void testLoadPkWithOffset() {
        runLoadPkTest(10);
    }

    public void testQuery() {
        this.dao.insert(createEntityWithRandomPk());
        Object nextPk = nextPk();
        this.dao.insert(createEntity(nextPk));
        this.dao.insert(createEntityWithRandomPk());
        StringBuilder sb = new StringBuilder();
        sb.append("WHERE ");
        sb.append(this.dao.getPkColumns()[0]);
        sb.append("=?");
        String sb2 = sb.toString();
        List queryRaw = this.dao.queryRaw(sb2, nextPk.toString());
        assertEquals(1, queryRaw.size());
        assertEquals(nextPk, this.daoAccess.getKey(queryRaw.get(0)));
    }

    public void testReadWithOffset() {
        Object nextPk = nextPk();
        this.dao.insert(createEntity(nextPk));
        Cursor queryWithDummyColumnsInFront = queryWithDummyColumnsInFront(5, "42", nextPk);
        try {
            assertEquals(nextPk, this.daoAccess.getKey(this.daoAccess.readEntity(queryWithDummyColumnsInFront, 5)));
        } finally {
            queryWithDummyColumnsInFront.close();
        }
    }

    public void testRowId() {
        assertTrue(this.dao.insert(createEntityWithRandomPk()) != this.dao.insert(createEntityWithRandomPk()));
    }

    public void testSave() {
        if (checkKeyIsNullable()) {
            this.dao.deleteAll();
            Object createEntity = createEntity(null);
            if (createEntity != null) {
                this.dao.save(createEntity);
                this.dao.save(createEntity);
                assertEquals(1, this.dao.count());
            }
        }
    }

    public void testSaveInTx() {
        if (checkKeyIsNullable()) {
            this.dao.deleteAll();
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            for (int i = 0; i < 20; i++) {
                Object createEntity = createEntity(null);
                if (i % 2 == 0) {
                    arrayList.add(createEntity);
                }
                arrayList2.add(createEntity);
            }
            this.dao.saveInTx((Iterable<T>) arrayList);
            this.dao.saveInTx((Iterable<T>) arrayList2);
            assertEquals((long) arrayList2.size(), this.dao.count());
        }
    }

    public void testUpdate() {
        this.dao.deleteAll();
        Object createEntityWithRandomPk = createEntityWithRandomPk();
        this.dao.insert(createEntityWithRandomPk);
        this.dao.update(createEntityWithRandomPk);
        assertEquals(1, this.dao.count());
    }
}
