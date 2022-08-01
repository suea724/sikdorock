<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section>

    <div id="likefoods">
        <c:forEach items="${list}" var="dto">
            <div class="likefood">
                <div class="likefood-img" style="background-image: url('/sikdorock/resources/files/${dto.filename}');"></div>
                <div class="likefood-btn" onclick="delLikeFood(${dto.fseq})"><i class="fa-solid fa-heart"></i></div>
                <div class="likefood-name">${dto.menuname}</div>
                <div class="likefood-price">7,500</div>
            </div>
        </c:forEach>
    </div>


    <div id="title">메뉴 관리</div>
    <div id="userList">
        <table class="table">
            <c:forEach items="${list}" var="fdto">
                <tr>
                    <td>${fdto.seq}</td>
                    <td>${fdto.outdate}</td>
                    <td>${fdto.menuname}</td>
                    <td>${fdto.allergy}</td>
                    <td><img src="/sikdorock/resources/files/${fdto.image}"></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/menu/menuli?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/menu/menuli?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/menu/menuli?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/menu/menuli?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/menu/menuli?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/menu/menuli?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/menu/menuli?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/menu/menuli?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
</section>