package com.adobe.xmp.impl;

import com.adobe.xmp.XMPConst;
import com.adobe.xmp.XMPDateTime;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPIterator;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPPathFactory;
import com.adobe.xmp.XMPUtils;
import com.adobe.xmp.impl.xpath.XMPPath;
import com.adobe.xmp.impl.xpath.XMPPathParser;
import com.adobe.xmp.options.IteratorOptions;
import com.adobe.xmp.options.ParseOptions;
import com.adobe.xmp.options.PropertyOptions;
import com.adobe.xmp.properties.XMPProperty;
import java.util.Calendar;
import java.util.Iterator;

public class XMPMetaImpl implements XMPConst, XMPMeta {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int VALUE_BASE64 = 7;
    private static final int VALUE_BOOLEAN = 1;
    private static final int VALUE_CALENDAR = 6;
    private static final int VALUE_DATE = 5;
    private static final int VALUE_DOUBLE = 4;
    private static final int VALUE_INTEGER = 2;
    private static final int VALUE_LONG = 3;
    private static final int VALUE_STRING = 0;
    private String packetHeader;
    private XMPNode tree;

    public XMPMetaImpl() {
        this.packetHeader = null;
        this.tree = new XMPNode(null, null, null);
    }

    public XMPMetaImpl(XMPNode xMPNode) {
        this.packetHeader = null;
        this.tree = xMPNode;
    }

    private void doSetArrayItem(XMPNode xMPNode, int i, String str, PropertyOptions propertyOptions, boolean z) throws XMPException {
        XMPNode xMPNode2 = new XMPNode(XMPConst.ARRAY_ITEM_NAME, null);
        PropertyOptions verifySetOptions = XMPNodeUtils.verifySetOptions(propertyOptions, str);
        int childrenLength = z ? xMPNode.getChildrenLength() + 1 : xMPNode.getChildrenLength();
        if (i == -1) {
            i = childrenLength;
        }
        if (1 > i || i > childrenLength) {
            throw new XMPException("Array index out of bounds", 104);
        }
        if (!z) {
            xMPNode.removeChild(i);
        }
        xMPNode.addChild(i, xMPNode2);
        setNode(xMPNode2, str, verifySetOptions, false);
    }

    private Object evaluateNodeValue(int i, XMPNode xMPNode) throws XMPException {
        String value = xMPNode.getValue();
        switch (i) {
            case 1:
                return new Boolean(XMPUtils.convertToBoolean(value));
            case 2:
                return new Integer(XMPUtils.convertToInteger(value));
            case 3:
                return new Long(XMPUtils.convertToLong(value));
            case 4:
                return new Double(XMPUtils.convertToDouble(value));
            case 5:
                return XMPUtils.convertToDate(value);
            case 6:
                return XMPUtils.convertToDate(value).getCalendar();
            case 7:
                return XMPUtils.decodeBase64(value);
            default:
                if (value == null && !xMPNode.getOptions().isCompositeProperty()) {
                    value = "";
                }
                return value;
        }
    }

