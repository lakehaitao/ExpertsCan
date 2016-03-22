<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String baseUrl = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="login page">

		<link rel="stylesheet" type="text/css" href="<%=baseUrl %>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=baseUrl %>/css/signin.css">

		<script type="text/javascript" src="<%=baseUrl %>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=baseUrl %>/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=baseUrl %>/js/signin.js"></script>

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
				<!-- 注册界面 -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="expSignin">
						<form class="form-signup" action="<%=request.getContextPath()%>/expert/loginRequest.action" method="post">
							<label for="inputEmail" class="sr-only">Email address</label>
							<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
							<label for="inputPassword" class="sr-only">Password</label>
							<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
						</form>
					</div>
					<div class="tab-pane fade" id="entSignin">
						<form class="form-signup" action="<%=request.getContextPath()%>/enterprise/loginRequest.action" method="post">
							<label for="inputEmail" class="sr-only">Email address</label>
							<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
							<label for="inputPassword" class="sr-only">Password</label>
							<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="./master_footer.jsp" />
	</body>
</html>