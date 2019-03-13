package com.baizhi.test;

import com.baizhi.Application;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestAdmin {
    @Autowired
    private UserDao userDao;
    @Test
    public void test1(){
        List<Admin> admins = userDao.queryAll();
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }
}
