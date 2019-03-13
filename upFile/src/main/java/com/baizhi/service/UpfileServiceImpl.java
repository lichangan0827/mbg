package com.baizhi.service;

import com.baizhi.dao.UpfileMapper;
import com.baizhi.entity.Upfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UpfileServiceImpl implements UpfileService {
    @Autowired
    private UpfileMapper upfileMapper;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Upfile> queryAll() {
        return upfileMapper.selectAll();
    }

    @Override
    public void insert(Upfile u) {
        upfileMapper.insert(u);
    }
}
