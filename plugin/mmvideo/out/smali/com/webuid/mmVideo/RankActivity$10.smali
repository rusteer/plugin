.class Lcom/webuid/mmVideo/RankActivity$10;
.super Ljava/lang/Object;
.source "RankActivity.java"

# interfaces
.implements Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/RankActivity;->setMainView()V
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
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$10;->this$0:Lcom/webuid/mmVideo/RankActivity;

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .locals 3

    .prologue
    .line 173
    new-instance v0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;

    iget-object v1, p0, Lcom/webuid/mmVideo/RankActivity$10;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/webuid/mmVideo/RankActivity$GetDataTask;-><init>(Lcom/webuid/mmVideo/RankActivity;Lcom/webuid/mmVideo/RankActivity$GetDataTask;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 174
    return-void
.end method
