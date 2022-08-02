<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">문의 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>내용</th>
                <th>아이디</th>
                <th style="width: 100px">답변 여부</th>
            </tr>
            <c:forEach items="${list}" var="qdto" varStatus="status">
                <c:if test="${qdto.answer == 'o'}">
                    <tr>
                        <td>${paging.offset + status.index}</td>
                        <td>${qdto.regdate}</td>
                        <td style="width: 350px">${qdto.content}</td>
                        <td>${qdto.id}</td>
                        <c:if test="${qdto.answer == 'x'}">
                            <td>미등록</td>
                        </c:if>
                        <c:if test="${qdto.answer == 'o'}">
                            <td>등록</td>
                        </c:if>
                    </tr>
                </c:if>
                <c:if test="${qdto.answer == 'x'}">
                    <tr class="question" onclick="location.href='/sikdorock/admin/questionview?seq=${qdto.seq}'">
                        <td>${paging.offset + status.index}</td>
                        <td>${qdto.regdate}</td>
                        <td>${qdto.content}</td>
                        <td>${qdto.id}</td>
                        <c:if test="${qdto.answer == 'x'}">
                            <td>미등록</td>
                        </c:if>
                        <c:if test="${qdto.answer == 'o'}">
                            <td>등록</td>
                        </c:if>
                    </tr>

                </c:if>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/admin/questionlist?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/admin/questionlist?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/admin/questionlist?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/admin/questionlist?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/admin/questionlist?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/admin/questionlist?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/admin/questionlist?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/admin/questionlist?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
</section>

<script>

    $('#submenu ul li:nth-child(4) a').css({
        "color": "white"
    });

    $('#submenu ul li:nth-child(4)').css({
        "background-color" : "#795c3a"
    });
</script>
