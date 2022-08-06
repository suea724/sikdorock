<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function() {
        //사용할 배너
        var $banner = $(".banner").find("ul");

        var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
        var $bannerHeight = $banner.children().outerHeight(); // 높이
        var $bannerLength = $banner.children().length;//배너 이미지의 갯수
        var rollingId;

        //정해진 초마다 함수 실행
        rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차

        //마우스 오버시 롤링을 멈춘다.
        banner.mouseover(function(){
            //중지
            clearInterval(rollingId);
            $(this).css("cursor", "pointer");
        });
        //마우스 아웃되면 다시 시작
        banner.mouseout(function(){
            rollingId = setInterval(function() { rollingStart(); }, 3000);
            $(this).css("cursor", "default");
        });

        function rollingStart() {
            $banner.css("width", $bannerWidth * $bannerLength + "px");
            $banner.css("height", $bannerHeight + "px");
            //alert(bannerHeight);
            //배너의 좌측 위치를 옮겨 준다.
            $banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
                //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                $(this).find("li:first").remove();
                //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                $(this).css("left", 0);
                //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
            });
        }
    });
</script>
<section>
    <div class="contents">
        <div class="banner">
            <ul>
                <li><img src="/sikdorock/resources/images/banner1.png" style="width: 1000px;"></li>
                <li><img src="/sikdorock/resources/images/banner2.png" style="width: 1000px;"></li>
                <li><img src="/sikdorock/resources/images/banner3.png" style="width: 1000px;"></li>
            </ul>
        </div>
    </div>
    <div class="title"><span>식도락</span> 과 함께</div>
    <div id="titleDown" class="title">맛있는 점심 드세요!</div>
    <div data-aos="fade-up"><img src="/sikdorock/resources/images/main1.jpg" style="width: 1000px"></div>
    <div id="subscribe" data-aos="fade-down" data-aos-anchor-placement="top-center">
        <span>정성껏 만든 점심<br>
            <span id="price">구독 7000원</span> 입니다.<br>
            메뉴표를 확인하세요!</span>
    </div>

    <div id="a1" >배달 가능 지역</div>
    <div data-aos="flip-left" id="delivery">
        <div id="a2">강남구, 성동구, 송파구, 영등포구, 용산구, 종로구, 중구, 관악구, 동작구, 강동구, 강북구</div>
        <div id="a3">*배송 위치에 따라 배송시간이 달라질 수 있습니다.</div>
    </div>

</section>

<script>
    AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
    $('#main-menu ul li:nth-child(1) a').css({
        "color": "#C69760",
    });
</script>
