package com.pdsu.po;

import java.io.Serializable;

public class Student implements Serializable {
    private String suId;

    private String suName;

    private String suSex;

    private String suDm;

    private String suClass;

    private String suEmail;

    private String suPhone;

    private String suPic;

    public String getSuPhone() {
        return suPhone;
    }

    public void setSuPhone(String suPhone) {
        this.suPhone = suPhone;
    }

    private static final long serialVersionUID = 1L;

    public String getSuId() {
        return suId;
    }

    public void setSuId(String suId) {
        this.suId = suId == null ? null : suId.trim();
    }

    public String getSuName() {
        return suName;
    }

    public void setSuName(String suName) {
        this.suName = suName == null ? null : suName.trim();
    }

    public String getSuSex() {
        return suSex;
    }

    public void setSuSex(String suSex) {
        this.suSex = suSex == null ? null : suSex.trim();
    }

    public String getSuDm() {
        return suDm;
    }

    public void setSuDm(String suDm) {
        this.suDm = suDm == null ? null : suDm.trim();
    }

    public String getSuClass() {
        return suClass;
    }

    public void setSuClass(String suClass) {
        this.suClass = suClass == null ? null : suClass.trim();
    }

    public String getSuEmail() {
        return suEmail;
    }

    public void setSuEmail(String suEmail) {
        this.suEmail = suEmail == null ? null : suEmail.trim();
    }

    public String getSuPic() { return suPic; }

    public void setSuPic(String suPic) { this.suPic = suPic; }
}