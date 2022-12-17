package web.service;

import web.entity.Notice;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FreeListService {
    public List<Notice> getList() {
        return getList("title", "", 1);
    }

    public List<Notice> getList(int page) {
        return getList("title", "", page);
    }

    public List<Notice> getList(String field, String query, int page) {
        List<Notice> list = new ArrayList<>();
        String sql = "select * from (" +
                "select rownum num, n.* " +
                "from (select * from freetable where "+field+"like ? orderby regdate desc) N" +
                ") " +
                "where num between ? and ?";
        String url = "jdbc:mariadb://localhost:3306/list";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "0000");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%"+query+"%");
            st.setInt(2, 1+(page-1) * 10);
            st.setInt(3, page*10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notice notice = new Notice(
                        rs.getInt("id"),
                        rs.getString("cate"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getDate("regDate"),
                        rs.getDate("modDate"),
                        rs.getInt("views"),
                        rs.getInt("files"),
                        rs.getString("content")
                );
                list.add(notice);
            }
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getCount() {
        return getCount("title", "", 1);
    }

    public int getCount(String field, String query, int page) {
        int count = 0;
        String sql = "select count(id) count from (" +
                "select rownum num, n.* " +
                "from (select * from freetable where "+field+"like ? order by regdate desc) N" +
                ") ";
        String url = "jdbc:mariadb://localhost:3306/list";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "0000");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, "%"+query+"%");
            ResultSet rs = st.executeQuery();
            count = rs.getInt("count");
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public Notice getNotice(int id) {
        Notice notice = null;
        String sql = "select * from freetable where id=?";
        String url = "jdbc:mariadb://localhost:3306/list";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "0000");
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                notice = new Notice(
                        rs.getInt("id"),
                        rs.getString("cate"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getDate("regDate"),
                        rs.getDate("modDate"),
                        rs.getInt("views"),
                        rs.getInt("files"),
                        rs.getString("content")
                );
            }
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }

    public Notice getNextNotice(int id) {
        Notice notice = null;
        String sql = "select * from freetable" +
                "where id = ( " +
                "select id from freetable " +
                "where regdate > (select regdate from freetable where id = ?) " +
                "and rownum = 1 " +
                ") ";
        String url = "jdbc:mariadb://localhost:3306/list";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "0000");
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                notice = new Notice(
                        rs.getInt("id"),
                        rs.getString("cate"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getDate("regDate"),
                        rs.getDate("modDate"),
                        rs.getInt("views"),
                        rs.getInt("files"),
                        rs.getString("content")
                );
            }
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }

    public Notice getPrevNotice(int id) {
        Notice notice = null;
        String sql = "select id from (select * from freetable order by regdate desc) " +
                "where regdate < (select regdate from freetable where id=?) " +
                "and rownum = 1";
        String url = "jdbc:mariadb://localhost:3306/list";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "0000");
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                notice = new Notice(
                        rs.getInt("id"),
                        rs.getString("cate"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getDate("regDate"),
                        rs.getDate("modDate"),
                        rs.getInt("views"),
                        rs.getInt("files"),
                        rs.getString("content")
                );
            }
            rs.close();
            st.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }

}
