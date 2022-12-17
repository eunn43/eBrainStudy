<%--
  Created by IntelliJ IDEA.
  User: 정성은
  Date: 2022-12-16
  Time: 오후 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Title</title>
</head>
<body>
<div class="title">
  <h2>게시판 - 등록</h2>
</div>
<div class="container">
  <hr/>
  <div>
    <p>카테고리 *</p>
    <select name="category">
      <option value="none">전체 카테고리</option>
    </select>
  </div>
  <hr/>
  <div>
    <p>작성자 *</p>
    <input type="text">
  </div>
  <hr/>
  <div>
    <p>비밀번호 *</p>
    <input type="password">
    <input type="password">
    <!-- 비밀번호 비교 후 일치 확인 -->
  </div>
  <hr/>
  <div>
    <p>제목 *</p>
    <input type="text">
  </div>
  <hr/>
  <div>
    <p>내용 *</p>
    <input type="text">
  </div>
  <hr/>
  <div>
    <p>파일 첨부</p>
  </div>
  <hr/>
  <div>
    <button type="submit">취소</button>
    <button type="submit">저장</button>
  </div>
</div>
</body>
</html>
