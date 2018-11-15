package cn.deerowl.dao;

import cn.deerowl.model.User;

import java.util.List;

public interface UserMapper {

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    int add(User user);

    /**
     * 获取所有球队
     * @return
     */
    List<User> getAllUsers();
}
