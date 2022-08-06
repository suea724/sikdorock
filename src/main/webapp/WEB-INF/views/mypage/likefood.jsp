<%--
  Created by IntelliJ IDEA.
  User: ioiju
  Date: 2022-08-01
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div id="myinfo-content">
        <div id="likefood-sub">
            <div id="title">찜목록</div>
        </div>

        <div id="likefoods">
            <c:if test="${not empty list}">
                <c:forEach items="${list}" var="dto">
                <div class="likefood" >
                    <div class="likefood-img" style="background-image: url('/sikdorock/resources/files/${dto.filename}');" onclick="location.href='/sikdorock/menu/view?seq=${dto.fseq}';"></div>
                    <div class="likefood-btn" onclick="delLikeFood(${dto.fseq})"><i class="fa-solid fa-heart"></i></div>
                    <div class="likefood-name">${dto.menuname}</div>
                    <div class="likefood-price">7,500</div>
                </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty list}">
                <div style="margin:0 auto;">찜목록이 비었습니다.</div>
            </c:if>
        </div>

        <div class="page">
            <ul class="pagination mode">
                <li> <a href="/sikdorock/mypage/likefood?page=1" class="first">처음 페이지</a></li>
                <c:if test="${paging.page > 1}">
                    <li> <a href="/sikdorock/mypage/likefood?page=${paging.page-1}" class="arrow left"><<</a></li>
                </c:if>
                <c:if test="${paging.page == 1}">
                    <li> <a href="/sikdorock/mypage/likefood?page=1" class="arrow left"><<</a></li>
                </c:if>
                <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                    <c:if test="${paging.page == i}">
                        <li> <a href="/sikdorock/mypage/likefood?page=${i}" class="active num">${i}</a></li>
                    </c:if>
                    <c:if test="${paging.page != i}">
                        <li> <a href="/sikdorock/mypage/likefood?page=${i}" class="num">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${paging.page < paging.totalPage}">
                    <li> <a href="/sikdorock/mypage/likefood?page=${paging.page+1}" class="arrow right">>></a></li>
                </c:if>
                <c:if test="${paging.page == paging.totalPage}">
                    <li> <a href="/sikdorock/mypage/likefood?page=${paging.totalPage}" class="arrow right">>></a></li>
                </c:if>
                <li><a href="/sikdorock/mypage/likefood?page=${paging.totalPage}" class="last">끝 페이지</a></li>
            </ul>
        </div>

    </div>
</section>

<script>
    function delLikeFood(fseq) {
        const temp = $(event.target);
        $.ajax({
            type: 'POST',
            url: '/sikdorock/mypage/dellikefood',
            data: 'fseq=' + fseq,
            dataType: 'json',
            success: function(result) {
                temp.parent().parent().remove();
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
        });
    }
</script>