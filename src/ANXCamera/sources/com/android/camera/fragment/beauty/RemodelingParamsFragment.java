package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.R;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;

public class RemodelingParamsFragment extends MakeupParamsFragment {
    public static /* synthetic */ void lambda$initOnItemClickListener$0(RemodelingParamsFragment remodelingParamsFragment, AdapterView adapterView, View view, int i, long j) {
        remodelingParamsFragment.mSelectedParam = i;
        String str = ((TypeItem) remodelingParamsFragment.mItemList.get(i)).mKeyOrType;
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(str, true);
        }
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return "4";
    }

    /* access modifiers changed from: protected */
    public void initExtraType() {
        this.mHeaderElement = 1;
        this.mFooterElement = -1;
        if (this.mItemList != null && !this.mItemList.isEmpty() && "pref_beautify_skin_smooth_ratio_key".equals(((TypeItem) this.mItemList.get(0)).mKeyOrType)) {
            this.mFooterElement = 2;
        }
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
                RemodelingParamsFragment.lambda$initOnItemClickListener$0(RemodelingParamsFragment.this, adapterView, view, i, j);
            }
        };
    }

    /* access modifiers changed from: protected */
    public void onClearClick() {
        super.onClearClick();
        toast(getResources().getString(R.string.beauty_clear_toast));
    }
}
