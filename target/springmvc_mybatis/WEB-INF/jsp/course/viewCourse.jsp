<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="${course.csName}" bodyTitle="学生信息详情">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>课程编号:</strong>${course.csNo}
        </div>
        <div class="panel-heading">
            <strong>课程名称:</strong>${course.csName}
        </div>
        <div class="panel-heading">
            <strong>课程容量:</strong>${course.csNumber}
        </div>
        <div class="panel-heading">
            <strong>课程学分:</strong>${course.csCredit}
        </div>
        <div class="panel-heading">
            <strong>授课教师:</strong>${course.csTeacher}
        </div>
    </div>

    <a href="javascript:history.back(-1)"  class="btn btn-primary btn-lg" role="button">返回</a>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item4_0";
    </script>
</template:user_backend>