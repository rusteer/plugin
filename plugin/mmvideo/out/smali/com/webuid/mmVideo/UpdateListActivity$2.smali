.class Lcom/webuid/mmVideo/UpdateListActivity$2;
.super Landroid/os/Handler;
.source "UpdateListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/UpdateListActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 250
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 253
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 266
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 267
    return-void

    .line 256
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 257
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->access$1(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 258
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 259
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->access$1(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 261
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$2;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->access$0(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    .line 253
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
