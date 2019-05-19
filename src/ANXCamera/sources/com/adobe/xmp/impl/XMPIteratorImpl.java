package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.IteratorOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPPropertyInfo;
import java.util.Collections;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class XMPIteratorImpl implements XMPIterator {
    private String baseNS = null;
    private Iterator nodeIterator = null;
    private IteratorOptions options;
    protected boolean skipSiblings = false;
    protected boolean skipSubtree = false;

    private class NodeIterator implements Iterator {
        protected static final int ITERATE_CHILDREN = 1;
        protected static final int ITERATE_NODE = 0;
        protected static final int ITERATE_QUALIFIER = 2;
        private Iterator childrenIterator = null;
        private int index = 0;
        private String path;
        private XMPPropertyInfo returnProperty = null;
        private int state = 0;
        private Iterator subIterator = Collections.EMPTY_LIST.iterator();
        private XMPNode visitedNode;

        public NodeIterator() {
        }

        public NodeIterator(XMPNode xMPNode, String str, int i) {
            this.visitedNode = xMPNode;
            this.state = 0;
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            }
            this.path = accumulatePath(xMPNode, str, i);
        }

        private boolean iterateChildren(Iterator it) {
            if (XMPIteratorImpl.this.skipSiblings) {
                XMPIteratorImpl.this.skipSiblings = false;
                this.subIterator = Collections.EMPTY_LIST.iterator();
            }
            if (!this.subIterator.hasNext() && it.hasNext()) {
                XMPNode xMPNode = (XMPNode) it.next();
                this.index++;
                this.subIterator = new NodeIterator(xMPNode, this.path, this.index);
            }
            if (!this.subIterator.hasNext()) {
                return false;
            }
            this.returnProperty = (XMPPropertyInfo) this.subIterator.next();
            return true;
        }

        /* access modifiers changed from: protected */
        public String accumulatePath(XMPNode xMPNode, String str, int i) {
            String str2;
            String str3;
            if (xMPNode.getParent() == null || xMPNode.getOptions().isSchemaNode()) {
                return null;
            }
            if (xMPNode.getParent().getOptions().isArray()) {
                StringBuilder sb = new StringBuilder();
                sb.append("[");
                sb.append(String.valueOf(i));
                sb.append("]");
                str2 = "";
                str3 = sb.toString();
            } else {
                str2 = "/";
                str3 = xMPNode.getName();
            }
            if (str == null || str.length() == 0) {
                return str3;
            }
            if (XMPIteratorImpl.this.getOptions().isJustLeafname()) {
                if (str3.startsWith("?")) {
                    str3 = str3.substring(1);
                }
                return str3;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append(str2);
            sb2.append(str3);
            return sb2.toString();
        }

        /* access modifiers changed from: protected */
        public XMPPropertyInfo createPropertyInfo(XMPNode xMPNode, String str, String str2) {
            final String value = xMPNode.getOptions().isSchemaNode() ? null : xMPNode.getValue();
            final String str3 = str;
            final String str4 = str2;
            final XMPNode xMPNode2 = xMPNode;
            AnonymousClass1 r1 = new XMPPropertyInfo() {
                public String getLanguage() {
                    return null;
                }

                public String getNamespace() {
                    return str3;
                }

                public PropertyOptions getOptions() {
                    return xMPNode2.getOptions();
                }

                public String getPath() {
                    return str4;
                }

                public Object getValue() {
                    return value;
                }
            };
            return r1;
        }

        /* access modifiers changed from: protected */
        public Iterator getChildrenIterator() {
            return this.childrenIterator;
        }

        /* access modifiers changed from: protected */
        public XMPPropertyInfo getReturnProperty() {
            return this.returnProperty;
        }

        public boolean hasNext() {
            if (this.returnProperty != null) {
                return true;
            }
            if (this.state == 0) {
                return reportNode();
            }
            if (this.state == 1) {
                if (this.childrenIterator == null) {
                    this.childrenIterator = this.visitedNode.iterateChildren();
                }
                boolean iterateChildren = iterateChildren(this.childrenIterator);
                if (!iterateChildren && this.visitedNode.hasQualifier() && !XMPIteratorImpl.this.getOptions().isOmitQualifiers()) {
                    this.state = 2;
                    this.childrenIterator = null;
                    iterateChildren = hasNext();
                }
                return iterateChildren;
            }
            if (this.childrenIterator == null) {
                this.childrenIterator = this.visitedNode.iterateQualifier();
            }
            return iterateChildren(this.childrenIterator);
        }

        public Object next() {
            if (hasNext()) {
                XMPPropertyInfo xMPPropertyInfo = this.returnProperty;
                this.returnProperty = null;
                return xMPPropertyInfo;
            }
            throw new NoSuchElementException("There are no more nodes to return");
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }

        /* access modifiers changed from: protected */
        public boolean reportNode() {
            this.state = 1;
            if (this.visitedNode.getParent() == null || (XMPIteratorImpl.this.getOptions().isJustLeafnodes() && this.visitedNode.hasChildren())) {
                return hasNext();
            }
            this.returnProperty = createPropertyInfo(this.visitedNode, XMPIteratorImpl.this.getBaseNS(), this.path);
            return true;
        }

        /* access modifiers changed from: protected */
        public void setChildrenIterator(Iterator it) {
            this.childrenIterator = it;
        }

        /* access modifiers changed from: protected */
        public void setReturnProperty(XMPPropertyInfo xMPPropertyInfo) {
            this.returnProperty = xMPPropertyInfo;
        }
    }

    private class NodeIteratorChildren extends NodeIterator {
        private Iterator childrenIterator;
        private int index = 0;
        private String parentPath;

        public NodeIteratorChildren(XMPNode xMPNode, String str) {
            super();
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            }
            this.parentPath = accumulatePath(xMPNode, str, 1);
            this.childrenIterator = xMPNode.iterateChildren();
        }

        public boolean hasNext() {
            if (getReturnProperty() != null) {
                return true;
            }
            if (XMPIteratorImpl.this.skipSiblings || !this.childrenIterator.hasNext()) {
                return false;
            }
            XMPNode xMPNode = (XMPNode) this.childrenIterator.next();
            this.index++;
            String str = null;
            if (xMPNode.getOptions().isSchemaNode()) {
                XMPIteratorImpl.this.setBaseNS(xMPNode.getName());
            } else if (xMPNode.getParent() != null) {
                str = accumulatePath(xMPNode, this.parentPath, this.index);
            }
            if (XMPIteratorImpl.this.getOptions().isJustLeafnodes() && xMPNode.hasChildren()) {
                return hasNext();
            }
            setReturnProperty(createPropertyInfo(xMPNode, XMPIteratorImpl.this.getBaseNS(), str));
            return true;
        }
    }

    public XMPIteratorImpl(XMPMetaImpl xMPMetaImpl, String str, String str2, IteratorOptions iteratorOptions) throws XMPException {
        XMPNode xMPNode;
        String str3 = null;
        if (iteratorOptions == null) {
            iteratorOptions = new IteratorOptions();
        }
        this.options = iteratorOptions;
        boolean z = str != null && str.length() > 0;
        boolean z2 = str2 != null && str2.length() > 0;
        if (!z && !z2) {
            xMPNode = xMPMetaImpl.getRoot();
        } else if (z && z2) {
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPPath xMPPath = new XMPPath();
            for (int i = 0; i < expandXPath.size() - 1; i++) {
                xMPPath.add(expandXPath.getSegment(i));
            }
            xMPNode = XMPNodeUtils.findNode(xMPMetaImpl.getRoot(), expandXPath, false, null);
            this.baseNS = str;
            str3 = xMPPath.toString();
        } else if (!z || z2) {
            throw new XMPException("Schema namespace URI is required", 101);
        } else {
            xMPNode = XMPNodeUtils.findSchemaNode(xMPMetaImpl.getRoot(), str, false);
        }
        if (xMPNode == null) {
            this.nodeIterator = Collections.EMPTY_LIST.iterator();
        } else if (!this.options.isJustChildren()) {
            this.nodeIterator = new NodeIterator(xMPNode, str3, 1);
        } else {
            this.nodeIterator = new NodeIteratorChildren(xMPNode, str3);
        }
    }

    /* access modifiers changed from: protected */
    public String getBaseNS() {
        return this.baseNS;
    }

    /* access modifiers changed from: protected */
    public IteratorOptions getOptions() {
        return this.options;
    }

    public boolean hasNext() {
        return this.nodeIterator.hasNext();
    }

    public Object next() {
        return this.nodeIterator.next();
    }

    public void remove() {
        throw new UnsupportedOperationException("The XMPIterator does not support remove().");
    }

    /* access modifiers changed from: protected */
    public void setBaseNS(String str) {
        this.baseNS = str;
    }

    public void skipSiblings() {
        skipSubtree();
        this.skipSiblings = true;
    }

    public void skipSubtree() {
        this.skipSubtree = true;
    }
}
