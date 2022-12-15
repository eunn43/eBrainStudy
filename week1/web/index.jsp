<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String url = "jdbc:mariadb://localhost:3306/list";
  String sql = "select * from freetable";
  Class.forName("org.mariadb.jdbc.Driver");
  Connection con = DriverManager.getConnection(url, "root", "0000");
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery(sql);


%>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <link rel="stylesheet" href="list.css">
  <div class="title">
    <h2>자유게시판 - 목록</h2>
  </div>
  <div class="container">
    <div class="search-table">
      <p>등록일</p>
      <input type="date">
      <p>~</p>
      <input type="date">
      <select name="category">
        <option value="none">전체 카테고리</option>
      </select>
      <input id="search" type="search" placeholder="검색어를 입력해주세요. (제목+작성자+내용)">
      <button type="submit">검색</button>
    </div>
    <div clasee="top-board">
      <p>총 n건</p>
    </div>
    <div class="board-table">
      <table class="table">
        <thead>
        <tr>
          <th scope="col" class="th-cate">카테고리</th>
          <th scope="col" class="th-file"></th>
          <th scope="col" class="th-titile">제목</th>
          <th scope="col" class="th-writer">작성자</th>
          <th scope="col" class="th-views">조회수</th>
          <th scope="col" class="th-date-up">등록일시</th>
          <th scope="col" class="th-date-co">수정일시</th>
        </tr>
        </thead>
        <tbody>
        <% while(rs.next()) {%>
        <tr>
          <td><%=rs.getString("cate")%></td>
          <td>o</td>
          <th>
            <a href="#!">OKKY 3월 세미나 서ㅣ슷 개발자로 커리어 전환하기 by ...</a>
          </th>
          <td><%=rs.getString("writer")%></td>
          <td><%=rs.getInt("views")%></td>
          <td><%=rs.getDate("registdate")%></td>
          <td><%=rs.getDate("modifydate")%></td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <div class="table-pager">

    </div>
    <div class="bottom-board">
      <button type="submit">등록</button>
    </div>
  </div>
  </body>
</html>
<%
  rs.close();
  st.close();
  con.close();
%>
