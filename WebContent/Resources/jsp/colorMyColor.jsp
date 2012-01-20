<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="background" class="beans.ColorBean" scope="session" />
<jsp:useBean id="foreground" class="beans.ColorBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Color My Color</title>
<style>
body {
	background-color: rgb(
		<jsp:getProperty name="background" property="red" />,
		<jsp:getProperty name="background" property="green" />,
		<jsp:getProperty name="background" property="blue" />);
	color: rgb(
		<jsp:getProperty name="foreground" property="red" />,
		<jsp:getProperty name="foreground" property="green" />,
		<jsp:getProperty name="foreground" property="blue" />);
}
</style>
</head>
<body>

<p>
Chosen background: <jsp:getProperty name="background" property="colorByName" /><br>
Chosen fontcolor: <jsp:getProperty name="foreground" property="colorByName" /><br>
</p>

	<form method="post">
		Background: 
			<input type="radio" name="bckgrnd" value="Red" checked>Red - 
			<input type="radio" name="bckgrnd" value="Blue">Blue - 
			<input type="radio" name="bckgrnd" value="Green">Green<br />
		Fontcolor: 
			<input type="radio" name="font" value="White" checked>White - 
			<input type="radio" name="font" value="Yellow">Yellow - 
			<input type="radio" name="font" value="Pink">Pink<br /> 
		<input type="submit" value="Color Me">
	</form>
</body>
</html>