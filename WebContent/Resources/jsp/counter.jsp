<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counter</title>
</head>
<body>
	<h1>Scopes</h1>
	
	<%
		// tweede mogelijke oplossing, met PageContext.PAGE_SCOPE/.REQUEST_SCOPE/.SESSION_SCOPE/.APPLICATION_SCOPE
		Integer pageCounter = (Integer) pageContext.getAttribute("pageCounter", PageContext.PAGE_SCOPE);
		if (pageCounter == null || pageCounter == 0) {
			pageCounter = 1;
		} else {
			pageCounter += 1;
		}
		pageContext.setAttribute("pageCounter", pageCounter, PageContext.PAGE_SCOPE);

		Integer requestCounter = (Integer) pageContext.getAttribute("requestCounter", PageContext.REQUEST_SCOPE);
		if (requestCounter == null || requestCounter == 0) {
			requestCounter = 1;
		} else {
			requestCounter += 1;
		}
		pageContext.setAttribute("requestCounter", requestCounter, PageContext.REQUEST_SCOPE);

		Integer sessionCounter = (Integer) pageContext.getAttribute("sessionCounter", PageContext.SESSION_SCOPE);
		if (sessionCounter == null || sessionCounter == 0) {
			sessionCounter = 1;
		} else {
			sessionCounter += 1;
		}
		pageContext.setAttribute("sessionCounter",	sessionCounter, PageContext.SESSION_SCOPE);

		Integer applicationCounter = (Integer) pageContext.getAttribute("applicationCounter", PageContext.APPLICATION_SCOPE);
		if (applicationCounter == null || applicationCounter == 0) {
			applicationCounter = 1;
		} else {
			applicationCounter += 1;
		}
		pageContext.setAttribute("applicationCounter", applicationCounter, PageContext.APPLICATION_SCOPE);
	%>
	
	<table>
		<tr>
			<td>Page:</td>
			<td><%=pageCounter%></td>
		</tr>
		<tr>
			<td>Request:</td>
			<td><%=requestCounter%></td>
		</tr>
		<tr>
			<td>Session:</td>
			<td><%=sessionCounter%></td>
		</tr>
		<tr>
			<td>Application</td>
			<td><%=applicationCounter%></td>
		</tr>
	</table>
</body>
</html>