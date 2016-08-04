.class Lcom/webuid/mmVideo/UpdateManager$1;
.super Landroid/os/Handler;
.source "UpdateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/UpdateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateManager;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateManager;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateManager$1;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    .line 50
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 52
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 62
    :goto_0
    return-void

    .line 54
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager$1;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->mProgress:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateManager;->access$0(Lcom/webuid/mmVideo/UpdateManager;)Landroid/widget/ProgressBar;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager$1;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->progress:I
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateManager;->access$1(Lcom/webuid/mmVideo/UpdateManager;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_0

    .line 57
    :pswitch_1
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager$1;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #calls: Lcom/webuid/mmVideo/UpdateManager;->installApk()V
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateManager;->access$2(Lcom/webuid/mmVideo/UpdateManager;)V

    goto :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
