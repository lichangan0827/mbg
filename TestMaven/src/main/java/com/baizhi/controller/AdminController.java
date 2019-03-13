package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    @ResponseBody
    public Object login(String username, String password, HttpSession session){
        Map<String,String> map = (Map<String,String>)adminService.login(username, password);
        //判断是否存在 若存在则存到Session中
        if(map.get("status").equals("200")){
                session.setAttribute("username",username);
        }
        return map;
    }
    @RequestMapping("/insert")
    public void insert(Admin admin){
        String s = UUID.randomUUID().toString();
        admin.setId(s);
         adminService.insert(admin);
    }
}
