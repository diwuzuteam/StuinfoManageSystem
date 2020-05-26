package com.pdsu.mapper;

import com.pdsu.po.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(String csNo);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String csNo);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}