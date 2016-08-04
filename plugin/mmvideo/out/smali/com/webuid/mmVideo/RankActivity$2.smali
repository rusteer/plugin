.class Lcom/webuid/mmVideo/RankActivity$2;
.super Landroid/os/Handler;
.source "RankActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RankActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    .line 263
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 266
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 279
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 280
    return-void

    .line 269
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 270
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$1(Lcom/webuid/mmVideo/RankActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 271
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 272
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$1(Lcom/webuid/mmVideo/RankActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 274
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$2;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$0(Lcom/webuid/mmVideo/RankActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    .line 266
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
