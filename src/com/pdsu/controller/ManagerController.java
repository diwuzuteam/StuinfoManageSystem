package com.pdsu.controller;

import com.pdsu.controller.exception.ManagerException;
import com.pdsu.impl.ManagerServiceImpl;
import com.pdsu.po.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author xxy
 * @Description: 管理员controller
 * @Version 1.0
 */
@Controller
@RequestMapping("manager")
public class ManagerController {
    @Autowired
    public ManagerServiceImpl managerService;

    /**
     * 跳转到登录页面
     */
    @RequestMapping(value = "/login")
    public ModelAndView goLogin(ModelAndView modelAndView) {
        modelAndView.setViewName("login");
        return modelAndView;
    }

    /**
     * 登录
     */
    @RequestMapping(value = "/toLogin",method = RequestMethod.POST)
    public ModelAndView toLogin(String adId, String adPassword, ModelAndView modelAndView, HttpSession session, String remember, HttpServletResponse response) throws Exception {
        Manager manager = managerService.login(adId);
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
            modelAndView.setViewName("student/listStudentPage");
        }else {
            throw new ManagerException("登陆失败，请检查用户名和密码再次登录！");
        }
        return modelAndView;
    }

    /**
     *判断密码是否正确
     */
    @RequestMapping(value = "/checkPassword",method = RequestMethod.POST)
    @ResponseBody
    public String checkPassword(String adId, String adPassword) throws Exception {
        Manager manager = managerService.login(adId);
        String msg = "";
        if (manager == null){
            msg = "NO";
        }else{
            if (manager.getAdPassword().equals(adPassword)){
                //密码正确　
                msg = "OK";
            }else{
                //密码错误
                msg = "NO";
            }
        }
        return msg;
    }
    /**
     * 注销登录
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session,ModelAndView modelAndView) throws Exception {
        session.invalidate();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    /**
     * 判断账号是否存在
     */
    @RequestMapping(value = "/exitUsername",method = RequestMethod.POST)
    @ResponseBody
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
    @RequestMapping(value = "/managerRegister",method = RequestMethod.POST)
    public ModelAndView managerRegister(Manager manager,ModelAndView modelAndView)throws Exception{
            managerService.addManager(manager);
            modelAndView.setViewName("login");
            return modelAndView;
    }
    /**
     * 跳转到管理员信息页面
     */
    @RequestMapping(value = "/toShowManager/{adId}")
    public ModelAndView toShowManager(ModelAndView modelAndView,@PathVariable("adId") String adId) throws Exception {
        Manager manager = managerService.selectManager(adId);
        modelAndView.addObject("manager",manager);
        modelAndView.setViewName("manager/viewManager");
        return  modelAndView;
    }
    /**
     * 跳转到管理员编辑页面
     */
    @RequestMapping("/goEditManager")
    public ModelAndView goEditManager(String adId,ModelAndView modelAndView)throws Exception{
        modelAndView.setViewName("manager/editManager");
        return modelAndView;
    }
    /**
     * 管理员信息修改
     */
    @RequestMapping(value = "/editManager",method = RequestMethod.POST)
    public ModelAndView editManager(String id,Manager manager,ModelAndView modelAndView,HttpSession session)throws Exception{
        managerService.editManager(id,manager);
        session.invalidate();
        modelAndView.setViewName("login");
        return modelAndView;
    }
    /**
     * 验证找回密码界面输入的工号和姓名是否匹配
     */
    @RequestMapping(value = "/checkIdAndName",method = RequestMethod.POST)
    @ResponseBody
    public String checkIdAndName(String adId,String adName) throws Exception {
        Manager manager = managerService.selectManager(adId);
        String msg = "";
        if (manager == null){
            msg = "NO";
        }else{
            if (manager.getAdName().equals(adName)){
                msg = "OK";
            }else{
                msg = "NO";
            }
        }
        return msg;
    }
    /**
     * 管理员密码修改
     */
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
    public ModelAndView updatePassword(Manager manager,ModelAndView modelAndView,HttpSession session){
        managerService.updatePassword(manager);
        session.invalidate();
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
