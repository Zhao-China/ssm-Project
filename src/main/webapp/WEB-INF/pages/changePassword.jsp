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
<title>密码修改</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
<script type="text/javascript"
	src="${ctp }/static/bootstrap/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[name='oldPassword']:first").change(function() {
			var password = this.value;
			if (password == "") {
				return false;
			}
			var url = "checkPswd";
			var data = {
				"password" : password
			};
			var callback = function(respData) {
				if (respData == "false") {
					alert("你输入的密码与旧密码不相同");
					$("input[name='oldPassword']:first").val("");
					$("input[name='oldPassword']:first").focus();
				}
			};
			jQuery.post(url, data, callback, "text");
		});
	});
</script>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${loginUser.username}</a>
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
			<form action="" method="post" onsubmit="return verify()">
				<div class="form-group">
					<label>旧密码</label> <input name="oldPassword" type="password"
						class="form-control">
				</div>
				<div class="form-group">
					<label>新密码</label> <input name="newPassword" type="password"
						class="form-control">
				</div>
				<div class="form-group">
					<label>确认新密码</label> <input name="newPasswordAgain" type="password"
						class="form-control">
				</div>
				<button type="submit" class="btn btn-primary">修改密码</button>
			</form>
			</main>
		</div>
	</div>
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
	<script type="text/javascript">
		function verify() {
			var pwdReg = /^[a-z0-9_-]{6,18}$/;
			var oldPassword = $("input[name='oldPassword']").val().trim();
			if (!pwdReg.test(oldPassword)) {
				alert("输入的密码不合法！");
				return false;
			}
			var newPassword = $("input[name='newPassword']").val().trim();
			if (!pwdReg.test(newPassword)) {
				alert("输入的密码不合法！");
				return false;
			}
			var newPasswordAgain = $("input[name='newPasswordAgain']").val()
					.trim();
			if (newPasswordAgain != newPassword) {
				alert("两次输入的密码不一致！");
				$("input[name='newPasswordAgain']").val("");
				return false;
			}
		};
	</script>
</body>
</html>