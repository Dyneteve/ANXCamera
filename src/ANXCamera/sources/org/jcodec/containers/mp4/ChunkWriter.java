package org.jcodec.containers.mp4;

import java.io.IOException;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.containers.mp4.boxes.AliasBox;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.ChunkOffsets64Box;
import org.jcodec.containers.mp4.boxes.ChunkOffsetsBox;
import org.jcodec.containers.mp4.boxes.DataInfoBox;
import org.jcodec.containers.mp4.boxes.DataRefBox;
import org.jcodec.containers.mp4.boxes.MediaInfoBox;
import org.jcodec.containers.mp4.boxes.NodeBox;
import org.jcodec.containers.mp4.boxes.SampleEntry;
import org.jcodec.containers.mp4.boxes.TrakBox;

public class ChunkWriter {
    byte[] buf = new byte[8092];
    private int curChunk;
    private SampleEntry[] entries;
    private SeekableByteChannel[] inputs;
    private long[] offsets;
    private SeekableByteChannel out;
    private TrakBox trak;

    public ChunkWriter(TrakBox trakBox, SeekableByteChannel[] seekableByteChannelArr, SeekableByteChannel seekableByteChannel) {
        this.entries = trakBox.getSampleEntries();
        ChunkOffsetsBox stco = trakBox.getStco();
        int length = stco != null ? stco.getChunkOffsets().length : trakBox.getCo64().getChunkOffsets().length;
        this.inputs = seekableByteChannelArr;
        this.offsets = new long[length];
        this.out = seekableByteChannel;
        this.trak = trakBox;
    }

    private void cleanDrefs(TrakBox trakBox) {
        MediaInfoBox minf = trakBox.getMdia().getMinf();
        DataInfoBox dinf = trakBox.getMdia().getMinf().getDinf();
        if (dinf == null) {
            dinf = DataInfoBox.createDataInfoBox();
            minf.add(dinf);
        }
        DataRefBox dref = dinf.getDref();
        if (dref == null) {
            dref = DataRefBox.createDataRefBox();
            dinf.add(dref);
        }
        dref.getBoxes().clear();
        dref.add(AliasBox.createSelfRef());
        SampleEntry[] sampleEntries = trakBox.getSampleEntries();
        for (SampleEntry drefInd : sampleEntries) {
            drefInd.setDrefInd(1);
        }
    }

    private SeekableByteChannel getInput(Chunk chunk) {
        return this.inputs[this.entries[chunk.getEntry() - 1].getDrefInd() - 1];
    }

    public void apply() {
        NodeBox nodeBox = (NodeBox) NodeBox.findFirstPath(this.trak, NodeBox.class, Box.path("mdia.minf.stbl"));
        nodeBox.removeChildren(new String[]{"stco", "co64"});
        nodeBox.add(ChunkOffsets64Box.createChunkOffsets64Box(this.offsets));
        cleanDrefs(this.trak);
    }

    public void write(Chunk chunk) throws IOException {
        SeekableByteChannel input = getInput(chunk);
        input.setPosition(chunk.getOffset());
        long position = this.out.position();
        this.out.write(NIOUtils.fetchFromChannel(input, (int) chunk.getSize()));
        long[] jArr = this.offsets;
        int i = this.curChunk;
        this.curChunk = i + 1;
        jArr[i] = position;
    }
}
