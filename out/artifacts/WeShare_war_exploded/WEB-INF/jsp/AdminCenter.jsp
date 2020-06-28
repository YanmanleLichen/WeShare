<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>闻说 - 管理员中心</title>

		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom fonts for this template -->
		<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/devicons/css/devicons.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">

		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/css/resume.min1.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>

	</head>

	<body id="page-top">

		<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
			<a class="navbar-brand js-scroll-trigger" target="_blanck" href="https://github.com/YanmanleLichen">
				<img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/img/admin.jpg" alt="" />
			</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item">
						管理员：${admin.admin_name }，您好
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#manage">用户管理</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/toCenter.action">进入广场</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/toIndex.action">返回首页</a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="container-fluid p-0">
			<section class="resume-section p-3 p-lg-5 d-flex flex-column" id="manage">
				<div>
					<a href="${pageContext.request.contextPath}/toAddAdminBlog.action" class="layui-btn layui-btn-radius">发表公告</a>
				</div>
				<table id="demo" lay-filter="test"></table>

				<script>
					layui.use('table', function() {
						var table = layui.table;
						//第一个实例
						table.render({
							elem: '#demo'
								//,height: 600
								,
							skin: 'nob',
							even: false,
							size: 'lg',
							url: '${pageContext.request.contextPath}/selectUsersList.action' //数据接口
								,
							page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
								layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'] //自定义分页布局
									,
								groups: 5,
								first: '首页',
								prev: '上一页',
								next: '下一页',
								last: '尾页',
								limit: 10,
								limits: [5, 10, 15]
							},
							cols: [
								[{
									field: 'user_id',
									title: '用户ID',
									width: 350,
									fixed: 'left'
								}, {
									field: 'user_name',
									title: '用户名',
									width: 150
								}, {
									field: 'gender',
									title: '性别',
									width: 100
								},{
									field: 'identity',
									title: '身份',
									width: 150
								},{
									field: 'user_state',
									title: '账号状态',
									width: 150
								},{
									field: 'registdate',
									title: '注册时间',
									width: 250
								}]
							]
						});
						table.on('row(test)', function(obj) {
							console.log(obj.tr) //得到当前行元素对象
							console.log(obj.data) //得到当前行数据
							window.open("${pageContext.request.contextPath}/toUserSpace.action?user_name=" + obj.data.user_name)
						});
					});
				</script>
			</section>

		</div>

		<!-- Bootstrap core JavaScript -->
		<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Plugin JavaScript -->
		<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for this template -->
		<script src="${pageContext.request.contextPath}/js/resume.min.js"></script>

	</body>

</html>