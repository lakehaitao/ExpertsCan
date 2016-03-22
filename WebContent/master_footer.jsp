<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String baseURL = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=baseURL %>/css/sticky-footer.css">

<footer class="footer">
	<div class="container">
		<ul class="nav navbar-nav">
			<li><a href="#">公司介绍</a></li>
			<li><a href="#">联系方式</a></li>
			<li><a href="#">成功案例</a></li>
			<li><a href="#">隐私保护</a></li>
			<li><a href="#">信息和资源</a></li>
			<li class="dropup">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">社交媒体<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">微信</a></li>
					<li><a href="#">FaceBook</a></li>
					<li><a href="#">Twitter</a></li>
				</ul>
			</li>
		</ul>
	</div>
</footer>