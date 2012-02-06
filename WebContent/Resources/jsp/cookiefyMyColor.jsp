<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%-- Same ColorBean as in colorMe.jsp --%>
<jsp:useBean id="background" class="beans.ColorBean" scope="session" />
<jsp:useBean id="foreground" class="beans.ColorBean" scope="session" />
<jsp:setProperty name="background" property="colorByName"
	param="bckgrnd" />
<jsp:setProperty name="foreground" property="colorByName" param="font" />
<%!/** this function converts an array of cookies into a hashtable */
	Hashtable<String, String> cookieTable(Cookie[] cookies) {
		Hashtable<String, String> cookieTable = new Hashtable<String, String>();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++)
				cookieTable.put(cookies[i].getName(), cookies[i].getValue());
		}
		return cookieTable;
	}%>

<%
	Cookie myCookie;
	String bckgrnd = new String();
	String font = new String();
	Hashtable<String, String> cookies = cookieTable(request
			.getCookies());

	if (cookies.containsKey("bckgrnd")) {
		bckgrnd = (String) cookies.get("bckgrnd");
		background.setColorByName(bckgrnd);
	}
	if (cookies.containsKey("font")) {
		font = (String) cookies.get("font");
		foreground.setColorByName(font);
	}
	

%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cookiefy My Color</title>
<style>
body {
	background-color: rgb(
		<jsp:getProperty name="background" property="red"   />,
		<jsp:getProperty name="background" property="green" />,
		<jsp:getProperty name="background" property="blue"  />);
	color: rgb(
		<jsp:getProperty name="foreground" property="red"   />,
		<jsp:getProperty name="foreground" property="green" />,
		<jsp:getProperty name="foreground" property="blue"  />);
}
</style>
</head>
<body>
	<p>
		Chosen background:
		<jsp:getProperty name="background" property="colorByName" /><br>
		Chosen fontcolor:
		<jsp:getProperty name="foreground" property="colorByName" /><br>
	</p>
	<form method="post">
		Background: 
		<input type="radio" name="bckgrnd" value="Red" checked>Red
		- 
		<input type="radio" name="bckgrnd" value="Blue">Blue
		- 
		<input type="radio" name="bckgrnd" value="Green">Green<br />
		Fontcolor: 
		<input type="radio" name="font" value="White" checked>White
		- 
		<input type="radio" name="font" value="Yellow">Yellow 
		- 
		<inputtype="radio" name="font" value="Pink">Pink<br /> 
		<input type="submit" value="Color Me"> 
		<input type="submit" value="Save Prefs">
	</form>
</body>
</html>