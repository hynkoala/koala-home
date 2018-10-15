/*
package cn.koala.home.service.impl;

import cn.koala.home.constant.ConstantUser;
import cn.koala.home.model.User;
import org.apache.commons.lang3.StringUtils;

import java.util.Map;

import static org.apache.commons.codec.digest.DigestUtils.md5Hex;

*/
/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.14
 * Time:1:00
 * Description:
 *//*


public class BaseServiceImpl implements BaseService {
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
                        } else if (!StringUtils.equals(user.getUserPassword(), confirmPassword)) {
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
}
*/
