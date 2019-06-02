package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.fragment.music.RoundedCornersTransformation;
import com.android.camera.ui.baseview.BaseRecyclerAdapter;
import com.android.camera.ui.baseview.BaseRecyclerViewHolder;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.bumptech.glide.j;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.a.c;
import com.bumptech.glide.request.a.c.a;
import com.bumptech.glide.request.f;
import java.util.ArrayList;

public class MimojiThumbnailRecyclerAdapter extends BaseRecyclerAdapter<ASAvatarConfigInfo> {
    private Context mContext;
    private float selectIndex;

    static class ThumbnailViewViewHolder extends BaseRecyclerViewHolder<ASAvatarConfigInfo> {
        ImageView imageView;

        public ThumbnailViewViewHolder(@NonNull View view) {
            super(view);
            this.imageView = (ImageView) view.findViewById(R.id.thumbnail_image_view);
        }

        public void setData(ASAvatarConfigInfo aSAvatarConfigInfo, int i) {
            c eE = new a(300).n(true).eE();
            if (aSAvatarConfigInfo == null || aSAvatarConfigInfo.thum == null || aSAvatarConfigInfo.thum.isRecycled()) {
                Log.e(getClass().getSimpleName(), "fmoji bitmap isRecycled");
            } else {
                com.bumptech.glide.c.g(this.itemView.getContext()).a(aSAvatarConfigInfo.thum).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(20, 1))).a((j<?, ? super TranscodeType>) com.bumptech.glide.load.resource.b.c.f(eE)).a(this.imageView);
            }
            this.itemView.setBackground(MimojiThumbnailRecyclerAdapter.getSelectItem(aSAvatarConfigInfo.configType) == ((float) aSAvatarConfigInfo.configID) ? this.itemView.getContext().getDrawable(R.drawable.bg_mimoji_thumbnail_selected) : null);
            String simpleName = getClass().getSimpleName();
            StringBuilder sb = new StringBuilder();
            sb.append("fmoji MimojiThumbnailAdapter getView position: ");
            sb.append(i);
            Log.i(simpleName, sb.toString());
        }
    }

    public MimojiThumbnailRecyclerAdapter(Context context, int i) {
        this(null);
        this.mContext = context;
        this.selectIndex = getSelectItem(i);
    }

    public MimojiThumbnailRecyclerAdapter(ArrayList<ASAvatarConfigInfo> arrayList) {
        super(arrayList);
        this.selectIndex = -1.0f;
    }

    public static float getSelectItem(int i) {
        return AvatarEngineManager.getInstance().getInnerConfigSelectIndex(i);
    }

    @NonNull
    public BaseRecyclerViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        return new ThumbnailViewViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.mimoji_thumbnail_view, viewGroup, false));
    }

    public void setSelectItem(int i, int i2) {
        AvatarEngineManager instance = AvatarEngineManager.getInstance();
        if (instance != null) {
            instance.setInnerConfigSelectIndex(i, (float) i2);
        }
    }
}
