package com.suyh202308.iam.sdk.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.NotNull;

@ConfigurationProperties(prefix = SuyhIamSdkProperties.PREFIX)
@Validated
@Data
public class SuyhIamSdkProperties {
    public static final String PREFIX = "suyh202308.iam.sdk";

    @NotNull
    private Boolean enabled;
}
