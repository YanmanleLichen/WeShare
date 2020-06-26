<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<title>闻说 - 搜索</title>

		<!-- meta -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pace.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">

		<!-- js -->
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/pace.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	</head>

	<body>
		<div class="container">
			<header id="site-header">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-8">
						<div class="logo">
							<h1><a href="${pageContext.request.contextPath}/toCenter.action"><b>闻说 - 搜索</a></h1>
						</div>
					</div>
					<!-- col-md-4 -->
					<div class="col-md-8 col-sm-7 col-xs-4">
						<nav class="main-nav" role="navigation">
							<div class="navbar-header">
								<button type="button" id="trigger-overlay" class="navbar-toggle">
                            <span class="ion-navicon"></span>
                        </button>
							</div>

							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li class="cl-effect-11">
										<a href="${pageContext.request.contextPath}/toIndex.action" data-hover="首页">首页</a>
									</li>
									<li class="cl-effect-11">
										<a href="${pageContext.request.contextPath}/toCenter.action" data-hover="广场">广场</a>
									</li>
									<li class="cl-effect-11">
										<a href="${pageContext.request.contextPath}/toSearch.action" data-hover="搜索" target="_blank">搜索</a>
									</li>
									<c:if test="${currentUser!=null ||admin!=null}">
										<li class="cl-effect-11">
											<a href="${pageContext.request.contextPath}/Logout.action" data-hover="退出">退出</a>
										</li>
									</c:if>
									<li class="">
										<c:if test="${currentUser!=null }">
											<a href="${pageContext.request.contextPath}/toUserSpace.action?user_name=${currentUser.user_name}" data-hover="<font color=red>${currentUser.user_name }</font>">
												<font color=red>
													用户：${currentUser.user_name }
												</font>
											</a>
										</c:if>
									</li>
									<li>
										<c:if test="${currentUser==null }">
											<a href="${pageContext.request.contextPath}/toAdminCenter.action?user_name=${admin.admin_name}" data-hover="${admin.admin_name}">
												<font color=red>
													管理员：${admin.admin_name }
												</font>
											</a>
										</c:if>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</header>
		</div>

		<div class="content-body">
			<div class="container">
				<div class="row">
					<main class="col-md-8">
						欢迎您，
						<a href="${pageContext.request.contextPath}/toUserSpace.action">
							<font color="red">${currentUser.user_name }</font>
						</a>
						<c:if test="${currentUser==null }">
							<font color=red>
								管理员：${admin.admin_name }
							</font>
						</c:if>
						<c:if test="${currentUser.identity=='outside' }">校外人士</c:if>
						<c:if test="${currentUser.identity=='inside' }">本校师生</c:if>
						<c:if test="${admin==null }">
							<a href="${pageContext.request.contextPath}/toAddBlog.action">
								<div style="float:right;">[发布信息]&nbsp;&nbsp;&nbsp;</div>
							</a>
						</c:if>
						<hr>
						<br />
						<div class="layui-input-block" style="margin-left: 0px;">
							<input id="search" name="search" lay-verify="title" 
								style="margin-right:10px;float:left;width: 600px;"
								autocomplete="off" placeholder="请输入" class="layui-input">
							<button style="width:140px;float: right;" 
								class="layui-btn" lay-filter="formDemo" onclick="analysis()">查找</button>
						</div>
						<br />
						<table id="demo" lay-filter="test"></table>
						<input type="hidden" name="type" id="type" value="${blog_type }" />
						<script>
							var blog_type = document.getElementById("type").value;
							console.log("blog_type: " + blog_type);
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
									url: '${pageContext.request.contextPath}/selectAllBlogsList.action?blog_type=' + blog_type //数据接口
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
										}]
									]
								});
								table.on('row(test)', function(obj) {
									console.log(obj.tr) //得到当前行元素对象
									console.log(obj.data) //得到当前行数据
									window.open("${pageContext.request.contextPath}/selectBlogByBlogId.action?blog_id=" + obj.data.blog_id, "_blank")
								});
							});
						</script>
						<h2><font color=red>${msg}</font></h2>
						<hr />
					</main>

					<aside class="col-md-4">
						<div class="widget widget-recent-posts">
							<h3 class="widget-title">最新消息</h3>
							<ul>
								<!-- <li>
									<a href=""></a>
								</li>
								<li>
									<a href=""></a>
								</li>
								<li>
									<a href=""></a>
								</li> -->
							</ul>
						</div>

						<div class="widget widget-category">
							<h3 class="widget-title">分类</h3>
							<ul>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=系统公告">系统公告<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=综合信息">综合信息<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=校园新闻">校园新闻<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=游戏交流">游戏交流<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=学习交流">学习交流<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=失物招领">失物招领<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=二手交易">二手交易<span class="post-count"></span></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/toSection.action?blog_type=租赁信息">租赁信息<span class="post-count"></span></a>
								</li>
								<li>
									<a href="" class="more-link">敬请期待<span class="post-count"></span></a>
								</li>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>

		<footer id="site-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p class="copyright">&copy 2020 - 闻说 - 作者
							<a href="https://github.com/YanmanleLichen" title="离尘" target="_blank">Github</a>
						</p>
					</div>
				</div>
			</div>
		</footer>
		<script src="${pageContext.request.contextPath}/js/script.js"></script>
	</body>

</html>