.class Lcom/webuid/mmVideo/RecommendActivity$3;
.super Landroid/os/Handler;
.source "RecommendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RecommendActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$3;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    .line 532
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/RecommendActivity$3;)Lcom/webuid/mmVideo/RecommendActivity;
    .locals 1
    .parameter

    .prologue
    .line 532
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$3;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    return-object v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 535
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 561
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 562
    return-void

    .line 538
    :pswitch_0
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$3;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #calls: Lcom/webuid/mmVideo/RecommendActivity;->setViewPager()V
    invoke-static {v1}, Lcom/webuid/mmVideo/RecommendActivity;->access$2(Lcom/webuid/mmVideo/RecommendActivity;)V

    .line 540
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/RecommendActivity$3$1;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/RecommendActivity$3$1;-><init>(Lcom/webuid/mmVideo/RecommendActivity$3;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 556
    .local v0, background:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 535
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
