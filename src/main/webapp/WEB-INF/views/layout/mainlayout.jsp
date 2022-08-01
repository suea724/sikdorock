<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락</title>
    <tiles:insertAttribute name="asset"/>
    <!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link rel="stylesheet" href="/sikdorock/resources/css/mainlayout.css">
</head>
<body>
    <main>
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="section"/>
        <tiles:insertAttribute name="footer"/>
    </main>
</body>
</html>
