<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'today'
            },
            initialDate: '${today}',
            navLinks: true, // can click day/week names to navigate views
            selectable: true,
            selectMirror: true,
            select: function(arg) {
                /* var title = prompt('일정 추가');
                if (title) {
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                  })
                } */
                calendar.unselect()
            },
            eventClick: function(arg) {
                /*if (confirm('정말 삭제하시겠습니까?')) {
                    //alert(arg.event);
                    arg.event.remove()
                }*/
            },
            editable: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: [
                <c:forEach items="${list}" var="dto">
                {
                    color: '#C69760',
                    title: '${dto.menuname}',
                    start: '${dto.outdate}',
                    end: '${dto.outdate}'
                },
                </c:forEach>

            ]
        });

        calendar.render();
    });
</script>
<style>
    #fc-dom-1 {
        font-weight: bold;
    }

    .fc-scrollgrid-sync-inner > .fc-col-header-cell-cushion {
        text-decoration-line: none;
        color: black;
    }

    .fc-daygrid-day-top > .fc-daygrid-day-number {
        text-decoration-line: none;
        color: black;
    }

    .fc-event-title.fc-sticky {
        font-weight: bold;
    }

</style>
<section>

    <div id='content' style='padding-top: 20px; width: 1000px; margin: 10px auto;'>
        <div id='calendar' style="background-color: white; padding: 5px;"></div>
    </div>

    <div id="btndiv"><input type="button" class="btn btn-warning" id="subscribe" value="구독하기" onclick="location.href='/'"></div>

    <div id="menubox">
        <div id="menus">
            <c:forEach items="${list}" var="dto">
                <div class="menu" onClick="location.href='/'">
                    <div class="menu-img" style="background-image: url('/sikdorock/resources/files/${dto.image}');"></div>
                    <div class="menu-name">${dto.menuname}</div>
                    <div class="menu-price">7,500</div>
                    <div class="menu-date">${dto.outdate}</div>
                </div>
            </c:forEach>
        </div>
    </div>



<%--    <div class="page">--%>
<%--        <ul class="pagination mode">--%>
<%--            <li> <a href="/sikdorock/menu/menuli?page=1" class="first">처음 페이지</a></li>--%>
<%--            <c:if test="${paging.page > 1}">--%>
<%--                <li> <a href="/sikdorock/menu/menuli?page=${paging.page-1}" class="arrow left"><<</a></li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${paging.page == 1}">--%>
<%--                <li> <a href="/sikdorock/menu/menuli?page=1" class="arrow left"><<</a></li>--%>
<%--            </c:if>--%>
<%--            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">--%>
<%--                <c:if test="${paging.page == i}">--%>
<%--                    <li> <a href="/sikdorock/menu/menuli?page=${i}" class="active num">${i}</a></li>--%>
<%--                </c:if>--%>
<%--                <c:if test="${paging.page != i}">--%>
<%--                    <li> <a href="/sikdorock/menu/menuli?page=${i}" class="num">${i}</a></li>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--            <c:if test="${paging.page < paging.totalPage}">--%>
<%--                <li> <a href="/sikdorock/menu/menuli?page=${paging.page+1}" class="arrow right">>></a></li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${paging.page == paging.totalPage}">--%>
<%--                <li> <a href="/sikdorock/menu/menuli?page=${paging.totalPage}" class="arrow right">>></a></li>--%>
<%--            </c:if>--%>
<%--            <li><a href="/sikdorock/menu/menuli?page=${paging.totalPage}" class="last">끝 페이지</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
</section>