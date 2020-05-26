package com.pdsu.po;

import java.io.Serializable;

public class Course implements Serializable {
    private String csNo;

    private String csName;

    private String csNumber;

    private String csCredit;

    private String csTeacher;

    private static final long serialVersionUID = 1L;

    public String getCsNo() {
        return csNo;
    }

    public void setCsNo(String csNo) {
        this.csNo = csNo == null ? null : csNo.trim();
    }

    public String getCsName() {
        return csName;
    }

    public void setCsName(String csName) {
        this.csName = csName == null ? null : csName.trim();
    }

    public String getCsNumber() {
        return csNumber;
    }

    public void setCsNumber(String csNumber) {
        this.csNumber = csNumber == null ? null : csNumber.trim();
    }

    public String getCsCredit() {
        return csCredit;
    }

    public void setCsCredit(String csCredit) {
        this.csCredit = csCredit == null ? null : csCredit.trim();
    }

    public String getCsTeacher() {
        return csTeacher;
    }

    public void setCsTeacher(String csTeacher) {
        this.csTeacher = csTeacher == null ? null : csTeacher.trim();
    }
}