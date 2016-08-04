.class Lcom/webuid/mmVideo/PlayerActivity$1;
.super Landroid/os/Handler;
.source "PlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayerActivity$1;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    .line 121
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 124
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 133
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 134
    return-void

    .line 127
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity$1;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u83b7\u53d6\u5730\u5740\u6210\u529f:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayerActivity$1;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    #getter for: Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;
    invoke-static {v2}, Lcom/webuid/mmVideo/PlayerActivity;->access$0(Lcom/webuid/mmVideo/PlayerActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 128
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity$1;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    #calls: Lcom/webuid/mmVideo/PlayerActivity;->playVideoNow()V
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayerActivity;->access$1(Lcom/webuid/mmVideo/PlayerActivity;)V

    goto :goto_0

    .line 124
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
