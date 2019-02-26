<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath }" scope="application"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootstrap/img/favicon.ico">
<title>资料下载</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
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
						<li class="nav-item"><a class="nav-link"
							href="${ctp }/users"> <span data-feather="users"></span>
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
			<h2>
				<a class="btn btn-sm btn-success" href="${ctp }/toUpload">资料上传</a>
			</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>编号</th>
							<td>创建人</td>
							<th>文件名</th>
							<th>内容简介</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty page.list }">
							<tr>
								<td>暂时文件！</td>
							</tr>
						</c:if>
						<c:if test="${!empty page.list}">
							<c:forEach var="fileCommon" items="${page.list }">
								<tr>
									<td>${fileCommon.id}</td>
									<td>${fileCommon.creater }</td>
									<td>${fileCommon.fileName }</td>
									<td>${fileCommon.fileContent }</td>
									<td><fmt:formatDate value="${fileCommon.createdTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><a class="btn btn-sm btn-primary" 
										href="${ctp }/Dwonload?id=${fileCommon.id }">下载</a>
										 <a class="btn btn-sm btn-danger deleteBtn"
										href="${ctp }/deleteFile?id=${fileCommon.id}">删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				共&nbsp;&nbsp;${page.totalPages }&nbsp;&nbsp;页，&nbsp;&nbsp;${page.totalrows }&nbsp;&nbsp;条记录&nbsp;&nbsp;
				<a href="${ctp }/toDwonload?curPage=1">首页</a>&nbsp;
				<c:if test="${page.hasPrev }">
					<a href="${ctp }/toDwonload?curPage=${page.prev }">上一页</a>&nbsp;
					</c:if>
				<c:if test="${page.hasNext }">
					<a href="${ctp }/toDwonload?curPage=${page.next}">下一页</a>&nbsp;
					</c:if>
				<a href="${ctp }/toDwonload?curPage=${page.totalPages}">末页</a>&nbsp;
				跳转到第<input type="text" id="input_pageNumber" />页 &nbsp;&nbsp;
			</div>
			</main>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctp }/static/script/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#input_pageNumber").change(function(){
				var curPage=this.value;
				window.location="${ctp}/toDwonload?curPage="+curPage;				
			});
		});
	
	</script>

	<script type="text/javascript"
		src="${ctp }/static/bootstrap/js/jquery-3.2.1.slim.min.js"></script>
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