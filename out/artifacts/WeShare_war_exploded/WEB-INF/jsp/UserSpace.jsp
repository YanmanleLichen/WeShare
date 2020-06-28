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

		<title>${SpaceUser.user_name }的个人空间</title>
		<!-- Bootstrap core CSS -->
		<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom fonts for this template -->
		<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/devicons/css/devicons.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

		<!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/css/resume.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>

	</head>

	<body id="page-top">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
			<a target="_blanck" class="navbar-brand js-scroll-trigger" href="https://github.com/YanmanleLichen">
				<c:if test="${SpaceUser.gender=='男' }">
					<img class="img-fluser_id img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/img/m.jpg" alt="${SpaceUser.user_name }" />
				</c:if>
				<c:if test="${SpaceUser.gender=='女' }">
					<img class="img-fluser_id img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/img/f.jpg" alt="${SpaceUser.user_name }" />
				</c:if>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#about">
							<c:if test="${SpaceUser.user_name!=currentUser.user_name || currentUser==null}">
								TA的信息
							</c:if>
							<c:if test="${SpaceUser.user_name==currentUser.user_name}">
								我的信息
							</c:if>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#blogs">
							<c:if test="${SpaceUser.user_name!=currentUser.user_name || currentUser==null}">
								TA的帖子
							</c:if>
							<c:if test="${SpaceUser.user_name==currentUser.user_name}">
								我的帖子
							</c:if>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#following">
							<c:if test="${SpaceUser.user_name!=currentUser.user_name || currentUser==null}">
								TA的关注
							</c:if>
							<c:if test="${SpaceUser.user_name==currentUser.user_name}">
								我的关注
							</c:if>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#followers">
							<c:if test="${SpaceUser.user_name!=currentUser.user_name || currentUser==null}">
								TA的粉丝
							</c:if>
							<c:if test="${SpaceUser.user_name==currentUser.user_name}">
								我的粉丝
							</c:if>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/toCenter.action">返回广场</a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="container-fluser_id p-0">
			<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
				<div class="my-auto">
					<h1 class="mb-0">
            			<span class="text-primary">
            				${SpaceUser.user_name }
            			</span>
          			</h1>
					<div class="subheading mb-5">
						<c:if test="${currentUser.user_name!=SpaceUser.user_name && canFollow == 1 }">
							<a href="${pageContext.request.contextPath}/
								focusOnUserByUserId.action?
								user_id=${currentUser.user_id}&follow_user_id=${SpaceUser.user_id}" class="layui-btn layui-btn-radius">点击关注</a>
						</c:if>
						<c:if test="${currentUser.user_name!=SpaceUser.user_name && canFollow == 0 }">
							<a href="${pageContext.request.contextPath}/
								unFollowUserByUserId.action?
								user_id=${currentUser.user_id}&follow_user_id=${SpaceUser.user_id}" class="layui-btn layui-btn-radius">取消关注</a>
						</c:if>
						<br />
						<c:if test="${SpaceUser.user_state=='t' }">账号正常</c:if>
						<c:if test="${SpaceUser.user_state=='f' }">账号冻结</c:if>
						<c:if test="${currentUser.user_name==SpaceUser.user_name }">
							<a href="${pageContext.request.contextPath}/toUpdateUser.action">点击修改账号信息</a>
						</c:if>
						<c:if test="${admin != null && SpaceUser.user_state=='t' }">
							<a href="${pageContext.request.contextPath}/updateUserStateFreeze.action?user_id=${SpaceUser.user_id}">点击封停此账号</a>
						</c:if>
						<c:if test="${admin != null && SpaceUser.user_state=='f' }">
							<a href="${pageContext.request.contextPath}/updateUserStateUnseal.action?user_id=${SpaceUser.user_id}">点击解封此账号</a>
						</c:if>
						<br>
						<c:if test="${SpaceUser.identity=='inside' }">身份：校内师生</c:if>
						<c:if test="${SpaceUser.identity=='outside' }">身份：校外人士</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;用户ID：${SpaceUser.user_id }
						<br/>性别：${SpaceUser.gender }
						<br/>
						注册时间：${SpaceUser.registdate }
						<fmt:formatDate value="${xx.date}" pattern="yyyy-MM-dd HH:mm:ss" />
						<hr/>简介：
						<br />
						${SpaceUser.description }

					</div>
					<ul class="list-inline list-social-icons mb-0">
						<li class="list-inline-item">
							<a target="_blanck" href="https://github.com/YanmanleLichen">
								<span class="fa-stack fa-lg">
                  					<i class="fa fa-circle fa-stack-2x"></i>
                  					<i class="fa fa-github fa-stack-1x fa-inverse"></i>
                				</span>
							</a>
						</li>
					</ul>
				</div>
			</section>
			
			<section class="resume-section p-3 p-lg-5 d-flex d-column" id="blogs">
				<table id="demo" lay-filter="test"></table>
				<input type="hidden" name="type" id="blog_user" value="${SpaceUser.user_name }" />
				<script>
					var blog_user = document.getElementById("blog_user").value;
					console.log("blog_user: " + blog_user);
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
							url: '${pageContext.request.contextPath}/selectAllBlogsByUserId.action?blog_user=' + blog_user //数据接口
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
									field: 'blog_title',
									title: '标题',
									width: 380,
									fixed: 'left'
								}, {
									field: 'blog_type',
									title: '类型',
									width: 100
								}, {
									field: 'blog_user',
									title: '发布者',
									width: 75
								}, {
									field: 'blog_time',
									title: '最后更新时间',
									width: 175
								}, {
									field: 'blog_id',
									title: '帖子ID',
									width: 350
								}]
							]
						});
						table.on('row(test)', function(obj) {
							console.log(obj.tr) //得到当前行元素对象
							console.log(obj.data) //得到当前行数据
							window.open("${pageContext.request.contextPath}/selectBlogByBlogId.action?blog_id=" + obj.data.blog_id, "_blank")
						});
					})
				</script>
			</section>
			
			<section class="resume-section p-3 p-lg-5 d-flex d-column" id="following">
				<table id="demo1" lay-filter="test"></table>
				<input type="hidden" name="type" id="user_id" value="${SpaceUser.user_id }" />
				<script>
					var user_id = document.getElementById("user_id").value;
					console.log("user_id: " + user_id);
					layui.use('table', function() {
						var table = layui.table;
						//第一个实例
						table.render({
							elem: '#demo1'
								//,height: 600
								,
							skin: 'nob',
							even: false,
							size: 'lg',
							url: '${pageContext.request.contextPath}/selectRelationsByUserId.action?user_id=' + user_id //数据接口
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
									title: '用户名',
									width: 150,
									fixed: 'left'
								}, {
									field: 'follow_user_id',
									title: '用户ID',
									width: 300
								}, {
									field: 'follow_time',
									title: '关注时间',
									width: 200
								}, {
									field: 'relation_id',
									title: '关系ID',
									width: 350
								}]
							]
						});
						table.on('row(test)', function(obj) {
							console.log(obj.tr) //得到当前行元素对象
							console.log(obj.data) //得到当前行数据
							window.open("${pageContext.request.contextPath}/toUserSpace.action?user_name=" + obj.data.user_id, "_blank")
						});
					})
				</script>
			</section>
			
			<section class="resume-section p-3 p-lg-5 d-flex d-column" id="followers">
				<table id="demo2" lay-filter="test"></table>
				<input type="hidden" name="type" id="follow_user_id" value="${SpaceUser.user_id }" />
				<script>
					var follow_user_id = document.getElementById("follow_user_id").value;
					console.log("follow_user_id: " + follow_user_id);
					layui.use('table', function() {
						var table = layui.table;
						//第一个实例
						table.render({
							elem: '#demo2'
								//,height: 600
								,
							skin: 'nob',
							even: false,
							size: 'lg',
							url: '${pageContext.request.contextPath}/selectRelationsByFollowUserId.action?follow_user_id=' + follow_user_id //数据接口
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
									field: 'follow_user_id',
									title: '用户名',
									width: 150,
									fixed: 'left'
								}, {
									field: 'user_id',
									title: '用户ID',
									width: 300
								}, {
									field: 'follow_time',
									title: '被关注时间',
									width: 200
								}, {
									field: 'relation_id',
									title: '关系ID',
									width: 350
								}]
							]
						});
						table.on('row(test)', function(obj) {
							console.log(obj.tr) //得到当前行元素对象
							console.log(obj.data) //得到当前行数据
							window.open("${pageContext.request.contextPath}/toUserSpace.action?user_name=" + obj.data.follow_user_id, "_blank")
						});
					})
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