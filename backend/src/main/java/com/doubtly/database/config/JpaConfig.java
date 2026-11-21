package com.doubtly.database.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/** Enables automatic created/updated timestamp auditing for JPA entities. */
@Configuration
@EnableJpaAuditing
public class JpaConfig {
}
