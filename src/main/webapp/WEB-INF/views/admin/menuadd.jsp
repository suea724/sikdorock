<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">메뉴 등록</div>
    <form method="post" action="/sikdorock/admin/menuaddok" id="addContent" enctype="multipart/form-data">
        <div id='image_preview'>
            <div id='att_zone'
                 data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'>
            </div>
            <h3>이미지 업로드</h3>
            <input type='file' id='btnAtt' name="btnAtt" multiple='multiple' />
        </div>
        <table class="table table-bordered" id="menuContent">
            <tr>
                <td>카테고리</td>
                <td>
                    <select name="cateseq" class="form-select" style="width: 100px" required>
                        <c:forEach items="${category}" var="dto">
                            <option value="${dto.seq}">${dto.category}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>날짜</td>
                <td id="aaa">
                    <input name="outdate" type="date" class="form-control" min="${nowDate}" style="width: 500px" onchange="dateCheck()" required>
                </td>
            </tr>
            <tr>
                <td>메뉴</td>
                <td><input name="menuname" type="text" class="form-control" style="width: 500px" required></td>
            </tr>
            <tr>
                <td>알레르기</td>
                <td><textarea name="allergy" class="form-control" style="width: 500px; height: 200px; resize: none" required></textarea></td>
            </tr>
            <tr>
                <td>메뉴 설명</td>
                <td><textarea name="menuexplain" class="form-control" style="width: 500px; height: 200px; resize: none" required></textarea></td>
            </tr>
        </table>
        <div id="addMenu">
            <input id="targetBtn" type="submit" value="메뉴 등록" class="button beige">
        </div>
    </form>
</section>

<script>

    //날짜 유효성 검사
    function dateCheck() {

        $.ajax({
            type: 'POST',
            url: '/sikdorock/admin/datecheck',
            data: 'date=' + $('input[name=outdate]').val(),
            dataType: 'json',
            success: function(result) {
                if (result.result == "1") {
                    if (document.getElementById('checkMsg')) {
                        document.getElementById('checkMsg').remove();
                    }
                    let check = document.createElement('div');
                    check.setAttribute('style', 'justify-content: left; display: flex; color: red');
                    check.setAttribute('id', 'checkMsg');
                    check.innerHTML = '이미 등록된 날짜입니다.';
                    document.getElementById('aaa').append(check);
                    $('#targetBtn').attr('disabled', true);

                } else {
                    if (document.getElementById('checkMsg')) {
                        document.getElementById('checkMsg').remove();
                    }
                    let check = document.createElement('div');
                    check.setAttribute('style', 'justify-content: left; display: flex; color: blue');
                    check.setAttribute('id', 'checkMsg');
                    check.innerHTML = '등록 가능한 날짜입니다.';
                    document.getElementById('aaa').append(check);
                    $('#targetBtn').attr('disabled', false);
                }

            },
            error: function (a,b,c) {
                console.log(a,b,c);
            }
        });

    }

    //이미지 미리보기 구현
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];



            btnAtt.onchange = function(e){
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for(f of fileArr){
                    imageLoader(f);
                }
            }


            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function(e){
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function(e){
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for(f of files){
                    imageLoader(f);
                }

            }, false)



            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function(file){
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }

                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
                var div = document.createElement('div')

                var btn = document.createElement('input')
                btn.setAttribute('type', 'button')
                btn.setAttribute('value', 'x')
                btn.setAttribute('delFile', file.name);
                btn.classList.add('button');
                btn.classList.add('beige');
                btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                        if(delFile== sel_files[i].name){
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for(f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'btnAtt')

</script>

