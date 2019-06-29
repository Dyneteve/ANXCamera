package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.miui.filtersdk.beauty.BeautyParameterType;

@Deprecated
public class LegacyMakeupParamsFragment extends MakeupParamsFragment {
    /* access modifiers changed from: protected */
    public OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                LegacyMakeupParamsFragment.this.mSelectedParam = i;
                switch (i) {
                    case 0:
                        BeautyParameterType beautyParameterType = BeautyParameterType.SHRINK_FACE_RATIO;
                        break;
                    case 1:
                        BeautyParameterType beautyParameterType2 = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                    case 2:
                        BeautyParameterType beautyParameterType3 = BeautyParameterType.SMOOTH_STRENGTH;
                        break;
                    default:
                        BeautyParameterType beautyParameterType4 = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                }
                MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
                if (makeupProtocol != null) {
                    makeupProtocol.onMakeupItemSelected(null, true);
                }
            }
        };
    }
}
