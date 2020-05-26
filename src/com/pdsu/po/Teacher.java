package com.pdsu.po;

import java.io.Serializable;

public class Teacher implements Serializable {
    private String thNo;

    private String thName;

    private String thSex;

    private String thAddress;

    private String thPhone;

    private String thTittle;

    private String thEmail;

    private static final long serialVersionUID = 1L;

    public String getThNo() {
        return thNo;
    }

    public void setThNo(String thNo) {
        this.thNo = thNo == null ? null : thNo.trim();
    }

    public String getThName() {
        return thName;
    }

    public void setThName(String thName) {
        this.thName = thName == null ? null : thName.trim();
    }

    public String getThSex() {
        return thSex;
    }

    public void setThSex(String thSex) {
        this.thSex = thSex == null ? null : thSex.trim();
    }

    public String getThAddress() {
        return thAddress;
    }

    public void setThAddress(String thAddress) {
        this.thAddress = thAddress == null ? null : thAddress.trim();
    }

    public String getThPhone() {
        return thPhone;
    }

    public void setThPhone(String thPhone) {
        this.thPhone = thPhone == null ? null : thPhone.trim();
    }

    public String getThTittle() {
        return thTittle;
    }

    public void setThTittle(String thTittle) {
        this.thTittle = thTittle == null ? null : thTittle.trim();
    }

    public String getThEmail() {
        return thEmail;
    }

    public void setThEmail(String thEmail) {
        this.thEmail = thEmail == null ? null : thEmail.trim();
    }
}