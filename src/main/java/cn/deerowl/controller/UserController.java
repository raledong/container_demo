package cn.deerowl.controller;

import cn.deerowl.dao.UserMapper;
import cn.deerowl.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController()
@RequestMapping("/user")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserMapper userMapper;

    @GetMapping("/")
    public List<User> getAll(){
        logger.info("返回所有的用户");
        return userMapper.getAllUsers();
    }

    @GetMapping("/add")
    public String add(){
        User user = new User();
        user.setName("rale");
        userMapper.add(user);
        logger.info("添加一个新用户");
        return "添加新用户 rale 至数据库中";
    }
}

