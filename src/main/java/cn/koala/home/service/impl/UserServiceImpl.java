package cn.koala.home.service.impl;

import cn.koala.home.constant.ConstantUser;
import cn.koala.home.mapper.UserMapper;
import cn.koala.home.model.User;
import cn.koala.home.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

import static org.apache.commons.codec.digest.DigestUtils.md5Hex;


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
    public String checkPassword(User user, String mappingMark, User localUser) {
        String checkInfo = "";
        String userPassword = user.getUserPassword();
        if (localUser.getUserPassword().equals(userPassword)) {
            checkInfo = ConstantUser.PASS_CHECK;
        } else {
            checkInfo = ConstantUser.PASSWORD_ERROR;
        }
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
            checkInfo = ConstantUser.USERNAME_EXIST;
        } else {
            checkInfo = ConstantUser.NO_SUCH_USER_NAME;
        }

        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.04
     * @Description: 登录和注册时检查用户名密码等信息不可为空
     */
    /*@Override
    public String checkInputData(User user, String mappingMark) {
        String checkInfo = "";
        if (user.getUserName() != null && user.getUserName().length() > 0) {
            if (user.getUserPassword() != null && user.getUserPassword().length() > 0) {
                // 注册时额外验证邮箱和密码提示不能为空
                if ("register".equals(mappingMark)) {
                    if (user.getUserEmail() != null && user.getUserEmail().length() > 0) {
                        if (user.getPasswordHint() != null && user.getPasswordHint() != "") {
                            checkInfo = ConstantUser.PASS_CHECK;
                            return checkInfo;
                        } else {
                            checkInfo = ConstantUser.PASSWORD_HINT_NOT_EXIST;
                            return checkInfo;
                        }
                    }
                    checkInfo = ConstantUser.EMAIL_NOT_EXIST;
                    return checkInfo;
                }else if(StringUtils.equals(mappingMark,ConstantUser.MAPPING_ALTER_PASSWORD)){

                }
                checkInfo = ConstantUser.PASS_CHECK;
                return checkInfo;

            } else {
                checkInfo = ConstantUser.PASSWORD_NOT_EXIST;
                return checkInfo;
            }
        }
        checkInfo = ConstantUser.USERNAME_NOT_EXIST;
        return checkInfo;


    }*/
    @Override
    public String checkInputData(Map inputMap, String mappingMark) {
        String checkInfo = null;
        if (StringUtils.isNotBlank(mappingMark)) {
            User user = (User) inputMap.get("user");
            User localUser = null;
            if (StringUtils.equals(mappingMark, ConstantUser.MAPPING_LOGIN)) {
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = ConstantUser.USERNAME_NOT_EXIST;
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser == null) {
                        checkInfo = ConstantUser.NO_SUCH_USER_NAME;
                    } else if (StringUtils.isBlank(user.getUserPassword())) {
                        checkInfo = ConstantUser.PASSWORD_NOT_EXIST;
                    } else if (!StringUtils.equals(localUser.getUserPassword(), md5Hex(user.getUserPassword()))) {
                        checkInfo = ConstantUser.PASSWORD_ERROR;
                    } else {
                        checkInfo = ConstantUser.PASS_CHECK;
                    }
                }
            } else if (StringUtils.equals(mappingMark, ConstantUser.MAPPING_REGISTER)) {
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = ConstantUser.USERNAME_NOT_EXIST;
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser != null) {
                        checkInfo = ConstantUser.USERNAME_EXIST;
                    } else if (StringUtils.isBlank(user.getUserPassword())) {
                        checkInfo = ConstantUser.PASSWORD_NOT_EXIST;
                    } else if (StringUtils.isBlank(user.getUserEmail())) {
                        checkInfo = ConstantUser.EMAIL_NOT_EXIST;
                    } else if (StringUtils.isBlank(user.getPasswordHint())) {
                        checkInfo = ConstantUser.PASSWORD_HINT_NOT_EXIST;
                    } else {
                        checkInfo = ConstantUser.PASS_CHECK;
                    }
                }
            } else if (StringUtils.equals(mappingMark, ConstantUser.MAPPING_ALTER_PASSWORD)) {
                String confirmPassword = inputMap.get("confirmPassword").toString();
                if (StringUtils.isBlank(user.getUserName())) {
                    checkInfo = "用户名跑丢了！";
                } else {
                    localUser = userMapper.queryUserByUserName(user.getUserName());
                    if (localUser != null) {
                        if (StringUtils.isBlank(user.getUserPassword())) {
                            checkInfo = ConstantUser.PASSWORD_NOT_EXIST;
                        } else if (StringUtils.isBlank(confirmPassword)) {
                            checkInfo = ConstantUser.CONFIRM_PASSWORD_NOT_EXIST;
                        } else if (StringUtils.equals(user.getUserPassword(), confirmPassword)) {
                            checkInfo = ConstantUser.PASSWORD_NOT_EQUAL;
                        } else {
                            checkInfo = ConstantUser.PASS_CHECK;
                        }
                    }
                }
            }
        }
        return checkInfo;
    }

    @Override
    public void registerUser(User user) {
        if (user != null) {
            user.setRegTime(new Date());
            user.setLastUpdateTime(new Date());
            user.setLastLoginTime(new Date());
            user.setUserId(UUID.randomUUID().toString().replace("-", "1"));
            //对密码进行加密
            user.setUserPassword(md5Hex(user.getUserPassword()));
            userMapper.insertUser(user);
        }
    }
}
