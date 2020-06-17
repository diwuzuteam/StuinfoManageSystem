package com.pdsu.po;

/**
 * @author xxy
 * @Description: 宿舍信息，学生信息综合类
 * @Version 1.0
 */
public class DormQueryVo extends Dormitory{
    private Student student;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
