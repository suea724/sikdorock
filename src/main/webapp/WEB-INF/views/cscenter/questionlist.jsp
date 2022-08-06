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
            <c:forEach items="${list}" var="dto" varStatus="status">
                <c:if test="${dto.answer == 'o'}">
                    <tr class="question" onclick="showAnswer(${dto.seq});">
                        <td>${paging.offset + status.index}</td>
                        <td>${dto.content}</td>
                        <td>${dto.regdate}</td>
                        <td>등록</td>
                    </tr>
                </c:if>
                <c:if test="${dto.answer == 'x'}">
                    <tr>
                        <td>${paging.offset + status.index}</td>
                        <td>${dto.content}</td>
                        <td>${dto.regdate}</td>
                        <td>미등록</td>
                    </tr>
                </c:if>
            </c:forEach>
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

    function showAnswer(seq) {
        window.open('/sikdorock/cscenter/showanswer?seq=' + seq, 'pop01' ,'width=700,height=700')
    }

    $('#cssubmenu div a:nth-child(2)').css({
        "color": "black",
        "font-weight": "bold"
    });

    $('#main-menu ul li:nth-child(4) a').css({
        "color": "#C69760",
    });

</script>
