<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="xxy" uri="http://com.xxy/common/" %>
<template:user_backend htmlTitle="查询课程信息" bodyTitle="查询课程信息">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前系统中没有该教师相关信息</h3>
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
            <form action="${pageContext.request.contextPath}/course/dynamicQuery.action" method="post">
                <div class="pull-left">
                    课程编号: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入课程编号(选填)"
                               name="csNo">
                    课程名称: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入课程名称(选填)"
                               name="csName">
                    任课教师: <input type="text" style="width: 340px;"
                               class="form-control" placeholder="输入任课教师工号(选填)"
                               name="csTeacher">
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
                <th>课程编号</th>
                <th>课程容量(人)</th>
                <th>选课人数</th>
                <th>课程学分</th>
                <th>授课教师</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出查询到的教师信息内容-->
            <c:forEach var="course" items="${pageInfo.list}"
                       varStatus="pageInfo">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" name="checkbox" value="${course.csNo}"></td>
                    <td class="text-center">${pageInfo.count}</td>
                    <td>${course.csNo}</td>
                    <td>${course.csName}</td>
                    <td>${course.csNumber}</td>
                    <td>${course.csCredit}</td>
                    <td><a href="${pageContext.request.contextPath}/teacher/toViewTeacher/${course.csTeacher}.action">${course.csTeacher}</a></td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${pageContext.request.contextPath}/course/toViewCourse/${course.csNo}.action">
                                详情</a></button>

                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${pageContext.request.contextPath}/course/toEditCourse/${course.csNo}.action">
                                编辑</a></button>

                        <button class="btn  btn-xs btn-danger ticketDel"><span
                                class="glyphicon glyphicon-user">
                        <a href="javascript:void(0)" onclick="deleteReg('${course.csNo}')">删除</a>
                    </span></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-center">
            <xxy:page url="${pageContext.request.contextPath}/course/showAllCourses.action"/>
        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item4_3";
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
    var ItemId = "Item4_3";
    function deleteReg(csNo){
        if (confirm("确定删除此课程信息？")){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/course/deleteCourse.action",
                data:{
                    "csNo":csNo
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