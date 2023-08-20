package com.suyh.common.web.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suyh.common.web.config.properties.SuyhCommonWebProperties;
import com.suyh.common.web.mvc.configurer.SuyhWebMvcConfigurer;
import com.suyh.common.web.mvc.error.SuyhErrorAttributes;
import com.suyh.common.web.mvc.response.SuyhResponseBodyAdvice;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@EnableConfigurationProperties(SuyhCommonWebProperties.class)
@Configuration(proxyBeanMethods = false)
public class SuyhCommonWebConfiguration {

    @ConditionalOnMissingBean
    @Bean
    public SuyhWebMvcConfigurer suyhWebMvcConfigurer() {
        return new SuyhWebMvcConfigurer();
    }

    @ConditionalOnMissingBean
    @Bean
    public SuyhErrorAttributes suyhErrorAttributes() {
        return new SuyhErrorAttributes();
    }

    @ConditionalOnBean(ObjectMapper.class)
    @ConditionalOnMissingBean
    @Bean
    public SuyhResponseBodyAdvice suyhResponseBodyAdvice(ObjectMapper objectMapper) {
        return new SuyhResponseBodyAdvice(objectMapper);
    }
}
