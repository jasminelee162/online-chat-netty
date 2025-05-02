package com.cong.wego.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import lombok.Data;

@Data
@Configuration
@ConfigurationProperties(prefix = "kimi.api")
public class KimiConfig {
    private String url;
    private String token;
    private String model;
}
