package org.jcodec.containers.mp4.boxes;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Map.Entry;

public class MetaBox extends NodeBox {
    private static final String FOURCC = "meta";

    public MetaBox(Header header) {
        super(header);
    }

    public static MetaBox createMetaBox() {
        return new MetaBox(Header.createHeader(fourcc(), 0));
    }

    private void dropChildBox(List<Box> list, String str) {
        ListIterator listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            if (str.equals(((Box) listIterator.next()).getFourcc())) {
                listIterator.remove();
            }
        }
    }

    public static String fourcc() {
        return FOURCC;
    }

    private DataBox getDataBox(List<Box> list) {
        for (Box box : list) {
            if (box instanceof DataBox) {
                return (DataBox) box;
            }
        }
        return null;
    }

    public Map<Integer, MetaValue> getItunesMeta() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        IListBox iListBox = (IListBox) findFirst(this, IListBox.class, IListBox.fourcc());
        if (iListBox == null) {
            return linkedHashMap;
        }
        for (Entry entry : iListBox.getValues().entrySet()) {
            Integer num = (Integer) entry.getKey();
            if (num != null) {
                DataBox dataBox = getDataBox((List) entry.getValue());
                if (dataBox != null) {
                    linkedHashMap.put(num, MetaValue.createOtherWithLocale(dataBox.getType(), dataBox.getLocale(), dataBox.getData()));
                }
            }
        }
        return linkedHashMap;
    }

    public Map<String, MetaValue> getKeyedMeta() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        IListBox iListBox = (IListBox) findFirst(this, IListBox.class, IListBox.fourcc());
        MdtaBox[] mdtaBoxArr = (MdtaBox[]) findAllPath(this, MdtaBox.class, new String[]{KeysBox.fourcc(), MdtaBox.fourcc()});
        if (iListBox == null || mdtaBoxArr.length == 0) {
            return linkedHashMap;
        }
        for (Entry entry : iListBox.getValues().entrySet()) {
            Integer num = (Integer) entry.getKey();
            if (num != null) {
                DataBox dataBox = getDataBox((List) entry.getValue());
                if (dataBox != null) {
                    MetaValue createOtherWithLocale = MetaValue.createOtherWithLocale(dataBox.getType(), dataBox.getLocale(), dataBox.getData());
                    if (num.intValue() > 0 && num.intValue() <= mdtaBoxArr.length) {
                        linkedHashMap.put(mdtaBoxArr[num.intValue() - 1].getKey(), createOtherWithLocale);
                    }
                }
            }
        }
        return linkedHashMap;
    }

    public void setItunesMeta(Map<Integer, MetaValue> map) {
        Map map2;
        if (!map.isEmpty()) {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.putAll(map);
            IListBox iListBox = (IListBox) findFirst(this, IListBox.class, IListBox.fourcc());
            if (iListBox == null) {
                map2 = new LinkedHashMap();
            } else {
                map2 = iListBox.getValues();
                for (Entry entry : map2.entrySet()) {
                    int intValue = ((Integer) entry.getKey()).intValue();
                    MetaValue metaValue = (MetaValue) linkedHashMap.get(Integer.valueOf(intValue));
                    if (metaValue != null) {
                        DataBox createDataBox = DataBox.createDataBox(metaValue.getType(), metaValue.getLocale(), metaValue.getData());
                        dropChildBox((List) entry.getValue(), DataBox.fourcc());
                        ((List) entry.getValue()).add(createDataBox);
                        linkedHashMap.remove(Integer.valueOf(intValue));
                    }
                }
            }
            for (Entry entry2 : linkedHashMap.entrySet()) {
                int intValue2 = ((Integer) entry2.getKey()).intValue();
                MetaValue metaValue2 = (MetaValue) entry2.getValue();
                DataBox createDataBox2 = DataBox.createDataBox(metaValue2.getType(), metaValue2.getLocale(), metaValue2.getData());
                ArrayList arrayList = new ArrayList();
                map2.put(Integer.valueOf(intValue2), arrayList);
                arrayList.add(createDataBox2);
            }
            HashSet<Integer> hashSet = new HashSet<>(map2.keySet());
            hashSet.removeAll(map.keySet());
            for (Integer remove : hashSet) {
                map2.remove(remove);
            }
            replaceBox(IListBox.createIListBox(map2));
        }
    }

    public void setKeyedMeta(Map<String, MetaValue> map) {
        if (!map.isEmpty()) {
            KeysBox createKeysBox = KeysBox.createKeysBox();
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            int i = 1;
            for (Entry entry : map.entrySet()) {
                createKeysBox.add(MdtaBox.createMdtaBox((String) entry.getKey()));
                MetaValue metaValue = (MetaValue) entry.getValue();
                ArrayList arrayList = new ArrayList();
                arrayList.add(DataBox.createDataBox(metaValue.getType(), metaValue.getLocale(), metaValue.getData()));
                linkedHashMap.put(Integer.valueOf(i), arrayList);
                i++;
            }
            IListBox createIListBox = IListBox.createIListBox(linkedHashMap);
            replaceBox(createKeysBox);
            replaceBox(createIListBox);
        }
    }
}
