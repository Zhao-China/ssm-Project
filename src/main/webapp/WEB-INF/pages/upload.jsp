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
<title>资料上传</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${loginUser.username}</a>
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
			<form action="Upload" method="post" enctype="multipart/form-data"
				onsubmit="return verify()">

				<div class="form-group">
					<label>上传文件的内容简介：</label>
					<textarea rows="7" cols="7" class="form-control" name="fileContent"></textarea>
				</div>

				<div class="form-group">
					<label>上传的文件：</label> <input type="file" class="form-control"
						name="picture">
				</div>

				<button type="submit" class="btn btn-primary">上传</button>
			</form>
			</main>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctp }/static/bootstrap/js/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		function verify() {
			var content = $("textarea").val().trim();
			if (content == "") {
				alert("文件内容不能为空！");
				return false;
			}
			var files = document.getElementsByName("picture")[0].files;
			var fileSize = 0;
			if (files.length == 0) {
				alert("请选择文件");
				return false;
			}
			fileSize = files[0].size;
			if (fileSize > 10485760) {
				alert("文件不能大于10M");
				return false;
			}
			return true;
		}
	</script>

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