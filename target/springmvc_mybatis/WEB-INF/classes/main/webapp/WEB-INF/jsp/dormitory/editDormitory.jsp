<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="编辑宿舍信息" bodyTitle="编辑宿舍信息">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/dormitory/updateDorm.action" method="post">
                <div class="form-group ">
                    <label class="control-label">宿舍号</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           readonly name="dormId" value="${dormitory.dormId}">
                </div>

                <div class="form-group ">
                    <label class="control-label">宿舍类型</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="dormNumber" value="${dormitory.dormNumber}">
                </div>

                <div class="form-group ">
                    <label class="control-label">宿舍长学号</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="dormMonitor" value="${dormitory.dormMonitor}">
                </div>

                <p class="col-lg-4 col-lg-offset-4">
                    <button class="btn"  style="background-color:#0b7285;color: white" type="submit">提交</button>
                    <a href="javascript:history.back(-1)"  class="btn" style="background-color:#0b7285;color: white" role="button">返回</a>
                </p>
        </form>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item5_0";
    </script>
</template:user_backend>
