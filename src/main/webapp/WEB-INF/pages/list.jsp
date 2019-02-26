<%@ page language="java" contentType="text/html; charset=UTF-8"
	isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<c:set var="ctp" value="${pageContext.request.contextPath }"
	scope="application"></c:set>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="${ctp }/static/bootstrap/img/favicon.ico">
<title>员工列表</title>
<link href="${ctp }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctp }/static/bootstrap/css/dashboard.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${loginUser.username}</a>
		<form action="${ctp }/emps" method="post" id="serchForm">
			<input type="hidden" name="lastName"> <input type="hidden"
				name="email"> <input type="hidden" name="gender"> <input
				type="hidden" name="dept.departmentName"> <input
				type="hidden" name="birth">
		</form>
		<input type="text" class="form-control form-control-dark"
			placeholder="姓名"> <input type="text"
			class="form-control form-control-dark" placeholder="邮箱">
		<input type="text" class="form-control form-control-dark"
			placeholder="性别"> <input type="text"
			class="form-control form-control-dark" placeholder="部门">
		<input type="text" class="form-control form-control-dark"
			placeholder="生日">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#"
				id="serch">搜索</a></li>
		</ul>

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
				<a class="btn btn-sm btn-success" href="${ctp }/emp">员工添加</a>
			</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th>编号</th>
							<th>姓名</th>
							<th>邮箱</th>
							<th>性别</th>
							<th>部门</th>
							<th>生日</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty page.list }">
							<tr>
								<td>暂无数据！</td>
							</tr>
						</c:if>

						<c:if test="${!empty page.list }">
							<c:forEach var="emp" items="${page.list }">
								<tr>
									<td>${emp.id }</td>
									<td>${emp.lastName }</td>
									<td>${emp.email }</td>
									<td>${emp.gender==1? "男":"女" }</td>
									<td>${emp.dept.departmentName }</td>
									<td><fmt:formatDate value="${emp.birth }"
											pattern="yyyy-MM-dd" /></td>
									<td><a class="btn btn-sm btn-primary"
										href="${ctp }/emp/${emp.id }">编辑</a> <a
										class="btn btn-sm btn-danger deleteBtn"
										href="${ctp }/emp/${emp.id}">删除</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				共&nbsp;&nbsp;${page.totalPages }&nbsp;&nbsp;页，&nbsp;&nbsp;${page.totalrows }&nbsp;&nbsp;条记录&nbsp;&nbsp;
				<a href="${ctp }/emps?${queryString}&curPage=1">首页</a>&nbsp;
				<c:if test="${page.hasPrev }">
					<a href="${ctp }/emps?${queryString}&curPage=${page.prev }">上一页</a>&nbsp; 
					</c:if>
				<c:if test="${page.hasNext }">
					<a href="${ctp }/emps?${queryString}&curPage=${page.next }">下一页</a>&nbsp;
					</c:if>
				<a href="${ctp }/emps?${queryString}&curPage=${page.totalPages }">末页</a>&nbsp;
				跳转到第<input type="text" id="input_pageNumber" />页 &nbsp;&nbsp;
			</div>
			</main>
		</div>
	</div>
	<form action="" method="post" id="deleteForm">
		<input type="hidden" name="_method" value="DELETE">
	</form>
	<script type="text/javascript"
		src="${ctp }/static/script/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 删除 */
			$(".deleteBtn").click(function() {
				var name = $(this).parents("tr").children().eq(1).text();
				var flg = confirm("你真的要删除员工:【" + name + "】的信息吗？")
				if (flg) {
					$("#deleteForm").attr("action", this.href);
					$("#deleteForm").submit();
				}
				return false;
			});

			/* 查询第几页 */
			$("#input_pageNumber").change(
					function() {
						var curpage=this.value;
						window.location = "${ctp}/emps?${queryString}&curPage="
								+ curpage;
					});
			/* 模糊查询 */
			$("#serch").click(function() {
				$("#serchForm :eq(0)").val($(":text:eq(0)").val());
				$("#serchForm :eq(1)").val($(":text:eq(1)").val());
				var gender = $(":text:eq(2)").val();
				if (gender == "男" || gender == "1") {
					$("#serchForm :eq(2)").val("1");
				}
				if (gender == "女" || gender == "0") {
					$("#serchForm :eq(2)").val("0");
				}
				$("#serchForm :eq(3)").val($(":text:eq(3)").val());
				$("#serchForm :eq(4)").val($(":text:eq(4)").val());
				$("#serchForm").submit();
				return false;
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