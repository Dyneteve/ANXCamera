.class public final Lcom/google/zxing/client/result/CalendarParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "CalendarParsedResult.java"


# static fields
.field private static final DATE_TIME:Ljava/util/regex/Pattern;

.field private static final RFC2445_DURATION:Ljava/util/regex/Pattern;

.field private static final RFC2445_DURATION_FIELD_UNITS:[J


# instance fields
.field private final attendees:[Ljava/lang/String;

.field private final description:Ljava/lang/String;

.field private final end:Ljava/util/Date;

.field private final endAllDay:Z

.field private final latitude:D

.field private final location:Ljava/lang/String;

.field private final longitude:D

.field private final organizer:Ljava/lang/String;

.field private final start:Ljava/util/Date;

.field private final startAllDay:Z

.field private final summary:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "P(?:(\\d+)W)?(?:(\\d+)D)?(?:T(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+)S)?)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/CalendarParsedResult;->RFC2445_DURATION:Ljava/util/regex/Pattern;

    const/4 v0, 0x5

    new-array v0, v0, [J

    fill-array-data v0, :array_1e

    nop

    nop

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/client/result/CalendarParsedResult;->RFC2445_DURATION_FIELD_UNITS:[J

    const-string v0, "[0-9]{8}(T[0-9]{6}Z?)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/CalendarParsedResult;->DATE_TIME:Ljava/util/regex/Pattern;

    return-void

    :array_1e
    .array-data 8
        0x240c8400
        0x5265c00
        0x36ee80
        0xea60
        0x3e8
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;DD)V
    .registers 26

    move-object v1, p0

    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->CALENDAR:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {v1, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    move-object v2, p1

    iput-object v2, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->summary:Ljava/lang/String;

    :try_start_9
    invoke-static {p2}, Lcom/google/zxing/client/result/CalendarParsedResult;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->start:Ljava/util/Date;
    :try_end_f
    .catch Ljava/text/ParseException; {:try_start_9 .. :try_end_f} :catch_7f

    nop

    if-nez p3, :cond_2d

    invoke-static/range {p4 .. p4}, Lcom/google/zxing/client/result/CalendarParsedResult;->parseDurationMS(Ljava/lang/CharSequence;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-gez v0, :cond_1e

    const/4 v0, 0x0

    goto :goto_2a

    :cond_1e
    new-instance v0, Ljava/util/Date;

    iget-object v5, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->start:Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    add-long/2addr v5, v3

    invoke-direct {v0, v5, v6}, Ljava/util/Date;-><init>(J)V

    :goto_2a
    iput-object v0, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->end:Ljava/util/Date;

    goto :goto_34

    :cond_2d
    :try_start_2d
    invoke-static/range {p3 .. p3}, Lcom/google/zxing/client/result/CalendarParsedResult;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->end:Ljava/util/Date;
    :try_end_33
    .catch Ljava/text/ParseException; {:try_start_2d .. :try_end_33} :catch_68

    nop

    :goto_34
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v5, 0x8

    if-ne v0, v5, :cond_40

    move v0, v4

    goto :goto_41

    :cond_40
    move v0, v3

    :goto_41
    iput-boolean v0, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->startAllDay:Z

    if-eqz p3, :cond_4d

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v5, :cond_4d

    move v3, v4

    nop

    :cond_4d
    iput-boolean v3, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->endAllDay:Z

    move-object/from16 v3, p5

    iput-object v3, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->location:Ljava/lang/String;

    move-object/from16 v4, p6

    iput-object v4, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->organizer:Ljava/lang/String;

    move-object/from16 v5, p7

    iput-object v5, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->attendees:[Ljava/lang/String;

    move-object/from16 v6, p8

    iput-object v6, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->description:Ljava/lang/String;

    move-wide/from16 v7, p9

    iput-wide v7, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->latitude:D

    move-wide/from16 v9, p11

    iput-wide v9, v1, Lcom/google/zxing/client/result/CalendarParsedResult;->longitude:D

    return-void

    :catch_68
    move-exception v0

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move-wide/from16 v7, p9

    move-wide/from16 v9, p11

    new-instance v11, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/text/ParseException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    :catch_7f
    move-exception v0

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p8

    move-wide/from16 v7, p9

    move-wide/from16 v9, p11

    new-instance v11, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/text/ParseException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11
.end method

.method private static buildDateFormat()Ljava/text/DateFormat;
    .registers 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-object v0
.end method

.method private static buildDateTimeFormat()Ljava/text/DateFormat;
    .registers 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd\'T\'HHmmss"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    return-object v0
.end method

.method private static format(ZLjava/util/Date;)Ljava/lang/String;
    .registers 4

    if-nez p1, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    const/4 v0, 0x2

    if-eqz p0, :cond_c

    invoke-static {v0}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_10

    :cond_c
    invoke-static {v0, v0}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    :goto_10
    nop

    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static parseDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/client/result/CalendarParsedResult;->DATE_TIME:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_68

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_1e

    invoke-static {}, Lcom/google/zxing/client/result/CalendarParsedResult;->buildDateFormat()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0

    :cond_1e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x10

    if-ne v0, v2, :cond_5f

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5a

    if-ne v3, v4, :cond_5f

    invoke-static {}, Lcom/google/zxing/client/result/CalendarParsedResult;->buildDateTimeFormat()Ljava/text/DateFormat;

    move-result-object v3

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    new-instance v3, Ljava/util/GregorianCalendar;

    invoke-direct {v3}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v3, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    int-to-long v6, v0

    add-long/2addr v4, v6

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    invoke-virtual {v3, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    int-to-long v6, v0

    add-long/2addr v4, v6

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    goto :goto_67

    :cond_5f
    invoke-static {}, Lcom/google/zxing/client/result/CalendarParsedResult;->buildDateTimeFormat()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    :goto_67
    return-object v0

    :cond_68
    new-instance v0, Ljava/text/ParseException;

    invoke-direct {v0, p0, v1}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static parseDurationMS(Ljava/lang/CharSequence;)J
    .registers 10

    const-wide/16 v0, -0x1

    if-nez p0, :cond_5

    return-wide v0

    :cond_5
    sget-object v2, Lcom/google/zxing/client/result/CalendarParsedResult;->RFC2445_DURATION:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_12

    return-wide v0

    :cond_12
    const-wide/16 v0, 0x0

    const/4 v3, 0x0

    :goto_15
    sget-object v4, Lcom/google/zxing/client/result/CalendarParsedResult;->RFC2445_DURATION_FIELD_UNITS:[J

    array-length v4, v4

    if-lt v3, v4, :cond_1b

    return-wide v0

    :cond_1b
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2e

    sget-object v5, Lcom/google/zxing/client/result/CalendarParsedResult;->RFC2445_DURATION_FIELD_UNITS:[J

    aget-wide v5, v5, v3

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    mul-long/2addr v5, v7

    add-long/2addr v0, v5

    :cond_2e
    add-int/lit8 v3, v3, 0x1

    goto :goto_15
.end method


# virtual methods
.method public getAttendees()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->attendees:[Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->summary:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-boolean v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->startAllDay:Z

    iget-object v2, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->start:Ljava/util/Date;

    invoke-static {v1, v2}, Lcom/google/zxing/client/result/CalendarParsedResult;->format(ZLjava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-boolean v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->endAllDay:Z

    iget-object v2, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->end:Ljava/util/Date;

    invoke-static {v1, v2}, Lcom/google/zxing/client/result/CalendarParsedResult;->format(ZLjava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->location:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->organizer:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->attendees:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->description:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/CalendarParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEnd()Ljava/util/Date;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->end:Ljava/util/Date;

    return-object v0
.end method

.method public getLatitude()D
    .registers 3

    iget-wide v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->latitude:D

    return-wide v0
.end method

.method public getLocation()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getLongitude()D
    .registers 3

    iget-wide v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->longitude:D

    return-wide v0
.end method

.method public getOrganizer()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->organizer:Ljava/lang/String;

    return-object v0
.end method

.method public getStart()Ljava/util/Date;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->start:Ljava/util/Date;

    return-object v0
.end method

.method public getSummary()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->summary:Ljava/lang/String;

    return-object v0
.end method

.method public isEndAllDay()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->endAllDay:Z

    return v0
.end method

.method public isStartAllDay()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/zxing/client/result/CalendarParsedResult;->startAllDay:Z

    return v0
.end method
