package com.bwell.configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.Contact;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI bwellOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("bWell API")
                        .description("Wellbeing platform API documentation")
                        .version("1.0.0")
                        .contact(new Contact()
                                .name("bWell Team")
                                .url("https://bwell.bieda.it")));
    }
}
