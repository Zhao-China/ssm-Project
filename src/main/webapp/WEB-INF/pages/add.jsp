<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootstrap/img/favicon.ico">
<title>员工添加</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
<script type="text/javascript" src="${ctp }/static/script/jquery-1.7.2.js"></script>
<script type="text/javascript">
function verify() {
	var username=$("input[name='username']").val().trim();
	if(username==""){
		alert("用户名不能为空");
		return false;
	}
	var email=$("input[name='email']").val().trim();
	if(email==""){
		alert("邮箱不能为空");
		return false;
	}
	var sex=$("input:radio[name='gender']:checked").val();
	if(sex==null){
		alert("请选择性别");
		return false;
	}
	var birth=$("input[name='birth']").val().trim();
	if(birth==""){
		alert("生日不能为空");
		return false;
	}
};

</script>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${loginUser.username }</a>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">注销登录</a>
			</li>
		</ul>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							href="list.html"> <span data-feather="home"></span> 员工列表 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="download.html">
								<span data-feather="file"></span> 资料下载
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="changePassword.html"> <span
								data-feather="shopping-cart"></span> 密码修改
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="accountManager.html"> <span data-feather="users"></span>
								账号管理
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
			<form action="emp" method="post" onsubmit="return verify()">
				<div class="form-group">
					<label>姓名</label> <input name="lastName" type="text"
						class="form-control" placeholder="zhangsan">
				</div>
				<div class="form-group">
					<label>邮箱</label> <input name="email" type="email"
						class="form-control" placeholder="zhangsan@163.com">
				</div>
				<div class="form-group">
					<label>性别</label><br />
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							value="1"> <label class="form-check-label">男</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="gender"
							value="0"> <label class="form-check-label">女</label>
					</div>
				</div>
				<div class="form-group">
					<label>部门</label> <select class="form-control" name="dept.id">
						<c:forEach var="dept" items="${allDept }">
							<option value="${dept.id }">${dept.departmentName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>生日</label> <input name="birth" type="text"
						class="form-control" placeholder="1999-01-01">
				</div>

				<button type="submit" class="btn btn-primary">添加</button>
			</form>
			</main>
		</div>
	</div>

	<!-- Bootstrap core JavaScript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="../static/bootstrap/js/jquery-3.2.1.slim.min.js"></script>
	<script type="text/javascript"
		src="../static/bootstrap/js/popper.min.js"></script>
	<script type="text/javascript"
		src="../static/bootstrap/js/bootstrap.min.js"></script>
	<!-- Icons -->
	<script type="text/javascript"
		src="../static/bootstrap/js/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
</body>
</html>