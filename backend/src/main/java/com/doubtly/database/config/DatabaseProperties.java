package com.doubtly.database.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/** Typed access to the {@code doubtly.database.*} properties. */
@ConfigurationProperties(prefix = "doubtly.database")
public class DatabaseProperties {

    /** Whether Flyway migrations are expected to run on startup. */
    private boolean migrationEnabled = true;

    /** Whether optional seed data should be loaded (used by local/dev tooling). */
    private boolean seedEnabled = false;

    public boolean isMigrationEnabled() {
        return migrationEnabled;
    }

    public void setMigrationEnabled(boolean migrationEnabled) {
        this.migrationEnabled = migrationEnabled;
    }

    public boolean isSeedEnabled() {
        return seedEnabled;
    }

    public void setSeedEnabled(boolean seedEnabled) {
        this.seedEnabled = seedEnabled;
    }
}
