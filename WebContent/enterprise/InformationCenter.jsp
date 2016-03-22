<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.EntInfo, com.expertscan.data.ProjInfo"%>
<%
	EntInfo enterprise = (EntInfo)request.getSession().getAttribute("userInfo");
	enterprise.refresh();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="information center of experts">
		
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="./css/infoCenter.css">
		
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/bootstrap.min.js"></script>

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
						<li><a href="#Recommendations">Recommendations</a></li>
					</ul>
				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<div class="bs-docs-section" id="Overview">
						<h1 class="page-header">Overview</h1>
						<form class="form-horizontal" action="enterprise/updateInfo.action" method="post">
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
										<input name="name" value="<%= enterprise.getName() %>" class="form-control" placeholder="Name" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Description</label>
									<div class="col-sm-10">
										<textarea name="description" class="form-control" rows="3"><%= enterprise.getDescription() %></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Address</label>
									<div class="col-sm-10">
										<textarea name="address" class="form-control" rows="2"><%= enterprise.getAddress() %></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Phone Number</label>
									<div class="col-sm-10">
										<input name="phone0" value="<%= enterprise.getPhone0() %>" class="form-control" placeholder="Phone Number">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Another Email</label>
									<div class="col-sm-10">
										<input type="email" name="email1" value="<%= enterprise.getEmail1() %>" class="form-control" placeholder="Another Email">
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
												<td><a href="enterprise/information?entid=<%=p.getProjid() %>" target="_blank"><%=p.getTitle() %></a></td>
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
												<td><a href="#" target="_blank"><%=p.getTitle() %></a></td>
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
												<td><a href="#" target="_blank"><%=p.getTitle() %></a></td>
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