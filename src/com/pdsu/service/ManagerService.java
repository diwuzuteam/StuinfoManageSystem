package com.pdsu.service;

import com.pdsu.po.Manager;
import org.apache.ibatis.annotations.Param;

/**
 * @author xxy
 * @Description: 管理员相关功能
 * @Version 1.0
 */
public interface ManagerService {
    /**
     * 根据id检查用户是否存在
     */
    public Manager checkIdIsExist(String adId)throws Exception;
    /**
     * 通过用户名及密码核查用户登录
     */
    public Manager login(String adId)throws Exception;
    /**
     * 管理员注册
     */
    public void addManager(Manager manager)throws Exception;
    /**
     * 按工号查找管理员信息
     */
    public Manager selectManager(String adId)throws Exception;
    /**
     * 管理员信息修改
     */
    public void editManager(String id,Manager manager)throws Exception;
    /**
     * 管理员密码修改
     */
    public void updatePassword(Manager manager)throws Exception;

}
