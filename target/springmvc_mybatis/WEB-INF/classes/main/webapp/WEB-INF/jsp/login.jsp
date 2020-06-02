<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resource/static/assets/jquery/jquery-2.1.4.min.js"></script>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生信息管理系统</title>
    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/static/assets/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/static/assets/font-awesome/4.7.0/css/font-awesome.css" type="text/css">
    <!-- Metis core stylesheet -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/static/bootstrap-adim/main.css" type="text/css">
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/static/assets/onoffcanvas/onoffcanvas.min.css" type="text/css">
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/static/assets/animate.css/animate.css" type="text/css">
<%--用户名密码非空校验--%>
    <script language="JavaScript" type="text/JavaScript">
        function loginCheck(loginForm){
            //检查姓名是否填写
            var adId = document.loginForm.adId.value;
            var adPassword = document.loginForm.adPassword.value;
            if(adId.length==0){
                alert("请填写用户名！");
                loginForm.adId.focus();
                return false;
            }else if(adPassword.length==0){
                alert("请填写密码！");
                loginForm.adPassword.focus();
                return false;
            }else{
              return true;
            }
        }
    </script>
<%--ajax判断密码是否正确--%>
    <script type="text/javascript">
        function checkPassword(){
            var id = $("#id").val();
            var password = $("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/manager/checkPassword.action",
                type:"post",
                data:{
                    "adId":id,
                    "adPassword":password
                },
                success:function (data) {
                    if (data.toString()=="NO"){
                        alert("用户名或密码错误！")
                        // location.reload();
                    }
                },
                error:function (data) {
                    alert("未知错误，请联系管理员。")
                }
            })
        }
    </script>
<%--对注册信息的校验--%>
    <script type="text/javascript" language="JavaScript">
        function registerCheck(registerForm) {
            var adId = document.registerForm.adId.value;
            var adName = document.registerForm.adName.value;
            var adEmail = document.registerForm.adEmail.value;
            var adPhone = document.registerForm.adPhone.value;
            var adPassword = document.registerForm.adPassword.value;
            var adPassword1= document.registerForm.adPassword1.value;
            if (adId.length==0){
                alert("请输入账号！");
                registerForm.adId.focus();
                return false;
            }else if (adName.length==0){
                alert("请输入姓名！");
                registerForm.adName.focus();
                return false;
            }else if (adEmail.length==0){
                alert("请输入邮箱！");
                registerForm.adEmail.focus();
                return false;
            }else if(adPhone.length==0){
                alert("请输入手机号！");
                registerForm.adPhone.focus();
                return false;
            }else if (adPassword.length==0){
                alert("请输入密码！");
                registerForm.adPassword.focus();
                return false;
            }else if (adPassword1.length==0){
                alert("请输入二次密码！");
                registerForm.adPassword1.focus();
                return false;
            }else if (adPassword!=adPassword1){
                alert("两次输入密码不一致！");
                registerForm.adPassword.focus();
                return false;
            }else{
                return true;
            }
        }
    </script>
<%--判断用户名是否存在--%>
    <script>
        function checkAdName(){
            $.ajax({
                url:"${pageContext.request.contextPath}/manager/exitUsername.action",
                type:"post",
                data:{'adId':$("#adId").val()},
                success:function (data) {
                    if (data.toString()=='OK'){
                        alert("该用户已存在！")
                    }else {
                        alert("用户可用！")
                    }
                }
            });
        }
    </script>
<%--Cookie实现用户名密码自动填充--%>
    <%
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie:cookies){
                if("adId".equals(cookie.getName())){
                    pageContext.setAttribute("adId", cookie.getValue());
                }
                if ("adPassword".equals(cookie.getName())){
                    pageContext.setAttribute("adPassword", cookie.getValue());
                }
            }
        }
    %>
<%--实现页面隐藏和显示--%>
<script language="JavaScript" type="text/javascript">
    function showRegister(){
        //隐藏登陆界面
        document.getElementById("login").style.display="none";
        //显示注册界面
        document.getElementById("signup").style.display="block";
    }
</script>
<script type="text/javascript">
    function showForgot() {
        //隐藏登陆界面
        document.getElementById("login").style.display="none";
        //显示忘记密码界面
        document.getElementById("forgot").style.display="block";
    }
</script>
<%--验证找回密码输入--%>
<script type="text/javascript">
    function checkForgot() {
        var id = $("#forgot_id").val();
        var name = $("#forgot_name").val();
        var pass = $("#forgot_pass").val();
        var pass1 = $("#forgot_pass1").val();
        if (id.length == 0){
            alert("请输入工号！")
            $("#forgot_id").focus();
            return false;
        }else if(name.length == 0){
            alert("请输入姓名！")
            $("#forgot_name").focus();
            return false;
        }else if (pass.length == 0){
            alert("新密码不能为空！")
            $("#forgot_pass").focus();
            return false;
        }else if (pass1.length == 0){
            alert("请再次输入新密码！")
            $("#forgot_pass1").focus();
            return false;
        }else if (pass != pass1){
            alert("两次密码不一致！")
            $("#forgot_pass1").focus();
            return false;
        }else{
            return true;
        }
    }
