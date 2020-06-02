package com.pdsu.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pdsu.mapper.StudentMapper;
import com.pdsu.po.Student;
import com.pdsu.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Collections;
import java.util.List;

/**
 * @author xxy
 * @Description: StudentService实现类
 * @Version 1.0
 */
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public List<Student> findAllStudent() throws Exception {
        List<Student> students = (List<Student>) studentMapper.selectAllStudent();
        return students;
    }

    @Override
    public PageInfo<Student> findStudentList(int page, int size) {
        String orderBy = "su_id asc";
        PageHelper.startPage(page, size, orderBy);
        List<Student> list = (List<Student>) studentMapper.selectAllStudent();
        PageInfo<Student> pageInfo = new PageInfo<Student>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Student> findStudentListDesc(int page, int size) {
        String orderBy = "su_id desc";
        PageHelper.startPage(page, size, orderBy);
        List<Student> list = (List<Student>) studentMapper.selectAllStudent();
        PageInfo<Student> pageInfo = new PageInfo<Student>(list);
        return pageInfo;
    }

    @Override
    public Student findStudentByNo(String suId)throws Exception {
        Student student = studentMapper.selectByPrimaryKey(suId);
        return student;
    }

    @Override
    public void updateStudent(String id,Student student) throws Exception {
        student.setSuId(id);
        studentMapper.updateByPrimaryKey(student);
    }

    @Override
    public void addStudent(Student student) throws Exception {
        studentMapper.insert(student);
    }

    @Override
    public Student checkSuIdIsExist(String suId) throws Exception {
        Student student = studentMapper.selectByPrimaryKey(suId);
        return student;
    }

    @Override
    public void deleteStudent(String suId) throws Exception {
        studentMapper.deleteByPrimaryKey(suId);
    }

    @Override
    public PageInfo<Student> dynamicQuery(int page, int size,Student student) throws Exception {
        PageHelper.startPage(page, size);
        List<Student> list = (List<Student>) studentMapper.dynamicQuery(student);
        PageInfo<Student> pageInfo = new PageInfo<Student>(list);
        return pageInfo;
    }

}
