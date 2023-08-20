package com.suyh202308.iam.server.config;

import com.suyh202308.iam.server.config.properties.SuyhIamServerProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@EnableConfigurationProperties(SuyhIamServerProperties.class)
@Configuration(proxyBeanMethods = false)
public class SuyhIamServerConfiguration {
}
