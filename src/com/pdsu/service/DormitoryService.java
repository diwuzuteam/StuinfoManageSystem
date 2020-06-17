package com.pdsu.service;

import com.github.pagehelper.PageInfo;
import com.pdsu.po.Course;
import com.pdsu.po.DormQueryVo;
import com.pdsu.po.Dormitory;
import com.pdsu.po.Teacher;

import java.util.List;

/**
 * @author xxy
 * @Description: 宿舍service类
 * @Version 1.0
 */
public interface DormitoryService {
    /**
     * 查询所有宿舍信息
     */
    public PageInfo<Dormitory> findAllDormitory(int page, int size)throws Exception;
    /**
     * 查询单个宿舍信息
     */
    public Dormitory findDormById(String dormId)throws Exception;
    /**
     * 删除宿舍信息
     */
    public void delDormitory(String dormId)throws Exception;
    /**
     * 更新宿舍信息
     */
    public void updateDorm(Dormitory dormitory)throws Exception;
    /**
     * 添加宿舍信息
     */
    public void addDorm(Dormitory dormitory)throws Exception;
    /**
     * 根据宿舍长查找宿舍
     */
    public Dormitory findDormByMo(String dormMonitor)throws Exception;
    /**
     * 动态查询
     */
    public PageInfo<Dormitory> dynamicQuery(int page, int size, Dormitory dormitory)throws Exception;
    /**
     * 宿舍学生信息综合查询
     */
    public PageInfo<DormQueryVo> queryDormStu(int page, int size);

}
