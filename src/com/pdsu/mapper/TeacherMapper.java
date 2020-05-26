package com.pdsu.mapper;

import com.pdsu.po.Teacher;

public interface TeacherMapper {
    int deleteByPrimaryKey(String thNo);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String thNo);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);
}