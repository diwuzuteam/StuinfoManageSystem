package com.pdsu.po;

import java.io.Serializable;

public class Dormitory implements Serializable {
    private String dormId;

    private String dormNumber;

    private String dormMonitor;

    private static final long serialVersionUID = 1L;

    public String getDormId() {
        return dormId;
    }

    public void setDormId(String dormId) {
        this.dormId = dormId == null ? null : dormId.trim();
    }

    public String getDormNumber() {
        return dormNumber;
    }

    public void setDormNumber(String dormNumber) {
        this.dormNumber = dormNumber == null ? null : dormNumber.trim();
    }

    public String getDormMonitor() {
        return dormMonitor;
    }

    public void setDormMonitor(String dormMonitor) {
        this.dormMonitor = dormMonitor == null ? null : dormMonitor.trim();
    }
}