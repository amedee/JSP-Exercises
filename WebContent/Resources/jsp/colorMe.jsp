<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.Random"%>
<%@page import="java.awt.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Color Me</title>
</head>
<%
	Random randomGenerator = new Random();

	Map<Color, String> colorMap = new HashMap<Color, String>();
	// populate the hashmap with the colors defined in the Color class
	for (Field f : Color.class.getFields()) {
		if (f.getType() == Color.class) {
			Color c = (Color) f.get(null);
			colorMap.put(c, f.getName());
		}
	}

	List<Color> colorList = new ArrayList<Color>(colorMap.keySet());
	int randomIndex = new Random().nextInt(colorList.size());
	Color randomColor = colorList.get(randomIndex);
%>
<style>
body {
	background-color: rgb(<%=randomColor.getRed()%>,<%=randomColor.getGreen()%>,<%=randomColor.getBlue()%>);
}
</style>
<body>
	<h1>
		Random background color =
		<%=colorMap.get(randomColor).toLowerCase()%></h1>
</body>
</html>