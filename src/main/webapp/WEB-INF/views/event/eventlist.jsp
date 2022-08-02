<%--
  Created by IntelliJ IDEA.
  User: jiyoon
  Date: 2022-08-01
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>



    <div class="eventList">
        <h3>이벤트</h3>
        <br>
        <c:forEach items="${list}" var="dto">
        <div class="banner" onclick="location.href='/sikdorock/event/eventview?seq=${dto.seq}'" style="cursor: pointer;">
                <img src="/sikdorock/resources/images/${dto.name}.png" class="img">
        </div>
        </c:forEach>
    </div>


</section>





