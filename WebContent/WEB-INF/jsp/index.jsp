<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<title>闻说 - 首页</title>

		<!-- meta -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pace.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

		<!-- js -->
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/pace.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
	</head>

	<body>
		<div class="container">
			<header id="site-header">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-8">
						<a href="${pageContext.request.contextPath}/toIndex.action">
							<div class="logo">
								<h2>闻说 - 首页</h2>
							</div>
						</a>
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
									<c:if test="${currentUser!=null }">
									<li class="cl-effect-11">
										<a href="${pageContext.request.contextPath}/Logout.action" data-hover="退出">退出</a>
									</li>
									</c:if>
									<li class="">
										<a href="" data-hover="<font color=red>${currentUser.user_name }</font>">
											<font color=red>${currentUser.user_name }</font>
										</a>
									</li>
									<li>
										<c:if test="${currentUser==null&&admin!=null }">
											<a href="${pageContext.request.contextPath}/toAdminCenter.action" data-hover="${currentUser.user_name }">
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
					<!-- col-md-8 -->
				</div>
			</header>
		</div>

		<div class="content-body">
			<div class="container">
				<div class="row">
					<main class="col-md-8">
						<article class="post post-1">
							<header class="entry-header">
								<h1 class="entry-title">
                            <a href="">请登录</a>
                        </h1>
							</header>
							<div class="entry-content clearfix">
								<p></p>
								<div class="read-more cl-effect-14">
									<a href="toLogin.action" class="more-link">登录 <span class="meta-nav">→</span></a>
								</div>
							</div>
						</article>

						<article class="post post-2">
							<header class="entry-header">
								<h1 class="entry-title">
                            <a href="">没有账号？请注册</a>
                        </h1>
							</header>
							<div class="entry-content clearfix">
								<p></p>
								<div class="read-more cl-effect-14">
									<a href="toRegist.action" class="more-link">注册账号<span class="meta-nav">→</span></a>
								</div>
							</div>
						</article>

						<article class="post post-3">
							<header class="entry-header">
								<h1 class="entry-title">
                            <a href="toAdminLogin.action">管理员登录</a>
                        </h1>
							</header>
							<div class="entry-content clearfix">
								<p></p>
								<div class="read-more cl-effect-14">
									<a href="toAdminLogin.action" class="more-link">进入 <span class="meta-nav">→</span></a>
								</div>
							</div>
						</article>
					</main>
					<aside class="col-md-4">
						<div class="widget widget-recent-posts">
							<h3 class="widget-title">最新消息</h3> 请登录后查看
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