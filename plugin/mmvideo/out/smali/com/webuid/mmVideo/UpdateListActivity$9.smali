.class Lcom/webuid/mmVideo/UpdateListActivity$9;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$9;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 173
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 174
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 175
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$9;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/UpdateListActivity;->mainHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 176
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 163
    const-wide/16 v0, 0x64

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :goto_0
    const-string v0, "currentThread"

    const-string v1, "currentThread"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/UpdateListActivity$9;->sendMessage(I)V

    .line 171
    return-void

    .line 164
    :catch_0
    move-exception v0

    goto :goto_0
.end method
