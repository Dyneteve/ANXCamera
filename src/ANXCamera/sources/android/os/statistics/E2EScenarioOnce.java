package android.os.statistics;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.statistics.PerfEvent.DetailFields;
import org.json.JSONException;
import org.json.JSONObject;

public class E2EScenarioOnce extends MacroscopicEvent<E2EScenarioOnceDetails> {
    public static final Creator<E2EScenarioOnce> CREATOR = new Creator<E2EScenarioOnce>() {
        public E2EScenarioOnce createFromParcel(Parcel parcel) {
            E2EScenarioOnce e2EScenarioOnce = new E2EScenarioOnce();
            e2EScenarioOnce.readFromParcel(parcel);
            return e2EScenarioOnce;
        }

        public E2EScenarioOnce[] newArray(int i) {
            return new E2EScenarioOnce[i];
        }
    };

    public static class E2EScenarioOnceDetails extends DetailFields {
        public int batteryLevel;
        public int batteryTemperature;
        public String beginPackageName;
        public int beginPid;
        public String beginProcessName;
        public int beginTid;
        public long beginWalltimeMillis;
        public String endPackageName;
        public int endPid;
        public String endProcessName;
        public int endTid;
        public long endWalltimeMillis;
        public boolean isCharging;
        public E2EScenarioPayload payload;
        public E2EScenario scenario;
        public long scenarioOnceId;
        public E2EScenarioSettings settings;
        public String tag;

        public E2EScenarioOnceDetails() {
            super(false);
        }

        public void fillIn(JniParcel jniParcel) {
            throw new UnsupportedOperationException();
        }

        public void readFromParcel(Parcel parcel) {
            E2EScenarioOnce.super.readFromParcel(parcel);
            this.scenarioOnceId = parcel.readLong();
            this.scenario = (E2EScenario) parcel.readParcelable(null);
            this.settings = (E2EScenarioSettings) parcel.readParcelable(null);
            this.tag = parcel.readString();
            this.payload = (E2EScenarioPayload) parcel.readParcelable(null);
            boolean z = true;
            if (parcel.readInt() != 1) {
                z = false;
            }
            this.isCharging = z;
            this.batteryLevel = parcel.readInt();
            this.batteryTemperature = parcel.readInt();
            this.beginWalltimeMillis = parcel.readLong();
            this.beginPid = parcel.readInt();
            this.beginTid = parcel.readInt();
            this.beginProcessName = parcel.readString();
            this.beginPackageName = parcel.readString();
            this.endWalltimeMillis = parcel.readLong();
            this.endPid = parcel.readInt();
            this.endTid = parcel.readInt();
            this.endProcessName = parcel.readString();
            this.endPackageName = parcel.readString();
        }

        public void writeToJson(JSONObject jSONObject) {
            E2EScenarioOnce.super.writeToJson(jSONObject);
            try {
                jSONObject.put("scenarioOnceId", this.scenarioOnceId);
                jSONObject.put("scenario", this.scenario.toJson());
                if (this.payload != null && !this.payload.isEmpty()) {
                    jSONObject.put("payload", this.payload.toJson());
                }
                jSONObject.put("charging", this.isCharging);
                jSONObject.put("batteryLevel", this.batteryLevel);
                jSONObject.put("temperature", this.batteryTemperature);
                jSONObject.put("beginWalltime", this.beginWalltimeMillis);
                jSONObject.put("beginPid", this.beginPid);
                jSONObject.put("beginTid", this.beginTid);
                jSONObject.put("beginProcessName", this.beginProcessName);
                jSONObject.put("beginPackageName", this.beginPackageName);
                jSONObject.put("endWalltime", this.endWalltimeMillis);
                jSONObject.put("endPid", this.endPid);
                jSONObject.put("endTid", this.endTid);
                jSONObject.put("endProcessName", this.endProcessName);
                jSONObject.put("endPackageName", this.endPackageName);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        public void writeToParcel(Parcel parcel, int i) {
            E2EScenarioOnce.super.writeToParcel(parcel, i);
            parcel.writeLong(this.scenarioOnceId);
            parcel.writeParcelable(this.scenario, i);
            parcel.writeParcelable(this.settings, i);
            parcel.writeString(this.tag);
            parcel.writeParcelable(this.payload, i);
            parcel.writeInt(this.isCharging ? 1 : 0);
            parcel.writeInt(this.batteryLevel);
            parcel.writeInt(this.batteryTemperature);
            parcel.writeLong(this.beginWalltimeMillis);
            parcel.writeInt(this.beginPid);
            parcel.writeInt(this.beginTid);
            parcel.writeString(this.beginProcessName);
            parcel.writeString(this.beginPackageName);
            parcel.writeLong(this.endWalltimeMillis);
            parcel.writeInt(this.endPid);
            parcel.writeInt(this.endTid);
            parcel.writeString(this.endProcessName);
            parcel.writeString(this.endPackageName);
        }
    }

    public E2EScenarioOnce() {
        super(65541, new E2EScenarioOnceDetails());
    }
}
