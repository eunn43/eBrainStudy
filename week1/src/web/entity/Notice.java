package web.entity;

import java.io.StringWriter;
import java.util.Date;

public class Notice {
    private int     id;
<<<<<<< HEAD
    private String  cate;
=======
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
    private String  title;
    private String  writer;
    private Date    regDate;
    private Date    modDate;
    private int     views;
<<<<<<< HEAD
    private int     files;
=======
    private String  files;
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
    private String  content;

    public Notice() {
    }

<<<<<<< HEAD
    public Notice(int id, String cate, String title, String writer, Date regDate, Date modDate, int views, int files, String content) {
        this.id = id;
        this.cate = cate;
=======
    public Notice(int id, String title, String writer, Date regDate, Date modDate, int views, String files, String content) {
        this.id = id;
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
        this.title = title;
        this.writer = writer;
        this.regDate = regDate;
        this.modDate = modDate;
        this.views = views;
        this.files = files;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

<<<<<<< HEAD
    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

=======
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriterId() {
        return writer;
    }

    public void setWriterId(String writerId) {
        this.writer = writerId;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getModDate() {
        return modDate;
    }

    public void setModDate(Date modDate) {
        this.modDate = modDate;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

<<<<<<< HEAD
    public int getFiles() {
        return files;
    }

    public void setFiles(int files) {
=======
    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
>>>>>>> 3b3cde11c77624bd98db9eeb836b392d2f85d518
        this.files = files;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", writerId='" + writer + '\'' +
                ", regDate='" + regDate + '\'' +
                ", modDate='" + modDate + '\'' +
                ", views='" + views + '\'' +
                ", files='" + files + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
