.class Lcom/webuid/mmVideo/FeedbackActivity$5$1;
.super Ljava/lang/Object;
.source "FeedbackActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/FeedbackActivity$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/webuid/mmVideo/FeedbackActivity$5;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FeedbackActivity$5;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5$1;->this$1:Lcom/webuid/mmVideo/FeedbackActivity$5;

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 147
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 148
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 149
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5$1;->this$1:Lcom/webuid/mmVideo/FeedbackActivity$5;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity$5;->access$0(Lcom/webuid/mmVideo/FeedbackActivity$5;)Lcom/webuid/mmVideo/FeedbackActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/webuid/mmVideo/FeedbackActivity;->mHandlerSub:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 150
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 135
    const-wide/16 v1, 0xc8

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 139
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/webuid/mmVideo/FeedbackActivity$5$1;->this$1:Lcom/webuid/mmVideo/FeedbackActivity$5;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity$5;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;
    invoke-static {v1}, Lcom/webuid/mmVideo/FeedbackActivity$5;->access$0(Lcom/webuid/mmVideo/FeedbackActivity$5;)Lcom/webuid/mmVideo/FeedbackActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/webuid/mmVideo/FeedbackActivity;->submitData()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 144
    :goto_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/FeedbackActivity$5$1;->sendMessage(I)V

    .line 145
    return-void

    .line 140
    :catch_0
    move-exception v0

    .line 142
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 136
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    goto :goto_0
.end method
