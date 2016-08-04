.class Lcom/webuid/mmVideo/FeedbackActivity$1;
.super Landroid/os/Handler;
.source "FeedbackActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/FeedbackActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/FeedbackActivity$1;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    .line 217
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 220
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 232
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 233
    return-void

    .line 223
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$1;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/FeedbackActivity;->adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->notifyDataSetChanged()V

    .line 224
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$1;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/FeedbackActivity;->access$0(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 225
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$1;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/FeedbackActivity;->adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;->notifyDataSetChanged()V

    .line 226
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity$1;->this$0:Lcom/webuid/mmVideo/FeedbackActivity;

    #getter for: Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/FeedbackActivity;->access$0(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_0

    .line 220
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
