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

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "camera_reduce_preview_flag"

    const-string v1, "o_0x01_r_p_s_f"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string/jumbo v0, "vendor"

    const-string v1, "o_0x02_soc_vendor"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_3d_face_beauty"

    const-string v1, "o_0x03_support_3d_face_beauty"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_mi_face_beauty"

    const-string v1, "o_0x04_support_mi_face_beauty"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "is_support_optical_zoom"

    const-string v1, "o_0x05_is_support_optical_zoom"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_peaking_mf"

    const-string v1, "o_0x06_is_support_peaking_mf"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_dynamic_light_spot"

    const-string v1, "o_0x08_is_support_dynamic_light_spot"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_hfr"

    const-string v1, "o_0x07_support_hfr"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_movie_solid"

    const-string v1, "o_0x08_support_movie_solid"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_tilt_shift"

    const-string v1, "o_0x09_support_tilt_shift"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_gradienter"

    const-string v1, "o_0x10_support_gradienter"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_picture_watermark"

    const-string v1, "o_0x11_picture_water_mark"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_magic_mirror"

    const-string v1, "o_0x12_magic_mirror"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_camera_age_detection"

    const-string v1, "o_0x13_age_detection"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "burst_shoot_count"

    const-string v1, "o_0x14_burst_count"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "support_dual_sd_card"

    const-string v1, "o_0x15_support_dual_sd_card"

    invoke-virtual {p0, v0, v1}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/mi/config/FeatureParserWrapper$1;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-eqz p2, :cond_1

    const-string v0, "o_0x"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The key \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" has already be mapped to \""

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The key \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" must be mapped to non-null string starting with \"o_0x\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
