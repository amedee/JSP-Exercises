<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="background" class="beans.RandomColorBean" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Color Me</title>
</head>
<style>
body {
	background-color: rgb(
		<jsp:getProperty name="background" property="red" />,
		<jsp:getProperty name="background" property="green" />,
		<jsp:getProperty name="background" property="blue" />);
}
</style>
<body>
	<h1>
		Random background color =
		<jsp:getProperty name="background" property="colorName" /></h1>
</body>
</html>