</script>
<%--ajax判断工号和姓名是否一致--%>
    <script>
        function checkIdAndName() {
            $.ajax({
                url:"${pageContext.request.contextPath}/manager/checkIdAndName.action",
                type:"post",
                data:{
                    'adId':$("#forgot_id").val(),
                    'adName':$("#forgot_name").val()
                },
                success:function (data) {
                    if (data.toString()=='OK'){
                        return true;
                    }else {
                        alert("工号和姓名验证失败，请重新输入！")
                        $("#forgot_id").val("");
                        $("#forgot_name").val("");
                        $("#forgot_pass").val("");
                        $("#forgot_pass1").val("");
                        $("#forgot_id").focus();
                    }
                }
            });
        }
    </script>
</head>
<body class="login" onload="document.getElementById('id').focus();">
<!-- 顶部导航栏 -->
<header class="navbar navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header" >
            <a class="navbar-brand warning" href="#">
                <span class="glyphicon glyphicon-leaf"></span>
                学生信息管理系统
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <li><a href="#"><span
                    class="glyphicon glyphicon-book"></span>帮助</a></li>
        </ul>
    </div>
</header>
<div class="form-signin">
    <div class="text-center">
        <img src="${pageContext.request.contextPath}/resource/static/img/pds.jpg" alt="学生信息管理系统">
    </div>
    <hr>
    <%--登录界面--%>
    <div class="tab-content">
        <div id="login" class="tab-pane active">
            <%--提交到指定的地方--%>
            <form name="loginForm" action="${pageContext.request.contextPath}/manager/toLogin.action" method="POST" onsubmit="return loginCheck(this)">
                <p class="text-muted text-center">
                    请输入您的账号和密码
                </p>
                <input name="adId" type="text" placeholder="请输入账号" id="id" value="${adId}"
                       class="form-control top">
                <input  name="adPassword" type="password" id="password" placeholder="请输入密码" value="${adPassword}"
                       class="form-control bottom" onblur="checkPassword()">

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember" ${empty adId?'':'checked'}>记住我
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block"
                        type="submit">登陆</button>
            </form>
                <ul class="list-inline" id="link">
                    <li><a class="text-muted" href="#" onclick="show()" data-toggle="tab">注册账号
                    </a></li>
                    <li><a class="text-muted" href="#" onclick="showForgot()" data-toggle="tab">忘记密码
                    </a></li>
                </ul>
        </div>
<%--注册页面--%>
        <div id="signup" class="tab-pane">
            <%--提交到指定的地方--%>
            <form action="${pageContext.request.contextPath}/manager/managerRegister.action" name="registerForm" onsubmit="return registerCheck(this)">
                <input type="text" placeholder="输入账号" class="form-control top" name="adId" id="adId" onblur="checkAdName()">
                <input type="text" placeholder="输入姓名" class="form-control top" name="adName">
                <input type="email" placeholder="输入email地址(mail@domain.com)"
                       class="form-control middle" name="adEmail">
                <input type="text" placeholder="输入手机号" class="form-control top" name="adPhone">
                <input type="password" placeholder="输入密码" name="adPassword"
                       class="form-control middle">
                <input type="password" placeholder="再次输入密码" name="adPassword1"
                       class="form-control bottom">
                <span id="spaName" onchange="check()"></span><br/><br/>
                <button class="btn btn-lg btn-success btn-block"
                        type="submit">注册</button>
            </form>
                <ul class="list-inline">
                    <li><a class="text-muted" href="javascript:history.go(-1);location.reload()" data-toggle="tab">返回主页
                    </a></li>
                </ul>
        </div>
<%--忘记密码界面--%>
        <div id="forgot" class="tab-pane">
            <%--提交到指定的地方--%>
            <form name="forgot" action="${pageContext.request.contextPath}/manager/editManager.action" method="post" onsubmit="return checkForgot(this)">
                <p class="text-muted text-center">输入你的工号</p>
                <input type="text" name="id" id="forgot_id" placeholder="输入工号" class="form-control">
                <p class="text-muted text-center">输入你的姓名</p>
                <input type="text" name="adName" id="forgot_name" placeholder="输入姓名" onblur="checkIdAndName()" class="form-control">
                <p class="text-muted text-center">输入你的新密码</p>
                <input type="password" name="adPassword" id="forgot_pass" placeholder="输入新密码" class="form-control">
                <p class="text-muted text-center">再次输入你的新密码</p>
                <input type="password" name="adPassword1" id="forgot_pass1" placeholder="再次输入新密码" class="form-control">
                <br>
                <button class="btn btn-lg btn-danger btn-block"
                        type="submit">忘记密码</button>
            </form>
                <ul class="list-inline">
                    <li><a class="text-muted" href="javascript:history.go(-1);location.reload()" data-toggle="tab">返回主页
                    </a></li>
                </ul>
        </div>

    </div>
</div>

</body>

</html>

