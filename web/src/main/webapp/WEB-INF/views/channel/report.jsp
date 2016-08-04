
<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="class1" value="class='warning'" />
<c:set var="class2" value="class='info'" />
<c:set var="class3" value="class='danger'" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${channel.name},数据统计</title>
<link REL="SHORTCUT ICON" href="/static/images/favicon.ico">
<link rel="stylesheet" href="/static/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script src="/static/jquery/1.10.2/jquery.min.js"></script>
<script src="/static/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style>
body {
	margin: 0;
	font-family: Verdana, "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 10px;
	line-height: 12px;
	color: #333333;
	text-align: center;
	background-color: #ffffff;
}

td {
	text-align: left;
	font-size: 9px;
	margin: 10px;
}

th {
	text-align: left;
	font-size: 10px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default lead" role="navigation">
		<div class="navbar-header">
			<label class="btn btn-warning  btn-lg">${channel.name},数据统计</label>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<a href="${logout}">退出</a><br/>
		 </div>
	</nav>
	<table class="table table-hover table-bordered table-condensed" style="font-size: 11px;">
		<thead>
			<tr>
				<th>日期</th>
				<th>激活数</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item"  varStatus="status">
				<c:if test="${status.index%2==0}">
					<c:set var="thClass" value="${class1}" />
				</c:if>
				<c:if test="${status.index%2==1}">
					<c:set var="thClass" value="${class2}" />
				</c:if>			
				<tr>
					<td ${thClass} width="100">${item.statDate}</td>
					<td ${thClass}>${item.activateCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>