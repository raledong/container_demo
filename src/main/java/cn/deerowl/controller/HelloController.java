package cn.deerowl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;

@Controller
@RequestMapping("/")
public class HelloController {

    @GetMapping("health")
    public String helloWorld() {
        return "hello world!";
    }
}
