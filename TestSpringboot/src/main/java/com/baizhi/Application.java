package com.baizhi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 组合注解
/*
* @SpringBootApplication相当于
*   @Configuration 声明当前类是配置类
*   @EnableAutoConfiguration 开启自动配置
*   @ComponentScan 开启注解扫描
* */
@SpringBootApplication
@MapperScan(value = "com.baizhi.dao")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class,args);
    }
}
