package cn.koala.home.controller;

import cn.koala.home.constant.LoginAndRegister;
import cn.koala.home.mapper.UserMapper;
import cn.koala.home.model.User;
import cn.koala.home.service.UserService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;

//import org.apache.commons.lang3.StringUtils;
;

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

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user, RedirectAttributes attr) {
        String mappingMark = "register";
        attr.addAttribute("mappingMark", mappingMark);
        String checkUserNameInfo = userService.checkUsernameIsExist(user, mappingMark);
        if (LoginAndRegister.NO_SUCH_USER_NAME.equals(checkUserNameInfo)) {
            String checkInfo = userService.checkInputIsNotNull(user, mappingMark);
            if (LoginAndRegister.PASS_CHECK.equals(checkInfo)) {
                userService.insertUser(user);
                return "home";
            } else {
                attr.addAttribute("checkInfo", checkInfo);
                return "redirect:/user/error";
            }

        } else {
            attr.addAttribute("checkInfo", checkUserNameInfo);
            return "redirect:/user/error";
        }

    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, RedirectAttributes attr) {
        String mappingMark = "login";
        attr.addAttribute("mappingMark", mappingMark);
        String checkInfo = userService.checkInputIsNotNull(user, mappingMark);
        if (LoginAndRegister.PASS_CHECK.equals(checkInfo)) {
            User user1 = userMapper.queryUserByUserName(user.getUserName());
            checkInfo = userService.checkLoginInfo(user, mappingMark, user1);
            if (checkInfo == LoginAndRegister.PASS_CHECK) {
                attr.addAttribute("username", user.getUserName());
                return "redirect:/user/toHome";
            } else {

                attr.addAttribute("checkInfo", checkInfo);
                return "redirect:/user/error";
            }
        }
        attr.addAttribute("checkInfo", checkInfo);
        return "redirect:/user/error";
    }


    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String loginAndRegisterError(@RequestParam String checkInfo,
                                        @RequestParam String mappingMark,
                                        ModelMap map) {
        map.addAttribute("mappingMark", mappingMark);
        if (!StringUtils.isEmpty(checkInfo)) {
            map.addAttribute("errorInfo", checkInfo);
        } else {
            map.addAttribute("errorInfo", checkInfo);
        }
        return "error";
    }

    @RequestMapping(value = "/toHome")
    public String loginHomepage(@RequestParam String username, ModelMap map) {
        if(StringUtils.isBlank(username)){
            username = "guest";
            User user = new User();
            user.setUserName("guest");
            map.addAttribute("list", user);
        }else{
            User user = userMapper.queryUserByUserName(username);
            map.addAttribute("list", user);
        }

        return "home";
    }
    /**
     *@Author: hanyaning
     *@Email: hynkoala@163.com
     *@Date: 2018.08.23
     *@Description: 从前台获取用户输入信息更新用户，并重定向到toMyspace的mapping
     */

    @RequestMapping(value = "/alterUserInfo", method = RequestMethod.POST)
    public String alterUserInfo(RedirectAttributes attr, User user) {
        user.setLastUpdateTime(new Date());
        String username = user.getUserName();
        userMapper.updateUser(user);
        //User newUser = userMapper.queryUserByUserName(username);
        attr.addAttribute("username",user.getUserName());
        return "redirect:/user/toMyspace";
    }

    /**
     *@Author: hanyaning
     *@Email: hynkoala@163.com
     *@Date: 2018.08.23
     *@Description: 通过用户名查到所有用户信息传到前台myspace.ftl页面，返回值类型转为json
     */
    @RequestMapping(value = "/toMyspace")
    public ModelAndView toMyspace(@RequestParam String username) {
        ModelAndView userModel = new ModelAndView();
        userModel.setViewName("ftl/myspace");

        /*JSONObject json = new JSONObject();
        if (username != null && username != "" && !"guest".equals(username)) {
            json=getUserInfo(username);
            userModel.addObject(json);
        } else {
            return null;
        }
        userModel.addObject(json);*/

        return userModel;

    }

    @ResponseBody
    @RequestMapping(value = "/getUserInfo")

    /*public String getUserInfo(@RequestParam String username) {
        List<User> list = new ArrayList();
        list = userMapper.queryUserByUserName(username);
        User user = (User)list.get(0);
        return username; a

    }*/
    public User getUserInfo(@RequestParam String username) {
        JSONObject json = new JSONObject();
        User user = new User();

            if(StringUtils.isNotBlank(username)) {

                user = userMapper.queryUserByUserName(username);
                //1、使用JSONObject
                String jsonstr = JSON.toJSONString(user);
                json = JSON.parseObject(jsonstr);
                //2、使用JSONArray
                //JSONArray array = JSONArray.fromObject(user);
            }else{
                json.fluentPut("errorInfo", "请先登录！");
            }

        return user;

    }

}

