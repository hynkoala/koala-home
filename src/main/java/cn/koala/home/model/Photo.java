package cn.koala.home.model;

import java.util.Date;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.18
 * Time:22:36
 * Description:
 */
public class Photo {

    private String photoId;//
    private String photoName;//
    private String photoNewName;//
    private String photoPath;//
    private String photoComment;//
    private Date uploadTime;//

    public String getPhotoId() {
        return photoId;
    }

    public void setPhotoId(String photoId) {
        this.photoId = photoId;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getPhotoNewName() {
        return photoNewName;
    }

    public void setPhotoNewName(String photoNewName) {
        this.photoNewName = photoNewName;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getPhotoComment() {
        return photoComment;
    }

    public void setPhotoComment(String photoComment) {
        this.photoComment = photoComment;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
}
