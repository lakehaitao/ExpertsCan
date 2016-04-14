<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String baseURL = request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/sticky-header.css">

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=baseURL %>">专家汇LOGO</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Projects</a></li>
				<li><a href="#">Experts</a></li>
				<li><a href="#">Enterprises</a></li>
			</ul>
			
			<form class="navbar-form  navbar-right" role="search">
				<input type="text" class="form-control" placeholder="Search...">
				<button type="submit" class="btn btn-default">Search</button>
			</form>
			
			<% if(request.getSession().getAttribute("userName") == null){ %>
			
			<div class="nav navbar-right btn-group">
				<a href="signin">
					<button type="button" class="btn btn-default navbar-btn">Sign in</button>
				</a>
				<a href="signup">
					<button type="button" class="btn btn-default navbar-btn">Sign up</button>
				</a>
			</div>
			
			
			
			<% } else { %>
			
			<%
				String userType = (String)request.getSession().getAttribute("userType");
				if( userType!= null && userType.equals("enterprise")){ %>
			<div class="nav navbar-right">
					<a href="enterprise/newProjectPage.action">
						<button type="button" class="btn btn-primary navbar-btn">New a Project !</button>
					</a>
			</div>
			<% } %>
			
			<ul class="nav navbar-nav navbar-right">			
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<%= request.getSession().getAttribute("userName") %>
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="informationCenter">Information Center</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="signout">Sign out</a></li>
					</ul>
				</li>
			</ul>
			
			<% } %>
			
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>