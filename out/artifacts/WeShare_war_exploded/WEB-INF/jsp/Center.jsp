<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<title>闻说 - 广场</title>

		<!-- meta -->
		<meta charset="UTF-8">

		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pace.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/dist/css/layui.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/build/layui.css" media="all">

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
							<h1><a href="${pageContext.request.contextPath}/toCenter.action"><b>闻说 - 广场</a></h1>
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
											<a href="${pageContext.request.contextPath}/toAdminCenter.action" data-hover="${admin.admin_name }">
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

						<div class="layui-carousel" id="test1">
							<div carousel-item="">
								<div>
									<img src="https://www.tfswufe.edu.cn/__local/C/87/56/3C12A2C9CC7D100141B20A9E21E_B274B881_161EF.jpg">
								</div>
								<div>
									<img src="https://www.tfswufe.edu.cn/__local/8/48/E2/D6B446FDE8E6F865F96E9A90FAA_D4429944_11988.png">
								</div>
								<div>
									<img src="https://www.tfswufe.edu.cn/__local/7/C2/42/58EC0DA5FA4F01C3A9FA3C5D387_38EB6794_AFB9.jpg">
								</div>
							</div>
						</div>
						<hr>
						<div class="link">
							<div class="read-more cl-effect-14">
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=系统公告" class="more-link">系统公告 <span class="meta-nav">→</span></a>
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=综合信息" class="more-link">综合信息 <span class="meta-nav">→</span></a>
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=校园新闻" class="more-link">校园新闻 <span class="meta-nav">→</span></a>
							</div>
						</div>
						<div class="link">
							<div class="read-more cl-effect-14">
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=游戏交流" class="more-link">游戏交流 <span class="meta-nav">→</span></a>
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=学习交流" class="more-link">学习交流 <span class="meta-nav">→</span></a>
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=失物招领" class="more-link">失物招领 <span class="meta-nav">→</span></a>
							</div>
						</div>
						<div class="link">
							<div class="read-more cl-effect-14">
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=二手交易" class="more-link">二手交易 <span class="meta-nav">→</span></a>
								<a href="${pageContext.request.contextPath}/toSection.action?blog_type=租赁信息" class="more-link">租赁信息 <span class="meta-nav">→</span></a>
								<a href="" class="more-link">敬请期待 <span class="meta-nav">→</span></a>
							</div>
						</div>
						<hr>
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
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
		<script>
			layui.use(['carousel'], function() {
				var carousel = layui.carousel;
				carousel.render({
					elem: '#test1',
					width: '700px',
					height: '440px',
					interval: 5000
				});
			});
		</script>
	</body>

</html>