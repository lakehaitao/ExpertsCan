<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.ExpInfo, com.expertscan.data.ProjInfo, com.expertscan.data.ProjExpCompleted"%>
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
		<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/glyphicons.css">
		
		<script type="text/javascript" src="<%=baseURL %>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=baseURL %>/js/bootstrap.min.js"></script>

		<title>专家汇平台</title>
	</head>
	<body>
		<jsp:include page="../master_nav.jsp" />
		<div class="container">
			<div class="bs-docs-section row" id="Overview">
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
							<input name="title" value="<%= project.getTitle() %>" class="form-control" placeholder="Title" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Description</label>
							<div class="col-sm-10">
								<textarea name="description" class="form-control" rows="3"><%= project.getDescription() %></textarea>
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
							<input name="expense" value="<%= project.getExpense() %>" class="form-control" placeholder="Expense">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Enterprise</label>
						<div class="col-sm-10">
							<p class="form-control-static"><a href="<%=baseURL %>/informationCenter" target="_blank"><%= project.getEnterprise().getName() %></a></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">State</label>
						<div class="col-sm-10">
							<p class="form-control-static">Tendering</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Save Changes</button>
						</div>
					</div>
				</form>
			</div>
			
			<div class="bs-docs-section" id="Experts">
				<h1 class="page-header">Experts Applications</h1>
				<%
					for(ProjExpCompleted relation : project.getExpertsCompleted()){
						ExpInfo exp = relation.getExp();
				%>
				<div class="border-section row">
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
				<form class="form-horizontal" action="#" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">Comments From Expert</label>
						<div class="col-sm-10">
							<textarea name="commentsFromExpert" class="form-control" rows="3" required><%= relation.getCommentsFromExp() %></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Rate</label>
						<div class="col-sm-10">
							<input name="title" value="<%= project.getTitle() %>" class="form-control" placeholder="Title" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Commit</button>
						</div>
					</div>
				</form>
				</div>
				<%
						}

				%>	
			</div>

		</div>
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>