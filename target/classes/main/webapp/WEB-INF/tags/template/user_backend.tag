<%--普通用户的后台模板,添加了左侧导航栏--%>
<%--定义页面的编码类型--%>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%--定义当前模板需要传入的变量--%>
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<%@ attribute name="extraHeadContent" fragment="true" required="false" %>
<%--定义扩展使用的传入变量--%>
<%@ attribute name="extraNavigationContent" fragment="true" required="false" %>
<%@ include file="/WEB-INF/jsp/base.jspf"%>
<!--template:main表示使用main的模板-->
<template:basic_backend htmlTitle="${htmlTitle}" bodyTitle="${bodyTitle}">
  <jsp:attribute name="headContent">
        <jsp:invoke fragment="extraHeadContent"/>
  </jsp:attribute>

    <jsp:attribute name="sideBar">
        <aside id="sidebar" class="sidebar-nav col-sm-2">
            <nav class="sidebar-nav">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="https://github.com/diwuzuteam/StuinfoManageSystem" id="Item0.0">
                            <span class="fa fa-fw fa-github fa-lg"></span>
                            主页
                        </a>

                    </li>
                    <li class="">
                        <a class="has-arrow" id="Item1_0"><span class="fa fa-fw fa-book fa-lg"></span>学生信息管理</a>
                        <ul class="mm-collapse">
                            <li><a href="${pageContext.request.contextPath}/student/goAddStudent.action" id="Item1_1">
                                添加学生信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/student/showAllStudents.action" id="Item1_2">
                                查看学生信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/student/goQueryStudent.action" id="Item1_3">
                                查询学生信息
                            </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="3#" id="Item3_0">
                            <span class="fa fa-fw fa-user-circle fa-lg"></span>教师信息管理</a>
                        <ul class="mm-collapse">
                            <li><a href="${pageContext.request.contextPath}/teacher/toAddTeacher.action" id="Item3_1">
                                添加教师信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/teacher/showAllTeachers.action" id="Item3_2">
                                查看教师信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/teacher/toQueryTeacher.action" id="Item3_3">
                                查询教师信息
                            </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" id="Item4_0"><span class="fa fa-fw fa-book fa-lg"></span>课程信息管理</a>
                        <ul class="mm-collapse">
                            <li><a href="${pageContext.request.contextPath}/course/toAddCourse.action" id="Item4_1">
                                添加课程信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/course/showAllCourses.action" id="Item4_2">
                                查看课程信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/course/toQueryCourse.action" id="Item4_3">
                                查询课程信息
                            </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="5#" id="Item5_0">
                            <span class="fa fa-fw fa-user-circle fa-lg"></span>宿舍信息管理</a>
                        <ul class="mm-collapse">
                            <li><a href="${pageContext.request.contextPath}/dormitory/toAddDormitory.action" id="Item5_1">
                                添加宿舍信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/dormitory/showAllDormitories.action" id="Item5_2">
                                查看宿舍信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/dormitory/toQueryDormitory.action" id="Item5_3">
                                查询宿舍信息
                            </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="2#" id="Item2_0">
                            <span class="fa fa-fw fa-user-circle fa-lg"></span>个人中心</a>
                        <ul class="mm-collapse">
                            <li><a href="${pageContext.request.contextPath}/manager/toShowManager/${manager.adId}.action" aria-expanded="false"
                                id="Item2_1">管理员信息
                            </a></li>
                            <li><a href="${pageContext.request.contextPath}/manager/goEditManager.action" aria-expanded="false"
                                   id="Item2_2">修改信息
                            </a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>
    </jsp:attribute>
    <jsp:body>
        <!--页面主体 -->
        <jsp:doBody/>
    </jsp:body>
</template:basic_backend>
