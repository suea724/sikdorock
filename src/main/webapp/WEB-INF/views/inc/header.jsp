<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header>
    <div id="logo">
        <a href="/"><img src="/sikdorock/resources/images/식도락.png" id="logo-img"></a>
    </div>
    <nav id="main-menu">
        <ul>
            <li><a href="/">홈</a></li>
            <li><a href="/">메뉴</a></li>
            <li><a href="/">이벤트</a></li>
            <li><a href="/">고객센터</a></li>
        </ul>
    </nav>
    <div>
        <div class="dropdown">
            <button class="dropbtn">
                <span>홍길동님</span> <i class="fa-solid fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="/house/web/usermypage/userEditInfo">마이페이지</a> <a href="/house/domain/sign/logout">로그아웃</a>
            </div>
        </div>
        <i class="fa-solid fa-cart-shopping" id="cart"></i>
    </div>
</header>

<script>
    $('.dropbtn').click(function(e) {
        if($('.dropdown-content').css('display') == 'block') {
            $('.dropbtn > i').remove();
            $('.dropbtn').append('<i class="fa-solid fa-caret-down"></i>');
            $('.dropdown-content').css('display', 'none');
        } else if($('.dropdown-content').css('display') == 'none') {
            $('.dropdown-content').css('display', 'block');
            $('.dropbtn > i').remove();
            $('.dropbtn').append('<i class="fa-solid fa-caret-up"></i>');
        }
    });
</script>