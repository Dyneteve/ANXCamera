package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.bumptech.glide.c;
import com.bumptech.glide.j;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.a.c.a;
import com.bumptech.glide.request.f;
import java.util.ArrayList;
import java.util.List;

public class MimojiThumbnailAdapter extends BaseAdapter {
    private Context mContext;
    private List<ASAvatarConfigInfo> mDatas = new ArrayList();
    private float selectIndex = -1.0f;

    class ViewHolder {
        ImageView imageView;
        ImageView selectView;

        public ViewHolder(View view) {
            this.imageView = (ImageView) view.findViewById(R.id.thumbnail_image_view);
            this.selectView = (ImageView) view.findViewById(R.id.thumbnail_select_view);
        }
    }

    MimojiThumbnailAdapter(Context context, int i) {
        this.mContext = context;
        this.selectIndex = getSelectItem(i);
    }

    public void addData(ASAvatarConfigInfo aSAvatarConfigInfo) {
        this.mDatas.add(aSAvatarConfigInfo);
        notifyDataSetChanged();
    }

    public int getCount() {
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
        ViewHolder viewHolder;
        ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) this.mDatas.get(i);
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.mimoji_thumbnail_view, null);
            viewHolder = new ViewHolder(view);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        c.g(this.mContext).a(aSAvatarConfigInfo.thum).b(new f().i(viewHolder.imageView.getDrawable())).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(20, 1))).a((j<?, ? super TranscodeType>) com.bumptech.glide.load.resource.b.c.f(new a(300).n(true).eE())).a(viewHolder.imageView);
        viewHolder.selectView.setVisibility(getSelectItem(aSAvatarConfigInfo.configType) == ((float) aSAvatarConfigInfo.configID) ? 0 : 4);
        return view;
    }

    public void refreshData(List<ASAvatarConfigInfo> list) {
        this.mDatas = list;
        notifyDataSetChanged();
    }

    public void setSelectItem(int i, int i2) {
        AvatarEngineManager instance = AvatarEngineManager.getInstance();
        if (instance != null) {
            instance.setInnerConfigSelectIndex(i, (float) i2);
        }
    }
}
