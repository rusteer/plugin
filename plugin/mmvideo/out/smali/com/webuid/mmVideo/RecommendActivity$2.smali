.class Lcom/webuid/mmVideo/RecommendActivity$2;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    .line 335
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 338
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 351
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 352
    return-void

    .line 341
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RecommendActivity;->adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 342
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #getter for: Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/RecommendActivity;->access$1(Lcom/webuid/mmVideo/RecommendActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 343
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RecommendActivity;->adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 344
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #getter for: Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/RecommendActivity;->access$1(Lcom/webuid/mmVideo/RecommendActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 346
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$2;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #getter for: Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/RecommendActivity;->access$0(Lcom/webuid/mmVideo/RecommendActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    .line 338
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
