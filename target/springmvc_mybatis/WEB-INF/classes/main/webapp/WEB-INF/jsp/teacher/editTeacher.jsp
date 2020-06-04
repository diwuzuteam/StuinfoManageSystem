<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="编辑学生信息" bodyTitle="编辑学生信息">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/teacher/updateTeacher.action" method="post">
                <div class="form-group ">
                    <label class="control-label">工号</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           readonly name="thNo" value="${teacher.thNo}">
                </div>

                <div class="form-group ">
                    <label class="control-label">姓名</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="thName" value="${teacher.thName}">
                </div>

                <div class="form-group ">
                    <label class="control-label">性别</label>
                    <select class="form-control" name="thSex"
                            style="width: 240px;">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>

                <div class="form-group ">
                    <label class="control-label">地址</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="thAddress" value="${teacher.thAddress}">
                </div>

                <div class="form-group ">
                    <label class="control-label">电话</label>
                    <input type="text" style="width: 240px;"
                           class="form-control"
                           name="thPhone" value="${teacher.thPhone}">
                </div>


                <div class="form-group ">
                    <label class="control-label">职称</label>
                    <input type="text" style="width: 240px;"
                           class="form-control"
                           name="thTittle" value="${teacher.thTittle}">
                </div>

                <div class="form-group ">
                    <label class="control-label">电子邮件</label>
                    <input type="email" style="width: 240px;"
                           class="form-control"
                           name="thEmail" value="${teacher.thEmail}">
                </div>
                <p class="col-lg-4 col-lg-offset-4">
                    <button class="btn"  style="background-color:#0b7285;color: white" type="submit">提交</button>
                    <a href="javascript:history.back(-1)"  class="btn" style="background-color:#0b7285;color: white" role="button">返回</a>
                </p>
        </form>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item3_0";
    </script>
</template:user_backend>
