package cn.koala.home.service.impl;

import cn.koala.home.constant.LoginAndRegister;
import cn.koala.home.mapper.UserMapper;
import cn.koala.home.model.User;
import cn.koala.home.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;


/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:16:59
 * Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * @Author:Hanyaning
     * @Email:hynkoala@163.com
     * @Date:2018.07.19
     * @Description:用户注册
     */
    @Override
    public void insertUser(User user) {
        user.setLastUpdateTime(new Date());
        user.setRegTime(new Date());
        user.setUserId(UUID.randomUUID().toString().replace("-", "1"));
        userMapper.insertUser(user);

    }

    /**
     * @Author:Hanyaning
     * @Email:hynkoala@163.com
     * @Date:2018.07.19
     * @Description:用户登录验证
     */
    @Override
    public String checkLoginInfo(User user, String mappingMark, User user1) {
        String checkInfo = "";
        String username = user.getUserName();
        String userPassword = user.getUserPassword();
        if (StringUtils.isNotBlank(user1.getUserName())) {
            if (user1.getUserPassword().equals(userPassword)) {
                //验证成功
                checkInfo = LoginAndRegister.PASS_CHECK;
                return checkInfo;
            } else {
                // 密码不正确
                checkInfo = LoginAndRegister.PASSWORD_ERROR;
                return checkInfo;
            }
        }
        checkInfo = LoginAndRegister.NO_SUCH_USER_NAME;
        return checkInfo;


    }


    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.04
     * @Param: [newUsername]
     * @Return: 验证结果
     * @Description: 用户注册时验证用户名是否已经存在
     */
    @Override
    public String checkUsernameIsExist(User newUser, String mappingMark) {
        String checkInfo = "";
        String newUsername = newUser.getUserName();
        User user = userMapper.queryUserByUserName(newUsername);
        // 注册时验证，判断用户名是否已经存在
        if (user != null) {
            checkInfo = LoginAndRegister.USERNAME_EXIST;
        } else {
            checkInfo = LoginAndRegister.NO_SUCH_USER_NAME;
        }

        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.04
     * @Description: 登录和注册时检查用户名密码等信息不可为空
     */
    @Override
    public String checkInputIsNotNull(User user, String mappingMark) {
        String checkInfo = "";
        if (user.getUserName() != null && user.getUserName().length() > 0) {
            if (user.getUserPassword() != null && user.getUserPassword().length() > 0) {
                // 注册时额外验证邮箱和密码提示不能为空
                if ("register".equals(mappingMark)) {
                    if (user.getUserEmail() != null && user.getUserEmail().length() > 0) {
                        if (user.getPasswordHint() != null && user.getPasswordHint() != "") {
                            checkInfo = LoginAndRegister.PASS_CHECK;
                            return checkInfo;
                        } else {
                            checkInfo = LoginAndRegister.PASSWORD_HINT_NOT_EXIST;
                            return checkInfo;
                        }
                    }
                    checkInfo = LoginAndRegister.EMAIL_NOT_EXIST;
                    return checkInfo;
                }
                checkInfo = LoginAndRegister.PASS_CHECK;
                return checkInfo;

            } else {
                checkInfo = LoginAndRegister.PASSWORD_NOT_EXIST;
                return checkInfo;
            }
        }
        checkInfo = LoginAndRegister.USERNAME_NOT_EXIST;
        return checkInfo;


    }
}
