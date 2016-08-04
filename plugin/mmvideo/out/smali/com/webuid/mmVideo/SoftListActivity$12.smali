.class Lcom/webuid/mmVideo/SoftListActivity$12;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/SoftListActivity;->getListFromCache()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$12;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 382
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 386
    iget-object v2, p0, Lcom/webuid/mmVideo/SoftListActivity$12;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/webuid/mmVideo/SoftListActivity;->access$4(Lcom/webuid/mmVideo/SoftListActivity;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_0

    .line 388
    const-wide/16 v2, 0x64

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    .line 398
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/webuid/mmVideo/SoftListActivity$12;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/SoftListActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 403
    :goto_1
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 404
    .local v1, message:Landroid/os/Message;
    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    .line 405
    iget-object v2, p0, Lcom/webuid/mmVideo/SoftListActivity$12;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    iget-object v2, v2, Lcom/webuid/mmVideo/SoftListActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 406
    return-void

    .line 393
    .end local v1           #message:Landroid/os/Message;
    :cond_0
    const-wide/16 v2, 0xfa0

    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 394
    :catch_0
    move-exception v2

    goto :goto_0

    .line 399
    :catch_1
    move-exception v0

    .line 401
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 389
    .end local v0           #e:Ljava/lang/Exception;
    :catch_2
    move-exception v2

    goto :goto_0
.end method
