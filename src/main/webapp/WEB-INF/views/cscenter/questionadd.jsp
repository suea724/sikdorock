<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div class="title">
        <span>고객 센터</span>
    </div>
    <div class="title" id="cssubmenu">
        <div>
            <a href="/sikdorock/cscenter/questionadd">문의하기</a>
            <a href="/sikdorock/cscenter/questionlist">내 문의내역</a>
        </div>
        <span style="font-size: 1rem">고객센터 Tel <br>02.1234.5678</span>
    </div>
    <div class="title">
        <div id="content">
            <span><span style="color: #C69760; font-weight: bold">식도락</span> 고객센터 입니다!</span><br>
            <span>식도락을 이용하면서 느끼신 불편사항을 말씀해주세요.<br>
                항상 최선을 다하겠습니다.</span>
        </div>
    </div>
    <form method="post" action="/sikdorock/cscenter/questionaddok" enctype="multipart/form-data">
        <div class="questionadd">
            <div>
                이미지 등록
            </div>
            <input type="file" name="imageAdd" id="imageAdd" multiple>
            <div>
                <textarea name="content" style="width: 500px; height: 300px; resize: none; margin-bottom: 30px;" class="form-control"></textarea>
            </div>
        </div>
        <div class="questionadd" id="sub">
            <input type="submit" class="button beige" value="등록하기">
        </div>
    </form>
</section>

<script>
    $('#cssubmenu div a:nth-child(1)').css({
        "color": "black",
        "font-weight": "bold"
    });

</script>
