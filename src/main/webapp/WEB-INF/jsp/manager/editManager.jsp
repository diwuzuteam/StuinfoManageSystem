<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="编辑学生信息" bodyTitle="编辑学生信息">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/manager/editManager.action" method="post">
            <div class="form-group ">
                <label class="control-label ">工号</label>
                <input type="text" style="width: 340px;"
                       class="form-control"
                       readonly name="id" value="${manager.adId}">
            </div>
            <div class="form-group ">
                <label class="control-label">姓名</label>
                <input type="text" style="width: 340px;"
                       class="form-control"
                       name="adName" value="${manager.adName}">
            </div>
            <div class="form-group ">
                <label class="control-label">电话</label>
                <input type="text" style="width: 340px;"
                       class="form-control"
                       name="adPhone" value="${manager.adPhone}">
            </div>
            <div class="form-group ">
                <label class="control-label">邮箱</label>
                <input type="text" style="width: 340px;"
                       class="form-control"
                       name="adEmail" value="${manager.adEmail}">
            </div>
            <div class="form-group ">
                <label class="control-label">密码</label>
                <input type="text" style="width: 340px;"
                       class="form-control"
                       name="adPassword" value="${manager.adPassword}">
            </div>
            <p class="col-lg-4 col-lg-offset-4">
                <button class="btn" style="background-color:#0b7285;color: white" type="submit">提交</button>
                <a href="javascript:history.back(-1)" class="btn" style="background-color:#0b7285;color: white"
                   role="button">返回</a>
            </p>
        </form>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item2_0";
    </script>
</template:user_backend>
