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
				<img class="img-fluser_id img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/img/tx.jpg" alt="${SpaceUser.user_name }" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#about">个人信息</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#following">我的关注</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#followers">我的粉丝</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#blogs">我的帖子</a>
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
					</div>
					<p class="mb-5">注册时间：${SpaceUser.registdate }
						<fmt:formatDate value="${xx.date}" pattern="yyyy-MM-dd HH:mm:ss" /><br/>简介：${SpaceUser.description }</p>
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