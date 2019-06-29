package com.android.camera;

import android.location.Location;
import android.os.Bundle;
import android.os.HandlerThread;
import com.android.camera.log.Log;
import com.android.camera.permission.PermissionManager;
import com.ss.android.ttve.common.TEDefine;
import java.util.Timer;
import java.util.TimerTask;

public class LocationManager {
    private static final int GPS_REQUEST_LOCATION_TIME_OUT = 60000;
    private static final long LOCATION_TIME_THRESHOLD = 3600000;
    private static final String TAG = "LocationManager";
    private static final long VALID_LAST_KNOWN_LOCATION_AGE = 180000;
    private Location mCacheLocation;
    private Location mLastKnownLocation;
    /* access modifiers changed from: private */
    public Listener mListener;
    LocationListener[] mLocationListeners;
    private android.location.LocationManager mLocationManager;
    /* access modifiers changed from: private */
    public boolean mRecordLocation;
    private HandlerThread mThreadHandler;
    /* access modifiers changed from: private */
    public Timer mTimer;

    public interface Listener {
        void hideGpsOnScreenIndicator();

        void showGpsOnScreenIndicator(boolean z);
    }

    private class LocationListener implements android.location.LocationListener {
        Location mLastLocation;
        String mProvider;
        boolean mValid = false;

        public LocationListener(String str) {
            this.mProvider = str;
            this.mLastLocation = new Location(this.mProvider);
        }

        public Location current() {
            if (this.mValid) {
                return this.mLastLocation;
            }
            return null;
        }

        public void onLocationChanged(Location location) {
            if (location.getLatitude() != 0.0d || location.getLongitude() != 0.0d) {
                if (LocationManager.this.mRecordLocation && "gps".equals(this.mProvider)) {
                    LocationManager.this.cancelTimer();
                    if (LocationManager.this.mListener != null) {
                        LocationManager.this.mListener.showGpsOnScreenIndicator(true);
                    }
                }
                if (!this.mValid) {
                    String str = LocationManager.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Got first location, it is from ");
                    sb.append(this.mProvider);
                    Log.d(str, sb.toString());
                } else {
                    String str2 = LocationManager.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("update location, it is from ");
                    sb2.append(this.mProvider);
                    Log.v(str2, sb2.toString());
                }
                this.mLastLocation.set(location);
                LocationManager.this.updateCacheLocation(this.mLastLocation);
                this.mValid = true;
            }
        }

        public void onProviderDisabled(String str) {
            this.mValid = false;
        }

        public void onProviderEnabled(String str) {
        }

