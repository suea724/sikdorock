<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락</title>
    <tiles:insertAttribute name="asset"/>
    <link rel="stylesheet" href="/sikdorock/resources/css/user.css">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <main>
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="section"/>
        <tiles:insertAttribute name="footer"/>
    </main>
</body>
</html>
