package cn.koala.home.mapper;

import cn.koala.home.model.Photo;
import org.springframework.stereotype.Repository;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.18
 * Time:23:45
 * Description:
 */
@Repository
public interface PhotoMapper {
    void savePhoto(Photo photo);
}
