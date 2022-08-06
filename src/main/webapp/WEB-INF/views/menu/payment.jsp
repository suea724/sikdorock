<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #payBox {
        width: 1000px;
    }

</style>
<%--model.addAttribute("cartli", cartli);--%>
<%--model.addAttribute("udto", udto);--%>
<%--model.addAttribute("couponli", couponli);--%>
<section>
    <form method="get" action="/">
    <div id="payBox">
        <h2>배송지</h2>
        <h4>${udto.name}</h4>
        <div>${udto.tel}</div>
        <div><span>${udto.address}<span><a>배송지 변경</a></span></div>

        <hr>

        <c:forEach items="${cartli}" var="cdto">
            <div id='CartBox'>
                <table>
                    <tr>
                        <td><img src="/sikdorock/resources/files/${cdto.image}"></td>
                        <td style="width: 250px;">
                            <div>${cdto.menuname}</div>
                            <div>${price}</div>
                        </td>
                        <td>
                            수량 ${cdto.count}개
                            <input type="hidden" name="menucount" value="${cdto.count}">
                            <input type="hidden" name="menuseq" value="${cdto.seq}">
                        </td>
                </table>
            </div>
        </c:forEach>

        <hr>

        <h4>쿠폰 할인</h4>
        <c:if test="${empty couponli}">
            <select class="form-control" disabled>
                <option disabled selected>======선택 불가======</option>
            </select>
        </c:if>
        <c:if test="${not empty couponli}">
        <select name="selcoupon" class="form-control" onchange="disprice(this)">
            <option value="" disabled selected>=======선택=======</option>
            <c:forEach items="${couponli}" var="coudto">
                <option value="${coudto.seq}" data-discount="${coudto.discount}">${coudto.name}</option>
            </c:forEach>
        </select>
        </c:if>

        <hr>

        <h4>최종 결제 금액</h4>
        <div><span>상품 금액: </span><span>${sump}원</span></div>
        <div><span>할인 금액: </span><span id="dp">원</span></div>
        <div><span>최종 금액: </span><span id="lastp">원</span></div>

        <div><input type="submit" value="결제하기" class="btn btn-success"></div>

    </div>
    </form>


</section>
<script>
    function disprice(e) {
        // 선택된 데이터 가져오기
        let value = ${price} / Number(e.datasets['discount']);

        // 데이터 출력
        document.getElementById('dp').innerHTML = value;
    }

</script>
