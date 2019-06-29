package android.os.statistics;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public final class E2EScenarioSettings implements Parcelable, Cloneable, Serializable {
    public static final Creator<E2EScenarioSettings> CREATOR = new Creator<E2EScenarioSettings>() {
        public E2EScenarioSettings createFromParcel(Parcel parcel) {
            return new E2EScenarioSettings(parcel);
        }

        public E2EScenarioSettings[] newArray(int i) {
            return new E2EScenarioSettings[i];
        }
    };
    public static final int STATISTICS_MODE_ALL = 7;
    public static final int STATISTICS_MODE_AVERAGE = 1;
    public static final int STATISTICS_MODE_DISTRIBUTION = 4;
    public static final int STATISTICS_MODE_HISTORY = 2;
    public static final int STATISTICS_MODE_NONE = 0;
    private static final long serialVersionUID = 1;
    public int historyLimitPerDay;
    public boolean isAutoAnalysisEnabled;
    public int slownessFloorThresholdMillis;
    public int statisticsMode;
    public int timeoutMillisOfAutoAnalysis;

    public E2EScenarioSettings() {
    }

    public E2EScenarioSettings(Parcel parcel) {
        this.statisticsMode = parcel.readInt();
        this.historyLimitPerDay = parcel.readInt();
        this.isAutoAnalysisEnabled = parcel.readInt() != 0;
        this.slownessFloorThresholdMillis = parcel.readInt();
        this.timeoutMillisOfAutoAnalysis = parcel.readInt();
    }

    public Object clone() {
        E2EScenarioSettings e2EScenarioSettings = new E2EScenarioSettings();
        e2EScenarioSettings.statisticsMode = this.statisticsMode;
        e2EScenarioSettings.historyLimitPerDay = this.historyLimitPerDay;
        e2EScenarioSettings.isAutoAnalysisEnabled = this.isAutoAnalysisEnabled;
        e2EScenarioSettings.slownessFloorThresholdMillis = this.slownessFloorThresholdMillis;
        e2EScenarioSettings.timeoutMillisOfAutoAnalysis = this.timeoutMillisOfAutoAnalysis;
        return e2EScenarioSettings;
    }

    public int describeContents() {
        return 0;
    }

    public void enableAutoAnalysis(int i, int i2) {
        this.isAutoAnalysisEnabled = true;
        this.slownessFloorThresholdMillis = i;
        this.timeoutMillisOfAutoAnalysis = i2;
    }

    public boolean isValid() {
        return !this.isAutoAnalysisEnabled || this.slownessFloorThresholdMillis > 0;
    }

    public void setHistoryLimitPerDay(int i) {
        this.historyLimitPerDay = i;
    }

    public void setStatisticsMode(int i) {
        this.statisticsMode = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.statisticsMode);
        parcel.writeInt(this.historyLimitPerDay);
        parcel.writeInt(this.isAutoAnalysisEnabled ? 1 : 0);
        parcel.writeInt(this.slownessFloorThresholdMillis);
        parcel.writeInt(this.timeoutMillisOfAutoAnalysis);
    }
}
