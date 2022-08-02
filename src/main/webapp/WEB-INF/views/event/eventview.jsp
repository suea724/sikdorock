<%--
  Created by IntelliJ IDEA.
  User: jiyoon
  Date: 2022-08-01
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>

    <div class="eventList">
        <h3>이벤트 상세보기</h3>
        <br>

            <div class="banner-view" onclick="location.href='/sikdorock/event/eventview?seq=${dto.seq}'" style="cursor: pointer;">
                <img src="/sikdorock/resources/images/${dto.name}.png" class="img-view">
            </div>
            <div class="eventinfo">${dto.eventInfo}</div>

    </div>

</section>
