<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">회원 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>아이디</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="dto" varStatus="status">
                <tr>
                    <td>${paging.offset + status.index}</td>
                    <td>${dto.name}</td>
                    <td>${dto.id}</td>
                    <td><input type="button" onclick="del('${dto.id}');" value="추방" class="button beige"></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/admin/userList?page=1&word=${word}" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/admin/userList?page=${paging.page-1}&word=${word}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/admin/userList?page=1&word=${word}" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/admin/userList?page=${i}&word=${word}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/admin/userList?page=${i}&word=${word}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/admin/userList?page=${paging.page+1}&word=${word}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/admin/userList?page=${paging.totalPage}&word=${word}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/admin/userList?page=${paging.totalPage}&word=${word}" class="last">끝 페이지</a></li>
        </ul>
    </div>
    <div id="search">
        <form action="/sikdorock/admin/userList">
            <input type="text" name="word" class="form-control" placeholder="ID를 입력하세요." value="">
            <input type="submit" value="검색하기" class="button beige">
        </form>
    </div>
</section>

<script>
    $('input[name=word]').attr('value','${word}');

    function del(id) {
        if (confirm('추방시키겠습니까?')) {
            location.href='/sikdorock/admin/userDel?page=' + '${paging.page}' + '&id=' + id + '&word=' + '${word}';
        }
    }
</script>