        public void onStatusChanged(String str, int i, Bundle bundle) {
            switch (i) {
                case 0:
                case 1:
                    this.mValid = false;
                    if (LocationManager.this.mListener != null && LocationManager.this.mRecordLocation && "gps".equals(str)) {
                        LocationManager.this.mListener.showGpsOnScreenIndicator(false);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    private static class LocationManagerHolder {
        /* access modifiers changed from: private */
        public static LocationManager sLocationManager = new LocationManager();

        private LocationManagerHolder() {
        }
    }

    private LocationManager() {
        this.mLocationListeners = new LocationListener[]{new LocationListener("gps"), new LocationListener("network")};
        this.mThreadHandler = new HandlerThread("Camera Handler Thread");
        this.mThreadHandler.start();
    }

    /* access modifiers changed from: private */
    public void cancelTimer() {
        if (this.mTimer != null) {
            this.mTimer.cancel();
            this.mTimer = null;
        }
    }

    private Location getBetterLocation(Location location, Location location2) {
        if (location2 == null) {
            return location;
        }
        if (location == null || location.getTime() < location2.getTime() || (location.getTime() == location2.getTime() && "gps".equals(location2.getProvider()))) {
            location = location2;
        }
        return location;
    }

    private void getLastLocation() {
        Location location;
        try {
            this.mLastKnownLocation = getBetterLocation(this.mLocationManager.getLastKnownLocation("gps"), this.mLocationManager.getLastKnownLocation("network"));
            location = getBetterLocation(this.mCacheLocation, this.mLastKnownLocation);
        } catch (SecurityException e) {
            Log.e(TAG, "fail to request last location update, ignore", e);
            location = this.mCacheLocation;
        }
        if (isValidLastKnownLocation(location)) {
            this.mCacheLocation = location;
        } else {
            this.mCacheLocation = null;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("last cache location is ");
        sb.append(this.mCacheLocation != null ? "not null" : TEDefine.FACE_BEAUTY_NULL);
        Log.d(str, sb.toString());
    }

    public static LocationManager instance() {
        return LocationManagerHolder.sLocationManager;
    }

    private boolean isValidLastKnownLocation(Location location) {
        return location != null && Math.abs(System.currentTimeMillis() - location.getTime()) < VALID_LAST_KNOWN_LOCATION_AGE;
    }

    private void startReceivingLocationUpdates() {
        if (this.mLocationManager == null) {
            this.mLocationManager = (android.location.LocationManager) CameraAppImpl.getAndroidContext().getSystemService("location");
        }
        if (this.mLocationManager != null) {
            try {
                this.mLocationManager.requestLocationUpdates("network", 1000, 0.0f, this.mLocationListeners[1], this.mThreadHandler.getLooper());
            } catch (SecurityException e) {
                Log.i(TAG, "fail to request location update, ignore", e);
            } catch (IllegalArgumentException e2) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("provider does not exist ");
                sb.append(e2.getMessage());
                Log.d(str, sb.toString());
            }
            try {
                this.mLocationManager.requestLocationUpdates("gps", 1000, 0.0f, this.mLocationListeners[0], this.mThreadHandler.getLooper());
                cancelTimer();
                this.mTimer = new Timer(true);
                this.mTimer.schedule(new TimerTask() {
                    public void run() {
                        LocationManager.this.stopReceivingGPSLocationUpdates();
                        LocationManager.this.mTimer = null;
                    }
                }, 60000);
                if (this.mListener != null) {
                    this.mListener.showGpsOnScreenIndicator(false);
                }
            } catch (SecurityException e3) {
                Log.i(TAG, "fail to request location update, ignore", e3);
            } catch (IllegalArgumentException e4) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("provider does not exist ");
                sb2.append(e4.getMessage());
                Log.d(str2, sb2.toString());
            }
            Log.d(TAG, "startReceivingLocationUpdates");
            getLastLocation();
        }
    }

    /* access modifiers changed from: private */
    public void stopReceivingGPSLocationUpdates() {
        if (this.mLocationManager != null) {
            try {
                this.mLocationManager.removeUpdates(this.mLocationListeners[0]);
            } catch (Exception e) {
                Log.i(TAG, "fail to remove location listeners, ignore", e);
            }
            this.mLocationListeners[0].mValid = false;
            Log.d(TAG, "stopReceivingGPSLocationUpdates");
        }
        if (this.mListener != null) {
            this.mListener.hideGpsOnScreenIndicator();
        }
    }

    private void stopReceivingLocationUpdates() {
        cancelTimer();
        if (this.mLocationManager != null) {
            for (int i = 0; i < this.mLocationListeners.length; i++) {
                try {
                    this.mLocationManager.removeUpdates(this.mLocationListeners[i]);
                } catch (Exception e) {
                    Log.i(TAG, "fail to remove location listeners, ignore", e);
                }
                this.mLocationListeners[i].mValid = false;
            }
            Log.d(TAG, "stopReceivingLocationUpdates");
        }
        if (this.mListener != null) {
            this.mListener.hideGpsOnScreenIndicator();
        }
    }

    /* access modifiers changed from: private */
    public void updateCacheLocation(Location location) {
        Location betterLocation = getBetterLocation(this.mCacheLocation, location);
        if (this.mCacheLocation != null) {
            this.mCacheLocation.set(betterLocation);
        } else {
            this.mCacheLocation = new Location(betterLocation);
        }
    }

    private static Location validateLocation(Location location) {
        long currentTimeMillis = System.currentTimeMillis();
        if (location != null && Math.abs(location.getTime() - currentTimeMillis) > LOCATION_TIME_THRESHOLD) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("validateLocation: modify to now from ");
            sb.append(location.getTime());
            Log.d(str, sb.toString());
            location.setTime(currentTimeMillis);
        }
        return location;
    }

    public Location getCurrentLocation() {
        if (!this.mRecordLocation) {
            return null;
        }
        for (int i = 0; i < this.mLocationListeners.length; i++) {
            Location current = this.mLocationListeners[i].current();
            if (current != null) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("get current location, it is from ");
                sb.append(this.mLocationListeners[i].mProvider);
                Log.v(str, sb.toString());
                return validateLocation(current);
            }
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("No location received yet. cache location is ");
        sb2.append(this.mCacheLocation != null ? "not null" : TEDefine.FACE_BEAUTY_NULL);
        Log.d(str2, sb2.toString());
        return validateLocation(this.mCacheLocation);
    }

    public Location getLastKnownLocation() {
        if (!this.mRecordLocation) {
            return null;
        }
        return this.mLastKnownLocation;
    }

    public void recordLocation(boolean z) {
        if (this.mRecordLocation != z) {
            this.mRecordLocation = z;
            if (!z || !PermissionManager.checkCameraLocationPermissions()) {
                stopReceivingLocationUpdates();
            } else {
                startReceivingLocationUpdates();
            }
        }
    }

    public void setListener(Listener listener) {
        this.mListener = listener;
    }

    public void unsetListener(Listener listener) {
        if (this.mListener == listener) {
            this.mListener = null;
        }
    }
}
