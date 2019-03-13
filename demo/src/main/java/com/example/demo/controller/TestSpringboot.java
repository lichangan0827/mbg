package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/testSpringboot")
public class TestSpringboot {
    @RequestMapping("/text")
    public String test(){
        return "success ";
    }
}
