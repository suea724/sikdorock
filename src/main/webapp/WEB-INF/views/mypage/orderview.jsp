<%--
  Created by IntelliJ IDEA.
  User: ioiju
  Date: 2022-08-03
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div id="myinfo-content">
        <div id="title">구매내역</div>
        <div id="buy">
            <div class="buy-food">
                <div id="order-date">구매일자 : ${list[0].regdate}</div>
                <table class="table table-bordered">
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                    </tr>
                    <c:forEach items="${list}" var="dto">
                        <tr>
                            <td>${dto.menuname}</td>
                            <td>${dto.count}개</td>
                        </tr>
                    </c:forEach>
                </table>
                <div id="order-btn"><input type="button" value="취소하기" onclick="cancelOrder(${list[0].oseq});"></div>
            </div>
        </div>
    </div>
</section>

<script>
    function cancelOrder(oseq) {
        if(confirm('주문을 취소하시겠습니까?')) {
            //주문 취소 하기
            $.ajax({
                type: 'POST',
                url: '/sikdorock/mypage/cancelorder',
                data: 'oseq=' + oseq,
                dataType: 'json',
                success: function(result) {
                    if(result.result != 0) {
                        alert('취소가 완료되었습니다.');
                        location.href='/sikdorock/mypage/order';
                    }
                },
                error: function(a, b, c) {
                    console.log(a, b, c);
                }
            });
        }

    }
</script>
