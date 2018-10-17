package cn.koala.home.mapper;

import cn.koala.home.model.Diary;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.15
 * Time:23:08
 * Description:
 */
@Repository
public interface DiaryMapper {

    List<Diary> getDiary(Map map);

    void addDiary(Diary diary);
}
