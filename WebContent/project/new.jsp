<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.expertscan.data.EntInfo"%>
    
<%
	EntInfo enterprise = (EntInfo)request.getSession().getAttribute("userInfo");
	String baseURL = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="login page">
		
		<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/bootstrap.min.css">
		
		<script type="text/javascript" src="<%=baseURL %>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=baseURL %>/js/bootstrap.min.js"></script>

		<title>专家汇平台</title>
	</head>
	<body>
		<jsp:include page="../master_nav.jsp" />
		
		<div class="container">
		<div class="page-header">
			<h1>New a Project</h1>
		</div>
			
			<div class="bs-docs-section">
				
				<form class="form-horizontal" action="<%=baseURL %>/project/new.action" method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label">Title</label>
							<div class="col-sm-9">
								<input name="title" class="form-control" placeholder="Title" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Description</label>
							<div class="col-sm-9">
								<textarea name="description" class="form-control" rows="3" placeholder="Description" required></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Expense</label>
							<div class="col-sm-9">
								<input name="expense" class="form-control" placeholder="Expense">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Enterprise</label>
							<div class="col-sm-9">
								<p class="form-control-static"><%= enterprise.getName() %></p>
							</div>
						</div>
						<div class="form-group"  style="color:white">
							<label class="col-sm-3 control-label">Enterprise ID</label>
							<div class="col-sm-9">
								<input type="hidden" name="entid" value="<%= enterprise.getEntid() %>">
								<p class="form-control-static"><%= enterprise.getEntid() %></p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-warning">New it!</button>
							</div>
						</div>
				</form>
			</div>
		</div>
		
		<jsp:include page="../master_footer.jsp" />
	</body>
</html>