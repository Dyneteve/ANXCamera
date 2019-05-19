package org.jcodec.containers.mp4.boxes;

import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.IBoxFactory;
import org.jcodec.platform.Platform;

public class NodeBox extends Box {
    protected List<Box> boxes = new LinkedList();
    protected IBoxFactory factory;

    public NodeBox(Header header) {
        super(header);
    }

    public static Box cloneBox(Box box, int i, IBoxFactory iBoxFactory) {
        return doCloneBox(box, i, iBoxFactory);
    }

    public static Box doCloneBox(Box box, int i, IBoxFactory iBoxFactory) {
        ByteBuffer allocate = ByteBuffer.allocate(i);
        box.write(allocate);
        allocate.flip();
        return parseChildBox(allocate, iBoxFactory);
    }

    public static <T extends Box> T[] findAll(Box box, Class<T> cls, String str) {
        return findAllPath(box, cls, new String[]{str});
    }

    public static <T extends Box> T[] findAllPath(Box box, Class<T> cls, String[] strArr) {
        LinkedList linkedList = new LinkedList();
        findBox(box, new ArrayList(Arrays.asList(strArr)), linkedList);
        ListIterator listIterator = linkedList.listIterator();
        while (listIterator.hasNext()) {
            Box box2 = (Box) listIterator.next();
            if (box2 == null) {
                listIterator.remove();
            } else if (!Platform.isAssignableFrom(cls, box2.getClass())) {
                try {
                    listIterator.set(asBox(cls, box2));
                } catch (Exception e) {
                    listIterator.remove();
                }
            }
        }
        return (Box[]) linkedList.toArray((Box[]) Array.newInstance(cls, 0));
    }

    public static void findBox(Box box, List<String> list, Collection<Box> collection) {
        if (list.size() > 0) {
            String str = (String) list.remove(0);
            if (box instanceof NodeBox) {
                for (Box box2 : ((NodeBox) box).getBoxes()) {
                    if (str == null || str.equals(box2.header.getFourcc())) {
                        findBox(box2, list, collection);
                    }
                }
            }
            list.add(0, str);
            return;
        }
        collection.add(box);
    }

    public static <T extends Box> T[] findDeep(Box box, Class<T> cls, String str) {
        ArrayList arrayList = new ArrayList();
        findDeepInner(box, cls, str, arrayList);
        return (Box[]) arrayList.toArray((Box[]) Array.newInstance(cls, 0));
    }

    public static <T extends Box> void findDeepInner(Box box, Class<T> cls, String str, List<T> list) {
        if (box != null) {
            if (str.equals(box.getHeader().getFourcc())) {
                list.add(box);
                return;
            }
            if (box instanceof NodeBox) {
                for (Box findDeepInner : ((NodeBox) box).getBoxes()) {
                    findDeepInner(findDeepInner, cls, str, list);
                }
            }
        }
    }

    public static <T extends Box> T findFirst(NodeBox nodeBox, Class<T> cls, String str) {
        return findFirstPath(nodeBox, cls, new String[]{str});
    }

    public static <T extends Box> T findFirstPath(NodeBox nodeBox, Class<T> cls, String[] strArr) {
        T[] findAllPath = findAllPath(nodeBox, cls, strArr);
        if (findAllPath.length > 0) {
            return findAllPath[0];
        }
        return null;
    }

    public static Box parseChildBox(ByteBuffer byteBuffer, IBoxFactory iBoxFactory) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        while (byteBuffer.remaining() >= 4 && duplicate.getInt() == 0) {
            byteBuffer.getInt();
        }
        Box box = null;
        if (byteBuffer.remaining() < 4) {
            return null;
        }
        Header read = Header.read(byteBuffer);
        if (read != null && ((long) byteBuffer.remaining()) >= read.getBodySize()) {
            box = parseBox(NIOUtils.read(byteBuffer, (int) read.getBodySize()), read, iBoxFactory);
        }
        return box;
    }

    public void add(Box box) {
        this.boxes.add(box);
    }

    public void addFirst(MovieHeaderBox movieHeaderBox) {
        this.boxes.add(0, movieHeaderBox);
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        for (Box write : this.boxes) {
            write.write(byteBuffer);
        }
    }

    /* access modifiers changed from: protected */
    public void dump(StringBuilder sb) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append("{\"tag\":\"");
        sb2.append(this.header.getFourcc());
        sb2.append("\",");
        sb.append(sb2.toString());
        sb.append("\"boxes\": [");
        dumpBoxes(sb);
        sb.append("]");
        sb.append("}");
    }

    /* access modifiers changed from: protected */
    public void dumpBoxes(StringBuilder sb) {
        for (int i = 0; i < this.boxes.size(); i++) {
            ((Box) this.boxes.get(i)).dump(sb);
            if (i < this.boxes.size() - 1) {
                sb.append(",");
            }
        }
    }

    public int estimateSize() {
        int i = 0;
        for (Box estimateSize : this.boxes) {
            i += estimateSize.estimateSize();
        }
        return i + Header.estimateHeaderSize(i);
    }

    public List<Box> getBoxes() {
        return this.boxes;
    }

    public void parse(ByteBuffer byteBuffer) {
        while (byteBuffer.remaining() >= 8) {
            Box parseChildBox = parseChildBox(byteBuffer, this.factory);
            if (parseChildBox != null) {
                this.boxes.add(parseChildBox);
            }
        }
    }

    public void removeChildren(String[] strArr) {
        Iterator it = this.boxes.iterator();
        while (it.hasNext()) {
            String fourcc = ((Box) it.next()).getFourcc();
            int i = 0;
            while (true) {
                if (i >= strArr.length) {
                    break;
                } else if (strArr[i].equals(fourcc)) {
                    it.remove();
                    break;
                } else {
                    i++;
                }
            }
        }
    }

    public void replace(String str, Box box) {
        removeChildren(new String[]{str});
        add(box);
    }

    public void replaceBox(Box box) {
        removeChildren(new String[]{box.getFourcc()});
        add(box);
    }

    public void setFactory(IBoxFactory iBoxFactory) {
        this.factory = iBoxFactory;
    }
}
