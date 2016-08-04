.class Lcom/webuid/mmVideo/RankActivity$8;
.super Ljava/lang/Object;
.source "RankActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/RankActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;

.field private final synthetic val$topBg:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RankActivity;Landroid/widget/LinearLayout;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    iput-object p2, p0, Lcom/webuid/mmVideo/RankActivity$8;->val$topBg:Landroid/widget/LinearLayout;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v2, 0x0

    .line 139
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->val$topBg:Landroid/widget/LinearLayout;

    const v1, 0x7f020049

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 140
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const/4 v1, 0x2

    iput v1, v0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    .line 141
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$4(Lcom/webuid/mmVideo/RankActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 142
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$0(Lcom/webuid/mmVideo/RankActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 143
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$0(Lcom/webuid/mmVideo/RankActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 144
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$0(Lcom/webuid/mmVideo/RankActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 145
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$8;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #calls: Lcom/webuid/mmVideo/RankActivity;->startSearch()V
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$6(Lcom/webuid/mmVideo/RankActivity;)V

    .line 146
    return-void
.end method
