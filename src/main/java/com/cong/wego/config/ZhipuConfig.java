package com.cong.wego.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import lombok.Data;

@Data
@Configuration
@ConfigurationProperties(prefix = "zhipu.api")
public class ZhipuConfig {
    private String url;
    private String apiKey;
    private String model;
}
