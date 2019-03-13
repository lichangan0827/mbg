package com.baizhi;

import com.baizhi.dao.UpfileMapper;
import com.baizhi.entity.Upfile;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UpfileApplicationTests {
    @Autowired
    private UpfileMapper upfileMapper;
    @Test
    public void contextLoads() {
        Upfile u = new Upfile();
        u.setId("212121");
        u.setUrl("sdlkgjhfijdfhgjsdaikfgh");
        u.setUsername("sasasa");
        upfileMapper.insert(u);
    }
    @Test
    public void contextLoads1() {
        List<Upfile> upfiles = upfileMapper.selectAll();
        for (Upfile upfile : upfiles) {
            System.out.println(upfile);
        }
    }
}
