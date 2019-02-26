<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctp" value="${pageContext.request.contextPath }" scope="application"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootst.rap/img/favicon.ico">
<title>首页</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/signin.css" rel="stylesheet">
<style type="text/css">
.errorMessageClass {
	color: red;
}
</style>
</head>
<script type="text/javascript" src="${ctp }/static/script/jquery-1.7.2.js"></script>
<script type="text/javascript">
		function verify() {
			var username = $("#inputEmail").val();
			var usernameReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!usernameReg.test(username)) {
				alert("请输入合法的用户名");
				return false;
			}
			var password = $("#inputPassword").val();
			var pwdReg = /^[a-z0-9_-]{6,18}$/;
			if (!pwdReg.test(password)) {
				alert("请输入合法的密码");
				return false;
			}
			return true;
		}
</script>
<body class="text-center">
	<form class="form-signin" method="post"  action="login"
		onsubmit="return verify()">
		<img class="mb-4" src="${ctp }/static/bootstrap/img/bootstrap-solid.svg"
			alt="" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">请登录</h1>
		<span id="errorMessage" class="errorMessageClass">${message }</span> <label
			for="inputEmail" class="sr-only">Email address</label> <input
			type="email" id="inputEmail" class="form-control"
			placeholder="Email address" name="username"> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" id="inputPassword" class="form-control"
			placeholder="Password" name="password">
		<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		<a class="btn btn-lg btn-primary btn-block" href="regist.jsp">没有账号，立即注册</a>
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
	</form>

	<a href="/list">去列表</a>
</body>


</html>