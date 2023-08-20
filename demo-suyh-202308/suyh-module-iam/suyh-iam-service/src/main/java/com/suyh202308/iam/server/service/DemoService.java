package com.suyh202308.iam.server.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;

@Service
@Slf4j
public class DemoService {
    @Resource
    private DataSource dataSource;

    @PostConstruct
    public void init() {
        log.info("demo service 启动了。");
    }
}
