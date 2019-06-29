.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->showAlertDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

.field final synthetic val$backType:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->val$backType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->val$backType:I

    const/4 p2, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->val$backType:I

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    move p2, v0

    goto :goto_1

    :cond_1
    :goto_0
    nop

    :goto_1
    if-nez p2, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1300(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$600(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1400(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1500(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_2
    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    :goto_2
    invoke-virtual {p1, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1, p2, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$900(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;ZZ)V

    iget p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->val$backType:I

    packed-switch p1, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    const-string/jumbo p1, "\u840c\u62cd\u7f16\u8f91\u53d6\u6d88"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_1
    const-string/jumbo p1, "\u840c\u62cd\u7f16\u8f91\u7269\u7406\u952e\u8fd4\u56de"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_2
    const-string/jumbo p1, "\u840c\u62cd\u9884\u89c8\u4e2d\u95f4\u9875\u7269\u7406\u952e\u8fd4\u56de"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_3
    const-string/jumbo p1, "\u840c\u62cd\u9884\u89c8\u4e2d\u95f4\u9875\u91cd\u62cd"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    goto :goto_3

    :pswitch_4
    const-string/jumbo p1, "\u840c\u62cd\u9884\u89c8\u4e2d\u95f4\u9875\u8fd4\u56de"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    nop

    :goto_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$7;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1602(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;Z)Z

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
