package com.pdsu.controller;

import com.pdsu.controller.exception.ManagerException;
import com.pdsu.impl.ManagerServiceImpl;
import com.pdsu.po.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author xxy
 * @Date 2020/5/17 22:09
 * @Description: 管理员登录controller
 * @Version 1.0
 */
@Controller
public class LoginController {
    @Autowired
    public ManagerServiceImpl managerService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping(value = "/login")
    public String goLogin(HttpSession session) {
        return "login";
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/toLogin")
    public ModelAndView toLogin(String adId, String adPassword,ModelAndView modelAndView, HttpSession session,String remember,HttpServletResponse response,HttpServletRequest request) throws Exception {
        Manager manager=managerService.login(adId);
        if(adId.equals(manager.getAdId()) && adPassword.equals(manager.getAdPassword())){
            if("on".equals(remember)){
                Cookie cookie1 = new Cookie("adId",adId);
                Cookie cookie2 = new Cookie("adPassword",adPassword);
                //Cookie保存24小时
                cookie1.setMaxAge(60*60*24);
                cookie2.setMaxAge(60*60*24);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }else{
                Cookie cookie1 = new Cookie("adId","");
                Cookie cookie2 = new Cookie("adPassword","");
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }

            //登录成功，将user对象设置到HttpSession作用范围域中
            session.setAttribute("manager", manager);
            //登录成功，跳转页面　
            modelAndView.setViewName("listStudentPage");
        }else {
            throw new ManagerException("登陆失败，请检查用户名和密码再次登录！");
        }
        return modelAndView;
    }
    /**
     * 注销登录
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:login.action";
    }

}

