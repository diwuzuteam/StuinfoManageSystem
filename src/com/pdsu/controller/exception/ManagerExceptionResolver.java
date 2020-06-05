package com.pdsu.controller.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author xxy
 * @Description: 全局异常处理器
 * @Version 1.0
 */
public class ManagerExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        //handler就是处理器适配器要执行的Handler对象（只有method）
        ManagerException managerException = null;
        if (e instanceof ManagerException){
            managerException = (ManagerException)e;
        }else{
            managerException = new ManagerException("未知错误，请联系管理员！");
        }
        //错误信息
        String message = managerException.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message",message);
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
