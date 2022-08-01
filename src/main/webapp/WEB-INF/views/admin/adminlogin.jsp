<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락 관리자</title>
    <tiles:insertAttribute name="asset"/>
    <link rel="stylesheet" href="/sikdorock/resources/css/adminlogin.css">
</head>
<body>
    <section>
        <div>
            <form method="post" id="formData">
                <div id="logo">
                    <img src="/sikdorock/resources/images/식도락.png" onclick="location.href='/sikdorock/index'" style="height: 100px">
                    <span>관리자</span>
                </div>
                <div id="login">
                    <div>
                        <input type="text" class="form-control" name="id" placeholder="ID">
                        <input type="password" class="form-control" name="pw" placeholder="Password">
                    </div>
                </div>
                <div id="loginBtn">
                    <input type="button" class="button beige" value="로그인" onclick="login()">
                </div>
            </form>
        </div>
    </section>

<script>
    function login() {
        $.ajax({
            type : 'POST',
            url : '/sikdorock/admin/loginok',
            data: $("#formData").serialize(),
            dataType : 'json',
            success: function(result){

                if(result.result == "1") {
                    location.href='/sikdorock/admin/userlist';

                }else {
                    alert('정보가 다릅니다.');
                }

            },

            error: function() {
                alert("서버요청 실패");

            }
        })
    }
</script>
</body>
</html>
