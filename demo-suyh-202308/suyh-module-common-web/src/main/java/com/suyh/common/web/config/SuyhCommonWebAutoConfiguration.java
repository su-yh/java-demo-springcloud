package com.suyh.common.web.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.suyh.common.web.config.properties.SuyhCommonWebProperties;
import com.suyh.common.web.mvc.configurer.SuyhWebMvcConfigurer;
import com.suyh.common.web.mvc.error.SuyhErrorAttributes;
import com.suyh.common.web.mvc.response.SuyhResponseBodyAdvice;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.context.annotation.Bean;

@ConditionalOnProperty(value = "suyh2308.common.web.enabled", havingValue = "true", matchIfMissing = true)
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

    @ConditionalOnMissingBean
    @Bean
    public SuyhResponseBodyAdvice suyhResponseBodyAdvice(ObjectMapper objectMapper) {
        return new SuyhResponseBodyAdvice(objectMapper);
    }
}
