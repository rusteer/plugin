.class Lcom/webuid/mmVideo/UpdateListActivity$12;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateListActivity;->getListFromCache()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$12;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 410
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 434
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 435
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 436
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$12;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/UpdateListActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 437
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 414
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$12;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$4(Lcom/webuid/mmVideo/UpdateListActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 416
    const-wide/16 v1, 0x64

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    .line 426
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$12;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 431
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/UpdateListActivity$12;->sendMessage(I)V

    .line 432
    return-void

    .line 421
    :cond_0
    const-wide/16 v1, 0xfa0

    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 422
    :catch_0
    move-exception v1

    goto :goto_0

    .line 427
    :catch_1
    move-exception v0

    .line 429
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 417
    .end local v0           #e:Ljava/lang/Exception;
    :catch_2
    move-exception v1

    goto :goto_0
.end method
