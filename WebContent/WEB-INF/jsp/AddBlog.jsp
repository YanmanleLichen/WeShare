<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>发表信息</title>

		<!-- meta -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pace.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

		<!-- js -->
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/pace.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
	</head>
	</head>

	<body id="page">
		<div class="container">
			<header id="site-header">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-8">
						<div class="logo">
							<h1><a href=""><b>发表信息</a></h1>
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
										<a href="${pageContext.request.contextPath}/toCenter.action" data-hover="广场">广场</a>
									</li>
									<li class="cl-effect-11">
										<a href="${pageContext.request.contextPath}/toUserSpace.action?user_name=${currentUser.user_name}">
											<font color=red>用户：${currentUser.user_name }</font>
										</a>
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
					<h1 class="page-title">发表信息</h1>
					<article class="post">
						<div class="entry-content clearfix">
							<form action="${pageContext.request.contextPath}/insertBlog.action" method="post" class="contact-form">
								<div class="row">
									<div class="col-md-6 col-md-offset-3">
										<input type="text" name="blog_title" placeholder="标题" required>
										<div>
											<select name="blog_type">
  												<option value="">请选择类型</option>
  												<option value="校园新闻">校园新闻</option>
  												<option value="综合信息">综合信息</option>
  												<option value="美食交流">美食交流</option>
  												<option value="游戏交流">游戏交流</option>
  												<option value="学习交流">学习交流</option>
  												<option value="失物招领">失物招领</option>
  												<option value="二手交易">二手交易</option>
  												<option value="租赁信息">租赁信息</option>
											</select>
										</div>
										<input type="hidden" name="blog_content" id="blog_content" />
										<div id="div1" class="toolbar">
										</div>
										<div id="div2" class="text">
										</div>
										<input id="btn2" type="submit" class="btn-send btn-5 btn-5b ion-ios-paperplane" value="发表" />
										<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/release/wangEditor.min.js"></script>
										<script type="text/javascript">
											var E = window.wangEditor
											var editor = new E('#div1', '#div2')
											editor.create()
											document.getElementById('btn2').addEventListener('click', function() {
												// 读取 text
												//alert("发布成功")
												$("#blog_content").attr("value", editor.txt.html());
											}, false)
										</script>
									</div>
								</div>

							</form>
						</div>
					</article>
					<h2><font color=red>${msg}</font></h2>
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