package com.pdsu.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pdsu.mapper.DormitoryMapper;
import com.pdsu.mapper.TeacherMapper;
import com.pdsu.po.Course;
import com.pdsu.po.Dormitory;
import com.pdsu.po.Teacher;
import com.pdsu.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author xxy
 * @Description: 宿舍service实现类
 * @Version 1.0
 */
public class DormitoryServiceImpl implements DormitoryService {
    @Autowired
    private DormitoryMapper dormitoryMapper;
    @Override
    public PageInfo<Dormitory> findAllDormitory(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
        List<Dormitory> list = dormitoryMapper.selectAllDormitory();
        PageInfo<Dormitory> pageInfo = new PageInfo<Dormitory>(list);
        return pageInfo;
    }

    @Override
    public Dormitory findDormById(String dormId) throws Exception {
        return dormitoryMapper.selectByPrimaryKey(dormId);
    }

    @Override
    public void delDormitory(String dormId) throws Exception {
        dormitoryMapper.deleteByPrimaryKey(dormId);
    }

    @Override
    public void updateDorm(Dormitory dormitory) throws Exception {
        dormitoryMapper.updateByPrimaryKey(dormitory);
    }

    @Override
    public void addDorm(Dormitory dormitory) throws Exception {
        dormitoryMapper.insert(dormitory);
    }

    @Override
    public Dormitory findDormByMo(String dormMonitor) throws Exception {
        return dormitoryMapper.findDormByMonitor(dormMonitor);
    }

    @Override
    public PageInfo<Dormitory> dynamicQuery(int page, int size, Dormitory dormitory) throws Exception {
        PageHelper.startPage(page, size);
        List<Dormitory> list = dormitoryMapper.dynamicQuery(dormitory);
        PageInfo<Dormitory> pageInfo = new PageInfo<Dormitory>(list);
        return pageInfo;
    }
}
