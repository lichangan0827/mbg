package com.baizhi.dao;

import java.util.List;

public interface BaseDao<T> {
    List<T> queryAll();
    void insert(T t);
    void update(T t);
    void delete(String id);
}
