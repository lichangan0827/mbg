package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    //登录
    public Object login(String usernam,String password);
    //注册
    public void insert(Admin admin);
}
