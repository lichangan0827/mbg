package com.baizhi.test;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring_core.xml")
public class AdminTest {
    @Autowired
    private AdminDao adminDao;
    @Test
    public void test0(){
        Admin login = adminDao.login("123@qq.com");
        System.out.println(login);
    }
}
