package cn.koala.home.model;

import java.util.Date;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.15
 * Time:23:09
 * Description:
 */
public class Diary {
    private String diaryId;//
    private String diaryTitle;//
    private String diaryContent;//
    private Date writeTime;

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"diaryId\":\"")
                .append(diaryId).append('\"');
        sb.append(",\"diaryTitle\":\"")
                .append(diaryTitle).append('\"');
        sb.append(",\"diaryContent\":\"")
                .append(diaryContent).append('\"');
        sb.append(",\"writeTime\":\"")
                .append(writeTime).append('\"');
        sb.append('}');
        return sb.toString();
    }

    public String getDiaryId() {
        return diaryId;
    }

    public void setDiaryId(String diaryId) {
        this.diaryId = diaryId;
    }

    public String getDiaryTitle() {
        return diaryTitle;
    }

    public void setDiaryTitle(String diaryTitle) {
        this.diaryTitle = diaryTitle;
    }

    public String getDiaryContent() {
        return diaryContent;
    }

    public void setDiaryContent(String diaryContent) {
        this.diaryContent = diaryContent;
    }

    public Date getWriteTime() {
        return writeTime;
    }

    public void setWriteTime(Date writeTime) {
        this.writeTime = writeTime;
    }
}
