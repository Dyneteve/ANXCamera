.class public final Lcom/adobe/xmp/XMPDateTimeFactory;
.super Ljava/lang/Object;
.source "XMPDateTimeFactory.java"


# static fields
.field private static final UTC:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/adobe/xmp/XMPDateTimeFactory;->UTC:Ljava/util/TimeZone;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToLocalTime(Lcom/adobe/xmp/XMPDateTime;)Lcom/adobe/xmp/XMPDateTime;
    .locals 2

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    new-instance p0, Ljava/util/GregorianCalendar;

    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-virtual {p0, v0, v1}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static convertToUTCTime(Lcom/adobe/xmp/XMPDateTime;)Lcom/adobe/xmp/XMPDateTime;
    .locals 5

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    new-instance p0, Ljava/util/GregorianCalendar;

    sget-object v2, Lcom/adobe/xmp/XMPDateTimeFactory;->UTC:Ljava/util/TimeZone;

    invoke-direct {p0, v2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    new-instance v2, Ljava/util/Date;

    const-wide/high16 v3, -0x8000000000000000L

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v2}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    invoke-virtual {p0, v0, v1}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static create(IIIIIII)Lcom/adobe/xmp/XMPDateTime;
    .locals 1

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>()V

    invoke-interface {v0, p0}, Lcom/adobe/xmp/XMPDateTime;->setYear(I)V

    invoke-interface {v0, p1}, Lcom/adobe/xmp/XMPDateTime;->setMonth(I)V

    invoke-interface {v0, p2}, Lcom/adobe/xmp/XMPDateTime;->setDay(I)V

    invoke-interface {v0, p3}, Lcom/adobe/xmp/XMPDateTime;->setHour(I)V

    invoke-interface {v0, p4}, Lcom/adobe/xmp/XMPDateTime;->setMinute(I)V

    invoke-interface {v0, p5}, Lcom/adobe/xmp/XMPDateTime;->setSecond(I)V

    invoke-interface {v0, p6}, Lcom/adobe/xmp/XMPDateTime;->setNanoSecond(I)V

    return-object v0
.end method

.method public static createFromCalendar(Ljava/util/Calendar;)Lcom/adobe/xmp/XMPDateTime;
    .locals 1

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static createFromISO8601(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getCurrentDateTime()Lcom/adobe/xmp/XMPDateTime;
    .locals 2

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-direct {v0, v1}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static setLocalTimeZone(Lcom/adobe/xmp/XMPDateTime;)Lcom/adobe/xmp/XMPDateTime;
    .locals 1

    invoke-interface {p0}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object p0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method
