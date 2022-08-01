<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <title>식도락</title>
    <tiles:insertAttribute name="asset"/>
</head>
<style>
    div {
        text-align: center;
    }
    #title {
        font-size: 3rem;
    }

    #table {
        width: 600px;
        margin: 0 auto;
    }

    #table tr > td:nth-child(1) {
        text-align: center;
        align-items: center;
    }

    #table tr:nth-child(2) {
        height: 550px;
    }
</style>
<body>
  <div id="title">답변</div>
  <table id="table" class="table table-bordered">
    <tr>
        <td>날짜</td>
        <td>${dto.regdate}</td>
    </tr>
      <tr>
          <td>내용</td>
          <td>${dto.content}</td>
      </tr>
  </table>
</body>
</html>
