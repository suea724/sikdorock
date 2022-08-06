<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  #CartBox {
    padding-top: 10px;
    padding-bottom: 10px;
    width: 800px;
    margin: 15px auto;
    background-color: #F2F2F2;
    border-radius: 15px;
    box-shadow: 5px 5px #E4E4E5;
  }

  #CartBox > table > tbody > tr > td:nth-child(1) {
    padding-left: 20px;
    padding-right: 10px;
    width: 55px;
  }

  #CartBox > table > tbody > tr > td:nth-child(2) > img {
    width: 200px;
    height: 150px;
    border-radius: 15px;
    margin-right: 10px;
  }

  #CartBox > table > tbody > tr > td:nth-child(3) > div:nth-child(1) {

  }

  #CartBox > table > tbody > tr > td:nth-child(3) > div:nth-child(2) {

  }

  #CartBox > table > tbody > tr > td:nth-child(4) > input[type=number] {
    width: 80px;
    margin-right: 15px;
  }

  #CartBox > table > tbody > tr > td:nth-child(5) > input {
    width: 80px; text-align:center; padding: 6px;
  }

  #paybox {
    width: 1000px;
    margin: 15px auto;
    text-align: center;
  }

  #selcart {
    margin-right: 10px;
  }

  #CartBox > table > tbody > tr > td:nth-child(4) {

  }

</style>
<section>

  <form method="get" action="/sikdorock/menu/payment">
  <c:forEach items="${clist}" var="cdto">
  <div id='CartBox'>
      <table>
        <tr>
          <td><input type="checkbox" name="checkcart" value="${cdto.seq}"></td>
          <td><img src="/sikdorock/resources/files/${cdto.image}"></td>
          <td style="width: 250px;">
            <div>${cdto.menuname}</div>
            <div>${price}</div>
          </td>
          <td style="width: 97px;"><input type="number" id="count" min="1" value="${cdto.count}" style="margin: 0"></td>
          <td style="width: 167px;">
            <input type="hidden" value="${cdto.seq}">
            <input type="button" value="수량 변경" class="btn btn-success" onclick="editcart(${cdto.seq})">
            <input type="button" value="삭제하기" class="btn btn-danger" onclick="delcart(${cdto.seq})">
          </td>
      </table>
  </div>
  </c:forEach>


  <div id="paybox">
    <input type="submit" id="selcart" name="selcart" class="btn btn-secondary" value="선택 구매">
    <input type="button" onclick="allpay()" id="allcart" name="allcart" class="btn btn-secondary" value="전체 구매">
  </div>
  </form>




</section>

<script>

  function editcart(seq) {

    const count = $(event.target).parent().prev().children().first().val();


    location.href="/sikdorock/menu/editcart?seq=" + seq + "&count=" + count;
  }


  function delcart(seq) {

    const target = $(event.target);

    $.ajax({
      type: 'GET',
      url: '/sikdorock/menu/delcart',
      data: 'seq=' + seq,
      dataType: 'json',
      success: function(result) {


        if (result.result == 1) {
          if (confirm("삭제하시겠습니까?")) {
            target.parent().parent().parent().parent().parent().remove();
          }
        }

      },
      error: function(a, b, c){
        console.log(a, b, c);
      }
    });

  }


</script>
