package com.android.camera.effect.framework.gles;

import android.opengl.GLES20;
import android.opengl.Matrix;
import java.nio.ByteBuffer;

public class FullFrameTexture {
    private static final String FRAGMENT_SHADER = "precision mediump float;\nuniform sampler2D sTexture;\nvarying vec2 vTextureCoord;\nvoid main() {\nvec2 texCoord = vTextureCoord;\ntexCoord.y = 1.0 - texCoord.y;\nvec4 ret =  texture2D(sTexture, texCoord);\nret.r = 1.0;\ngl_FragColor = ret;\n}";
    private static final String VERTEXT_SHADER = "uniform mat4 uOrientationM;\nuniform mat4 uTransformM;\nattribute vec2 aPosition;\nvarying vec2 vTextureCoord;\nvoid main() {\ngl_Position = vec4(aPosition, 0.0, 1.0);\nvTextureCoord = (uTransformM * ((uOrientationM * gl_Position + 1.0) * 0.5)).xy;}";
    private final byte[] FULL_QUAD_COORDINATES = {-1, 1, -1, -1, 1, 1, 1, -1};
    private ByteBuffer fullQuadVertices;
    private final float[] orientationMatrix = new float[16];
    private ShaderProgram shader;
    private final float[] transformMatrix = new float[16];

    public FullFrameTexture() {
        if (this.shader != null) {
            this.shader = null;
        }
        this.shader = new ShaderProgram();
        this.shader.create(VERTEXT_SHADER, FRAGMENT_SHADER);
        this.fullQuadVertices = ByteBuffer.allocateDirect(8);
        this.fullQuadVertices.put(this.FULL_QUAD_COORDINATES).position(0);
        Matrix.setRotateM(this.orientationMatrix, 0, 0.0f, 0.0f, 0.0f, 1.0f);
        Matrix.setIdentityM(this.transformMatrix, 0);
    }

    private void renderQuad(int i) {
        GLES20.glVertexAttribPointer(i, 2, 5120, false, 0, this.fullQuadVertices);
        GLES20.glEnableVertexAttribArray(i);
        GLES20.glDrawArrays(5, 0, 4);
    }

    public void draw(int i) {
        this.shader.use();
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(3553, i);
        int attributeLocation = this.shader.getAttributeLocation("uOrientationM");
        int attributeLocation2 = this.shader.getAttributeLocation("uTransformM");
        GLES20.glUniformMatrix4fv(attributeLocation, 1, false, this.orientationMatrix, 0);
        GLES20.glUniformMatrix4fv(attributeLocation2, 1, false, this.transformMatrix, 0);
        renderQuad(this.shader.getAttributeLocation("aPosition"));
        this.shader.unUse();
    }

    public void release() {
        this.shader = null;
        this.fullQuadVertices = null;
    }
}
