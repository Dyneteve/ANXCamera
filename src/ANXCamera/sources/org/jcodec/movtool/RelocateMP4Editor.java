package org.jcodec.movtool;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import org.jcodec.common.io.FileChannelWrapper;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.BoxFactory;
import org.jcodec.containers.mp4.BoxUtil;
import org.jcodec.containers.mp4.MP4Util;
import org.jcodec.containers.mp4.MP4Util.Atom;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.MovieBox;

public class RelocateMP4Editor {
    private ByteBuffer fetchBox(SeekableByteChannel seekableByteChannel, Atom atom) throws IOException {
        seekableByteChannel.setPosition(atom.getOffset());
        return NIOUtils.fetchFromChannel(seekableByteChannel, (int) atom.getHeader().getSize());
    }

    private Atom getMoov(SeekableByteChannel seekableByteChannel) throws IOException {
        for (Atom atom : MP4Util.getRootAtoms(seekableByteChannel)) {
            if ("moov".equals(atom.getHeader().getFourcc())) {
                return atom;
            }
        }
        return null;
    }

    private Box parseBox(ByteBuffer byteBuffer) {
        return BoxUtil.parseBox(byteBuffer, Header.read(byteBuffer), BoxFactory.getDefault());
    }

    public void modifyOrRelocate(File file, MP4Edit mP4Edit) throws IOException {
        if (!new InplaceMP4Editor().modify(file, mP4Edit)) {
            relocate(file, mP4Edit);
        }
    }

    public void relocate(File file, MP4Edit mP4Edit) throws IOException {
        FileChannelWrapper fileChannelWrapper;
        try {
            fileChannelWrapper = NIOUtils.rwChannel(file);
            try {
                Atom moov = getMoov(fileChannelWrapper);
                MovieBox movieBox = (MovieBox) parseBox(fetchBox(fileChannelWrapper, moov));
                mP4Edit.apply(movieBox);
                if (moov.getOffset() + moov.getHeader().getSize() < fileChannelWrapper.size()) {
                    fileChannelWrapper.setPosition(moov.getOffset() + 4);
                    fileChannelWrapper.write(ByteBuffer.wrap(Header.FOURCC_FREE));
                    fileChannelWrapper.setPosition(fileChannelWrapper.size());
                } else {
                    fileChannelWrapper.setPosition(moov.getOffset());
                }
                MP4Util.writeMovie(fileChannelWrapper, movieBox);
                NIOUtils.closeQuietly(fileChannelWrapper);
            } catch (Throwable th) {
                th = th;
                NIOUtils.closeQuietly(fileChannelWrapper);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            fileChannelWrapper = null;
            NIOUtils.closeQuietly(fileChannelWrapper);
            throw th;
        }
    }
}
