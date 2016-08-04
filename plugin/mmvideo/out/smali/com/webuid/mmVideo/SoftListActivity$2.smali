.class Lcom/webuid/mmVideo/SoftListActivity$2;
.super Landroid/os/Handler;
.source "SoftListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SoftListActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 242
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 245
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 258
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 259
    return-void

    .line 248
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/SoftListActivity;->adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 249
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/SoftListActivity;->access$1(Lcom/webuid/mmVideo/SoftListActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 250
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/SoftListActivity;->adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 251
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/SoftListActivity;->access$1(Lcom/webuid/mmVideo/SoftListActivity;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 253
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$2;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/SoftListActivity;->access$0(Lcom/webuid/mmVideo/SoftListActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    .line 245
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
