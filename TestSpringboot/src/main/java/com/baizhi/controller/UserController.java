package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/queryAll")
    public List<Admin> queryAll(){
        List<Admin> admins = userService.queryAll();
        return admins;
    }
}
