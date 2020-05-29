package com.pdsu.impl;

import com.pdsu.po.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


/**
 * @author xxy
 * @Date 2020/5/29 8:40
 * @Description:
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/applicationContext.xml")
public class StudentServiceImplTest {
    @Autowired
     public StudentServiceImpl studentService;
    /*@Test
    public void dynamicQuery() throws Exception {
        Student student = new Student();
        //student.setSuId("171210239");
        //student.setSuName("夏新");
        student.setSuClass("17级计科2班");
        List<Student> studentList = studentService.dynamicQuery(student);
        for (Student students:studentList
             ) {
            students.getSuId();
            student.getSuName();
        }
    }*/

    @Test
    public void findStudentByNo() throws Exception {
        String id = "171210239";
        Student student = studentService.findStudentByNo(id);
        System.out.println(student.getSuId() + student.getSuName());

    }

    @Test
    public void findAllStudent() throws Exception {
        List<Student> students = studentService.findAllStudent();
        for (Student stu:students
             ) {
            System.out.println(stu.getSuId() +
            stu.getSuName());

        }
    }
}