    public void appendArrayItem(String str, String str2, PropertyOptions propertyOptions, String str3, PropertyOptions propertyOptions2) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        if (propertyOptions == null) {
            propertyOptions = new PropertyOptions();
        }
        if (propertyOptions.isOnlyArrayOptions()) {
            PropertyOptions verifySetOptions = XMPNodeUtils.verifySetOptions(propertyOptions, null);
            XMPPath expandXPath = XMPPathParser.expandXPath(str, str2);
            XMPNode findNode = XMPNodeUtils.findNode(this.tree, expandXPath, false, null);
            if (findNode != null) {
                if (!findNode.getOptions().isArray()) {
                    throw new XMPException("The named property is not an array", 102);
                }
            } else if (verifySetOptions.isArray()) {
                findNode = XMPNodeUtils.findNode(this.tree, expandXPath, true, verifySetOptions);
                if (findNode == null) {
                    throw new XMPException("Failure creating array node", 102);
                }
            } else {
                throw new XMPException("Explicit arrayOptions required to create new array", 103);
            }
            doSetArrayItem(findNode, -1, str3, propertyOptions2, true);
            return;
        }
        throw new XMPException("Only array form flags allowed for arrayOptions", 103);
    }

    public void appendArrayItem(String str, String str2, String str3) throws XMPException {
        appendArrayItem(str, str2, null, str3, null);
    }

    public Object clone() {
        return new XMPMetaImpl((XMPNode) this.tree.clone());
    }

    public int countArrayItems(String str, String str2) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return 0;
        }
        if (findNode.getOptions().isArray()) {
            return findNode.getChildrenLength();
        }
        throw new XMPException("The named property is not an array", 102);
    }

    public void deleteArrayItem(String str, String str2, int i) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertArrayName(str2);
            deleteProperty(str, XMPPathFactory.composeArrayItemPath(str2, i));
        } catch (XMPException e) {
        }
    }

    public void deleteProperty(String str, String str2) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
            if (findNode != null) {
                XMPNodeUtils.deleteNode(findNode);
            }
        } catch (XMPException e) {
        }
    }

    public void deleteQualifier(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(XMPPathFactory.composeQualifierPath(str3, str4));
            deleteProperty(str, sb.toString());
        } catch (XMPException e) {
        }
    }

    public void deleteStructField(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertStructName(str2);
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(XMPPathFactory.composeStructFieldPath(str3, str4));
            deleteProperty(str, sb.toString());
        } catch (XMPException e) {
        }
    }

    public boolean doesArrayItemExist(String str, String str2, int i) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertArrayName(str2);
            return doesPropertyExist(str, XMPPathFactory.composeArrayItemPath(str2, i));
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesPropertyExist(String str, String str2) {
        boolean z = false;
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            if (XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null) != null) {
                z = true;
            }
            return z;
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesQualifierExist(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertPropName(str2);
            String composeQualifierPath = XMPPathFactory.composeQualifierPath(str3, str4);
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(composeQualifierPath);
            return doesPropertyExist(str, sb.toString());
        } catch (XMPException e) {
            return false;
        }
    }

    public boolean doesStructFieldExist(String str, String str2, String str3, String str4) {
        try {
            ParameterAsserts.assertSchemaNS(str);
            ParameterAsserts.assertStructName(str2);
            String composeStructFieldPath = XMPPathFactory.composeStructFieldPath(str3, str4);
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(composeStructFieldPath);
            return doesPropertyExist(str, sb.toString());
        } catch (XMPException e) {
            return false;
        }
    }

    public String dumpObject() {
        return getRoot().dumpNode(true);
    }

    public XMPProperty getArrayItem(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        return getProperty(str, XMPPathFactory.composeArrayItemPath(str2, i));
    }

    public XMPProperty getLocalizedText(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertSpecificLang(str4);
        String normalizeLangValue = str3 != null ? Utils.normalizeLangValue(str3) : null;
        String normalizeLangValue2 = Utils.normalizeLangValue(str4);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        Object[] chooseLocalizedText = XMPNodeUtils.chooseLocalizedText(findNode, normalizeLangValue, normalizeLangValue2);
        int intValue = ((Integer) chooseLocalizedText[0]).intValue();
        final XMPNode xMPNode = (XMPNode) chooseLocalizedText[1];
        if (intValue != 0) {
            return new XMPProperty() {
                public String getLanguage() {
                    return xMPNode.getQualifier(1).getValue();
                }

                public PropertyOptions getOptions() {
                    return xMPNode.getOptions();
                }

                public Object getValue() {
                    return xMPNode.getValue();
                }

                public String toString() {
                    return xMPNode.getValue().toString();
                }
            };
        }
        return null;
    }

    public String getObjectName() {
        return this.tree.getName() != null ? this.tree.getName() : "";
    }

    public String getPacketHeader() {
        return this.packetHeader;
    }

    public XMPProperty getProperty(String str, String str2) throws XMPException {
        return getProperty(str, str2, 0);
    }

    /* access modifiers changed from: protected */
    public XMPProperty getProperty(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        final XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        if (i == 0 || !findNode.getOptions().isCompositeProperty()) {
            final Object evaluateNodeValue = evaluateNodeValue(i, findNode);
            return new XMPProperty() {
                public String getLanguage() {
                    return null;
                }

                public PropertyOptions getOptions() {
                    return findNode.getOptions();
                }

                public Object getValue() {
                    return evaluateNodeValue;
                }

                public String toString() {
                    return evaluateNodeValue.toString();
                }
            };
        }
        throw new XMPException("Property must be simple when a value type is requested", 102);
    }

    public byte[] getPropertyBase64(String str, String str2) throws XMPException {
        return (byte[]) getPropertyObject(str, str2, 7);
    }

    public Boolean getPropertyBoolean(String str, String str2) throws XMPException {
        return (Boolean) getPropertyObject(str, str2, 1);
    }

    public Calendar getPropertyCalendar(String str, String str2) throws XMPException {
        return (Calendar) getPropertyObject(str, str2, 6);
    }

    public XMPDateTime getPropertyDate(String str, String str2) throws XMPException {
        return (XMPDateTime) getPropertyObject(str, str2, 5);
    }

    public Double getPropertyDouble(String str, String str2) throws XMPException {
        return (Double) getPropertyObject(str, str2, 4);
    }

    public Integer getPropertyInteger(String str, String str2) throws XMPException {
        return (Integer) getPropertyObject(str, str2, 2);
    }

    public Long getPropertyLong(String str, String str2) throws XMPException {
        return (Long) getPropertyObject(str, str2, 3);
    }

    /* access modifiers changed from: protected */
    public Object getPropertyObject(String str, String str2, int i) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode == null) {
            return null;
        }
        if (i == 0 || !findNode.getOptions().isCompositeProperty()) {
            return evaluateNodeValue(i, findNode);
        }
        throw new XMPException("Property must be simple when a value type is requested", 102);
    }

    public String getPropertyString(String str, String str2) throws XMPException {
        return (String) getPropertyObject(str, str2, 0);
    }

    public XMPProperty getQualifier(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(XMPPathFactory.composeQualifierPath(str3, str4));
        return getProperty(str, sb.toString());
    }

    public XMPNode getRoot() {
        return this.tree;
    }

    public XMPProperty getStructField(String str, String str2, String str3, String str4) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertStructName(str2);
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(XMPPathFactory.composeStructFieldPath(str3, str4));
        return getProperty(str, sb.toString());
    }

    public void insertArrayItem(String str, String str2, int i, String str3) throws XMPException {
        insertArrayItem(str, str2, i, str3, null);
    }

    public void insertArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode != null) {
            doSetArrayItem(findNode, i, str3, propertyOptions, true);
            return;
        }
        throw new XMPException("Specified array does not exist", 102);
    }

    public XMPIterator iterator() throws XMPException {
        return iterator(null, null, null);
    }

    public XMPIterator iterator(IteratorOptions iteratorOptions) throws XMPException {
        return iterator(null, null, iteratorOptions);
    }

    public XMPIterator iterator(String str, String str2, IteratorOptions iteratorOptions) throws XMPException {
        return new XMPIteratorImpl(this, str, str2, iteratorOptions);
    }

    public void normalize(ParseOptions parseOptions) throws XMPException {
        if (parseOptions == null) {
            parseOptions = new ParseOptions();
        }
        XMPNormalizer.process(this, parseOptions);
    }

    public void setArrayItem(String str, String str2, int i, String str3) throws XMPException {
        setArrayItem(str, str2, i, str3, null);
    }

    public void setArrayItem(String str, String str2, int i, String str3, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), false, null);
        if (findNode != null) {
            doSetArrayItem(findNode, i, str3, propertyOptions, false);
            return;
        }
        throw new XMPException("Specified array does not exist", 102);
    }

    public void setLocalizedText(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setLocalizedText(str, str2, str3, str4, str5, null);
    }

    /* JADX INFO: used method not loaded: com.adobe.xmp.impl.XMPNode.removeChild(com.adobe.xmp.impl.XMPNode):null, types can be incorrect */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x009f, code lost:
        if (r2 == null) goto L_0x00ad;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00a5, code lost:
        if (r7.getChildrenLength() <= 1) goto L_0x00ad;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00a7, code lost:
        r7.removeChild(r2);
        r7.addChild(1, r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x00ad, code lost:
        r9 = com.adobe.xmp.impl.XMPNodeUtils.chooseLocalizedText(r7, r9, r10);
        r0 = ((java.lang.Integer) r9[0]).intValue();
        r9 = (com.adobe.xmp.impl.XMPNode) r9[1];
        r3 = com.adobe.xmp.XMPConst.X_DEFAULT.equals(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00c3, code lost:
        switch(r0) {
            case 0: goto L_0x0156;
            case 1: goto L_0x0109;
            case 2: goto L_0x00ee;
            case 3: goto L_0x00e7;
            case 4: goto L_0x00d7;
            case 5: goto L_0x00d0;
            default: goto L_0x00c6;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x00cf, code lost:
        throw new com.adobe.xmp.XMPException("Unexpected result from ChooseLocalizedText", 9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00d0, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, r10, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x00d3, code lost:
        if (r3 == false) goto L_0x0162;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00d7, code lost:
        if (r2 == null) goto L_0x00e2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00dd, code lost:
        if (r7.getChildrenLength() != 1) goto L_0x00e2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00df, code lost:
        r2.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00e2, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, r10, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00e7, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, r10, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00ea, code lost:
        if (r3 == false) goto L_0x0162;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00ee, code lost:
        if (r8 == false) goto L_0x0105;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00f0, code lost:
        if (r2 == r9) goto L_0x0105;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00f2, code lost:
        if (r2 == null) goto L_0x0105;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x0100, code lost:
        if (r2.getValue().equals(r9.getValue()) == false) goto L_0x0105;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x0102, code lost:
        r2.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x0105, code lost:
        r9.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0109, code lost:
        if (r3 != false) goto L_0x0126;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x010b, code lost:
        if (r8 == false) goto L_0x0122;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x010d, code lost:
        if (r2 == r9) goto L_0x0122;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x010f, code lost:
        if (r2 == null) goto L_0x0122;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x011d, code lost:
        if (r2.getValue().equals(r9.getValue()) == false) goto L_0x0122;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x011f, code lost:
        r2.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x0122, code lost:
        r9.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0126, code lost:
        r9 = r7.iterateChildren();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x012f, code lost:
        if (r9.hasNext() == false) goto L_0x0150;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0131, code lost:
        r10 = (com.adobe.xmp.impl.XMPNode) r9.next();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x0137, code lost:
        if (r10 == r2) goto L_0x012b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0139, code lost:
        r0 = r10.getValue();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x013d, code lost:
        if (r2 == null) goto L_0x0144;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x013f, code lost:
        r3 = r2.getValue();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0144, code lost:
        r3 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x0149, code lost:
        if (r0.equals(r3) != false) goto L_0x014c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x014c, code lost:
        r10.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0150, code lost:
        if (r2 == null) goto L_0x0162;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0152, code lost:
        r2.setValue(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x0156, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, com.adobe.xmp.XMPConst.X_DEFAULT, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x015c, code lost:
        if (r3 != false) goto L_0x0161;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x015e, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, r10, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x0161, code lost:
        r8 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x0162, code lost:
        if (r8 != false) goto L_?;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x0168, code lost:
        if (r7.getChildrenLength() != 1) goto L_?;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x016a, code lost:
        com.adobe.xmp.impl.XMPNodeUtils.appendLangItem(r7, com.adobe.xmp.XMPConst.X_DEFAULT, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:97:?, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setLocalizedText(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        XMPNode xMPNode;
        boolean z;
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertArrayName(str2);
        ParameterAsserts.assertSpecificLang(str4);
        String normalizeLangValue = str3 != null ? Utils.normalizeLangValue(str3) : null;
        String normalizeLangValue2 = Utils.normalizeLangValue(str4);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), true, new PropertyOptions(7680));
        if (findNode != null) {
            if (!findNode.getOptions().isArrayAltText()) {
                if (findNode.hasChildren() || !findNode.getOptions().isArrayAlternate()) {
                    throw new XMPException("Specified property is no alt-text array", 102);
                }
                findNode.getOptions().setArrayAltText(true);
            }
            Iterator iterateChildren = findNode.iterateChildren();
            while (true) {
                if (!iterateChildren.hasNext()) {
                    xMPNode = null;
                    z = false;
                    break;
                }
                xMPNode = (XMPNode) iterateChildren.next();
                if (xMPNode.hasQualifier() && XMPConst.XML_LANG.equals(xMPNode.getQualifier(1).getName())) {
                    if (XMPConst.X_DEFAULT.equals(xMPNode.getQualifier(1).getValue())) {
                        z = true;
                        break;
                    }
                }
            }
            throw new XMPException("Language qualifier must be first", 102);
        }
        throw new XMPException("Failed to find or create array node", 102);
    }

    /* access modifiers changed from: 0000 */
    public void setNode(XMPNode xMPNode, Object obj, PropertyOptions propertyOptions, boolean z) throws XMPException {
        if (z) {
            xMPNode.clear();
        }
        xMPNode.getOptions().mergeWith(propertyOptions);
        if (!xMPNode.getOptions().isCompositeProperty()) {
            XMPNodeUtils.setNodeValue(xMPNode, obj);
        } else if (obj == null || obj.toString().length() <= 0) {
            xMPNode.removeChildren();
        } else {
            throw new XMPException("Composite nodes can't have values", 102);
        }
    }

    public void setObjectName(String str) {
        this.tree.setName(str);
    }

    public void setPacketHeader(String str) {
        this.packetHeader = str;
    }

    public void setProperty(String str, String str2, Object obj) throws XMPException {
        setProperty(str, str2, obj, null);
    }

    public void setProperty(String str, String str2, Object obj, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        PropertyOptions verifySetOptions = XMPNodeUtils.verifySetOptions(propertyOptions, obj);
        XMPNode findNode = XMPNodeUtils.findNode(this.tree, XMPPathParser.expandXPath(str, str2), true, verifySetOptions);
        if (findNode != null) {
            setNode(findNode, obj, verifySetOptions, false);
            return;
        }
        throw new XMPException("Specified property does not exist", 102);
    }

    public void setPropertyBase64(String str, String str2, byte[] bArr) throws XMPException {
        setProperty(str, str2, bArr, null);
    }

    public void setPropertyBase64(String str, String str2, byte[] bArr, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, bArr, propertyOptions);
    }

    public void setPropertyBoolean(String str, String str2, boolean z) throws XMPException {
        setProperty(str, str2, z ? XMPConst.TRUESTR : XMPConst.FALSESTR, null);
    }

    public void setPropertyBoolean(String str, String str2, boolean z, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, z ? XMPConst.TRUESTR : XMPConst.FALSESTR, propertyOptions);
    }

    public void setPropertyCalendar(String str, String str2, Calendar calendar) throws XMPException {
        setProperty(str, str2, calendar, null);
    }

    public void setPropertyCalendar(String str, String str2, Calendar calendar, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, calendar, propertyOptions);
    }

    public void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime) throws XMPException {
        setProperty(str, str2, xMPDateTime, null);
    }

    public void setPropertyDate(String str, String str2, XMPDateTime xMPDateTime, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, xMPDateTime, propertyOptions);
    }

    public void setPropertyDouble(String str, String str2, double d) throws XMPException {
        setProperty(str, str2, new Double(d), null);
    }

    public void setPropertyDouble(String str, String str2, double d, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Double(d), propertyOptions);
    }

    public void setPropertyInteger(String str, String str2, int i) throws XMPException {
        setProperty(str, str2, new Integer(i), null);
    }

    public void setPropertyInteger(String str, String str2, int i, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Integer(i), propertyOptions);
    }

    public void setPropertyLong(String str, String str2, long j) throws XMPException {
        setProperty(str, str2, new Long(j), null);
    }

    public void setPropertyLong(String str, String str2, long j, PropertyOptions propertyOptions) throws XMPException {
        setProperty(str, str2, new Long(j), propertyOptions);
    }

    public void setQualifier(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setQualifier(str, str2, str3, str4, str5, null);
    }

    public void setQualifier(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertPropName(str2);
        if (doesPropertyExist(str, str2)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(XMPPathFactory.composeQualifierPath(str3, str4));
            setProperty(str, sb.toString(), str5, propertyOptions);
            return;
        }
        throw new XMPException("Specified property does not exist!", 102);
    }

    public void setStructField(String str, String str2, String str3, String str4, String str5) throws XMPException {
        setStructField(str, str2, str3, str4, str5, null);
    }

    public void setStructField(String str, String str2, String str3, String str4, String str5, PropertyOptions propertyOptions) throws XMPException {
        ParameterAsserts.assertSchemaNS(str);
        ParameterAsserts.assertStructName(str2);
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(XMPPathFactory.composeStructFieldPath(str3, str4));
        setProperty(str, sb.toString(), str5, propertyOptions);
    }

    public void sort() {
        this.tree.sort();
    }
}
