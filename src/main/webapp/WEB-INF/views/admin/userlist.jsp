<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <div id="title">회원 관리</div>
    <div id="userList">
        <table class="table">
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>아이디</th>
                <th></th>
            </tr>
            <c:forEach items="${list}" var="dto">
                <tr>
                    <td>${dto.seq}</td>
                    <td>${dto.name}</td>
                    <td>${dto.id}</td>
                    <td><button class="button beige">추방</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="page">
        <ul class="pagination mode">
            <li> <a href="#" class="first">처음 페이지</a></li>
            <li> <a href="#" class="arrow left"><<</a></li>
            <li> <a href="#" class="active num">1</a></li>
            <li> <a href="#" class="num">2</a></li>
            <li> <a href="#" class="num">3</a></li>
            <li> <a href="#" class="num">4</a></li>
            <li> <a href="#" class="num">5</a></li>
            <li> <a href="#" class="num">6</a></li>
            <li> <a href="#" class="num">7</a></li>
            <li> <a href="#" class="num">8</a></li>
            <li> <a href="#" class="num">9</a></li>
            <li> <a href="#" class="arrow right">>></a></li>
            <li><a href="#" class="last">끝 페이지</a></li>
        </ul>
    </div>
    <div id="search">
        <input type="text" class="form-control" placeholder="ID를 입력하세요.">
        <input type="submit" value="검색하기" class="button beige">
    </div>
</section>