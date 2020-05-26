package com.pdsu.mapper;

import com.pdsu.po.Dormitory;

public interface DormitoryMapper {
    int deleteByPrimaryKey(String dormId);

    int insert(Dormitory record);

    int insertSelective(Dormitory record);

    Dormitory selectByPrimaryKey(String dormId);

    int updateByPrimaryKeySelective(Dormitory record);

    int updateByPrimaryKey(Dormitory record);
}