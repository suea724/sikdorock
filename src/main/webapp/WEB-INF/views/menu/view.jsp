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

    #reTbl > tbody > tr:nth-child(2) > td:nth-child(4) {
        width: 110px;
    }

    #review {
        width: 880px;
        height: 38px;
    }

    #reTbl  tr:nth-child(2) > td:nth-child(5) {
        width: 91.89px;
    }

    #reTbl  tr:nth-child(2) > td:nth-child(5) > span:nth-child(1):hover {
        cursor: pointer;
        font-weight: bold;
    }

    #reTbl  tr:nth-child(2) > td:nth-child(5) > span:nth-child(2):hover {
        cursor: pointer;
        font-weight: bold;
    }

    #like > td:nth-child(1):hover {
        cursor: pointer;
    }

    #addCart:hover {
        cursor: pointer;
    }

    #cartli {
        cursor: pointer;
        text-decoration: none;
        color: black;
    }

    #cartli {
        cursor: pointer;
    }

    .btnBold:hover {
        font-weight: bold;
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

      <tr id="like">
        <c:if test="${like == 0}">
        <td class="btnBold"><i class="fa-regular fa-heart" onclick="like(${fdto.seq})"></i> 찜</td>
        </c:if>
        <c:if test="${like != 0}">
          <td class="btnBold"><i class="fa-solid fa-heart" onclick="delLike(${fdto.seq})" style="color: tomato"></i> 찜</td>
        </c:if>
        <c:if test="${cart == 0}">
        <td class="btnBold"><i class="fa-solid fa-cart-plus" onclick="addCart(${fdto.seq})" id="addCart"></i> 장바구니</td>
        </c:if>
        <c:if test="${cart != 0}">
        <td class="btnBold"><a href="/sikdorock/menu/cartlist" id="cartli"><i class="fa-solid fa-cart-shopping"></i> 장바구니</a></td>
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
    <form method="post" action="/sikdorock/menu/reviewadd" id="reform">
    <tr>
      <td>
        <div class="myform">
          <input type="radio" name="star" value="5" id="cleanRate1"><label
                for="cleanRate1">★</label>
          <input type="radio" name="star" value="4" id="cleanRate2"><label
                for="cleanRate2">★</label>
          <input type="radio" name="star" value="3" id="cleanRate3"><label
                for="cleanRate3">★</label>
          <input type="radio" name="star" value="2" id="cleanRate4"><label
                for="cleanRate4">★</label>
          <input type="radio" name="star" value="1" id="cleanRate5"><label
                for="cleanRate5">★</label>
        </div>
      </td>
      <td colspan="3">
          <input type="text" name="review" id="review" class="form-control" maxlength="40">
          <input type="hidden" name="fseq" value="${fdto.seq}">
      </td>
      <td><input type="submit" id="reAdd" class="btn btn-primary" value="작성하기"></td>
    </tr>
    </form>
    <c:if test="${not empty reviewList}">
    <c:forEach items="${reviewList}" var="rdto">
    <tr data-rseq="${rdto.seq}" data-fseq="${fdto.seq}">
      <td>${rdto.name}</td>
      <td>
              ${rdto.content}
          <input type="hidden" id="hideContent" value="${rdto.content}">
      </td>
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
      <td>
          <c:if test="${rdto.id == id}">
          <span onclick="editReview('${rdto.seq}','${rdto.star}','${rdto.content}','${fdto.seq}');">수정</span> |
          <span onclick="delReview(${rdto.seq});">삭제</span>
          </c:if>
      </td>
    </tr>

    </c:forEach>
    </c:if>
  </table>

    <script>

        let flag = false;

        function editReview(seq, star, content, fseq) {

            const temp = `
                            <tr id="reedit" style="border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black">
                              <td>
                                <div class="myform">
                                  <input type="radio" name="star" value="5" id="Rate1" checked><label
                                        for="Rate1">★</label>
                                  <input type="radio" name="star" value="4" id="Rate2"><label
                                        for="Rate2">★</label>
                                  <input type="radio" name="star" value="3" id="Rate3"><label
                                        for="Rate3">★</label>
                                  <input type="radio" name="star" value="2" id="Rate4"><label
                                        for="Rate4">★</label>
                                  <input type="radio" name="star" value="1" id="Rate5"><label
                                        for="Rate5">★</label>
                              </div>
                              </td>
                              <td colspan="3">
                                  <input type="text" value="\${content}" name="review2" id="review2" class="form-control" maxlength="40" >
                                  <input type="hidden" name="fseq" value="\${fseq}">
                                  <input type="hidden" name="rseq" value="\${seq}">
                              </td>
                              <td><input type="button" id="reEdit" class="btn btn-Light" value="수정하기" onclick="reedit()"></td>
                            </tr>
                            `;

                if (flag == false) {
                    $(event.target).parent().parent().after(temp);
                    flag = true;
                } else {
                    //$(event.target).parent().parent().next().remove();
                    $('#reedit').remove();
                    flag = false;
                }

        }



        function reedit() {

            const star = $('input[name=star]:checked').val();
            const fseq = $('input[name=fseq]').val();
            const content = $('#review2').val();
            const seq = $('input[name=rseq]').val();

            alert('수정이 완료되었습니다!');

            location.href="/sikdorock/menu/editreview?seq=" + seq + "&fseq=" + fseq + "&content=" + content + "&star=" + star;

        }



        function delReview(rseq) {

            const tr = $(event.target);

            /*let anoHrseq = $('.hospitalview-review table tr').last().data('hrseq');*/

            $.ajax({
                type: 'GET',
                url: '/sikdorock/menu/reviewdel',
                data: 'rseq=' + rseq,
                dataType: 'json',
                success: function(result) {


                    if (result.result == 1) {
                        if (confirm("삭제하시겠습니까?")) {
                            tr.parent().parent().remove();
                        }
                    }

                },
                error: function(a, b, c){
                    console.log(a, b, c);
                }
            });
        }


        function like(fseq) {

            const tr = $(event.target);

            /*let anoHrseq = $('.hospitalview-review table tr').last().data('hrseq');*/

            $.ajax({
                type: 'GET',
                url: '/sikdorock/menu/addlike',
                data: 'fseq=' + fseq,
                dataType: 'json',
                success: function(result) {

                    if (result.result == 1) {

                        tr.parent().remove();

                        const temp = `<td class="btnBold"><i class="fa-solid fa-heart" onclick="delLike(${fdto.seq})" style="color: tomato"></i> 찜</td>`

                        $('#like').prepend(temp);


                    }

                },
                error: function(a, b, c){
                    console.log(a, b, c);
                }
            });
        }


        function delLike(fseq) {

            const tr = $(event.target);

            /*let anoHrseq = $('.hospitalview-review table tr').last().data('hrseq');*/

            $.ajax({
                type: 'GET',
                url: '/sikdorock/menu/dellike',
                data: 'fseq=' + fseq,
                dataType: 'json',
                success: function(result) {


                    if (result.result == 1) {

                        tr.parent().remove();

                        const temp = `<td class="btnBold"><i class="fa-regular fa-heart" onclick="like(${fdto.seq})"></i> 찜</td>`

                        $('#like').prepend(temp);


                    }

                },
                error: function(a, b, c){
                    console.log(a, b, c);
                }
            });

        }



        function addCart(fseq) {

            const count = $('#count').val();

            const tr = $(event.target);

            /*let anoHrseq = $('.hospitalview-review table tr').last().data('hrseq');*/

            $.ajax({
                type: 'GET',
                url: '/sikdorock/menu/addcart',
                data: 'fseq=' + fseq + "&count=" + count,
                dataType: 'json',
                success: function(result) {



                    if (result.result == 1) {

                        tr.parent().remove();

                        const temp = `<td class="btnBold"><a href="/" id="cartli"><i class="fa-solid fa-cart-shopping"></i> 장바구니</a></td>`

                        alert('장바구니에 추가되었습니다!')

                        $('#like').append(temp);

                        $('#count').val('1');

                    }

                },
                error: function(a, b, c){
                    console.log(a, b, c);
                }
            });

        }



    </script>


</section>
