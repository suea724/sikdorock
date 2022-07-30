<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">메뉴 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>메뉴</th>
                <th>상태</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="fdto" varStatus="status">
                <tr>
                    <td>${paging.offset + status.index}</td>
                    <td>${fdto.outDate}</td>
                    <td>${fdto.menuName}</td>
                    <td>${fdto.allergy}</td>
                    <c:if test="${fdto.allergy == '판매중'}">
                        <td><input type="button" value="삭제" class="button beige" onclick="del('${fdto.seq}')"></td>
                    </c:if>
                    <c:if test="${fdto.allergy == '판매완료'}">
                        <td><input type="button" value="삭제" class="button gray" disabled></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="/sikdorock/admin/menuList?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/admin/menuList?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/admin/menuList?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/admin/menuList?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/admin/menuList?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/admin/menuList?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/admin/menuList?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/admin/menuList?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
    <div id="menuadd"><input type="button" value="메뉴 등록" class="button beige" onclick="location.href='/sikdorock/admin/menuAdd'"></div>
</section>

<script>
    function del(seq) {
        if (confirm('삭제 하시겠습니까?')) {
            location.href='/sikdorock/admin/menuDel?page=' + '${paging.page}' + '&seq=' + seq;
        }
    }

    $('#submenu ul li:nth-child(3) a').css({
        "color": "black"
    });
</script>
