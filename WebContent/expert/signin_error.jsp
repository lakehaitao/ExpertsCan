<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="login page">

		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/signin.css">

		<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/signin.js"></script>

		<title>登录专家汇</title>
	</head>

	<body>
		<div class="container">
			<div>
				<!-- 用户角色 Tab -->
				<ul id="userRoleTabs" class="nav nav-tabs nav-justified">
					<li class="active"><a href="#expSignin" data-toggle="tab">I'm Expert</a></li>
					<li><a href="#entSignin" data-toggle="tab">I'm Enterprise</a></li>
				</ul>
				<!-- 登录界面 -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="expSignin">
						<form class="form-signin" action="<%=request.getContextPath()%>/expert/loginRequest.action" method="post">
							<label for="inputEmail" class="sr-only">Email address</label>
							<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
							<label for="inputPassword" class="sr-only">Password</label>
							<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
						</form>
					</div>
					<div class="tab-pane fade" id="entSignin">
						<form class="form-signin" action="<%=request.getContextPath()%>/enterprise/loginRequest.action" method="get">
							<label for="inputEmail" class="sr-only">Email address</label>
							<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
							<label for="inputPassword" class="sr-only">Password</label>
							<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
							<div class="alert alert-danger"><s:fielderror /></div>
							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>