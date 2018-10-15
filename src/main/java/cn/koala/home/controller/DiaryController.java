package cn.koala.home.controller;

import cn.koala.home.mapper.DiaryMapper;
import cn.koala.home.model.Diary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.15
 * Time:23:07
 * Description:
 */
@Controller
@RequestMapping("/diary")
public class DiaryController {
    @Autowired
    DiaryMapper diaryMapper;

    @ResponseBody
    @RequestMapping("/getDiary")
    public List<Diary> DiaryController(@RequestParam(required = false) String inputData) {


        return diaryMapper.getDiary(inputData);
    }

    @ResponseBody
    @RequestMapping("/addDiary")
    public String addDiary(Diary diary) {
        diary.setDiaryId(UUID.randomUUID().toString().replace("-", "1"));
        diary.setWriteTime(new Date());
        diaryMapper.addDiary(diary);
        return "success";
    }
}
