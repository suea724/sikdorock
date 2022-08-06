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
                    end: '${dto.outdate}',
                    url: '/sikdorock/menu/view?seq=${dto.seq}'
                },
                </c:forEach>

            ]
        });

        calendar.render();

        $('.fc-next-button').on('click', function () {
            let month = Number($('input[name=month]').val());
            $('input[name=month]').val(month + 1);

            location.href='/sikdorock/menu/menuli?month=' + $('input[name=month]').val()
        });

        $('.fc-prev-button').on('click', function () {
            let month = Number($('input[name=month]').val());
            $('input[name=month]').val(month - 1);

            location.href='/sikdorock/menu/menuli?month=' + $('input[name=month]').val()
        });

        $('.fc-today-button').on('click', function () {

            location.href='/sikdorock/menu/menuli';
        });



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
    <input name="month" type="hidden" value="${month}">

    <div id="btndiv"><input type="button" class="btn btn-warning" id="subscribe" value="구독하기" onclick="location.href='/'"></div>

    <div id="menubox">
        <div id="menus">
            <c:forEach items="${list}" var="dto">              
                <div class="menu" onClick="location.href='/sikdorock/menu/view?seq=${dto.seq}'">
                    <div class="menu-img" style="background-image: url('/sikdorock/resources/files/${dto.image}');"></div>
                    <div class="menu-name">${dto.menuname}</div>
                    <div class="menu-price">${price}</div>
                    <div class="menu-date">${dto.outdate}</div>
                </div>
            </c:forEach>
        </div>
    </div>


</section>

<script>
    $('#main-menu ul li:nth-child(2) a').css({
        "color": "#C69760",
    });
</script>
