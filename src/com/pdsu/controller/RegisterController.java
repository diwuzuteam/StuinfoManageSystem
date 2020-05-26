package com.pdsu.controller;

import com.pdsu.impl.ManagerServiceImpl;
import com.pdsu.po.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
/**
 * @author xxy
 * @Description: 管理员注册的controller
 * @Version 1.0
 */
@RestController
public class RegisterController {
    @Autowired
    ManagerServiceImpl managerService;

    /**
     * 判断账号是否存在
     */
    @RequestMapping(value = "/exitUsername")
   public String exitUsername(String adId) throws Exception {
       Manager manager = managerService.checkIdIsExist(adId);
       String msg = "";
        if (manager.getAdId().equals(adId)){
            msg = "OK";
       }else{
            msg = "NO";
        }
        return msg;
    }
    /**
     * 添加管理员
     */
    @RequestMapping(value = "/managerRegister")
    public ModelAndView managerRegister(Manager manager,ModelAndView modelAndView)throws Exception{
        managerService.addManager(manager);
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
