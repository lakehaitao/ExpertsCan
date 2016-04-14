<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.ExpInfo, com.expertscan.data.ProjInfo"%>
<%
	ProjInfo project = (ProjInfo)request.getAttribute("information");
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
		<div class="container">
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
		</div>
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>