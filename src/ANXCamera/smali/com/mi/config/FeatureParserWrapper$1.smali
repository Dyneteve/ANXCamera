.class Lcom/mi/config/FeatureParserWrapper$1;
.super Ljava/util/HashMap;
.source "FeatureParserWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mi/config/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v0, "support_screen_light"

    const-string v1, "o_0x00_s_s_l"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "camera_reduce_preview_flag"

    const-string v1, "o_0x01_r_p_s_f"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "vendor"

    const-string v1, "o_0x02_soc_vendor"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
