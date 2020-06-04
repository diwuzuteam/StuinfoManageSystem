<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="编辑课程信息" bodyTitle="编辑课程信息">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/course/updateCourse.action" method="post">
                <div class="form-group ">
                    <label class="control-label">课程编号</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           readonly name="csNo" value="${course.csNo}">
                </div>

                <div class="form-group ">
                    <label class="control-label">课程名称</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="csName" value="${course.csName}">
                </div>

                <div class="form-group ">
                    <label class="control-label">课程容量</label>
                    <input type="text" style="width: 340px;"
                           class="form-control"
                           name="csNumber" value="${course.csNumber}">
                </div>

                <div class="form-group ">
                    <label class="control-label">教授教师</label>
                    <input type="text" style="width: 240px;"
                           class="form-control"
                           name="csTeacher" value="${course.csTeacher}">
                </div>


                <div class="form-group ">
                    <label class="control-label">课程学分</label>
                    <input type="text" style="width: 240px;"
                           class="form-control"
                           name="csCredit" value="${course.csCredit}">
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
