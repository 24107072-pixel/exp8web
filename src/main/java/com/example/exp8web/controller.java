package com.example.exp8web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/")
public class controller {
    @GetMapping
    public String hello() {
        return "hello";
    }
}
