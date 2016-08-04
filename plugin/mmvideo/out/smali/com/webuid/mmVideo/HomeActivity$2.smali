.class Lcom/webuid/mmVideo/HomeActivity$2;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/HomeActivity;->onCreate(Landroid/os/Bundle;)V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/HomeActivity$2;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 90
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 91
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 92
    iget-object v1, p0, Lcom/webuid/mmVideo/HomeActivity$2;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/HomeActivity;->mainHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 93
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 79
    const-wide/16 v0, 0x64

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :goto_0
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity$2;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    #getter for: Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;
    invoke-static {v0}, Lcom/webuid/mmVideo/HomeActivity;->access$0(Lcom/webuid/mmVideo/HomeActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity$2;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    #getter for: Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;
    invoke-static {v0}, Lcom/webuid/mmVideo/HomeActivity;->access$0(Lcom/webuid/mmVideo/HomeActivity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity$2;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/HomeActivity;->getDataSource2()V

    .line 87
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/HomeActivity$2;->sendMessage(I)V

    .line 88
    return-void

    .line 80
    :catch_0
    move-exception v0

    goto :goto_0
.end method
