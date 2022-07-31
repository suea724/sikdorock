<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락 관리자</title>
    <tiles:insertAttribute name="asset"/>
    <link rel="stylesheet" href="/sikdorock/resources/css/admin.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
