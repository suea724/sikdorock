<%--
  Created by IntelliJ IDEA.
  User: jiyoon
  Date: 2022-08-01
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>

    <div class="eventList">
            <div id="eventbox">
                <div class="banner-view" onclick="location.href='/sikdorock/event/eventview?seq=${dto.seq}'" style="cursor: pointer;">
                    <img src="/sikdorock/resources/images/${dto.name}.png" class="img-view">
                </div>


                <c:if test="${dto.checkdate <= 0}">
                    <c:if test="${empty auth}">
                        <h4 class="notevent">이벤트 뽑기는 로그인 후 이용 가능합니다.</h4>
                    </c:if>
                    <c:if test="${not empty auth}">
                        <div class="eventinfo">${dto.eventinfo}<br>당첨된 쿠폰은 마이페이지 > 쿠폰함에서 확인할 수 있습니다.</div>
                        <div id="ment"><h4>과연 행운의 <span id="host">주인공</span>은 누구일까요? 😋</h4><h6>🔽 선물 클릭 🔽</h6></div>
                        <div id="btn-box">
                            <%--<button class="button beige" onclick="eventcheck();">이벤트 뽑기</button>--%>
                            <%--<input type="button" class="button beige" value="이벤트 뽑기" id="event-btn">--%>
                            <%--<input type="button" value="이벤트 뽑기" id="event-btn">--%>
                            <button class="event-btn" id="event-btn" type="submit"><img id="box" src="/sikdorock/resources/images/선물.png" class="event-btn"></button>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${dto.checkdate > 0}">
                    <h4 class="notevent">이벤트가 종료되었습니다.😅 다음 이벤트를 기대해주세요! ✨</h4>
                </c:if>
            </div>
        <%--${dto.coupon}--%>
        <%--${udto.id}--%>


        <div class="guide-box">
            <div class="guide-type">[이벤트 유의사항]</div>
            <div class="guide-content">
                <div>- 본 이벤트는 로그인 후 참여하실 수 있습니다.</div>
                <div>- 본 이벤트는 식도락에서 정해진 기간 내에만 참여 가능합니다.</div>
                <div>- 이벤트 관련 문의사항은 고객센터 문의 게시판으로 문의 주시길 바랍니다.</div>
            </div>
            <div class="guide-type">[쿠폰 유의사항]</div>
            <div class="guide-content">
                <div>- 모든 쿠폰은 재사용 및 다른 쿠폰과의 중복 사용이 불가합니다.</div>
                <div>- 쿠폰은 타인에게 양도 혹은 재판매 하실 수 없으며 이러한 행위로 발생한 불이익은 식도락에서 책임지지 않습니다.</div>
            </div>
        </div>

    </div>

</section>

<script>




    $('#event-btn').click(function() {
         $.ajax({

             type: 'GET',
             url: "/sikdorock/event/eventcheck",
             dataType: 'json',
             data: 'id=${udto.id}' + '&cseq=${dto.cseq}' + '&seq=${dto.seq}',
             success: function (result) {

                 if (result.result == 1) {
                     alert('이벤트 당첨을 축하합니다! \n 당첨된 쿠폰은 마이페이지 > 쿠폰함에서 확인할 수 있습니다.');
                     $('#box').attr('src', '/sikdorock/resources/images/상자열림.png');
                     $('#box').attr('id', '');
                 } else if (result.result == 0) {
                     alert('아쉽게도 당첨되지 않았습니다. \n 다음 기회를 노려보세요!')
                     $('#box').attr('src', '/sikdorock/resources/images/상자열림.png');
                     $('#box').attr('id', '');
                 } else {
                     alert('이미 참여하셨습니다. \n 다음 이벤트를 기대해주세요!')
                     $('#box').attr('src', '/sikdorock/resources/images/상자열림.png');
                     $('#box').attr('id', '');
                 }
             },
             error: function (a, b, c) {
                 console.log(a, b, c)
             }
         });
     });





</script>
