package cn.deerowl.controller;

import cn.deerowl.dao.UserMapper;
import cn.deerowl.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController()
@RequestMapping("/user")
public class HelloWorldController{

    @Autowired
    private UserMapper userMapper;

    @GetMapping("/")
    public List<User> getAll(){
        return userMapper.getAllUsers();
    }

    @GetMapping("/add")
    public String add(){
        User user = new User();
        user.setName("rale");
        userMapper.add(user);
        return "添加新用户 rale 至数据库中";
    }
}

