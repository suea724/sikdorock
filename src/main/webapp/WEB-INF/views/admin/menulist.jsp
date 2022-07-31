<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">메뉴 관리</div>
    <div id="userList">
        <div class="price">구독 가격 : ${pdto.subPrice}</div>
        <div class="price">개별 가격 : ${pdto.indPrice}</div>
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
                    <td style="width: 300px">${fdto.menuName}</td>
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
            <li> <a href="/sikdorock/admin/menulist?page=1" class="first">처음 페이지</a></li>
            <c:if test="${paging.page > 1}">
                <li> <a href="/sikdorock/admin/menulist?page=${paging.page-1}" class="arrow left"><<</a></li>
            </c:if>
            <c:if test="${paging.page == 1}">
                <li> <a href="/sikdorock/admin/menulist?page=1" class="arrow left"><<</a></li>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                <c:if test="${paging.page == i}">
                    <li> <a href="/sikdorock/admin/menulist?page=${i}" class="active num">${i}</a></li>
                </c:if>
                <c:if test="${paging.page != i}">
                    <li> <a href="/sikdorock/admin/menulist?page=${i}" class="num">${i}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${paging.page < paging.totalPage}">
                <li> <a href="/sikdorock/admin/menulist?page=${paging.page+1}" class="arrow right">>></a></li>
            </c:if>
            <c:if test="${paging.page == paging.totalPage}">
                <li> <a href="/sikdorock/admin/menulist?page=${paging.totalPage}" class="arrow right">>></a></li>
            </c:if>
            <li><a href="/sikdorock/admin/menulist?page=${paging.totalPage}" class="last">끝 페이지</a></li>
        </ul>
    </div>
    <div id="menuadd">
        <input type="button" value="가격 변경" class="button beige" style="margin-right: 10px" onclick="showPrice()">
        <input type="button" value="메뉴 등록" class="button beige" onclick="location.href='/sikdorock/admin/menuadd'">
    </div>
</section>

<script>

    function showPrice() {
        window.open('/sikdorock/admin/priceupdate', 'pop01' ,'width=200,height=200')
    }

    function del(seq) {
        if (confirm('삭제 하시겠습니까?')) {
            location.href='/sikdorock/admin/menudel?page=' + '${paging.page}' + '&seq=' + seq;
        }
    }

    $('#submenu ul li:nth-child(3) a').css({
        "color": "white"
    });

    $('#submenu ul li:nth-child(3)').css({
        "background-color" : "#795c3a"
    });
</script>
