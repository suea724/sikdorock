<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
  <div id="title">문의 상세보기</div>
  <div class="slider">
    <c:forEach items="${qlist}" var="dto" varStatus="status">
      <c:if test="${status.index == 0}">
      <input type="radio" name="slide" id="slide${status.index}" checked>
      </c:if>
      <c:if test="${status.index != 0}">
      <input type="radio" name="slide" id="slide${status.index}">
      </c:if>
    </c:forEach>
    <ul id="imgholder" class="imgs">
      <c:forEach items="${qlist}" var="dto">
        <li><img src="/sikdorock/resources/files/${dto.ext}"></li>
      </c:forEach>
    </ul>
    <div class="bullets">
      <c:forEach items="${qlist}" var="dto" varStatus="status">
        <label for="slide${status.index}">&nbsp;</label>
      </c:forEach>
    </div>
  </div>
    <div id="viewContent">
      <table class="table table-bordered">
        <tr>
          <th>문의 내용</th>
        </tr>
        <tr>
          <td>${dto.content}</td>
        </tr>
      </table>
    </div>
  <div id="answerAdd">
    <input type="button" class="button beige" value="답변쓰기" onclick="location.href='/sikdorock/admin/answeradd?seq=${dto.seq}'">
  </div>
</section>


