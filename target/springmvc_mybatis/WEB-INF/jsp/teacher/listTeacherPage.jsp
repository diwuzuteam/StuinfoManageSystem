<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--添加自定义标签--%>
<%@ taglib prefix="xxy" uri="http://com.xxy/common/"%>
<template:user_backend htmlTitle="教师信息列表" bodyTitle="查看教师信息">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前系统没有任何教师信息</h3>
        </c:when>
        <c:otherwise>
            <strong>总记录数:${pageInfo.total}, 总页数:${pageInfo.pages},
                第${pageInfo.pageNum}页,
                记录:${pageInfo.startRow}-${pageInfo.endRow},
                总数:${pageInfo.size}</strong>
        </c:otherwise>
    </c:choose>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
            <div class="pull-right">
            </div>
            <div class="pull-left">
                <button class="btn btn-danger" onclick="deleteThs()">批量删除</button>
            </div>
        </div>

        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox" onclick="selectAll()"></td>
                <th>序号</th>
                <th>教师工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>地址</th>
                <th>电话</th>
                <th>职称</th>
                <th>电子邮箱</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有教师信息内容-->
            <c:forEach var="teacher" items="${pageInfo.list}"
                       varStatus="pageInfo">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" name="checkbox" value="${teacher.thNo}"></td>
                    <td class="text-center">${pageInfo.count}</td>
                    <td>${teacher.thNo}</td>
                    <td>${teacher.thName}</td>
                    <td>${teacher.thSex}</td>
                    <td>${teacher.thAddress}</td>
                    <td>${teacher.thPhone}</td>
                    <td>${teacher.thTittle}</td>
                    <td>${teacher.thEmail}</td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${pageContext.request.contextPath}/teacher/toViewTeacher/${teacher.thNo}.action">
                                详情</a></button>
                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${pageContext.request.contextPath}/teacher/toEditTeacher/${teacher.thNo}.action">
                                编辑</a></button>

                        <button class="btn  btn-xs btn-danger ticketDel"><span
                                class="glyphicon glyphicon-user">
                        <a href="javascript:void(0)" onclick="deleteReg('${teacher.thNo}')">删除</a>
                    </span></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-center">
            <xxy:page url="${pageContext.request.contextPath}/teacher/showAllTeachers.action"/>
        </div>
    </div>
</template:user_backend>
<%--使用ajax异步删除后刷新--%>
<script>
    var ItemId = "Item3_2";
    function deleteReg(thNo){
        if (confirm("确定删除此教师信息？")){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/teacher/deleteTeacherById.action",
                data:{
                    "thNo":thNo
                },
                success:function(){
                    window.location.reload();
                },
                error:function () {
                    window.location.reload();
                }
            })
        }else{
          return false;
        }
    }
</script>
<%--批量删除按钮实现--%>
<script>
    var ItemId = "Item3_2";
    function deleteThs() {
        var ids = [];
        $('input[name="checkbox"]:checked').each(function(){
            ids.push($(this).val());
        });
        if (ids.length == 0){
            alert("请选中要删除的教师！")
        }else{
            if (confirm("确定删除多个教师信息吗？")){
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/teacher/deleteTeachers.action",
                    data:{ids:ids},
                    success:function(){
                        window.location.reload();
                    },
                    error:function () {
                        window.location.reload();
                    }
                })
            }else{
                return false;
            }
        }
    }
</script>
<%--实现全选和取消全选--%>
<script>
    function selectAll(){
        $("input[type='checkbox']").each( function() {
            if($(this).prop("checked")==true) {
                $("input[type='checkbox']").prop('checked', true);
                return;
            } else {
                $("input[type='checkbox']").prop('checked', false);
                return;
            }
        });
    }
</script>
