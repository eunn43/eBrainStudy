
<%@ page import="web.service.FreeListService" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="web.entity.Notice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<<<<<<< HEAD

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
<%
//  FreeListService service = new FreeListService();
//  List<Notice> list = service.getList();
  String url = "jdbc:mariadb://localhost:3306/list";
  String sql = "select * from freetable";
  Class.forName("org.mariadb.jdbc.Driver");
  Connection con = DriverManager.getConnection(url, "root", "0000");
  Statement st = (Statement) con.createStatement();
  ResultSet rs = st.executeQuery(sql);
<<<<<<< HEAD
=======

>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
  List<Notice> list = new ArrayList<>();
  while(rs.next()) {
    Notice notice = new Notice(
            rs.getInt("id"),
<<<<<<< HEAD
            rs.getString("cate"),
=======
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
            rs.getString("title"),
            rs.getString("writer"),
            rs.getDate("regDate"),
            rs.getDate("modDate"),
            rs.getInt("views"),
<<<<<<< HEAD
            rs.getInt("files"),
=======
            rs.getString("files"),
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
            rs.getString("content")
    );
    list.add(notice);
  }
<<<<<<< HEAD
  request.setAttribute("list", list);
=======

  request.setAttribute("list", list);

>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
  rs.close();
  st.close();
  con.close();
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
  <div class="top-board">
    <p>총 n건</p>
  </div>
<<<<<<< HEAD
  <div class="board-table">
    <table class="table">
      <thead>
      <tr>
        <th scope="col" class="th-cate">카테고리</th>
        <th scope="col" class="th-file"></th>
        <th scope="col" class="th-title">제목</th>
        <th scope="col" class="th-writer">작성자</th>
        <th scope="col" class="th-views">조회수</th>
        <th scope="col" class="th-date-up">등록일시</th>
        <th scope="col" class="th-date-co">수정일시</th>
      </tr>
      </thead>
      <tbody>
      <%
        List<Notice> lst = (List<Notice>) request.getAttribute("list");
        for(Notice n : lst) {
          pageContext.setAttribute("n", n);
      %>
      <tr>
        <td>${n.cate}</td>
        <td></td> //file image
        <th>
          <a href="view.jsp?id=${n.id}>">${n.title}</a>
        </th>
        <td>${n.writer}</td>
        <td>${n.views}</td>
        <td>${n.regDate}</td>
        <td>${n.modDate}</td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
  <div class="table-pager">
=======
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
    <div class="top-board">
      <p>총 n건</p>
    </div>
    <div class="board-table">
      <table class="table">
        <thead>
        <tr>
          <th scope="col" class="th-cate">카테고리</th>
          <th scope="col" class="th-file"></th>
          <th scope="col" class="th-title">제목</th>
          <th scope="col" class="th-writer">작성자</th>
          <th scope="col" class="th-views">조회수</th>
          <th scope="col" class="th-date-up">등록일시</th>
          <th scope="col" class="th-date-co">수정일시</th>
        </tr>
        </thead>
        <tbody>
        <%
          List<Notice> lst = (List<Notice>) request.getAttribute("list");
          for(Notice n : lst) {
            pageContext.setAttribute("n", n);
        %>
        <tr>
          <td><%=rs.getString("cate")%></td>
          <td></td> //file image
          <th>
            <a href="view.jsp?id=${n.id}>">${n.title}</a>
          </th>
          <td>${n.writer}</td>
          <td>${n.views}</td>
          <td>${n.regDate}</td>
          <td>${n.modDate}</td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <div class="table-pager">
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518

  </div>
  <div class="bottom-board">
    <button type="submit">등록</button>
  </div>
</div>
</body>
</html>
