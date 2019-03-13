package com.baizhi.service;

import com.baizhi.entity.Upfile;

import java.util.List;

public interface UpfileService {
    //展示所有
    List<Upfile> queryAll();
    //上传
    void insert(Upfile u);

}
