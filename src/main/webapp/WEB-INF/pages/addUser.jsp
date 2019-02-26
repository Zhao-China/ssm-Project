<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath }"
	scope="application"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootstrap/img/favicon.ico">
<title>账号添加</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
<script type="text/javascript"
	src="${ctp }/static/bootstrap/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
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
		};
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
		
	});
</script>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${loginUser.username }</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link"
				href="${ctp }/logout">注销登录</a></li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							href="${ctp }/emps"> <span data-feather="home"></span> 员工列表 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ctp }/toDwonload"> <span data-feather="file"></span>
								资料下载
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ctp }/toChangePswd"> <span
								data-feather="shopping-cart"></span> 密码修改
						</a></li>
						<li class="nav-item"><a class="nav-link" href="${ctp }/users">
								<span data-feather="users"></span> 账号管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="bar-chart-2"></span> Reports
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="layers"></span> Integrations
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<form action="user" method="post" onsubmit="return verify()">
				<div class="form-group">
					<label>用户名</label> <input id="inputEmail" name="username" type="text"
						class="form-control" placeholder="zhangsan">
				</div>
				<div class="form-group">
					<label>密码</label> <input name="password" type="password"
						class="form-control" placeholder="密码">
				</div>
				<div class="form-group">
					<label>确认密码</label> <input name="againPassword" type="password"
						class="form-control" placeholder="请再次输入密码">
				</div>
				<div class="form-group">
					<label>权限</label> <select class="form-control" name="isEnabled">
						<option value="1">普通用户</option>
						<option value="0">管理员</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">添加</button>
			</form>
			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="${ctp }/static/bootstrap/js/popper.min.js"></script>
	<script type="text/javascript"
		src="${ctp }/static/bootstrap/js/bootstrap.min.js"></script>
	<!-- Icons -->
	<script type="text/javascript"
		src="${ctp }/static/bootstrap/js/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
</body>
</html>