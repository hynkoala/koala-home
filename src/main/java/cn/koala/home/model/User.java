package cn.koala.home.model;

import java.util.Date;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:17:12
 * Description:
 */
public class User {
    private String userId;
    private String userName;
    private String userPassword;
    private String userTrueName;
    private String userEmail;
    private String userPhone;
    private String userSex;
    private Integer userAge;
    private Date regTime;
    private Date lastUpdateTime;
    private String passwordHint;
    private Date lastLoginTime;
    private String adminId;

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"userId\":\"")
                .append(userId).append('\"');
        sb.append(",\"userName\":\"")
                .append(userName).append('\"');
        sb.append(",\"userPassword\":\"")
                .append(userPassword).append('\"');
        sb.append(",\"userTrueName\":\"")
                .append(userTrueName).append('\"');
        sb.append(",\"userEmail\":\"")
                .append(userEmail).append('\"');
        sb.append(",\"userPhone\":\"")
                .append(userPhone).append('\"');
        sb.append(",\"userSex\":\"")
                .append(userSex).append('\"');
        sb.append(",\"userAge\":")
                .append(userAge);
        sb.append(",\"regTime\":\"")
                .append(regTime).append('\"');
        sb.append(",\"lastUpdateTime\":\"")
                .append(lastUpdateTime).append('\"');
        sb.append(",\"passwordHint\":\"")
                .append(passwordHint).append('\"');
        sb.append(",\"lastLoginTime\":\"")
                .append(lastLoginTime).append('\"');
        sb.append(",\"adminId\":\"")
                .append(adminId).append('\"');
        sb.append('}');
        return sb.toString();
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserTrueName() {
        return userTrueName;
    }

    public void setUserTrueName(String userTrueName) {
        this.userTrueName = userTrueName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getPasswordHint() {
        return passwordHint;
    }

    public void setPasswordHint(String passwordHint) {
        this.passwordHint = passwordHint;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
}
