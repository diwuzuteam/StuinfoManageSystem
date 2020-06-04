package com.pdsu.service;

import com.github.pagehelper.PageInfo;
import com.pdsu.po.Student;
import com.pdsu.po.Teacher;
import org.springframework.web.server.handler.ExceptionHandlingWebHandler;

/**
 * @author xxy
 * @Description: 教师service
 * @Version 1.0
 */
public interface TeacherService {
    /**
     * 查询所有教师信息
     */
    public PageInfo<Teacher> findAllTeacher(int page, int size);

    /**
     *删除教师信息
     */
    public void deleteTeacher(String thNo)throws Exception;
    /**
     * 添加教师信息
     */
    public void addTeacher(Teacher teacher)throws Exception;
    /**
     * 判断教师工号是否存在
     */
    public Teacher selectTeacherByNo(String thNo)throws Exception;
    /**
     * 更新教师信息
     */
    public void updateTeacher(Teacher teacher)throws Exception;
    /**
     * 动态查询教师信息
     */
    public PageInfo<Teacher> dynamicQuery(int page, int size, Teacher teacher) throws Exception;
}
