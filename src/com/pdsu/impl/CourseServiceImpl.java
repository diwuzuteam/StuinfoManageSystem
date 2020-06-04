package com.pdsu.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pdsu.mapper.CourseMapper;
import com.pdsu.po.Course;
import com.pdsu.po.Teacher;
import com.pdsu.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author xxy
 * @Description: 课程service实现类
 * @Version 1.0
 */
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Override
    public PageInfo<Course> findAllCourse(int page, int size)throws Exception{
        PageHelper.startPage(page, size);
        List<Course> list = courseMapper.selectAllCourse();
        PageInfo<Course> pageInfo = new PageInfo<Course>(list);
        return pageInfo;
    }

    @Override
    public Course findCourseByNo(String csNo) throws Exception {
        return courseMapper.selectByPrimaryKey(csNo);
    }

    @Override
    public void addCourse(Course course) throws Exception {
        courseMapper.insert(course);
    }

    @Override
    public void deleteCourse(String csNo) throws Exception {
        courseMapper.deleteByPrimaryKey(csNo);
    }

    @Override
    public void updateCourse(Course course) throws Exception {
        courseMapper.updateByPrimaryKey(course);
    }

    @Override
    public PageInfo<Course> dynamicQuery(int page, int size, Course course) throws Exception {
        PageHelper.startPage(page, size);
        List<Course> list = courseMapper.dynamicQuery(course);
        PageInfo<Course> pageInfo = new PageInfo<Course>(list);
        return pageInfo;
    }
}
