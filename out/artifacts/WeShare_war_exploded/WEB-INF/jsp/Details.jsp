<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<title>${b.blog_title }</title>

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

	<body id="single">
		<div class="container">
			<header id="site-header">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-8">
						<div class="logo">
							<h1><a href=""><b>${b.blog_title }</a></h1>
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
							<!-- /.navbar-collapse -->
						</nav>

					</div>
				</div>
			</header>
		</div>

		<div class="content-body">
			<div class="container">
				<div class="row">
					<main class="col-md-8">
						<article class="post post-1">
							<header class="entry-header">
								<c:if test="${b.blog_user==currentUser.user_name&&admin==null }">
									<div style="float:right;">
										<a href="${pageContext.request.contextPath}/toUpdateBlog.action?blog_id=${b.blog_id}">
											<font color=gray size=2sp>
												编辑文章
											</font>
										</a>

										<a href="${pageContext.request.contextPath}/deleteBlogByBlogId.action?blog_id=${b.blog_id}">
											<font color=gray size=2sp>
												删除文章
											</font>
										</a>
									</div>
								</c:if>
								<c:if test="${admin!=null }">
									<a href="${pageContext.request.contextPath}/deleteBlogByBlogId.action?blog_id=${b.blog_id}">
										<font color=gray size=2sp>
											删除文章
										</font>
									</a>
								</c:if>
								<div style="float:center;">
									<h1 class="entry-title">${b.blog_title }</h1>
								</div>
								<div class="entry-meta">
									<span class="post-date">
										<a href="${pageContext.request.contextPath}/toUserSpace.action?user_name=${b.blog_user}">
											最后更新时间：${b.blog_time }
												<time class="entry-date" datetime="2012-11-09T23:15:57+00:00">
                                                </time>
                                        </a>
                                    </span>
									<span class="post-author"><a href="${pageContext.request.contextPath}/toUserSpace.action?user_name=${b.blog_user}">发布者：${b.blog_user }</a></span>

								</div>

							</header>
							<div class="entry-content clearfix">
								<blockquote>
									<p>
										${b.blog_content }
									</p>
								</blockquote>
							</div>
						</article>
						<section class="comment-area" id="comment-area">
							<hr>
							<h3>发表评论</h3>
							<form action="${pageContext.request.contextPath}/insertMessage.action" method="post" class="comment-form">
								<div class="row">
									<div class="col-md-12">
										<label for="id_comment">评论：</label>
										<textarea name="msg_content" id="id_comment" required></textarea>
										<button type="submit" class="comment-btn">发表</button>
									</div>
								</div>
								<!-- row -->
							</form>
							<div class="comment-list-panel">
								<h3>评论列表</h3>
								<h2><font color=red>${msg}</font></h2>
								<c:forEach items="${messages }" var="m">
									<div style="float:left;">${m.msg_user } ${m.msg_time }</div>
									<div style="float:right;">
										<c:if test="${m.msg_user==currentUser.user_name||admin!=null }">
											<a href="${pageContext.request.contextPath}/deleteMessageByMsgId.action?msg_id=${m.msg_id}&blog_id=${m.blog_id}">删除评论</a>
										</c:if>
									</div><br/> ${m.msg_content }
									<hr/>
								</c:forEach>
							</div>
						</section>
					</main>
					<aside class="col-md-4">
						<div class="widget widget-recent-posts">
							<h3 class="widget-title">探索</h3>
							<ul>
								<li>
									<a href="http://localhost:8080/WeShare/selectMessagesByBlogId.action?blog_id=${exploreBlogs[0].blog_id}">${exploreBlogs[0].blog_title}</a>
								</li>
								<li>
									<a href="http://localhost:8080/WeShare/selectMessagesByBlogId.action?blog_id=${exploreBlogs[1].blog_id}">${exploreBlogs[1].blog_title}</a>
								</li>
								<li>
									<a href="http://localhost:8080/WeShare/selectMessagesByBlogId.action?blog_id=${exploreBlogs[2].blog_id}">${exploreBlogs[2].blog_title}</a>
								</li>
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