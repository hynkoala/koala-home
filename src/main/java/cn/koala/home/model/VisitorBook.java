package cn.koala.home.model;

import java.util.Date;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.13
 * Time:11:08
 * Description:
 */
public class VisitorBook {
    private String bookId;//
    private String userName;//
    private String bookContent;//
    private Date writeTime;

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getBookContent() {
        return bookContent;
    }

    public void setBookContent(String bookContent) {
        this.bookContent = bookContent;
    }

    public Date getWriteTime() {
        return writeTime;
    }

    public void setWriteTime(Date writeTime) {
        this.writeTime = writeTime;
    }
}
