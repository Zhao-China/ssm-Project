<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="../static/bootstrap/img/favicon.ico">
<title>员工修改</title>
<link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
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
			<form:form action="${ctp }/emp" method="post" modelAttribute="emp">
				<input type="hidden" name="_method" value="PUT">
				<form:hidden path="id"/>
				<div class="form-group">
					<label>姓名</label>
					<form:input path="lastName" class="form-control" readonly="true" />
				</div>
				<div class="form-group">
					<label>邮箱</label>
					<form:input path="email" class="form-control" />
				</div>
				<div class="form-group">
					<label>性别</label><br />
					<div class="form-check form-check-inline">
						<form:radiobuttons path="gender" items="${genderMap }"
							class="form-check-input" />
					</div>
				</div>
				<div class="form-group">
					<label>部门</label>
					<form:select path="dept.id" items="${allDept }"
						itemLabel="departmentName" itemValue="id">
					</form:select>
				</div>
				<div class="form-group">
					<label>生日</label>
					<form:input path="birth" class="form-control" />
				</div>

				<button type="submit" class="btn btn-primary">修改</button>
			</form:form> </main>
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