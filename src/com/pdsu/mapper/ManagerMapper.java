package com.pdsu.mapper;

import com.pdsu.po.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(String adId);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String adId);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}