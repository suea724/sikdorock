<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .myform {
        display: inline-block;
        direction: rtl;
        border:0;
    }
    .myform legend{
        text-align: right;
    }
    .myform input[type=radio]{
        display: none;
    }
    .myform label{
        font-size: 2em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }
    .myform label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    .myform label:hover ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    .myform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }

    #reTbl {
        width: 1200px;
        margin: 0 auto;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    #reTbl > tbody > tr:nth-child(1) > td:nth-child(1) {
        width: 200px;
        padding-left: 10px;
        height: 80px;
    }

    #reTbl > tbody > tr > td:nth-child(1) {
        padding-left: 10px;
    }

    #reTbl > tbody > tr:nth-child(1) > td:nth-child(2) {
       width: 800px;
    }

    #reTbl > tbody > tr:nth-child(2) > td:nth-child(3) {
        width: 150px;
    }

    #review {
        width: 880px;
        height: 38px;
    }

</style>

<section>

  <div id="viewBox">
    <div class="slider">
      <input type="radio" name="slide" id="slide1" checked>
      <input type="radio" name="slide" id="slide2">
      <ul id="imgholder" class="imgs">
      <c:forEach items="${imgList}" var="image">
        <li><img src="/sikdorock/resources/files/${image}"></li>
        <%--<li><div class="view-img" style="background-image: url('/sikdorock/resources/files/${image}');"></div></li>--%>
      </c:forEach>
      </ul>
      <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
      </div>
    </div>

    <table class="tbl">
      <tr>
        <td colspan="2">${fdto.menuname}</td>
      </tr>
      <tr>
        <td colspan="2">가격:  ${price}</td>
      </tr>
      <tr>
        <td colspan="2">카테고리:  ${fdto.category}</td>

      </tr>
      <tr>
        <td colspan="2">알레르기:  ${fdto.allergy}</td>

      </tr>
      <tr>
        <td colspan="2">배송 날짜:  ${fdto.outdate}</td>

      </tr>

      <tr>
        <c:if test="${like == 0}">
        <td><i class="fa-regular fa-heart"></i> 찜</td>
        </c:if>
        <c:if test="${like != 0}">
          <td><i class="fa-solid fa-heart"></i> 찜</td>
        </c:if>
        <c:if test="${cart == 0}">
        <td><i class="fa-solid fa-cart-plus"></i> 장바구니</td>
        </c:if>
        <c:if test="${cart != 0}">
        <td><i class="fa-solid fa-cart-shopping"></i> 장바구니</td>
        </c:if>
      </tr>
      <tr>
        <td colspan="2">
          <input type="number" name="count" id="count" placeholder="수량" min="1" value="1">
          <input type="hidden" name="seq" id="viewSeq" value="${fdto.seq}">
          <input type="button" id="purchase" class="btn btn-success form-contril" onclick="purchase()" value="구매하기">
        </td>

      </tr>
    </table>

  </div>
  <hr class="explainHr">
  <div id="menuexplain">메뉴 설명: ${fdto.menuexplain}</div>


  <div id="reHeader"><div>리뷰</div><div><i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)"></i>별점 ${fstar}</div></div>
  <hr class="reHr">


  <table id="reTbl">
    <form method="post" ></form>
    <tr>
      <td>
        <div class="myform">
          <input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
                for="cleanRate1">★</label>
          <input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
                for="cleanRate2">★</label>
          <input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
                for="cleanRate3">★</label>
          <input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
                for="cleanRate4">★</label>
          <input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
                for="cleanRate5">★</label>
        </div>
      </td>
      <td colspan="2"><input type="text" name="review" id="review" class=""></td>
      <td><input type="submit" id="reAdd" class="btn btn-primary" value="작성하기"></td>
    </tr>
    <c:if test="${not empty reviewList}">
    <c:forEach items="${reviewList}" var="rdto">
    <tr>
      <td>${rdto.name}</td>
      <td>${rdto.content}</td>
      <td>
          <c:if test="${rdto.star == 5}">
          <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
          <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
          <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
          <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
          <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
          </c:if>
          <c:if test="${rdto.star == 4}">
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
          </c:if>
          <c:if test="${rdto.star == 3}">
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
          </c:if>
          <c:if test="${rdto.star == 2}">
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
          </c:if>
          <c:if test="${rdto.star == 1}">
              <i class="fa-solid fa-star" style="color: rgba(250, 208, 0, 0.99)" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
              <i class="fa-solid fa-star" style="color: #f0f0f0" />
          </c:if>
      </td>
      <td>${rdto.regdate}</td>
        <%--rdto.id도 있음--%>
    </tr>
    </c:forEach>
    </c:if>
  </table>




</section>
