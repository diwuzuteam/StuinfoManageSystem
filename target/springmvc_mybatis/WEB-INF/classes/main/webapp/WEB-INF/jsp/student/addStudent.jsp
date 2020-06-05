<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="添加学生信息" bodyTitle="添加学生信息">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span> 添加学生信息
            </div>
            <div class="panel-body">
                <form name="form1" action="${pageContext.request.contextPath}/student/addStudent.action" enctype="multipart/form-data" method="post" onsubmit="return myCheck()">
                    <fieldset>
                        <div class="form-group ">
                            <a href="javascript:void(0)" onclick="uploadPhoto()">选择照片</a>
                            <input type="file" id="photoFile" name="photo" style="display: none;" onchange="upload()">
                            <img id="preview_photo" src="" width="150px" height="150px">
                            <style>
                                img[src=""],img:not([src]){
                                    opacity:0;
                                }
                            </style>
                        </div>
                        <div class="form-group ">
                            <label class="control-label">学号</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入学生学号"
                                   name="suId" id="suId" onblur="a2()">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">姓名</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入学生姓名"
                                   name="suName" id="suName">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">性别</label>
                            <select class="form-control" name="suSex" id="suSex"
                                    style="width: 240px;">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>

                        <div class="form-group ">
                            <label class="control-label">班级</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="例如:17级计科2班"
                                   name="suClass" id="suClass">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">电话号码</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入电话号码"
                                    name="suPhone" id="suPhone">
                        </div>


                        <div class="form-group ">
                            <label class="control-label">宿舍号</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入宿舍号"
                                   name="suDm" id="suDm">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">电子邮件</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="请输入电子邮件"
                                   name="suEmail" id="suEmail">
                        </div>
                        <button class="btn"  style="background-color:#0b7285;color: white" type="submit">添加学生信息</button>
                    </fieldset>
                </form>
                <button class="btn btn-default" onclick="clear_content()" id="button1">重置</button>
                <button class="btn btn-default" onclick="javascript:history.back(-1)" id="button2">返回</button>
            </div>

        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item1_1";
    </script>
<%--判断用户名是否存在--%>
    <script>
        function a2(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/student/exitStudentId.action",
                data:{'suId':$("#suId").val()},
                success:function (data) {
                    if (data.toString() == "OK"){
                        alert("该用户已存在！")
                    }else {
                        alert("ID可用！")
                    }
                }
            });
        }
    </script>
<%--jQuery重置文本框内容--%>
    <script>
        function clear_content()
        {
            $("#suId").val("");
            $("#suName").val("");
            $("#suSex").val("");
            $("#suClass").val("");
            $("#suDm").val("");
            $("#suPhone").val("");
            $("#suEmail").val("");
            $("#suId").focus();
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
<%--实现图片上传预览--%>
    <script src="${pageContext.request.contextPath}/resource/static/js/uploadpic.js"/>
<%--引入jquery--%>
    <script src="${pageContext.request.contextPath}/resource/static/assets/jquery/jquery-2.1.4.min.js"></script>
</template:user_backend>
