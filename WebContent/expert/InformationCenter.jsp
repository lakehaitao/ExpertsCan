<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.ExpInfo, com.expertscan.data.ProjInfo"%>
<%
	ExpInfo expert = (ExpInfo)request.getSession().getAttribute("userInfo");
	expert.refresh();
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
								<li><a href="#ProjectsBidding">Projects Bidding</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#ProjectsOngoing">Projects Ongoing</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#ProjectsCompleted">Projects Completed</a></li>
							</ul>
						</li>
						<li><a href="#Recommendations">Recommendations</a></li>
					</ul>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<div class="bs-docs-section" id="Overview">
						<h1 class="page-header">Overview</h1>
						<form class="form-horizontal" action="<%=baseURL %>/expert/updateInfo.action" method="post">
								<div class="form-group"  style="color:white">
									<label class="col-sm-2 control-label">Expert ID</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= expert.getExpid() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Email</label>
									<div class="col-sm-10">
										<p class="form-control-static"><%= expert.getEmail() %></p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Name</label>
									<div class="col-sm-10">
										<input name="name" value="<%= expert.getName() %>" class="form-control" placeholder="Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Description</label>
									<div class="col-sm-10">
										<textarea name="description" class="form-control" rows="3"><%= expert.getDescription() %></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Experiences</label>
									<div class="col-sm-10">
										<textarea name="experience" class="form-control" rows="3"><%= expert.getExperience() %></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Phone Number</label>
									<div class="col-sm-10">
										<input name="phone0" value="<%= expert.getPhone0() %>" class="form-control" placeholder="Phone Number">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Another Email</label>
									<div class="col-sm-10">
										<input type="email" name="email1" value="<%= expert.getEmail1() %>" class="form-control" placeholder="Another Email">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="checkbox">
											<label>
												<input type="checkbox" name="isPublic"
												<% if(expert.getIsPublic()){ %>
												checked="checked"
												<%} %>
												> is public
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-default">Save Changes</button>
									</div>
								</div>
						</form>
					</div>
					<div class="bs-docs-section" id="Projects">
						<h1 class="page-header">Projects</h1>
						<div id="ProjectsBidding">
							<h2>Projects Bidding</h2>
							<%
								if(expert.getProjectsBidding().size() == 0){
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
												<th>Enterprise</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : expert.getProjectsBidding()){
										if(p.getState() == 0){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><a href="<%=baseURL %>/enterprise/information?entid=<%=p.getEnterprise().getEntid() %>" target="_blank"><%=p.getEnterprise().getName() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
										}
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
								if(expert.getProjectsOngoing().size() == 0){
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
												<th>Enterprise</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : expert.getProjectsOngoing()){
										if(p.getState() == 1){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><a href="<%=baseURL %>/enterprise/information?entid=<%=p.getEnterprise().getEntid() %>" target="_blank"><%=p.getEnterprise().getName() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
										}
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
								if(expert.getProjectsCompleted().size() == 0){
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
												<th>Enterprise</th>
												<th>Release Date</th>
											</tr>
										</thead>
										<tbody>
							<%
									for(ProjInfo p : expert.getProjectsCompleted()){
										if(p.getState() == 2){
							%>
											<tr>
												<td><%=p.getProjid() %></td>
												<td><a href="<%=baseURL %>/project/information?projid=<%= p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
												<td><a href="<%=baseURL %>/enterprise/information?entid=<%=p.getEnterprise().getEntid() %>" target="_blank"><%=p.getEnterprise().getName() %></a></td>
												<td><%=p.getReleaseDate() %></td>
											</tr>
							<%
										}
									}
							%>
										</tbody>
									</table>
							<%
								}
							%>
						</div>
					</div>
					<div class="bs-docs-section" id="Recommendations">
						<h1 class="page-header">Recommendations</h1>
						1<br>
						2<br>
						3<br>
						4<br>
						5<br>
						6<br>
						7<br>
					</div>
				</div>
			</div>
        </div>
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>