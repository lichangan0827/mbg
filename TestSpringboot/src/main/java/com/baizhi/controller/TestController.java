package com.baizhi.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/text")
public class TestController {
    @RequestMapping("/text")
    public String test(){
        return "succe";
    }
}
