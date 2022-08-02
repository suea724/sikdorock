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



    <div class="events">
        <h3>이벤트</h3>
        <br>
        <div id="eventlistbox">
            <c:forEach items="${list}" var="dto" varStatus="status">
                <div id="banner${status.index}" class="banner" onclick="location.href='/sikdorock/event/eventview?seq=${dto.seq}'" style="cursor: pointer;">

                    <img src="/sikdorock/resources/images/${dto.name}.png" class="img">
                    <img src="/sikdorock/resources/images/${dto.name}2.png" class="img">

                </div>
            </c:forEach>
        </div>
    </div>


</section>

<script>

    function rotateBanners(elem) {
        var active = $(elem+" img.active");
        var next = active.next();
        if (next.length == 0)
            next = $(elem+" img:first");
        active.removeClass("active").fadeOut(100);
        next.addClass("active").fadeIn(100);
    }

    function prepareRotator(elem) {
        $(elem+" img").fadeOut(0);
        $(elem+" img:first").fadeIn(0).addClass("active");
    }

    function startRotator(elem) {
        prepareRotator(elem);
        setInterval("rotateBanners('"+elem+"')", 2500);
    }

    //페이지 로드 되면서 실행
    window.onload = function() {
        <c:forEach items="${list}" var="dto" varStatus="status">
            startRotator("#banner${status.index}");
        </c:forEach>
    }

</script>



