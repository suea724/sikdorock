<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>


    /* 페이징 */
    .page{
        text-align: center;
    }

    .pagination {
        list-style: none;
        display: inline-block;
        padding: 0;
        margin-top: 20px;}

    .pagination li {
        display: inline;
        text-align: center;
    }
    .pagination a {
        float: left;
        display: block;
        font-size: 14px;
        text-decoration: none;
        padding: 5px 12px;
        color: #96a0ad;
        line-height: 1.5;}

    .first{
        margin-right: 15px;}

    .last{
        margin-left: 15px;}

    .first:hover, .last:hover, .left:hover, .right:hover{
        color: #C69760;}

    .pagination a.active {
        cursor: default;
        color: #ffffff;}

    .pagination a:active {
        outline: none;}

    .mode .num {
        margin-left: 3px;
        padding: 0;
        width: 30px;
        height: 30px;
        line-height: 30px;
    }

    .mode .num:hover {
        background-color: #C69760;
        color: #ffffff;}

    .mode .num.active, .mode .num:active {
        background-color: #C69760;
        cursor: pointer;}

    .arrow-left {
        width: 0;
        height: 0;
        border-top: 10px solid transparent;
        border-bottom: 10px solid transparent;
        border-right:10px solid blue; }
</style>
<section>


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