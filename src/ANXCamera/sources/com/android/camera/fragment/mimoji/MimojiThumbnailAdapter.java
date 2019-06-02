package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.bumptech.glide.j;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.a.c;
import com.bumptech.glide.request.a.c.a;
import com.bumptech.glide.request.f;
import java.util.ArrayList;
import java.util.List;

public class MimojiThumbnailAdapter extends BaseAdapter {
    private Context mContext;
    private List<ASAvatarConfigInfo> mDatas = new ArrayList();
    private Drawable mSelectedDrawable;
    private float selectIndex = -1.0f;

    MimojiThumbnailAdapter(Context context, int i) {
        this.mContext = context;
        this.selectIndex = getSelectItem(i);
        this.mSelectedDrawable = this.mContext.getDrawable(R.drawable.bg_mimoji_thumbnail_selected);
    }

    public void addData(ASAvatarConfigInfo aSAvatarConfigInfo, int i) {
        if (i < this.mDatas.size()) {
            this.mDatas.set(i, aSAvatarConfigInfo);
        } else {
            this.mDatas.add(aSAvatarConfigInfo);
        }
        notifyDataSetChanged();
    }

    public int getCount() {
        if (this.mDatas == null) {
            return 0;
        }
        return this.mDatas.size();
    }

    public Object getItem(int i) {
        if (i >= this.mDatas.size()) {
            i = this.mDatas.size() - 1;
        }
        return this.mDatas.get(i);
    }

    public long getItemId(int i) {
        return 0;
    }

    public float getSelectItem(int i) {
        return AvatarEngineManager.getInstance().getInnerConfigSelectIndex(i);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) this.mDatas.get(i);
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.mimoji_thumbnail_view, viewGroup, false);
        }
        c eE = new a(300).n(true).eE();
        if (view instanceof ImageView) {
            if (aSAvatarConfigInfo == null || aSAvatarConfigInfo.thum == null || aSAvatarConfigInfo.thum.isRecycled()) {
                Log.e(getClass().getSimpleName(), "bitmap isRecycled");
            } else {
                ImageView imageView = (ImageView) view;
                com.bumptech.glide.c.g(this.mContext).a(aSAvatarConfigInfo.thum).b(new f().i(imageView.getDrawable())).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(20, 1))).a((j<?, ? super TranscodeType>) com.bumptech.glide.load.resource.b.c.f(eE)).a(imageView);
            }
        }
        view.setBackground(getSelectItem(aSAvatarConfigInfo.configType) == ((float) aSAvatarConfigInfo.configID) ? this.mSelectedDrawable : null);
        return view;
    }

    public void refreshData(List<ASAvatarConfigInfo> list) {
        this.mDatas.clear();
        this.mDatas.addAll(list);
        notifyDataSetChanged();
    }

    public void setSelectItem(int i, int i2) {
        AvatarEngineManager instance = AvatarEngineManager.getInstance();
        if (instance != null) {
            instance.setInnerConfigSelectIndex(i, (float) i2);
        }
    }
}
