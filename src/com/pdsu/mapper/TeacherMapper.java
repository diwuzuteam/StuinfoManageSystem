package com.pdsu.mapper;

import com.pdsu.po.Student;
import com.pdsu.po.Teacher;

import java.util.List;

public interface TeacherMapper {
    int deleteByPrimaryKey(String thNo);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String thNo);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    List<Teacher> selectAllTeacher();

    List<Teacher> dynamicQuery(Teacher teacher);
}