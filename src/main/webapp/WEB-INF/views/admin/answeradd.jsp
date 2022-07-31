<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
  <div id="title">답변 쓰기</div>
  <form method="post" action="/sikdorock/admin/answeraddok" id="answerCheck">
    <textarea class="form-control" name="content">

    </textarea>
    <div>
      <input type="submit" class="button beige" value="답변 쓰기">
    </div>
    <input type="hidden" name="qseq" value="${seq}">
  </form>
</section>



