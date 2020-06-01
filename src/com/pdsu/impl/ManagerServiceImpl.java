package com.pdsu.impl;

import com.pdsu.controller.exception.ManagerException;
import com.pdsu.mapper.ManagerMapper;
import com.pdsu.po.Manager;
import com.pdsu.service.ManagerService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author xxy
 * @Description: 管理员service实现类
 * @Version 1.0
 */
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public Manager checkIdIsExist(String adId) throws Exception {
        Manager manager = managerMapper.selectByPrimaryKey(adId);
        return manager;
    }

    @Override
    public Manager login(String adId) throws Exception {
        Manager manager = managerMapper.selectByPrimaryKey(adId);
        return manager;
    }

    @Override
    public void addManager(Manager manager) throws Exception {
        managerMapper.insert(manager);
    }

    @Override
    public Manager selectManager(String adId) throws Exception {
        Manager manager = managerMapper.selectByPrimaryKey(adId);
        return manager;
    }

    @Override
    public void editManager(String id,Manager manager) throws Exception {
        manager.setAdId(id);
        managerMapper.updateByPrimaryKey(manager);
    }

}
