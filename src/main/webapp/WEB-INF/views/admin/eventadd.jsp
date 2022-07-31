<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">이벤트 등록</div>
    <form method="post" action="/sikdorock/admin/eventaddok" id="addContent" enctype="multipart/form-data">
        <table class="table table-bordered" id="menuContent">
            <tr>
                <td>시작 날짜</td>
                <td><input name="startDate" type="date" class="form-control" min="${nowDate}" style="width: 500px" onchange="minDate()" required></td>
            </tr>
            <tr>
                <td>종료 날짜</td>
                <td><input name="endDate" type="date" class="form-control" style="width: 500px" readonly required></td>
            </tr>
            <tr>
                <td>이벤트명</td>
                <td><input type="text" class="form-control" name="name" required style="width: 500px"></td>
            </tr>
            <tr>
                <td>이벤트 설명</td>
                <td><textarea name="eventInfo" class="form-control" style="width: 500px; height: 200px; resize: none" required></textarea></td>
            </tr>
            <tr>
                <td>쿠폰</td>
                <td>
                    쿠폰명:<input type="text" name="couponName" class="form-control"><br><br>
                    할인:<div style="display: flex; justify-content: center"><input type="number" name="discount" class="form-control" style="width: 100px;" min="0" max="100"></div>
                </td>
            </tr>
        </table>
        <div id="addMenu">
            <input type="submit" value="이벤트 등록" class="button beige">
        </div>
    </form>
</section>

<script>
    function minDate() {
        $('input[name=endDate]').attr('readonly', false);
        $('input[name=endDate]').attr('min', $('input[name=startDate]').val());

        if ($('input[name=endDate]').is('[readonly]') == false) {
            let startDate = new Date($('input[name=startDate]').val());
            let endDate = new Date($('input[name=endDate]').val());

            if (startDate > endDate) {
                $('input[name=endDate]').val($('input[name=startDate]').val());
            }
        }
    }
</script>

