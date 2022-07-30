<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">메뉴 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>날짜</th>
                <th>메뉴</th>
                <th>가격</th>
            </tr>
        </table>
    </div>
    <div id="menuadd"><input type="button" value="메뉴 등록" class="button beige" onclick="location.href='/sikdorock/admin/menuAdd'"></div>
</section>
