package com.ss.android.ugc.effectmanager.link.model.host;

import com.ss.android.ugc.effectmanager.link.model.blackRoom.BlackRoomItem;
import java.net.URI;

public class Host extends BlackRoomItem {
    private String host;
    private int port = -1;
    private String schema;
    private long sortTime;
    private long weightTime;

    public Host(String str) {
        URI create = URI.create(str);
        this.host = create.getHost();
        this.schema = create.getScheme();
        this.port = create.getPort();
    }

    public Host(String str, String str2) {
        this.host = str;
        this.schema = str2;
    }

    public Host(String str, String str2, long j) {
        this.host = str;
        this.schema = str2;
        this.weightTime = j;
    }

    public Host(URI uri) {
        this.host = uri.getHost();
        this.schema = uri.getScheme();
    }

    public String getHost() {
        return this.host;
    }

    public String getItemName() {
        StringBuilder sb = new StringBuilder();
        sb.append(getSchema());
        sb.append("://");
        sb.append(getHost());
        String sb2 = sb.toString();
        if (this.port == -1) {
            return sb2;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(":");
        sb3.append(this.port);
        return sb3.toString();
    }

    public int getPort() {
        return this.port;
    }

    public String getSchema() {
        return this.schema;
    }

    public long getSortTime() {
        return this.sortTime + this.weightTime;
    }

    public long getWeightTime() {
        return this.weightTime;
    }

    public boolean hostEquals(Host host2) {
        boolean z = false;
        if (host2 == null) {
            return false;
        }
        if (host2.getHost().equals(getHost()) && host2.getSchema().equals(getSchema())) {
            z = true;
        }
        return z;
    }

    public void setHost(String str) {
        this.host = str;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setSchema(String str) {
        this.schema = str;
    }

    public void setSortTime(long j) {
        this.sortTime = j;
    }

    public void setWeightTime(long j) {
        this.weightTime = j;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Host{weightTime=");
        sb.append(this.weightTime);
        sb.append(", schema='");
        sb.append(this.schema);
        sb.append('\'');
        sb.append(", host='");
        sb.append(this.host);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
