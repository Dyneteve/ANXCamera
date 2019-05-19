package org.jcodec.containers.mp4.boxes;

public class MovieFragmentBox extends NodeBox {
    private MovieBox moov;

    public MovieFragmentBox(Header header) {
        super(header);
    }

    public static MovieFragmentBox createMovieFragmentBox() {
        return new MovieFragmentBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "moof";
    }

    public MovieBox getMovie() {
        return this.moov;
    }

    public int getSequenceNumber() {
        MovieFragmentHeaderBox movieFragmentHeaderBox = (MovieFragmentHeaderBox) findFirst(this, MovieFragmentHeaderBox.class, MovieFragmentHeaderBox.fourcc());
        if (movieFragmentHeaderBox != null) {
            return movieFragmentHeaderBox.getSequenceNumber();
        }
        throw new RuntimeException("Corrupt movie fragment, no header atom found");
    }

    public TrackFragmentBox[] getTracks() {
        return (TrackFragmentBox[]) findAll(this, TrackFragmentBox.class, TrackFragmentBox.fourcc());
    }

    public void setMovie(MovieBox movieBox) {
        this.moov = movieBox;
    }
}
