package cn.koala.home.controller;

import cn.koala.home.mapper.VisitorBookMapper;
import cn.koala.home.model.VisitorBook;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.13
 * Time:11:08
 * Description:
 */
@Controller
@RequestMapping("/visitorBook")
public class VisitorBookController {
    @Autowired
    VisitorBookMapper visitorBookMapper;

    @ResponseBody
    @RequestMapping("/saveMessage")
    public String saveMessage(String userName, String visitorMessage) {
        String msg = "失败！";
        if (StringUtils.isNotBlank(visitorMessage)) {
            VisitorBook newMessage = new VisitorBook();
            newMessage.setBookId(UUID.randomUUID().toString().replace("-", "1"));
            newMessage.setBookContent(visitorMessage);
            newMessage.setUserName(userName);
            newMessage.setWriteTime(new Date());
            visitorBookMapper.insertVisitorMessage(newMessage);
            msg = "success!";
        }
        return msg;
    }

    @ResponseBody
    @RequestMapping("/showHistory")
    public List<VisitorBook> showHistory() {
        List<VisitorBook> bookList = new ArrayList<>();
        bookList = visitorBookMapper.getHistoryBook();
        return bookList;
    }
}
