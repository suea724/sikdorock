<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/sikdorock/resources/css/user.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
    <div id="login-container">
    <h3 id="login-title">로그인 / 회원가입</h3>
    <div id="login-btns">
        <img src="/sikdorock/resources/images/naver_login.png" id="naver-login-btn" onclick="location.href='${url}'">
        <img src="/sikdorock/resources/images/kakao_login.png" id="kakao-login-btn" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=dfeb89b9833869d3e1a11f5d2aa1d36f&redirect_uri=http://localhost:9090/sikdorock/login/kakao&response_type=code'">
    </div>
    </div>
</section>