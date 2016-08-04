.class Lcom/webuid/mmVideo/SoftListActivity$10;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/SoftListActivity;->setMainView()V
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
.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$10;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .locals 3

    .prologue
    .line 182
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$GetDataTask;

    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity$10;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/webuid/mmVideo/SoftListActivity$GetDataTask;-><init>(Lcom/webuid/mmVideo/SoftListActivity;Lcom/webuid/mmVideo/SoftListActivity$GetDataTask;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/SoftListActivity$GetDataTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 183
    return-void
.end method
