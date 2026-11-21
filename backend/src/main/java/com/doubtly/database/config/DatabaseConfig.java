package com.doubtly.database.config;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Database layer configuration.
 *
 * <p>Spring Boot auto-configures the HikariCP {@code DataSource} and Spring Data
 * JPA from the {@code spring.datasource.*} and {@code spring.jpa.*} properties in
 * {@code application.properties}. This class enables the project-specific
 * {@link DatabaseProperties} so the database layer can be tuned without
 * scattering property keys across the codebase.</p>
 */
@Configuration
@EnableConfigurationProperties(DatabaseProperties.class)
public class DatabaseConfig {
}
