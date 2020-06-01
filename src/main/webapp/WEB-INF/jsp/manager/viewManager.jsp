<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="${manager.adName}" bodyTitle="学生信息详情">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>工号:</strong>${manager.adId}
        </div>
        <div class="panel-heading">
            <strong>姓名:</strong>${manager.adName}
        </div>
        <div class="panel-heading">
            <strong>邮箱:</strong> ${manager.adEmail}
        </div>
        <div class="panel-heading">
            <strong>电话:</strong> ${manager.adPhone}
        </div>
    </div>
    <a href="javascript:history.back(-1)"  class="btn btn-primary btn-lg" role="button">返回</a>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item2_0";
    </script>
</template:user_backend>