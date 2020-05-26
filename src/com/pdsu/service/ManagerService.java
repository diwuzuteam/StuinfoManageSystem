package com.pdsu.service;

import com.pdsu.po.Manager;
import org.apache.ibatis.annotations.Param;

/**
 * @author xxy
 * @Description:
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
//    public void addManager(String adId, String adPassword, String adPhone, String adName, String adEmail)throws Exception;
    public void addManager(Manager manager)throws Exception;

}
