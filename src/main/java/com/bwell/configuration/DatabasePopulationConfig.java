package com.bwell.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@Configuration
public class DatabasePopulationConfig {

    @Value("${app.shouldCreate}")
    private String shouldCreate;

    @Bean
    public String getDecision(){
        System.out.println("PRINT VAULT VALUE----> " + shouldCreate);
        return shouldCreate;
    }
}
