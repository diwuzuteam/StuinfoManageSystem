package com.pdsu.mapper;

import com.pdsu.po.Course;

import java.util.List;

public interface CourseMapper {
    int deleteByPrimaryKey(String csNo);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String csNo);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> selectAllCourse();

    List<Course> dynamicQuery(Course course);
}