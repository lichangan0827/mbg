package com.baizhi.entity;

import lombok.Data;

import java.io.Serializable;
//使lomBok自动生成实体类的setget、有参无参等一些方法
@Data
public class Admin implements Serializable {
    private String id;
    private String username;
    private String password;

}
