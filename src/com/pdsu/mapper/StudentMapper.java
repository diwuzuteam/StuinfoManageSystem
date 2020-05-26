package com.pdsu.mapper;

import com.pdsu.po.Student;

import java.util.List;


public interface StudentMapper {
    int deleteByPrimaryKey(String suId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String suId);

    List<Student> selectAllStudent();

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}