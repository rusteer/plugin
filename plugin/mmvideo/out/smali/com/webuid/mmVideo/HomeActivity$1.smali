.class Lcom/webuid/mmVideo/HomeActivity$1;
.super Landroid/os/Handler;
.source "HomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/HomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/HomeActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/HomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/HomeActivity$1;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    .line 157
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 160
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 168
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 169
    return-void

    .line 163
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity$1;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/HomeActivity;->checkVersion()V

    goto :goto_0

    .line 160
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
