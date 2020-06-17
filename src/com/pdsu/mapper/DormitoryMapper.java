package com.pdsu.mapper;

import com.pdsu.po.Dormitory;

import java.util.List;

public interface DormitoryMapper {
    int deleteByPrimaryKey(String dormId);

    List<Dormitory> selectAllDormitory();

    int insert(Dormitory record);

    int insertSelective(Dormitory record);

    Dormitory selectByPrimaryKey(String dormId);

    int updateByPrimaryKeySelective(Dormitory record);

    int updateByPrimaryKey(Dormitory record);

    Dormitory findDormByMonitor(String dormMonitor);

    List<Dormitory> dynamicQuery(Dormitory dormitory);
}