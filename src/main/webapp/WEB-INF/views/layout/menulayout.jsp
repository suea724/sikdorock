<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락</title>
    <tiles:insertAttribute name="asset"/>
    <link rel="stylesheet" href="/sikdorock/resources/css/menu.css">
    <script src='/sikdorock/resources/lib/main.js'></script>
    <link href='/sikdorock/resources/lib/main.css' rel='stylesheet' />

<%--    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js"></script>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css" rel="stylesheet">--%>
</head>
<body>
<main>
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="section"/>
    <tiles:insertAttribute name="footer"/>
</main>
</body>
</html>
