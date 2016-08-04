.class Lcom/webuid/mmVideo/RecommendActivity$13;
.super Ljava/lang/Object;
.source "RecommendActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/RecommendActivity;->startSearch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RecommendActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$13;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 327
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 328
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 329
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$13;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 330
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 314
    const-wide/16 v1, 0xc8

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 318
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$13;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #getter for: Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/webuid/mmVideo/RecommendActivity;->access$5(Lcom/webuid/mmVideo/RecommendActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 319
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$13;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/RecommendActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 324
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/RecommendActivity$13;->sendMessage(I)V

    .line 325
    return-void

    .line 320
    :catch_0
    move-exception v0

    .line 322
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 315
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_0
.end method
