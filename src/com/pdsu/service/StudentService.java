package com.pdsu.service;

import com.github.pagehelper.PageInfo;
import com.pdsu.po.Student;

import java.util.List;

/**
 * @author xxy
 * @Description: 学生相关功能
 * @Version 1.0
 */
public interface StudentService {
    /**
     * 查找所有学生
     */
     public List<Student> findAllStudent()throws Exception;
    /**
     * 分页(默认升序)
     */
    public PageInfo<Student> findStudentList(int page, int size);
    /**
     * 分页(降序)
     */
    public PageInfo<Student> findStudentListDesc(int page, int size);
    /**
     * 按学号查找学生
     */
    public Student findStudentByNo(String suId)throws Exception;
    /**
     * 更新学生信息
     */
    public void updateStudent(String id,Student student)throws Exception;
    /**
     * 添加学生
     */
    public void addStudent(Student student)throws Exception;
    /**
     * 判断学生是否存在
     */
    public Student checkSuIdIsExist(String suId)throws Exception;
    /**
     * 删除学生信息
     */
    public void deleteStudent(String suId)throws Exception;
    /**
     * 动态查询学生信息并分页
     */
    public PageInfo<Student> dynamicQuery(int page,int size,Student student)throws Exception;

}
