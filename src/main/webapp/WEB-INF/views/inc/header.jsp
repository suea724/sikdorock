<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div id="logo">
        <a href="/sikdorock/index"><img src="/sikdorock/resources/images/식도락.png" id="logo-img"></a>
    </div>
    <nav id="main-menu">
        <ul>
            <li><a href="/sikdorock/index">홈</a></li>
            <li><a href="/sikdorock/menu/menuli">메뉴</a></li>
            <li><a href="/sikdorock/event">이벤트</a></li>
            <li><a href="/sikdorock/cscenter/questionadd">고객센터</a></li>
        </ul>
    </nav>
    <div>
        <c:if test="${not empty auth}">
        <div class="dropdown">
            <button class="dropbtn">
                <span>${auth.name}님</span> <i class="fa-solid fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="/sikdorock/mypage/myinfo">마이페이지</a> <a href="/sikdorock/logout">로그아웃</a>
            </div>
        </div>
        <i class="fa-solid fa-cart-shopping" id="cart"></i>
        </c:if>
        <c:if test="${empty auth}">
            <div id="login-menu">
                <span><a href="/sikdorock/login">로그인 / 회원가입</a></span>
            </div>
        </c:if>
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