package com.suyh202308.iam.server.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = SuyhIamServerProperties.PREFIX)
@Data
public class SuyhIamServerProperties {
    public static final String PREFIX = "suyh202308.iam.server";
}
