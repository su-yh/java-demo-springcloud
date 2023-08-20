package com.suyh.common.web.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suyh.common.web.config.properties.SuyhCommonWebProperties;
import com.suyh.common.web.mvc.configurer.SuyhWebMvcConfigurer;
import com.suyh.common.web.mvc.error.SuyhErrorAttributes;
import com.suyh.common.web.mvc.response.SuyhResponseBodyAdvice;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.context.annotation.Bean;

@EnableConfigurationProperties(SuyhCommonWebProperties.class)
@AutoConfiguration(before = ErrorMvcAutoConfiguration.class)
public class SuyhCommonWebAutoConfiguration {

    @ConditionalOnMissingBean
    @Bean
    public SuyhWebMvcConfigurer suyhWebMvcConfigurer() {
        return new SuyhWebMvcConfigurer();
    }

    // 如果不控制ErrorMvcAutoConfiguration 的优先级，这里就创建不出来。
    @ConditionalOnMissingBean
    @Bean
    public ErrorAttributes errorAttributes() {
        return new SuyhErrorAttributes();
    }

    @ConditionalOnBean(ObjectMapper.class)
    @ConditionalOnMissingBean
    @Bean
    public SuyhResponseBodyAdvice suyhResponseBodyAdvice(ObjectMapper objectMapper) {
        // TODO: suyh - 这里没有运行，也就是说没有ObjectMapper 的bean 对象
        return new SuyhResponseBodyAdvice(objectMapper);
    }
}
