<%--
  Created by IntelliJ IDEA.
  User: ioiju
  Date: 2022-08-01
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="myinfo-content">
        <div id="likefood-sub">
            <div id="title">찜목록</div>
        </div>

        <div id="likefoods">
            <div class="likefood">
                <div class="likefood-img"></div>
                <div class="likefood-btn" onclick="delLikeFood()"><i class="fa-solid fa-heart"></i></div>
                <div class="likefood-name">오징어 덮밥/양지차돌 곰탕</div>
                <div class="likefood-price">7,500</div>
            </div>
        </div>
    </div>
</section>

<script>
    function delLikeFood() {
        $.ajax({
            type: 'POST',
            url: '/sikdorock/mypage/likefood',
            dataType: 'json',
            success: function(result) {
                $(event.target).parent().remove();
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
        });
    }
</script>