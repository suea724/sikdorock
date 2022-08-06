<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #payBox {
        width: 1000px;
        margin: 0 auto;
        margin-top: 30px;
    }

    #CartBox {
        padding-top: 10px;
        padding-bottom: 10px;
        width: 800px;
        margin: 15px auto;
        background-color: #F2F2F2;
        border-radius: 15px;
        box-shadow: 5px 5px #E4E4E5;
        padding-left: 10px;
    }

    #CartBox > table > tbody > tr > td:nth-child(1) > img {
        width: 200px;
        height: 150px;
        border-radius: 15px;
        margin-right: 10px;
    }

    #CartBox > table > tbody > tr > td:nth-child(2) {
        width: 450px;
    }

    #address {
        display: flex;
        justify-content: space-between;
    }

    #payBox > select {
        width: 300px;
    }

    .hrmargin {
        margin-top: 21px;
        margin-bottom: 21px;
    }

</style>

<section>

        <div id="payBox">
            <h2 style="font-weight: 600">배송지</h2>
            <br>
            <h4>${udto.name}</h4>
            <div>${udto.tel}</div>
            <div id="address"><div>${udto.address}</div><a href="/"><div>배송지 변경</div></a></div>

            <hr class="hrmargin">

            <c:forEach items="${cartli}" var="cdto">
                <div id='CartBox'>
                    <table>
                        <tr>
                            <td><img src="/sikdorock/resources/files/${cdto.image}"></td>
                            <td>
                                <div>${cdto.menuname}</div>
                                <div>${price}</div>
                            </td>
                            <td>
                                수량 ${cdto.count}개
                                <input type="hidden" class="menucount" value="${cdto.count}">
                                <input type="hidden" class="menuseq" value="${cdto.fseq}">
                            </td>
                    </table>
                </div>
            </c:forEach>

            <hr class="hrmargin">

            <h4 style="font-weight: 600">쿠폰 할인</h4>
            <c:if test="${empty couponli}">
                <select class="form-control" disabled>
                    <option disabled selected>=========빈 쿠폰함=========</option>
                </select>
            </c:if>
            <c:if test="${not empty couponli}">
                <select name="selcoupon" class="form-control" id="selcoupon" onchange="disprice(this)">
                    <option value="" disabled selected>============선택============</option>
                    <c:forEach items="${couponli}" var="coudto">
                        <option value="${coudto.seq}" data-discount="${coudto.discount}">${coudto.name}</option>
                    </c:forEach>
                </select>
            </c:if>

            <hr class="hrmargin">

            <h4 style="font-weight: 600">최종 결제 금액</h4>
            <div style="font-weight: 600"><span>상품 금액: </span><span id="sump">원</span></div>
            <div style="font-weight: 600"><span>할인 금액: </span><span id="dp">원</span></div>
            <div style="font-weight: 600"><span>최종 금액: </span><span id="lastp">원</span></div>


            <div style="text-align: right"><button onclick="requestPay()">결제하기</button></div>
        </div>



</section>
<script>
    let coupon = 0;
    let seqList = document.getElementsByClassName('menuseq');
    let seqArr = [];
    for (let i=0; i<seqList.length; i++) {
        seqArr.push(seqList[i].value);
    }

    let countList = document.getElementsByClassName('menucount');
    let countArr = [];
    for (let i=0; i<countList.length; i++) {
        countArr.push(countList[i].value);
    }


    function disprice(e) {
        let value = document.getElementById('selcoupon').options[document.getElementById('selcoupon').selectedIndex].dataset.discount;
        coupon = document.getElementById('selcoupon').options[document.getElementById('selcoupon').selectedIndex].value;

        let dp = Math.floor(${sump} / value);
        let lastp = ${sump} - dp;

        document.getElementById('dp').innerText = dp.toLocaleString() + "원";
        document.getElementById('lastp').innerText = lastp.toLocaleString() + "원";
    }


    let sump = ${sump};
    document.getElementById('sump').innerText = sump.toLocaleString() + "원";

    document.getElementById('lastp').innerText = sump.toLocaleString() + "원";

    IMP.init("imp58287643"); // 예: imp00000000

    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: "${seq}",
            name: "식도락 메뉴 결제",
            amount: document.getElementById('lastp').innerText,
            buyer_email: "${udto.id}",
            buyer_name: "${udto.name}",
            buyer_tel: "${udto.tel}",
            buyer_addr: "${udto.address}",
            buyer_postcode: "01181"
        }, function (rsp) { // callback
            if (rsp.success) {
                location.href='/sikdorock/menu/payok?seq=' + seqArr + '&count=' + countArr + '&price=' + document.getElementById('lastp').innerText + '&coupon=' + coupon;
            } else {

            }
        });
    }

</script>
