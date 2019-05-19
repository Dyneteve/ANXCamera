package org.jcodec.movtool;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.io.FileChannelWrapper;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.Chunk;
import org.jcodec.containers.mp4.ChunkReader;
import org.jcodec.containers.mp4.ChunkWriter;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Movie;
import org.jcodec.containers.mp4.boxes.AliasBox;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.ChunkOffsetsBox;
import org.jcodec.containers.mp4.boxes.DataRefBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;
import org.jcodec.containers.mp4.boxes.NodeBox;
import org.jcodec.containers.mp4.boxes.TrakBox;
import org.jcodec.containers.mp4.boxes.UrlBox;
import org.jcodec.platform.Platform;

public class Flattern {
    public List<ProgressListener> listeners = new ArrayList();

    public interface ProgressListener {
        void trigger(int i);
    }

    private int calcProgress(int i, int i2, int i3) {
        int i4 = (100 * i2) / i;
        if (i3 >= i4) {
            return i3;
        }
        for (ProgressListener trigger : this.listeners) {
            trigger.trigger(i4);
        }
        return i4;
    }

    private int calcSpaceReq(MovieBox movieBox) {
        TrakBox[] tracks = movieBox.getTracks();
        int i = 0;
        for (TrakBox stco : tracks) {
            ChunkOffsetsBox stco2 = stco.getStco();
            if (stco2 != null) {
                i += stco2.getChunkOffsets().length * 4;
            }
        }
        return i;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x003f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void main1(String[] strArr) throws Exception {
        SeekableByteChannel seekableByteChannel;
        if (strArr.length < 2) {
            System.out.println("Syntax: self <ref movie> <out movie>");
            System.exit(-1);
        }
        File file = new File(strArr[1]);
        Platform.deleteFile(file);
        try {
            seekableByteChannel = NIOUtils.readableChannel(new File(strArr[0]));
            try {
                new Flattern().flattern(MP4Util.parseFullMovieChannel(seekableByteChannel), file);
                if (seekableByteChannel != null) {
                    seekableByteChannel.close();
                }
            } catch (Throwable th) {
                th = th;
                if (seekableByteChannel != null) {
                    seekableByteChannel.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            seekableByteChannel = null;
            if (seekableByteChannel != null) {
            }
            throw th;
        }
    }

    private void writeHeader(Header header, SeekableByteChannel seekableByteChannel) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(16);
        header.write(allocate);
        allocate.flip();
        seekableByteChannel.write(allocate);
    }

    public void addProgressListener(ProgressListener progressListener) {
        this.listeners.add(progressListener);
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0017  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void flattern(Movie movie, File file) throws IOException {
        FileChannelWrapper fileChannelWrapper;
        Platform.deleteFile(file);
        try {
            fileChannelWrapper = NIOUtils.writableChannel(file);
            try {
                flatternChannel(movie, fileChannelWrapper);
                if (fileChannelWrapper != null) {
                    fileChannelWrapper.close();
                }
            } catch (Throwable th) {
                th = th;
                if (fileChannelWrapper != null) {
                    fileChannelWrapper.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            fileChannelWrapper = null;
            if (fileChannelWrapper != null) {
            }
            throw th;
        }
    }

    public void flatternChannel(Movie movie, SeekableByteChannel seekableByteChannel) throws IOException {
        int i;
        long j;
        long j2;
        int i2;
        int i3;
        Movie movie2 = movie;
        SeekableByteChannel seekableByteChannel2 = seekableByteChannel;
        movie.getFtyp();
        MovieBox moov = movie.getMoov();
        if (moov.isPureRefMovie()) {
            seekableByteChannel2.setPosition(0);
            MP4Util.writeFullMovie(seekableByteChannel2, movie2);
            seekableByteChannel2.write(ByteBuffer.allocate(calcSpaceReq(moov)));
            long position = seekableByteChannel.position();
            writeHeader(Header.createHeader("mdat", 4294967297L), seekableByteChannel2);
            SeekableByteChannel[][] inputs = getInputs(moov);
            TrakBox[] tracks = moov.getTracks();
            ChunkReader[] chunkReaderArr = new ChunkReader[tracks.length];
            ChunkWriter[] chunkWriterArr = new ChunkWriter[tracks.length];
            Chunk[] chunkArr = new Chunk[tracks.length];
            long[] jArr = new long[tracks.length];
            int i4 = 0;
            int i5 = 0;
            while (i5 < tracks.length) {
                chunkReaderArr[i5] = new ChunkReader(tracks[i5]);
                int size = i4 + chunkReaderArr[i5].size();
                chunkWriterArr[i5] = new ChunkWriter(tracks[i5], inputs[i5], seekableByteChannel2);
                chunkArr[i5] = chunkReaderArr[i5].next();
                if (tracks[i5].isVideo()) {
                    jArr[i5] = (long) (2 * moov.getTimescale());
                }
                i5++;
                i4 = size;
            }
            int i6 = 0;
            int i7 = 0;
            while (true) {
                int i8 = -1;
                int i9 = 0;
                while (true) {
                    i = i7;
                    if (i9 >= chunkReaderArr.length) {
                        break;
                    }
                    if (chunkArr[i9] == null) {
                        i3 = i6;
                        j2 = position;
                        i2 = i4;
                    } else {
                        if (i8 == -1) {
                            i3 = i6;
                            j2 = position;
                            i2 = i4;
                        } else {
                            i3 = i6;
                            i2 = i4;
                            j2 = position;
                            if (moov.rescale(chunkArr[i9].getStartTv(), (long) tracks[i9].getTimescale()) + jArr[i9] >= moov.rescale(chunkArr[i8].getStartTv(), (long) tracks[i8].getTimescale()) + jArr[i8]) {
                            }
                        }
                        i8 = i9;
                    }
                    i9++;
                    i7 = i;
                    i6 = i3;
                    i4 = i2;
                    position = j2;
                    Movie movie3 = movie;
                }
                int i10 = i6;
                j = position;
                int i11 = i4;
                if (i8 == -1) {
                    break;
                }
                long j3 = j;
                Movie movie4 = movie;
                chunkWriterArr[i8].write(chunkArr[i8]);
                chunkArr[i8] = chunkReaderArr[i8].next();
                int i12 = i10 + 1;
                int i13 = i11;
                int calcProgress = calcProgress(i13, i12, i);
                i6 = i12;
                i7 = calcProgress;
                long j4 = j3;
                i4 = i13;
                Movie movie5 = movie4;
                position = j4;
            }
            for (int i14 = 0; i14 < tracks.length; i14++) {
                chunkWriterArr[i14].apply();
            }
            long position2 = seekableByteChannel.position() - j;
            seekableByteChannel2.setPosition(0);
            MP4Util.writeFullMovie(seekableByteChannel2, movie);
            long position3 = j - seekableByteChannel.position();
            if (position3 >= 0) {
                writeHeader(Header.createHeader("free", position3), seekableByteChannel2);
                seekableByteChannel2.setPosition(j);
                writeHeader(Header.createHeader("mdat", position2), seekableByteChannel2);
                return;
            }
            throw new RuntimeException("Not enough space to write the header");
        }
        throw new IllegalArgumentException("movie should be reference");
    }

    /* access modifiers changed from: protected */
    public SeekableByteChannel[][] getInputs(MovieBox movieBox) throws IOException {
        TrakBox[] tracks = movieBox.getTracks();
        SeekableByteChannel[][] seekableByteChannelArr = new SeekableByteChannel[tracks.length][];
        int i = 0;
        while (i < tracks.length) {
            DataRefBox dataRefBox = (DataRefBox) NodeBox.findFirstPath(tracks[i], DataRefBox.class, Box.path("mdia.minf.dinf.dref"));
            if (dataRefBox != null) {
                List boxes = dataRefBox.getBoxes();
                SeekableByteChannel[] seekableByteChannelArr2 = new SeekableByteChannel[boxes.size()];
                SeekableByteChannel[] seekableByteChannelArr3 = new SeekableByteChannel[boxes.size()];
                for (int i2 = 0; i2 < seekableByteChannelArr2.length; i2++) {
                    seekableByteChannelArr3[i2] = resolveDataRef((Box) boxes.get(i2));
                }
                seekableByteChannelArr[i] = seekableByteChannelArr3;
                i++;
            } else {
                throw new RuntimeException("No data references");
            }
        }
        return seekableByteChannelArr;
    }

    public SeekableByteChannel resolveDataRef(Box box) throws IOException {
        if (box instanceof UrlBox) {
            String url = ((UrlBox) box).getUrl();
            if (url.startsWith("file://")) {
                return NIOUtils.readableChannel(new File(url.substring(7)));
            }
            throw new RuntimeException("Only file:// urls are supported in data reference");
        } else if (box instanceof AliasBox) {
            String unixPath = ((AliasBox) box).getUnixPath();
            if (unixPath != null) {
                return NIOUtils.readableChannel(new File(unixPath));
            }
            throw new RuntimeException("Could not resolve alias");
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(box.getHeader().getFourcc());
            sb.append(" dataref type is not supported");
            throw new RuntimeException(sb.toString());
        }
    }
}
