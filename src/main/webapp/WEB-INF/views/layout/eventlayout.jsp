<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락</title>
    <tiles:insertAttribute name="asset"/>
    <link rel="stylesheet" href="/sikdorock/resources/css/event.css">
    <link rel="stylesheet" href="/sikdorock/resources/css/button.css">
</head>
<body>
    <main>
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="section"/>
        <tiles:insertAttribute name="footer"/>
    </main>
</body>
</html>
