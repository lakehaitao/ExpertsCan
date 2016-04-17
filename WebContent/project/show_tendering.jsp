<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.ExpInfo, com.expertscan.data.ProjInfo, com.expertscan.data.ProjExpTendering"%>
<%
	ProjInfo project = (ProjInfo)request.getAttribute("information");
	String baseURL = request.getContextPath();
	String userType = (String) request.getSession().getAttribute("userType");
	
	boolean isExpert = userType.equals("expert");
	boolean hasApplied = false;
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
		<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/glyphicons.css">
		
		<script type="text/javascript" src="<%=baseURL %>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=baseURL %>/js/bootstrap.min.js"></script>

		<title>专家汇平台</title>
	</head>
	<body>
		<jsp:include page="../master_nav.jsp" />
		<div class="container">
			
			<!-- Overview Section -->
			<div class="bs-docs-section" id="Overview">
				<h1 class="page-header">Overview</h1>
				<form class="form-horizontal" action="#" method="post">
					<div class="form-group"  style="color:white">
						<label class="col-sm-2 control-label">Project ID</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= project.getProjid() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Title</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= project.getTitle() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Description</label>
							<div class="col-sm-10">
								<p class="form-control-static"><%= project.getDescription() %></p>
							</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Release Date</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= project.getReleaseDate() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Expense</label>
						<div class="col-sm-10">
							<p class="form-control-static"><%= project.getExpense() %></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Enterprise</label>
						<div class="col-sm-10">
							<p class="form-control-static"><a href="enterprise/information?entid=<%=project.getEnterprise().getEntid() %>"><%= project.getEnterprise().getName() %></a></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">State</label>
						<div class="col-sm-10">
							<p class="form-control-static">
							<%
								String state = "Unknown";
								switch(project.getState()){
								case 0:
									state ="Tendering";
									break;
								case 1:
									state ="Ongoing";
									break;
								case 2:
									state ="Completed";
									break;
								}
							%>
							<%=state %>
							</p>
						</div>
					</div>
				</form>
			</div>
		
		
			<!-- Experts Section -->
			<div class="bs-docs-section" id="Experts">
				<h1 class="page-header">Experts Applications</h1>
				<%
					if(project.getExpertsTendering().size() == 0){
				%>
					尚无专家投标
				<%
					}else{
						Integer expertID = null;
						if(isExpert){
							expertID = ((ExpInfo)request.getSession().getAttribute("userInfo")).getExpid();
						}
						for(ProjExpTendering relation : project.getExpertsTendering()){
							ExpInfo exp = relation.getExp();
				%>
						<div class="border-section row">
							<div class="col-sm-10">
								<div class="row">
									<label class="col-sm-2 control-label">Expert Name</label>
									<div class="col-sm-10">
										<%-- <% if(exp.getIsPublic()){ %>
										<p><a href="expert/information?expid=<%= exp.getExpid() %>" target="_blank"><%= exp.getName() %></a></p>
										<% }else{ %>
										<p>Anonymous</p>
										<% } %> --%>
										<p><a href="<%=baseURL %>/expert/information?expid=<%= exp.getExpid() %>" target="_blank"><%= exp.getName() %></a></p>
									</div>
								</div>
								<div class="row">
									<label class="col-sm-2 control-label">Application State</label>
									<div class="col-sm-10">
										<%
											switch(relation.getState()){
											case 0:
										%>
										<p>Pending</p>
										<%
											break;
											case 1:
										%>
										<p>Accepted</p>
										<%
											break;
											case 2:
										%>
										<p>Denied</p>
										<% 
											break;
											case 3:
										%>
										<p>Application Canceled</p>
										<%
											break;
											}
										%>
									</div>
								</div>
							</div>
							<%
								if(isExpert && expertID.equals(exp.getExpid()) && relation.getState()!=3){
										hasApplied = true;
							%>
							<div class="col-sm-2 bs-glyphicons">
								<ul class="bs-glyphicons-list">
									<li>
										<a href="#">
											<button type="button" class="btn btn-default">
												<span class="glyphicon glyphicon-remove"></span>
												&nbsp;
												<span class="glyphicon-class">Cancel</span>
											</button>
										</a>
									</li>
								</ul>
							</div>
							<%
								}
							%>
						</div>
				<%
						}

					}
				%>	
			</div>
		
			
			<!-- Apply Section -->
			<%
				if(isExpert && !hasApplied){
					Integer expertID = ((ExpInfo)request.getSession().getAttribute("userInfo")).getExpid();
			%>
			<div class="row">			
				<div class="col-sm-offset-5 col-sm-7">
					<a href="#"><button class="btn btn-info">Apply This Project !</button></a>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>