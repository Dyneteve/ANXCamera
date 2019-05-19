package com.android.camera.effect.framework.gles;

public interface IShaderProgram {
    void create(String str, String str2);

    int getAttributeLocation(String str);

    void unUse();

    void use();
}
