package com.pdsu.service;

import com.github.pagehelper.PageInfo;
import com.pdsu.po.Course;
import com.pdsu.po.Teacher;

import java.util.List;

/**
 * @author xxy
 * @Description: 课程service
 * @Version 1.0
 */
public interface CourseService {
    /**
     * 查询所有课程信息
     */
    public PageInfo<Course> findAllCourse(int page, int size)throws Exception;
    /**
     *查询单个课程信息
     */
    public Course findCourseByNo(String csNo)throws Exception;
    /**
     * 添加课程信息
     */
    public void addCourse(Course course)throws Exception;
    /**
     * 删除课程信息
     */
    public void deleteCourse(String csNo)throws Exception;
    /**
     * 更新课程信息
     */
    public void updateCourse(Course course)throws Exception;
    /**
     * 动态查询
     */
    public PageInfo<Course> dynamicQuery(int page, int size, Course course)throws Exception;
}
