package com.android.camera.network.resource;

import android.text.TextUtils;

public class Resource {
    public int category;
    public String content;
    public String extra;
    public String icon;
    public long id;
    public String label;
    public long parent;
    public String type;

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Resource)) {
            return false;
        }
        Resource resource = (Resource) obj;
        if (this.id != resource.id || this.parent != resource.parent || this.category != resource.category || !TextUtils.equals(this.type, resource.type) || !TextUtils.equals(this.label, resource.label) || !TextUtils.equals(this.icon, resource.icon) || !TextUtils.equals(this.extra, resource.extra) || !TextUtils.equals(this.content, resource.content)) {
            z = false;
        }
        return z;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Resource{id=");
        sb.append(this.id);
        sb.append(", parent=");
        sb.append(this.parent);
        sb.append(", category=");
        sb.append(this.category);
        sb.append(", type='");
        sb.append(this.type);
        sb.append('\'');
        sb.append(", label='");
        sb.append(this.label);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
