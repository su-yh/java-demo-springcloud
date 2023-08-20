package com.suyh.common.web.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

@ConfigurationProperties(prefix = SuyhCommonWebProperties.PREFIX)
@Validated
@Data
public class SuyhCommonWebProperties {
    public static final String PREFIX = "suyh2308.common.web";

    private boolean enabled = true;
}
