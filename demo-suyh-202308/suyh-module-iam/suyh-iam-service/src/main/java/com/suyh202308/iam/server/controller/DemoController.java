package com.suyh202308.iam.server.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class DemoController {
    @RequestMapping("/tmp")
    public String tmp(@RequestParam("exp") Boolean exp) {
        if (exp) {
            throw new RuntimeException("test exception.");
        }
        return "OK";
    }
}
