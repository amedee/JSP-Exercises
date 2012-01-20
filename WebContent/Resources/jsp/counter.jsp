<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pageCounter" class="beans.AccessCountBean" scope="page"></jsp:useBean>
<jsp:useBean id="requestCounter" class="beans.AccessCountBean" scope="request"></jsp:useBean>
<jsp:useBean id="sessionCounter" class="beans.AccessCountBean" scope="session"></jsp:useBean>
<jsp:useBean id="applicationCounter" class="beans.AccessCountBean" scope="application"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counter</title>
</head>
<body>
	<h1>Scopes</h1>
	<table>
		<tr>
			<td>Page:</td>
			<td><jsp:getProperty name="pageCounter" property="accessCount" />
				<%
					pageCounter.incrementAccessCount();
				%></td>
		</tr>
		<tr>
			<td>Request:</td>
			<td><jsp:getProperty name="requestCounter" property="accessCount" />
			<%
 				requestCounter.incrementAccessCount();
 			%></td>
		</tr>
		<tr>
			<td>Session:</td>
			<td><jsp:getProperty name="sessionCounter" property="accessCount" />
			<%
 				sessionCounter.incrementAccessCount();
 			%></td>
		</tr>
		<tr>
			<td>Application:</td>
			<td><jsp:getProperty name="applicationCounter" property="accessCount" />
			<%
 				applicationCounter.incrementAccessCount();
 			%></td>
		</tr>
	</table>
</body>
</html>