.class Lcom/webuid/mmVideo/SoftListActivity$11;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/SoftListActivity;->startSearch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$11;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 233
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 234
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 235
    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity$11;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/SoftListActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 236
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 220
    const-wide/16 v1, 0xc8

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 224
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity$11;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/webuid/mmVideo/SoftListActivity;->access$4(Lcom/webuid/mmVideo/SoftListActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 225
    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity$11;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/SoftListActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 230
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/SoftListActivity$11;->sendMessage(I)V

    .line 231
    return-void

    .line 226
    :catch_0
    move-exception v0

    .line 228
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 221
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_0
.end method
