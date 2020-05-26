<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="${student.suName}" bodyTitle="学生信息详情">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>学号:</strong>${student.suId}
        </div>
        <div class="panel-heading">
            <strong>姓名:</strong>${student.suName}
        </div>
        <div class="panel-heading">
            <strong>性别:</strong>${student.suSex}
        </div>
        <div class="panel-heading">
            <strong>班级:</strong>${student.suClass}
        </div>
        <div class="panel-heading">
            <strong>宿舍号:</strong>  ${student.suDm}
        </div>
        <div class="panel-heading">
            <strong>邮箱:</strong> ${student.suEmail}
        </div>
        <div class="panel-heading">
            <strong>电话:</strong> ${student.suPhone}
        </div>
    </div>

    <a href="javascript:history.back(-1)"  class="btn btn-primary btn-lg" role="button">返回</a>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>