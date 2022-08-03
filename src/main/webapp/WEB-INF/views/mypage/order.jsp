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
        <div id="title">결제/구독 내역</div>
        <div id="subscribe-content">
            <div id="subscribes">
                <div class="subscribe">
                    <div>식도락과 든든하게 정기구독</div>
                    <div>기간 : 2022.08.01 ~ 2022.08.31</div>
                </div>
                <div class="subscribe-btns">
                    <div id="subscribe-change"><input type="button" value="결제방식 변경하기"></div>
                    <div id="subscribe-cancel"><input type="button" value="정기구독 해지하기"></div>
                </div>
            </div>
        </div>

        <div id="orders">
            <c:if test="${empty list}">
                <div>구매내역이 없습니다.</div>
            </c:if>

            <c:if test="${not empty list}">
            <c:forEach items="${list}" var="dto">
                <div class="order" onclick="location.href='/sikdorock/mypage/orderview?oseq=${dto.oseq}';">
                    <div class="order-food">${dto.menuname}</div>
                    <div class="order-date">${dto.regdate}</div>
                </div>
            </c:forEach>
            </c:if>
        </div>
    </div>
</section>
