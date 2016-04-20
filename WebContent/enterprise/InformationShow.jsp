<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.EntInfo, com.expertscan.data.ProjInfo"%>
<%
	EntInfo enterprise = (EntInfo)request.getAttribute("information");
	String baseURL = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="information center of experts">
		
		<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/infoCenter.css">
		
		<script type="text/javascript" src="<%=baseURL %>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=baseURL %>/js/bootstrap.min.js"></script>

		<title>专家汇平台</title>
	</head>
	<body>
		<jsp:include page="../master_nav.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<ul class="nav nav-sidebar">
						<li><a href="#Overview">Overview</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								Projects<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#ProjectsTendering">Projects Tendering</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#ProjectsOngoing">Projects Ongoing</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#ProjectsCompleted">Projects Completed</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<div class="bs-docs-section" id="Overview">
						<h1 class="page-header">Overview</h1>
						<form class="form-horizontal" action="<%=baseURL %>/enterprise/updateInfo.action" method="post">
								<div class="form-group"  style="color:white">
									<label class="col-sm-2 control-label">Enterprise ID</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getEntid() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getEmail() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Name</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getName() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Description</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getDescription() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Address</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getAddress() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Phone Number</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getPhone0() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Another Email</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getEmail1() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Rate</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= enterprise.getRate() %></p>
									</div>
								</div>
						</form>
					</div>
					<div class="bs-docs-section" id="Projects">
						<h1 class="page-header">Projects</h1>
						<div id="ProjectsTendering">
							<h2>Projects Tendering</h2>
							<%
								if(enterprise.getProjectsTendering().size() == 0){
							%>
								尚无
							<%
								}else{
							%>
									<table class="table">
										<thead>
											<tr>
												<th>Project ID</th>
												<th>Project Title</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : enterprise.getProjectsTendering()){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
									}
							%>
										</tbody>
									</table>
							<%
								}
							%>
						</div>
						<br>
						<div id="ProjectsOngoing">
							<h2>Projects Ongoing</h2>
							<%
								if(enterprise.getProjectsOngoing().size() == 0){
							%>
								尚无
							<%
								}else{
							%>
									<table class="table">
										<thead>
											<tr>
												<th>Project ID</th>
												<th>Project Title</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : enterprise.getProjectsOngoing()){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
									}
							%>
										</tbody>
									</table>
							<%
								}
							%>
						</div>
						<br>
						<div id="ProjectsCompleted">
							<h2>Projects Completed</h2>
							<%
								if(enterprise.getProjectsCompleted().size() == 0){
							%>
								尚无
							<%
								}else{
							%>
									<table class="table">
										<thead>
											<tr>
												<th>Project ID</th>
												<th>Project Title</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : enterprise.getProjectsCompleted()){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
									}
							%>
										</tbody>
									</table>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
        </div>
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>