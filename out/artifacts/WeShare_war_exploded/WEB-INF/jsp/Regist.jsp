<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>闻说 - 注册</title>
		
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
							<h1><a href=""><b>注册</a></h1>
						</div>
					</div><!-- col-md-4 -->
					<div class="col-md-8 col-sm-7 col-xs-4">
						<nav class="main-nav" role="navigation">
							<div class="navbar-header">
  								<button type="button" id="trigger-overlay" class="navbar-toggle">
    								<span class="ion-navicon"></span>
  								</button>
							</div>

							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  								<ul class="nav navbar-nav navbar-right">
    								<li class="cl-effect-11"><a href="${pageContext.request.contextPath}/toIndex.action" data-hover="首页">首页</a></li>
  								</ul>
							</div><!-- /.navbar-collapse -->
						</nav>
					</div><!-- col-md-8 -->
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
								<form action="${pageContext.request.contextPath}/Regist.action" method="post" class="contact-form">
									<div class="row">
										<div class="col-md-6 col-md-offset-3">
											<input type="text" id ="user_name"
											 name="user_name" placeholder="用户名" onBlur="ajaxValidate()" required>
											 <span id="remind"></span>
											<input type="password" name="password" placeholder="密码" required/>
											<div>
												<select name="gender">
  													<option value="">请选择性别</option>
  													<option value="女">女</option>
  													<option value="男">男</option>
												</select>
												<select name="identity">
  													<option value="">请选择身份</option>
  													<option value="inside">本校师生</option>
  													<option value="outside">校外人士</option>
												</select>
											</div>
											<textarea name="description" rows="7" placeholder="简介" required></textarea>
											<input type="submit" id="regist" class="btn-send btn-5 btn-5b ion-ios-paperplane" value="注册"/>
										</div>
									</div>	<!-- row -->
								</form>
							</div>
						</article>
						<h2 class="page-title"><font color=red>${msg}</font></h2>
						<article class="post post-1">
                    		<header class="entry-header">
                        		<h1 class="entry-title">
                            		<a href="">已有账号？请登录</a>
                        		</h1>
                    		</header>
                    		<div class="entry-content clearfix">
                        		<div class="read-more cl-effect-14">
                            		<a href="toLogin.action" class="more-link">登录 <span class="meta-nav">→</span></a>
                        		</div>
                    		</div>
                		</article>
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

		<script src="${pageContext.request.contextPath}/js/script.js"></script>
		<script type="text/javascript">
		function ajaxValidate() {
		    var user_name=$("#user_name").val();
		    $.ajax({
		        type:"POST",
		        url:"${pageContext.request.contextPath}/findUser.action?user_name=" + user_name,//提交地址
		        data:{},//提交数据
		        dataType:"json",//返回json格式
		        contentType:"application/json;charset=utf-8",
		        success:function(data){
		            if (1 == data) {//后端传来的msg的值是no,不能注册。反之。
		                $("#remind").html("<font color='red'>抱歉，该用户已被注册，请更换！</font>");
		                document.getElementById("regist").disabled = true;
		            }
		            if(0 == data){
		                $("#remind").html("");//如果没有被注册，将提示语清空。
		                document.getElementById("regist").disabled = false;
		                }
		        }
		    });
		}
		</script>
	</body>
</html>