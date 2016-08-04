.class Lcom/webuid/mmVideo/UpdateListActivity$6;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateListActivity;->onCreate(Landroid/os/Bundle;)V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    const/4 v3, 0x0

    .line 131
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    const/4 v2, 0x1

    iput v2, v1, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$4(Lcom/webuid/mmVideo/UpdateListActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 132
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    const v2, 0x7f060004

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 133
    .local v0, titleText:Landroid/widget/TextView;
    const-string v1, "\u4eca\u65e5\u66f4\u65b0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$0(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 135
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$0(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 136
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$0(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 137
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$6;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #calls: Lcom/webuid/mmVideo/UpdateListActivity;->startSearch()V
    invoke-static {v1}, Lcom/webuid/mmVideo/UpdateListActivity;->access$6(Lcom/webuid/mmVideo/UpdateListActivity;)V

    .line 138
    return-void
.end method
