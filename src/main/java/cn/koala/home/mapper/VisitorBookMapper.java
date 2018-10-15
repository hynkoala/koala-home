package cn.koala.home.mapper;

import cn.koala.home.model.VisitorBook;

import java.util.List;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.13
 * Time:11:20
 * Description:
 */
public interface VisitorBookMapper {
    void insertVisitorMessage(VisitorBook book);

    List<VisitorBook> getHistoryBook();
}
