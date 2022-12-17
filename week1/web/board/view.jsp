<%@ page import="java.sql.*" %>
<%@ page import="web.entity.Notice" %>
<%--
  Created by IntelliJ IDEA.
  User: 정성은
  Date: 2022-12-16
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  String url = "jdbc:mariadb://localhost:3306/list";
  String sql = "select * from freetable where id=?";
  Class.forName("org.mariadb.jdbc.Driver");
  Connection con = DriverManager.getConnection(url, "root", "0000");
  PreparedStatement st = con.prepareStatement(sql);
  st.setInt(1, id);
  ResultSet rs = st.executeQuery();
  rs.next();
  Notice notice = new Notice(
          rs.getInt("id"),
          rs.getString("title"),
          rs.getString("writer"),
          rs.getDate("regDate"),
          rs.getDate("modDate"),
          rs.getInt("views"),
          rs.getString("files"),
          rs.getString("content")
  );
  request.setAttribute("n", notice);
  rs.close();
  st.close();
  con.close();
%>

<html>
<head>
  <title>Title</title>
</head>
<body>
<div class="title">
  <h2>자유게시판 - 목록</h2>
</div>
<div class="container">
  <div class="top-board">
    <div>${n.writer}</div>
    <div>${n.regDate}</div>
    <div>${n.modDate}</div>
  </div>
  <div class="board-title">
    <div><%=rs.getString("cate")%></div>
    <div>${n.title}</div>
  </div>
  <div class="board">
    <div>${n.content}</div>
    <div>첨부파일</div>
    <div>댓글</div>
    <div>댓글 입력</div>
  </div>
  <hr/>
  <div class="bottom-board">
    <div>
      <button type="submit">목록</button>
      <button type="submit">수정</button>
      <button type="submit">삭제</button>
    </div>
    <div>page num</div>
  </div>
</div>
</body>
</html>
