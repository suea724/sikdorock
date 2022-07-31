<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div class="title">
        <span>고객 센터</span>
    </div>
    <div class="title" id="cssubmenu">
        <div>
            <a href="/sikdorock/cscenter/questionadd">문의하기</a>
            <a href="/sikdorock/cscenter/questionlist">내 문의내역</a>
        </div>
        <span style="font-size: 1rem">고객센터 Tel <br>02.1234.5678</span>
    </div>
    <div id="tableDiv">
        <table class="table">
            <tr>
                <th>번호</th>
                <th style="width: 400px">내용</th>
                <th>날짜</th>
                <th>답변여부</th>
            </tr>
            <c:forEach items="${list}" var="dto">
                <tr>

                </tr>
            </c:forEach>
            <tr>

            </tr>
            <tr>
                <td>A:</td>
                <td colspan="2">해결했어요</td>
                <td>2022-07-20</td>
            </tr>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/cscenter/questionlist?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/cscenter/questionlist?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/cscenter/questionlist?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/cscenter/questionlist?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/cscenter/questionlist?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/cscenter/questionlist?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/cscenter/questionlist?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/cscenter/questionlist?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
</section>

<script>
    $('#cssubmenu div a:nth-child(2)').css({
        "color": "black",
        "font-weight": "bold"
    });

</script>
