<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="添加学生信息" bodyTitle="添加学生信息">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span> 添加教师信息
            </div>
            <div class="panel-body">
                <form name="form1" action="${pageContext.request.contextPath}/teacher/addTeacher.action" onsubmit="return myCheck()">
                    <fieldset>
                        <div class="form-group ">
                            <label class="control-label">工号</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入教师工号"
                                   name="thNo" id="thNo" onblur="a2()">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">姓名</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入教师姓名"
                                   name="thName" id="thName">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">性别</label>
                            <select class="form-control" name="thSex" id="thSex"
                                    style="width: 240px;">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>

                        <div class="form-group ">
                            <label class="control-label">地址</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="XX省，XX市"
                                   name="thAddress" id="thAddress">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">电话</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入电话号码"
                                    name="thPhone" id="thPhone">
                        </div>


                        <div class="form-group ">
                            <label class="control-label">职称</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入教师职称"
                                   name="thTittle" id="thTittle">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">电子邮件</label>
                            <input type="email" style="width: 240px;"
                                   class="form-control" placeholder="请输入电子邮件"
                                   name="thEmail" id="thEmail">
                        </div>
                        <button class="btn"  style="background-color:#0b7285;color: white" type="submit">添加教师信息</button>
                    </fieldset>
                </form>
                <button class="btn btn-default" onclick="clear_content()" id="button1">重置</button>
                <button class="btn btn-default" onclick="javascript:history.back(-1)" id="button2">返回</button>
            </div>
        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item3_1";
    </script>
<%--判断教师工号是否存在--%>
    <script>
        function a2(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/teacher/exitTeacherNo.action",
                data:{'thNo':$("#thNo").val()},
                success:function (data) {
                    if (data.toString()=='NO'){
                        alert("该教师已存在！")
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
            $("#thNo").val("");
            $("#thName").val("");
            $("#thSex").val("");
            $("#thAddress").val("");
            $("#thPhone").val("");
            $("#thTittle").val("");
            $("#suEmail").val("");
            $("#thNo").focus();
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
</template:user_backend>
