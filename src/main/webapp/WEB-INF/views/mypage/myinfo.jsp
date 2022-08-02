<%--
  Created by IntelliJ IDEA.
  User: ioiju
  Date: 2022-08-01
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section>
    <div id="myinfo-content">
        <div id="title">내 정보 관리하기</div>
            <div id="myinfo">
                <div id="myinfo-name"><span>이름 : </span> <span class="user-info">${dto.name}</span></div>
                <div id="myinfo-email"><span>이메일 : </span><span class="user-info">${dto.id}</span></div>
                <div id="myinfo-phone"><span>전화번호 : </span><span class="user-info" id="user-tel">${dto.tel}</span></div>
                <div id="myinfo-address"><span>주소 : </span><span class="user-info" id="user-address">${dto.address} ${dto.addressdetail}</span></div>
            </div>
        <div id="myinfoedit-btn"><input type="button" value="수정" onclick="myinfoEdit()"></div>
    </div>
</section>

<script>
    const temp = `<input type="text" value="${dto.tel}" name="tel" id="changetel">`;
    const temp2 = `<input type="text" value="${dto.address}" name="address" id="changeaddress"> <input type="text" value=" ${dto.addressdetail}" name="addressdetail" id="changedetail"> <input type="button" id="address" value="주소 찾기" onclick="findAddress();">`;
    let isEdit = false;
    //버튼 클릭 시 수정창 생성
    function myinfoEdit() {
        if(!isEdit) {
            //span 태그 삭제하고 input 추가하기
            $('#user-tel').remove();
            $('#myinfo-phone').append(temp);

            $('#user-address').remove();
            $('#myinfo-address').append(temp2);
            isEdit = true;
        } else {
            editMyInfo();
        }

    }


    //주소 API
    function findAddress() {
        var width = 500; //팝업의 너비
        var height = 600; //팝업의 높이

        new daum.Postcode({
            width: width,
            height: height,
            oncomplete: function(data) {
                document.getElementById('changeaddress').value = data.address;
                document.getElementById('changedetail').value = '';
            }
        }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
        });
    }



    //내 정보를 수정하는 함수
    function editMyInfo() {

        const tel = document.getElementById('changetel').value;
        const address = document.getElementById('changeaddress').value;
        const detail = document.getElementById('changedetail').value;

        const temp3 = `<span class="user-info" id="user-tel">\${tel}</span>`;
        const temp4 = `<span class="user-info" id="user-address">\${address} \${detail}</span>`;

        console.log(tel);
        console.log(address);
        console.log(detail);
        $.ajax({
            type: 'POST',
            url: '/sikdorock/mypage/editmyinfo',
            data: {
                "tel": tel,
                "address": address,
                "detail": detail
            },
            dataType: 'json',
            success: function(result) {

                //전화번호 유효성 검사 생각해보기!
                /*if (!/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/.test(tel)) {
                    $('#tel-check-result').text("전화번호는 '-'을 포함한 13자리로 입력해주세요.");
                    return false;
                }*/

                if(result.result == 1) {
                    //성공 시 수정 부분을 바꿔준다.
                    $('#changetel').remove();
                    $('#changeaddress').remove();
                    $('#changedetail').remove();
                    $('#address').remove();

                    $('#myinfo-phone').append(temp3);
                    $('#myinfo-address').append(temp4);

                } else {
                    alert('수정 실패');
                }
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
        });
    }



</script>

