<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락 관리자</title>
    <tiles:insertAttribute name="asset"/>
</head>
<body>
<main>
    <div>
        <tiles:insertAttribute name="adminsubmenu"/>
        <tiles:insertAttribute name="content"/>
    </div>
</main>
</body>
</html>
