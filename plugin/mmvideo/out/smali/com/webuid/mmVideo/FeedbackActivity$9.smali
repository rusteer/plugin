.class Lcom/webuid/mmVideo/FeedbackActivity$9;
.super Ljava/lang/Object;
.source "FeedbackActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/FeedbackActivity;->startSearch()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/FeedbackActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FeedbackActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$9;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 210
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 211
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 212
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$9;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/FeedbackActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 213
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 197
    const-wide/16 v1, 0xc8

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 201
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$9;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->access$2(Lcom/webuid/mmVideo/FeedbackActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 202
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$9;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 207
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/FeedbackActivity$9;->sendMessage(I)V

    .line 208
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 205
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 198
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_0
.end method
