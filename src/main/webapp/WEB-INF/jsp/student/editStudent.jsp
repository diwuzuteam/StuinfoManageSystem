<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="编辑学生信息" bodyTitle="编辑学生信息">
    <div class="panel-body">
        <form action="${pageContext.request.contextPath}/student/updateStudent.action" enctype="multipart/form-data" method="post">
                <div class="form-group ">
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
                           readonly name="suId" value="${student.suId}">
                </div>

                <div class="form-group ">
                    <label class="control-label">姓名</label>
                    <input type="text" style="width: 340px;"
                           class="form-control" placeholder="请输入学生姓名"
                           name="suName" value="${student.suName}">
                </div>

                <div class="form-group ">
                    <label class="control-label">性别</label>
                    <select class="form-control" name="suSex"
                            style="width: 240px;">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>

                <div class="form-group ">
                    <label class="control-label">班级</label>
                    <input type="text" style="width: 340px;"
                           class="form-control" placeholder="请输入学生班级"
                           name="suClass" value="${student.suClass}">
                </div>

                <div class="form-group ">
                    <label class="control-label">电话号码</label>
                    <input type="text" style="width: 240px;"
                           class="form-control" placeholder="请输入电话号码"
                           name="suPhone" value="${student.suPhone}">
                </div>


                <div class="form-group ">
                    <label class="control-label">宿舍号</label>
                    <input type="text" style="width: 240px;"
                           class="form-control" placeholder="请输入宿舍号"
                           name="suDm" value="${student.suDm}">
                </div>

                <div class="form-group ">
                    <label class="control-label">电子邮件</label>
                    <input type="text" style="width: 240px;"
                           class="form-control" placeholder="请输入电子邮件"
                           name="suEmail" value="${student.suEmail}">
                </div>
                <p class="col-lg-4 col-lg-offset-4">
                    <button class="btn"  style="background-color:#0b7285;color: white" type="submit">提交</button>
                    <a href="javascript:history.back(-1)"  class="btn" style="background-color:#0b7285;color: white" role="button">返回</a>
                </p>
<%--            </fieldset>--%>
        </form>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
<%--实现图片上传预览--%>
    <script>
        function uploadPhoto() {
            $("#photoFile").click();
        }
        /**
         * 上传图片
         */
        function upload() {
            if ($("#photoFile").val() == '') {
                return;
            }
            var formData = new FormData();
            formData.append('photo', document.getElementById('photoFile').files[0]);
            $.ajax({
                url:"${pageContext.request.contextPath}/student/uploadPhoto.action",
                type:"post",
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data.type == "success") {
                        $("#preview_photo").attr("src", data.filepath+data.filename);
                        $("#productImg").val(data.filename);
                    } else {
                        alert(data.msg);
                    }
                },
                error:function(data) {
                    alert("上传失败")
                }
            });
        }
    </script>
</template:user_backend>
