<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="${teacher.thName}" bodyTitle="学生信息详情">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>工号:</strong>${teacher.thNo}
        </div>
        <div class="panel-heading">
            <strong>姓名:</strong>${teacher.thName}
        </div>
        <div class="panel-heading">
            <strong>性别:</strong>${teacher.thSex}
        </div>
        <div class="panel-heading">
            <strong>地址:</strong>${teacher.thAddress}
        </div>
        <div class="panel-heading">
            <strong>电话:</strong>  ${teacher.thPhone}
        </div>
        <div class="panel-heading">
            <strong>职称:</strong> ${teacher.thTittle}
        </div>
        <div class="panel-heading">
            <strong>电子邮件:</strong> ${teacher.thEmail}
        </div>
    </div>

    <a href="javascript:history.back(-1)"  class="btn btn-primary btn-lg" role="button">返回</a>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item3_0";
    </script>
</template:user_backend>