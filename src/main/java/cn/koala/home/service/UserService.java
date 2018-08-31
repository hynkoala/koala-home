package cn.koala.home.service;

import cn.koala.home.model.User;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:16:55
 * Description:
 */
public interface UserService {
    void insertUser(User user);

    String checkLoginInfo(User user, String mappingMark, User user1);

    String checkUsernameIsExist(User user, String mappingMark);

    String checkInputIsNotNull(User user, String mappingMark);
}
