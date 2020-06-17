package com.pdsu.interceptor;

import com.pdsu.po.Manager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author xxy
 * @Description: 登陆认证的拦截器
 * @Version 1.0
 */
public class HandlerInterceptorManager implements HandlerInterceptor {

    //进入Handler方法之前执行
    //用于身份认证、身份授权
    //身份认证：如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的url
        String url = request.getRequestURI();
        //判断url是否是公开地址（实际开发时，地址配置在文件中）
        if (url.indexOf("toLogin.action")>=0||
                url.indexOf("managerRegister.action")>=0||
                url.indexOf("exitUsername.action")>=0||
                url.indexOf("checkIdAndName.action")>=0||
                url.indexOf("updatePassword.action")>=0||
                url.indexOf("checkPassword.action")>=0){
            //如果到登陆页面，放行
            return true;
        }
        //判断session
        HttpSession session = request.getSession();
        //从session中取出用户信息
        Manager manager = (Manager) session.getAttribute("manager");
        if (manager != null){
            return true;
        }

        //执行这里表示用户身份需要认证，跳转登陆页面
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);

        //return false表示拦截，不向下M执行
        //return true表示放行
        return false;
    }

    //进入Handler方法之后，返回modelAndView之前执行
    //应用场景从modelAndView出发：将公用的模型数据（比如菜单导航）传到视图，也可以在这里指定视图
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    //Handler完成执行执行此方法
    //应用场景：统一的异常处理、统一的日志处理
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
