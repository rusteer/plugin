.class Lcom/webuid/mmVideo/OfflineActivity$2;
.super Ljava/lang/Object;
.source "OfflineActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/OfflineActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/OfflineActivity;

.field private final synthetic val$topBg:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/widget/LinearLayout;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    iput-object p2, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->val$topBg:Landroid/widget/LinearLayout;

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 117
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->val$topBg:Landroid/widget/LinearLayout;

    const v1, 0x7f02003c

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 118
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    const/4 v1, 0x2

    iput v1, v0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    .line 119
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/OfflineActivity;->getDataList()V

    .line 120
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$2;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    #getter for: Lcom/webuid/mmVideo/OfflineActivity;->actualListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/OfflineActivity;->access$5(Lcom/webuid/mmVideo/OfflineActivity;)Landroid/widget/ListView;

    move-result-object v0

    sget-object v1, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 123
    sget-object v0, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->notifyDataSetChanged()V

    .line 124
    return-void
.end method
