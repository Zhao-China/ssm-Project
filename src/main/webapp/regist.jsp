<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootstrap/img/favicon.ico">
<title>注册</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/signin.css" rel="stylesheet">
</head>
<script type="text/javascript"
	src="${ctp }/static/script/jquery-1.7.2.js"></script>
<script type="text/javascript">
	function verify() {
		var username = $("#inputEmail").val();
		var usernameReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (!usernameReg.test(username)) {
			alert("请输入合法的用户名！");
			$("#inputEmail").val("")
			return false;
		}
		var password = $("#inputPassword").val();
		var pwdReg = /^[a-z0-9_-]{6,18}$/;
		if (!pwdReg.test(password)) {
			alert("请输入合法的密码！");
			$("#inputPassword").val("")
			return false;
		}
		var againPassword = $("#againPassword").val();
		if (againPassword != password) {
			alert("两次输入的密码不一致！");
			$("#againPassword").val("")
			return false;
		}

		return true;
	}
	$(function() {
		$("#inputEmail").change(function() {
			var username = $("#inputEmail").val();
			if (username == "") {
				return false;
			}
			var url = "checkUser";
			var data = {
				"username" : username
			};
			var callback = function(respData) {
				if (respData == "false") {
					alert(username + "该用户名已存在！");
					$("#inputEmail").val("");
				}
			};
			$.post(url, data, callback, "text");
		});
		$("#againPassword").blur(function() {
			var password = $("#inputPassword").val();
			if ($(this).val() != password) {
				alert("两次输入的密码不一致！");
				$(this).val("");
			}
		});
	});
</script>
<body class="text-center">
	<form class="form-signin" method="post" action="user"
		onsubmit="return verify()">
		<img class="mb-4"
			src="${ctp }/static/bootstrap/img/bootstrap-solid.svg" alt=""
			width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">请注册</h1>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="email" id="inputEmail" class="form-control"
			placeholder="输入邮箱地址作为用户名" name="username"> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" id="inputPassword" class="form-control"
			placeholder="密码" name="password"> <label for="againPassword"
			class="sr-only">Again Password</label> <input type="password"
			id="againPassword" class="form-control" placeholder="确认密码"> <label
			for="inputCode" class="sr-only">验证码</label> <input type="text"
			id="inputCode" class="form-control" placeholder="请输入验证码"> <img
			id="code_img" alt="" src="${ctp }/static/img/code.bmp"> <input
			type="hidden" name="isEnabled" value="1">
		<button class="btn btn-lg btn-primary btn-block" type="submit">立即注册</button>
		<a class="btn btn-lg btn-primary btn-block" href="${ctp }/index.jsp">已有账号，立即登录</a>
	</form>
</body>
</html>