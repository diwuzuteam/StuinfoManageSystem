<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<template:user_backend htmlTitle="查询学生信息" bodyTitle="查询学生信息">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前系统没有任何学生信息</h3>
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
            <form action="${pageContext.request.contextPath}/student/dynamicQuery.action" method="post">
                <div class="pull-left">
                    学号: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入查询学号(可不填)"
                               name="suId">
                    姓名: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入查询姓名(可不填)"
                               name="suName">
                    班级: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入查询班级(可不填)"
                               name="suClass">
                    <button class="btn" style="background-color:#0b7285;color: white" type="submit">查询</button>
                </div>

            </form>
        </div>
        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox" onclick="selectAll()"></td>
                <th>序号</th>
                <th>学生ID号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>班级</th>
                <th>电话</th>
                <th>宿舍号</th>
                <th>电子邮箱</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有学生信息内容-->
            <c:forEach var="student" items="${pageInfo.list}"
                       varStatus="pageInfo">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" name="checkbox" value="${student.suId}"></td>
                    <td class="text-center">${pageInfo.count}</td>
                    <td>${student.suId}</td>
                    <td>${student.suName}</td>
                    <td>${student.suSex}</td>
                    <td>${student.suClass}</td>
                    <td>${student.suPhone}</td>
                    <td>${student.suDm}</td>
                    <td>${student.suEmail}</td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${pageContext.request.contextPath}/student/goViewStudent/${student.suId}.action">
                                详情</a></button>
                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${pageContext.request.contextPath}/student/goEditStudent/${student.suId}.action">
                                编辑</a></button>

                        <button class="btn  btn-xs btn-danger ticketDel"><span
                                class="glyphicon glyphicon-user">
                        <a href="javascript:void(0)" onclick="deleteReg('${student.suId}')">删除</a>
                    </span></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>
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
<%--使用ajax异步删除后刷新--%>
<script>
    var ItemId = "Item1_2";
    function deleteReg(suId){
        if (confirm("确定删除此学生信息？")){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/student/deleteStudentById.action",
                data:{
                    "suId":suId
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