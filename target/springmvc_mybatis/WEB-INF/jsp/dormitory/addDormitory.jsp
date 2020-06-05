<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<template:user_backend htmlTitle="添加宿舍信息" bodyTitle="添加宿舍信息">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span>添加宿舍信息
            </div>
            <div class="panel-body">
                <form name="form1" action="${pageContext.request.contextPath}/dormitory/addDorm.action" method="post" onsubmit="return myCheck()">
                    <fieldset>
                        <div class="form-group ">
                            <label class="control-label">宿舍号</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入宿舍编号"
                                   name="dormId" id="dormId" onblur="checkDmNo()">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">宿舍长</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入宿舍长学号"
                                   name="dormMonitor" id="dormMonitor" onblur="checkMonitor()">
                        </div>

                        <div class="form-group ">
                            <label class="control-label">宿舍类型</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="请输入宿舍类型(X人间)"
                                   name="dormNumber" id="dormNumber">
                        </div>
                        <button class="btn"  style="background-color:#0b7285;color: white" type="submit">添加宿舍信息</button>
                    </fieldset>
                </form>
                <button class="btn btn-default" onclick="clear_content()" id="button1">重置</button>
                <button class="btn btn-default" onclick="javascript:history.back(-1)" id="button2">返回</button>
            </div>
        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item5_1";
    </script>
<%--判断宿舍长是否已经是别的宿舍宿舍长--%>
    <script>
        function checkMonitor(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/dormitory/exitDormMo.action",
                data:{'dormMonitor':$("#dormMonitor").val()},
                success:function (data) {
                    if (data.toString()=='NO'){
                        alert("该学生已经是别的宿舍的宿舍长！")
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
            $("#dormId").val("");
            $("#dormNumber").val("");
            $("#dormMonitor").val("");
            $("#dormId").focus();
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
<%--判断宿舍号是否存在--%>
    <script>
        function checkDmNo(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/dormitory/exitDorm.action",
                data:{'dormId':$("#dormId").val()},
                success:function (data) {
                    if (data.toString()=='NO'){
                        alert("此宿舍已经存在！")
                    }else {
                        return;
                    }
                }
            });
        }
    </script>
</template:user_backend>
