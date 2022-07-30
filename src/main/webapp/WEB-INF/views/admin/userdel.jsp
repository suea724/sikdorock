<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    <c:if test="${result == 1}">
        location.href = "/sikdorock/admin/userList";
    </c:if>

    <c:if test="${result == 0}">
        alert('failed');
        history.back();
    </c:if>
</script>
