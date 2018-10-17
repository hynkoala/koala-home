package cn.koala.home.controller;

import cn.koala.home.constant.ConstantCommon;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.17
 * Time:23:28
 * Description:
 */
@Controller
@RequestMapping("/album")
public class AlbumController {
    @ResponseBody
    @RequestMapping("/uploadPhoto")
    public String uploadPhoto(@RequestParam(required = false) File photos){
        File album = photos;
        return ConstantCommon.STR_SUCCESS;
    }
}
