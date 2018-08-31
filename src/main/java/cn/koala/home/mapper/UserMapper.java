package cn.koala.home.mapper;

import cn.koala.home.model.User;
import org.springframework.stereotype.Repository;

/**
 * Created by user
 * Email:hynkoala@163.com
 * Date: 2018.07.19
 * Time:17:02
 * Description:
 */
@Repository
public interface UserMapper {

    void insertUser(User user);

    /**
     * @Author:Hanyaning
     * @Email:hynkoala@163.com
     * @Date:2018.07.20
     * @Param:[username]
     * @Return:
     */
    User queryUserByUserName(String username);

    void updateUser(User user);
}
