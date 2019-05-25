package com.android.camera.fragment.music;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.bumptech.glide.c;
import com.bumptech.glide.load.i;
import com.bumptech.glide.request.f;
import com.oneplus.camera.R;
import java.util.List;

public class MusicAdapter extends Adapter<CommonRecyclerViewHolder> {
    private Context mContext;
    private List<LiveMusicInfo> mMusicList;
    private OnClickListener mOnClickListener;
    private OnTouchListener mOnTouchListener;

    public MusicAdapter(Context context, OnClickListener onClickListener, OnTouchListener onTouchListener, List<LiveMusicInfo> list) {
        this.mContext = context;
        this.mOnClickListener = onClickListener;
        this.mOnTouchListener = onTouchListener;
        this.mMusicList = list;
    }

    public int getItemCount() {
        return this.mMusicList.size();
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        LiveMusicInfo liveMusicInfo = (LiveMusicInfo) this.mMusicList.get(i);
        commonRecyclerViewHolder.itemView.setOnTouchListener(this.mOnTouchListener);
        commonRecyclerViewHolder.itemView.setTag(liveMusicInfo);
        ((TextView) commonRecyclerViewHolder.getView(R.id.music_author)).setText(liveMusicInfo.mAuthor);
        ((TextView) commonRecyclerViewHolder.getView(R.id.music_title)).setText(liveMusicInfo.mTitle);
        c.g(this.mContext).l(liveMusicInfo.mThumbnailUrl).b(f.a((i<Bitmap>) new RoundedCornersTransformation<Bitmap>(10, 1))).a((ImageView) commonRecyclerViewHolder.getView(R.id.music_thumbnail));
        ImageView imageView = (ImageView) commonRecyclerViewHolder.getView(R.id.music_play);
        imageView.setOnClickListener(this.mOnClickListener);
        imageView.setTag(liveMusicInfo);
        ((ProgressBar) commonRecyclerViewHolder.getView(R.id.music_loading)).setTag(liveMusicInfo);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.music_duration);
        StringBuilder sb = new StringBuilder();
        sb.append("00 : ");
        sb.append(liveMusicInfo.mDuration);
        textView.setText(sb.toString());
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new CommonRecyclerViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_music_adapter, viewGroup, false));
    }

    public void setData(List<LiveMusicInfo> list) {
        this.mMusicList = list;
        notifyDataSetChanged();
    }
}
