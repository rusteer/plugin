.class Lcom/webuid/mmVideo/UpdateListActivity$10;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateListActivity;->setMainView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$10;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .locals 3

    .prologue
    .line 190
    new-instance v0, Lcom/webuid/mmVideo/UpdateListActivity$GetDataTask;

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity$10;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/webuid/mmVideo/UpdateListActivity$GetDataTask;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;Lcom/webuid/mmVideo/UpdateListActivity$GetDataTask;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/UpdateListActivity$GetDataTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 191
    return-void
.end method
