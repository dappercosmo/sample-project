package com.sample.actions.sample.controller;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/person")
public class PersonController {

    @GetMapping
    public String hello(){
        return "hello world";
    }
}
