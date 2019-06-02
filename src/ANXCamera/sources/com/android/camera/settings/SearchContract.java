package com.android.camera.settings;

public class SearchContract {
    public static final String[] SEARCH_RESULT_COLUMNS = {"title", SearchResultColumn.COLUMN_SUMMARY_ON, SearchResultColumn.COLUMN_SUMMARY_OFF, SearchResultColumn.COLUMN_KEYWORDS, SearchResultColumn.COLUMN_ICON_RESID, SearchResultColumn.COLUMN_INTENT_ACTION, SearchResultColumn.COLUMN_INTENT_TARGET_PACKAGE, SearchResultColumn.COLUMN_INTENT_TARGET_CLASS, SearchResultColumn.COLUMN_URI_STRING, SearchResultColumn.COLUMN_EXTRAS, SearchResultColumn.COLUMN_OTHER};

    public static final class SearchResultColumn {
        public static final String COLUMN_EXTRAS = "extras";
        public static final String COLUMN_ICON_RESID = "iconResId";
        public static final String COLUMN_INTENT_ACTION = "intentAction";
        public static final String COLUMN_INTENT_TARGET_CLASS = "intentTargetClass";
        public static final String COLUMN_INTENT_TARGET_PACKAGE = "intentTargetPackage";
        public static final String COLUMN_KEYWORDS = "keywords";
        public static final String COLUMN_OTHER = "other";
        public static final String COLUMN_SUMMARY_OFF = "summaryOff";
        public static final String COLUMN_SUMMARY_ON = "summaryOn";
        public static final String COLUMN_TITLE = "title";
        public static final String COLUMN_URI_STRING = "uriString";

        private SearchResultColumn() {
        }
    }
}
