package cn.koala.home.controller;

import cn.koala.home.constant.ConstantUser;
import cn.koala.home.mapper.DiaryMapper;
import cn.koala.home.mapper.UserMapper;
import cn.koala.home.model.Diary;
import cn.koala.home.model.User;
import cn.koala.home.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hanyaning
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:16:42
 * Description:用户的注册和登录
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DiaryMapper diaryMapper;

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.29
     * @Param: [user]
     * @Return: java.lang.String
     * @Description: 用户注册
     */
    @ResponseBody
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user) {
        String mappingMark = ConstantUser.MAPPING_REGISTER;
        Map<Object, Object> inputMap = new HashMap();
        inputMap.put("user", user);
        String checkInfo = userService.checkInputData(inputMap, mappingMark);
        if (checkInfo == ConstantUser.PASS_CHECK) {
            userService.registerUser(user);
        }
        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @Param: [user, attr]
     * @Return:
     * @Description: 用户登录
     */
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user) {
        String mappingMark = ConstantUser.MAPPING_LOGIN;
        Map inputMap = new HashMap();
        inputMap.put("user", user);
        String checkInfo = userService.checkInputData(inputMap, mappingMark);
        if (StringUtils.equals(checkInfo, ConstantUser.PASS_CHECK)) {
            user.setLastLoginTime(new Date());
            userMapper.updateLoginTime(user);
        }
        return checkInfo;
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.09.17
     * @Param: [userName, map]
     * @Return:
     * @Description: 返回主页
     */
    @RequestMapping(value = "/toHome")
    public String loginHomepage(@RequestParam String userName, ModelMap modelMap) {
        User user = null;
        if (StringUtils.isBlank(userName)) {
            user = userMapper.queryUserByUserName("guest");
        } else {
            user = userMapper.queryUserByUserName(userName);
        }
        Map<String, String> map = new HashMap();
        List<Diary> dailyList = diaryMapper.getDiary(map);
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("diaryList", dailyList);
        return "home";
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.23
     * @Description: 从前台获取用户输入信息更新用户，并重定向到toMyspace的mapping
     */
    @ResponseBody
    @RequestMapping(value = "/alterUserInfo", method = RequestMethod.POST)
    public void alterUserInfo(User user) {
        user.setLastUpdateTime(new Date());
        String userName = user.getUserName();
        userMapper.updateUser(user);
    }

    /**
     * @Author: hanyaning
     * @Email: hynkoala@163.com
     * @Date: 2018.08.23
     * @Description: 通过用户名查到所有用户信息传到前台myspace.ftl页面，返回值类型转为json
     */
    @RequestMapping(value = "/toMyspace")
    public String toMyspace(@RequestParam String userName) {
        return "myspace";
    }

    @ResponseBody
    @RequestMapping(value = "/getUserInfo")
    public List<User> getUserInfo(User user, String userName) {
        Map map = new HashMap();
        map.put("userName", userName);
        List<User> userList = userMapper.queryUsers(map);
        return userList;
    }

    @ResponseBody
    @RequestMapping(value = "/alterPassword")
    public String alterPassword(User user, String userPassword, String confirmPassword) {
        String mappingMark = ConstantUser.MAPPING_ALTER_PASSWORD;
        Map inputMap = new HashMap();
        inputMap.put("user", user);
        inputMap.put("confirmPassword", confirmPassword);
        String checkInfo = userService.checkInputData(inputMap, mappingMark);
        if (StringUtils.equals(checkInfo, ConstantUser.PASS_CHECK)) {
            user.setUserPassword(DigestUtils.md5Hex(confirmPassword));
            userMapper.alterPassword(user);
            return ConstantUser.SUCCESS;
        }
        return checkInfo;
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public String deleteUser(String userIds) {
        String msg = "error";
        userService.mulDeleteUsers(userIds);
        return msg;
    }
}

