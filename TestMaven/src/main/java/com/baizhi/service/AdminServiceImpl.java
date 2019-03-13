package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@Transactional(propagation=Propagation.SUPPORTS)
public class AdminServiceImpl implements  AdminService {
    @Autowired
    private AdminDao adminDao;
    @Override
    public Object login(String usernam, String password) {
        Admin login = adminDao.login(usernam);
        HashMap<String, String> map = new HashMap<String,String>();
        if(login == null){
            map.put("status","300");
            map.put("message","用户名不存在");
            return map;
        }else if(!login.getPassword().equals(password)){
            map.put("status","400");
            map.put("message","密码错误");
            return map;
        }else{
            map.put("status","200");
            map.put("message","登录成功");
            return map;
        }
    }

    @Override
    public void insert(Admin admin) {
        adminDao.insert(admin);
    }
}
