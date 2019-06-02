package com.android.camera.network.resource;

public class LiveResource {
    public String id;
    public boolean isLocal;

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LiveResource{id=");
        sb.append(this.id);
        sb.append(", ");
        sb.append(this.isLocal ? "local" : "online");
        sb.append('}');
        return sb.toString();
    }
}
