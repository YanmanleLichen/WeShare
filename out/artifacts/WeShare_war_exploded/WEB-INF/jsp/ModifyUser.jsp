<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>闻说 - 修改用户资料</title>

		<!-- meta -->
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pace.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

		<!-- js -->
		<script src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/pace.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/modernizr.custom.js"></script>
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	</head>
	</head>

	<body id="page">
		<div class="container">
			<header id="site-header">
				<div class="row">
					<div class="col-md-4 col-sm-5 col-xs-8">
						<div class="logo">
							<h1><a href=""><b>修改用户资料</a></h1>
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
										<a href="${pageContext.request.contextPath}/Logout.action" data-hover="退出">退出</a>
									</li>
									<li class="">
										<a href="${pageContext.request.contextPath}/toUserSpace.action?user_name=${currentUser.user_name}" data-hover="${currentUser.user_name }">
											<font color=red>
												用户：${currentUser.user_name }
											</font>
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
					<main class="col-md-12">
						<h1 class="page-title">请输入相关信息</h1>
						<article class="post">
							<div class="entry-content clearfix">
								<form action="${pageContext.request.contextPath}/updateUserByUserId.action" method="post" class="contact-form">
									<div class="row">
										<div class="col-md-6 col-md-offset-3">
											<input type="password" name="password" placeholder="密码" required/>
											<div>
												<select name="gender" id="gender">
													<option value="">请选择性别</option>
													<option value="女">女</option>
													<option value="男">男</option>
												</select>
											</div>
											<input type="hidden" name="hiddengender" id="hiddengender" value="${currentUser.gender}"/>
											<script type="text/javascript">
												var hiddengender = document.getElementById("hiddengender").value;
												$("#gender").val(hiddengender);  
											</script>
											<textarea name="description" rows="7" placeholder="简介" required>${currentUser.description}</textarea>
											<input type="submit" class="btn-send btn-5 btn-5b ion-ios-paperplane" value="修改" />
										</div>
									</div>
									<!-- row -->
								</form>
							</div>
						</article>
						<h2 class="page-title"><font color=red>${msg}</font></h2>
					</main>
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
	</body>

</html>