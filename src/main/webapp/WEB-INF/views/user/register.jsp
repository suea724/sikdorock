<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section>
    <h3 id="register-title">회원가입</h3>
    <form action="/sikdorock/register" method="post">
        <table class="table table-borderless" id="register-table">
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력해주세요." required>
                    <div id="name-check-result" class="error"></div>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력해주세요." required></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>
                    <input type="text" name="tel" id="tel" class="form-control" placeholder="전화번호를 입력해주세요." required>
                    <div id="tel-check-result" class="error"></div>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="address" id="address" class="form-control" placeholder="주소를 입력해주세요." required></td>
            </tr>
            <tr>
                <th>상세주소</th>
                <td><input type="text" name="addressdetail" id="address-detail" class="form-control" placeholder="상세주소를 입력해주세요." required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="d-grid gap-2">
                        <input type="hidden" name="token" value="${token}">
                        <input type="submit" value="회원가입" class="btn btn-primary btn-block">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</section>

<script>

    window.onload = function() {

        document.getElementById("address").addEventListener("click", function() {

            var width = 500; //팝업의 너비
            var height = 600; //팝업의 높이

            new daum.Postcode({
                width: width,
                height: height,
                oncomplete: function(data) {
                    document.getElementById('address').value = data.address;
                }
            }).open({
                left: (window.screen.width / 2) - (width / 2),
                top: (window.screen.height / 2) - (height / 2)
            });

        });
    }

    <c:if test="${not empty rdto.name}">
        $('#name').val('${rdto.name}');
        $('#name').attr("readonly", true);
    </c:if>

    <c:if test="${not empty rdto.email}">
        $('#email').val('${rdto.email}');
        $('#email').attr("readonly", true);
    </c:if>

    <c:if test="${not empty rdto.tel}">
        $('#tel').val('${rdto.tel}');
        $('#tel').attr("readonly", true);
    </c:if>

    $('form').submit(function() {
        let name = $('#name').val();
        let tel = $('#tel').val();

        if (!/^[가-힣]{2,6}$/.test(name)) {
            $('#name-check-result').text('이름은 2~6자 이내 한글로 입력해주세요.');
            return false;
        }
        if (!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(tel)) {
            $('#tel-check-result').text("전화번호는 '-'을 포함한 13자리로 입력해주세요.");
            return false;
        }
        $("#register-btn").submit();
    });
</script>
