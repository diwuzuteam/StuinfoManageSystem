<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="添加课程信息" bodyTitle="添加课程信息">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span> 添加课程信息
            </div>
            <div class="panel-body">
                <form name="form1" action="${pageContext.request.contextPath}/course/addCourse.action" method="post" onsubmit="return myCheck()">
                    <fieldset>
                        <div class="form-group ">
                            <label class="control-label">课程编号</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入课程编号"
                                   name="csNo" id="csNo" onblur="checkCsNo()">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">课程名称</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入课程名称"
                                   name="csName" id="csName">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">课程容量</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入课程容量"
                                   name="csNumber" id="csNumber">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">授课教师</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入授课教师工号"
                                    name="csTeacher" id="csTeacher" onblur="checkThNo()">
                        </div>


                        <div class="form-group ">
                            <label class="control-label">课程学分</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入课程学分"
                                   name="csCredit" id="csCredit">
                        </div>

                        <button class="btn"  style="background-color:#0b7285;color: white" type="submit">添加课程信息</button>
                    </fieldset>
                </form>
                <button class="btn btn-default" onclick="clear_content()" id="button1">重置</button>
                <button class="btn btn-default" onclick="javascript:history.back(-1)" id="button2">返回</button>
            </div>
        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item4_1";
    </script>
<%--判断课程号是否存在--%>
    <script>
        function checkCsNo(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/course/exitCourseNo.action",
                data:{'csNo':$("#csNo").val()},
                success:function (data) {
                    if (data.toString()=='NO'){
                        alert("该课程已存在！")
                    }else {
                        return;
                    }
                }
            });
        }
    </script>
<%--jQuery重置文本框内容--%>
    <script>
        function clear_content()
        {
            $("#csNo").val("");
            $("#csName").val("");
            $("#csNumber").val("");
            $("#csTeacher").val("");
            $("#csCredit").val("");
            $("#csNo").focus();
        }
    </script>
<%--非空校验--%>
    <script type="text/javascript">
        function myCheck()
        {
            for(var i=0;i<document.form1.elements.length-1;i++)
            {
                if(document.form1.elements[i].value=="")
                {
                    alert("当前表单不能有空项,请填写完整!");
                    document.form1.elements[i].focus();
                    return false;
                }
            }
            return true;
        }
    </script>
<%--判断教师工号是否存在--%>
    <script>
        function checkThNo(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/teacher/exitTeacherNo.action",
                data:{'thNo':$("#csTeacher").val()},
                success:function (data) {
                    if (data.toString()=='NO'){
                        return;
                    }else {
                        alert("该教师不存在请检查后重新输入！")
                    }
                }
            });
        }
    </script>
</template:user_backend>
