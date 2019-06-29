package com.facebook.rebound;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class SpringConfigRegistry {
    private static final SpringConfigRegistry INSTANCE = new SpringConfigRegistry(true);
    private final Map<SpringConfig, String> mSpringConfigMap = new HashMap();

    SpringConfigRegistry(boolean z) {
        if (z) {
            addSpringConfig(SpringConfig.defaultConfig, "default config");
        }
    }

    public static SpringConfigRegistry getInstance() {
        return INSTANCE;
    }

    public boolean addSpringConfig(SpringConfig springConfig, String str) {
        if (springConfig == null) {
            throw new IllegalArgumentException("springConfig is required");
        } else if (str == null) {
            throw new IllegalArgumentException("configName is required");
        } else if (this.mSpringConfigMap.containsKey(springConfig)) {
            return false;
        } else {
            this.mSpringConfigMap.put(springConfig, str);
            return true;
        }
    }

    public Map<SpringConfig, String> getAllSpringConfig() {
        return Collections.unmodifiableMap(this.mSpringConfigMap);
    }

    public void removeAllSpringConfig() {
        this.mSpringConfigMap.clear();
    }

    public boolean removeSpringConfig(SpringConfig springConfig) {
        if (springConfig != null) {
            return this.mSpringConfigMap.remove(springConfig) != null;
        }
        throw new IllegalArgumentException("springConfig is required");
    }
}
