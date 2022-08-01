<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">이벤트 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>번호</th>
                <th>이벤트</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>상태</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="dto" varStatus="status">
                <tr>
                    <td>${paging.offset + status.index}</td>
                    <td style="width: 350px">${dto.name}</td>
                    <td>${dto.startdate}</td>
                    <td>${dto.enddate}</td>
                    <td>${dto.state}</td>
                    <c:if test="${dto.state == '종료'}">
                        <td><input type="button" value="삭제" class="button gray" disabled></td>
                    </c:if>
                    <c:if test="${dto.state != '종료'}">
                        <td><input type="button" value="삭제" class="button beige" onclick="del('${dto.seq}')"></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/admin/eventlist?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/admin/eventlist?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/admin/eventlist?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/admin/eventlist?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/admin/eventlist?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/admin/eventlist?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/admin/eventlist?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/admin/eventlist?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
    <div id="menuadd"><input type="button" value="이벤트 등록" class="button beige" onclick="location.href='/sikdorock/admin/eventadd'"></div>
</section>

<script>
    function del(seq) {
        if (confirm('삭제 하시겠습니까?')) {
            location.href='/sikdorock/admin/eventdel?page=' + '${paging.page}' + '&seq=' + seq;
        }
    }

    $('#submenu ul li:nth-child(5) a').css({
        "color": "white"
    });

    $('#submenu ul li:nth-child(5)').css({
        "background-color" : "#795c3a"
    });
</script>
