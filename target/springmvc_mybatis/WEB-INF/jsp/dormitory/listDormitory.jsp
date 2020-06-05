<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--添加自定义标签--%>
<%@ taglib prefix="xxy" uri="http://com.xxy/common/"%>
<template:user_backend htmlTitle="宿舍信息列表" bodyTitle="查看宿舍信息">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前系统没有任何宿舍信息</h3>
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
                <button class="btn btn-danger" onclick="deleteDms()">批量删除</button>
            </div>
        </div>

        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox" onclick="selectAll()"></td>
                <th>序号</th>
                <th>宿舍号</th>
                <th>宿舍类型</th>
                <th>宿舍长学号</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有课程信息内容-->
            <c:forEach var="dormitory" items="${pageInfo.list}"
                       varStatus="pageInfo">
                <tr>
                    <td class="text-center">
                        <input type="checkbox" name="checkbox" value="${dormitory.dormId}"></td>
                    <td class="text-center">${pageInfo.count}</td>
                    <td>${dormitory.dormId}</td>
                    <td>${dormitory.dormNumber}</td>
                    <td><a href="${pageContext.request.contextPath}/student/goViewStudent/${dormitory.dormMonitor}.action">${dormitory.dormMonitor}</a></td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${pageContext.request.contextPath}/dormitory/toViewDormitory/${dormitory.dormId}.action">
                                详情</a></button>

                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${pageContext.request.contextPath}/dormitory/toEditDormitory/${dormitory.dormId}.action">
                                编辑</a></button>

                        <button class="btn  btn-xs btn-danger ticketDel"><span
                                class="glyphicon glyphicon-user">
                        <a href="javascript:void(0)" onclick="deleteReg('${dormitory.dormId}')">删除</a>
                    </span></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-center">
            <xxy:page url="${pageContext.request.contextPath}/dormotiry/showAllDormitories.action"/>
        </div>
    </div>
</template:user_backend>
<%--使用ajax异步删除后刷新--%>
<script>
    var ItemId = "Item5_2";
    function deleteReg(dormId){
        if (confirm("确定删除此宿舍信息？")){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/dormitory/delDormitory.action",
                data:{
                    "dormId":dormId
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
    var ItemId = "Item5_2";
    function deleteDms() {
        var ids = [];
        $('input[name="checkbox"]:checked').each(function(){
            ids.push($(this).val());
        });
        if (ids.length == 0){
            alert("请选中要删除的宿舍！")
        }else{
            if (confirm("确定删除多个宿舍信息吗？")){
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/dormitory/deleteDorms.action",
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
