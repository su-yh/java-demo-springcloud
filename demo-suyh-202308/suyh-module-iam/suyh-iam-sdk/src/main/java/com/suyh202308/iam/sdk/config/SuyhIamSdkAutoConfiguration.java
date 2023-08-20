package com.suyh202308.iam.sdk.config;

import com.suyh202308.iam.sdk.config.properties.SuyhIamSdkProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@EnableConfigurationProperties(SuyhIamSdkProperties.class)
@Configuration(proxyBeanMethods = false)
public class SuyhIamSdkAutoConfiguration {

}
