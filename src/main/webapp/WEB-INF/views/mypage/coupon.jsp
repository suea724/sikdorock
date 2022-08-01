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
        <div id="title">내 쿠폰함</div>
        <div id="coupons">
            <c:if test="${not empty list}">
                <c:forEach items="${list}" var="dto">
                    <div class="coupon">
                        <div class="coupon-name">${dto.name}</div>
                        <div class="coupon-date">유효기간 : 2022.08.01 ~ 2022.08.31</div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty list}">
                <div>쿠폰함이 비었습니다.</div>
            </c:if>
        </div>

    </div>
</section>

