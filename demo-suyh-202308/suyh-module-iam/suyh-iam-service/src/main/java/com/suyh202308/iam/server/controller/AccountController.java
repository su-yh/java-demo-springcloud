package com.suyh202308.iam.server.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/account")
@Slf4j
public class AccountController {
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public void registerAccount() {

    }
}
