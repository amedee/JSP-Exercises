<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.Random"%>
<%@page import="java.awt.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Color My Color</title>
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
	int randomIndex;
	randomIndex = new Random().nextInt(colorList.size());
	Color randomForegroundColor = colorList.get(randomIndex);
	randomIndex = new Random().nextInt(colorList.size());
	Color randomBackgroundColor = colorList.get(randomIndex);
%>
<body>
	<form method="post">
		Background : <input type=radio name=bckgrnd value="Red" checked>Red
		- <input type=radio name=bckgrnd value="Blue">Blue - <input
			type=radio name=bckgrnd value="Green">Green<br /> FontColor :
		<input type=radio name=font value="White" checked>White - <input
			type=radio name=font value="Yellow">Yellow - <input
			type=radio name=font value="Pink">Pink<br /> <input
			type=submit value="Color Me">
	</form>
</body>
</html>