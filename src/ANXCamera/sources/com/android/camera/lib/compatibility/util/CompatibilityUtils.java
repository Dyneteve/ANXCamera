package com.android.camera.lib.compatibility.util;

import android.app.Activity;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.InputConfiguration;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.params.StreamConfiguration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.hardware.display.DisplayManager;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.IPowerManager;
import android.text.TextPaint;
import android.view.IWindowManager;
import android.view.Window;
import com.android.camera.lib.compatibility.related.popcamera.PopCameraUtil;
import com.android.camera.lib.compatibility.related.screenlight.ScreenLightUtils;
import com.android.camera.lib.compatibility.related.v21.V21Utils;
import com.android.camera.lib.compatibility.related.v23.V23Utils;
import com.android.camera.lib.compatibility.related.v24.V24Utils;
import com.android.camera.lib.compatibility.related.v26.V26Utils;
import com.android.camera.lib.compatibility.related.v28.V28Utils;
import com.android.camera.lib.compatibility.related.v29.V29Utils;
import java.io.FileDescriptor;
import java.util.List;

public class CompatibilityUtils {
    public static final int ANDROID_L_VERSION = 21;
    public static final int ANDROID_M_VERSION = 23;
    public static final int ANDROID_N_VERSION = 24;
    public static final int ANDROID_O_VERSION = 26;
    public static final int ANDROID_P_VERSION = 28;
    public static final int MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING = 802;
    public static final int MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED = 803;

    public interface PackageInstallerListener {
        void onPackageInstalled(String str, boolean z);
    }

    public static void addChannelForNotificationBuilder(NotificationManager notificationManager, String str, CharSequence charSequence, Builder builder) {
        V26Utils.addChannelForNotificationBuilder(notificationManager, str, charSequence, builder);
    }

    public static void allocGraphicBuffers() {
        V26Utils.allocGraphicBuffers();
    }

    public static CaptureRequest.Builder constructCaptureRequestBuilder(CameraMetadataNative cameraMetadataNative, boolean z, int i, CaptureRequest captureRequest) {
        return V28Utils.constructCaptureRequestBuilder(cameraMetadataNative, z, i, captureRequest);
    }

    public static void createCaptureSessionWithSessionConfiguration(CameraDevice cameraDevice, int i, InputConfiguration inputConfiguration, List<OutputConfiguration> list, CaptureRequest captureRequest, StateCallback stateCallback, Handler handler) throws CameraAccessException {
        V28Utils.createCaptureSessionWithSessionConfiguration(cameraDevice, i, inputConfiguration, list, captureRequest, stateCallback, handler);
    }

    public static StreamConfigurationMap createStreamConfigMap(List<StreamConfiguration> list, CameraCharacteristics cameraCharacteristics) {
        return V29Utils.createStreamConfigMap(list, cameraCharacteristics);
    }

    public static String getInstallMethodDescription() {
        return V28Utils.getInstallMethodDescription();
    }

    public static int getMotorStatus() {
        return PopCameraUtil.getMotorStatus();
    }

    public static Object getPackageInstallObserver(PackageInstallerListener packageInstallerListener) {
        return V28Utils.getPackageInstallObserver(packageInstallerListener);
    }

    public static String getSdcardPath(Context context) {
        return V23Utils.getSdcardPath(context);
    }

    public static boolean hasNavigationBar(Context context, IWindowManager iWindowManager) {
        return V29Utils.hasNavigationBar(context, iWindowManager);
    }

    public static final boolean isInMultiWindowMode(Activity activity) {
        return V24Utils.isInMultiWindowMode(activity);
    }

    public static boolean isInVideoCall(Context context) {
        return V23Utils.isInVideoCall(context);
    }

    public static void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.pauseMediaRecorder(mediaRecorder);
    }

    public static boolean popupMotor() {
        return PopCameraUtil.popupMotor();
    }

    public static void resumeMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.resumeMediaRecorder(mediaRecorder);
    }

    public static void setBrightnessRampRate(IPowerManager iPowerManager, int i) {
        ScreenLightUtils.setBrightnessRampRate(iPowerManager, i);
    }

    public static void setCutoutModeShortEdges(Window window) {
        V28Utils.setCutoutModeShortEdges(window);
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, FileDescriptor fileDescriptor) {
        return V26Utils.setNextOutputFile(mediaRecorder, fileDescriptor);
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, String str) {
        return V26Utils.setNextOutputFile(mediaRecorder, str);
    }

    public static void setPhysicalCameraId(OutputConfiguration outputConfiguration, String str) {
        V28Utils.setPhysicalCameraId(outputConfiguration, str);
    }

    public static void setSurfaceTextureOnFrameAvailableListener(SurfaceTexture surfaceTexture, OnFrameAvailableListener onFrameAvailableListener, Handler handler) {
        V21Utils.setSurfaceTextureOnFrameAvailableListener(surfaceTexture, onFrameAvailableListener, handler);
    }

    public static void setTemporaryAutoBrightnessAdjustment(DisplayManager displayManager, float f) {
        V28Utils.setTemporaryAutoBrightnessAdjustment(displayManager, f);
    }

    public static void setTextPaintLetterSpacing(TextPaint textPaint, float f) {
        V21Utils.setTextPaintLetterSpacing(textPaint, f);
    }

    public static void setZsl(CaptureRequest.Builder builder, boolean z) {
        V26Utils.setZsl(builder, z);
    }

    public static boolean takebackMotor() {
        return PopCameraUtil.takebackMotor();
    }
}
