package com.bytedance.frameworks.core.monitor.net;

import android.content.Context;
import com.bytedance.frameworks.baselib.log.LogHandler;
import com.bytedance.frameworks.baselib.log.LogHandler.BaseConfig;
import com.bytedance.frameworks.baselib.log.LogHandler.IResponseConfig;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import java.util.List;

public class DefaultLogSendImpl implements ILogSendImpl {
    String mAid;
    Context mContext;
    LogHandler mLogHandler;
    String mLogType;
    boolean mMoreChannelSwitch;
    int mNetFailCount;
    int mStatusCode;
    volatile long mStopInterval;

    public DefaultLogSendImpl(Context context, final String str, final String str2) {
        this.mContext = context;
        this.mAid = str;
        final String str3 = str;
        AnonymousClass3 r0 = new LogHandler(context.getApplicationContext(), new BaseConfig() {
            public List<String> getChannels() {
                return MonitorConfigure.getReportUrl(str, str2);
            }

            public String getLogType() {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(str2);
                return sb.toString();
            }

            public int getMaxRetryCount() {
                return MonitorConfigure.getReportFailRepeatCount(str);
            }

            public long getRetryInterval() {
                return (long) MonitorConfigure.getReportFailBaseTime(str);
            }
        }, new IResponseConfig() {
            public boolean getMoreChannelSwitch() {
                return DefaultLogSendImpl.this.mMoreChannelSwitch;
            }

            public boolean getRemoveSwitch() {
                return MonitorConfigure.getLogRemoveSwitch(str);
            }

            public int getStatusCode() {
                return DefaultLogSendImpl.this.mStatusCode;
            }

            public long getStopInterval() {
                return DefaultLogSendImpl.this.mStopInterval;
            }

            public long getStopMoreChannelInterval() {
                return MonitorConfigure.getStopMoreChannelInterval(str);
            }
        }) {
            /* access modifiers changed from: protected */
            public boolean send(String str, byte[] bArr) {
                if (MonitorLogSender.getISendLog(str3) != null) {
                    NetResponse sendLog = MonitorLogSender.getISendLog(str3).sendLog(NetConst.MAX_LENGTH, str, bArr, 1, NetConst.CONTENT_TYPE);
                    if (sendLog == null || sendLog.stateCode <= 0) {
                        DefaultLogSendImpl.this.mMoreChannelSwitch = true;
                    } else {
                        DefaultLogSendImpl.this.mMoreChannelSwitch = false;
                        if (sendLog.stateCode == 200 && sendLog.responseMsg != null) {
                            if (sendLog.responseMsg.optInt("is_crash", 0) == 1) {
                                DefaultLogSendImpl.this.mStopInterval = MonitorCommonConstants.LAST_STOP_INTERVAL;
                                DefaultLogSendImpl.this.mNetFailCount = 3;
                                return false;
                            } else if (sendLog.responseMsg.opt("message").equals("success")) {
                                DefaultLogSendImpl.this.mNetFailCount = 0;
                                DefaultLogSendImpl.this.mStopInterval = 0;
                                return true;
                            }
                        }
                        if (500 <= sendLog.stateCode && sendLog.stateCode <= 600) {
                            if (DefaultLogSendImpl.this.mNetFailCount == 0) {
                                DefaultLogSendImpl.this.mStopInterval = MonitorCommonConstants.SECOND_STOP_INTERVAL;
                                DefaultLogSendImpl.this.mNetFailCount++;
                            } else if (DefaultLogSendImpl.this.mNetFailCount == 1) {
                                DefaultLogSendImpl.this.mStopInterval = MonitorCommonConstants.THIRD_STOP_INTERVAL;
                                DefaultLogSendImpl.this.mNetFailCount++;
                            } else if (DefaultLogSendImpl.this.mNetFailCount == 2) {
                                DefaultLogSendImpl.this.mStopInterval = MonitorCommonConstants.LAST_STOP_INTERVAL;
                                DefaultLogSendImpl.this.mNetFailCount++;
                            } else {
                                DefaultLogSendImpl.this.mStopInterval = MonitorCommonConstants.LAST_STOP_INTERVAL;
                                DefaultLogSendImpl.this.mNetFailCount++;
                            }
                            return false;
                        }
                    }
                }
                return false;
            }
        };
        this.mLogHandler = r0;
    }

    public boolean logStopCollectSwitch() {
        return this.mStopInterval == MonitorCommonConstants.LAST_STOP_INTERVAL;
    }

    public boolean send(String str) {
        return this.mLogHandler.enqueue(str);
    }
}
