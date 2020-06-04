package com.pdsu.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pdsu.mapper.TeacherMapper;
import com.pdsu.po.Student;
import com.pdsu.po.Teacher;
import com.pdsu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author xxy
 * @Description: 教师service实现类
 * @Version 1.0
 */
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public PageInfo<Teacher> findAllTeacher(int page, int size) {
        PageHelper.startPage(page, size);
        List<Teacher> list = teacherMapper.selectAllTeacher();
        PageInfo<Teacher> pageInfo = new PageInfo<Teacher>(list);
        return pageInfo;
    }

    @Override
    public void deleteTeacher(String thNo) throws Exception {
        teacherMapper.deleteByPrimaryKey(thNo);
    }

    @Override
    public void addTeacher(Teacher teacher) throws Exception {
        teacherMapper.insert(teacher);
    }

    @Override
    public Teacher selectTeacherByNo(String thNo) throws Exception {
        return teacherMapper.selectByPrimaryKey(thNo);
    }

    @Override
    public void updateTeacher(Teacher teacher) throws Exception {
        teacherMapper.updateByPrimaryKey(teacher);
    }

    @Override
    public PageInfo<Teacher> dynamicQuery(int page, int size, Teacher teacher) throws Exception {
        PageHelper.startPage(page, size);
        List<Teacher> list = (List<Teacher>) teacherMapper.dynamicQuery(teacher);
        PageInfo<Teacher> pageInfo = new PageInfo<Teacher>(list);
        return pageInfo;
    }
}
