package com.pdsu.controller.exception;

/**
 * @author xxy
 * @Date
 * @Description: 自定义异常类
 * @Version 1.0
 */
public class ManagerException extends Exception{
    //异常信息
    public String message;

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ManagerException(String message){
        super(message);
        this.message = message;

    }
}
