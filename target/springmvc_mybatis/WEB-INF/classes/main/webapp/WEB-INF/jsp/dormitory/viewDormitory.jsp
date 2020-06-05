<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="${dormitory.dormId}" bodyTitle="宿舍信息详情">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>宿舍号:</strong>${dormitory.dormId}
        </div>
        <div class="panel-heading">
            <strong>宿舍类型:</strong>${dormitory.dormNumber}
        </div>
        <div class="panel-heading">
            <strong>宿舍长学号:</strong>${dormitory.dormMonitor}
        </div>
    </div>

    <a href="javascript:history.back(-1)"  class="btn btn-primary btn-lg" role="button">返回</a>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item5_0";
    </script>
</template:user_backend>