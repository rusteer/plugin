.class Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;
.super Landroid/os/AsyncTask;
.source "OfflineActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/OfflineActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetDataTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/OfflineActivity;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/OfflineActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 513
    iput-object p1, p0, Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;->doInBackground([Ljava/lang/Void;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)[Ljava/lang/String;
    .locals 3
    .parameter "params"

    .prologue
    const/4 v2, 0x1

    .line 518
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    #getter for: Lcom/webuid/mmVideo/OfflineActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    invoke-static {v1}, Lcom/webuid/mmVideo/OfflineActivity;->access$4(Lcom/webuid/mmVideo/OfflineActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getCurrentMode()I

    move-result v0

    .line 519
    .local v0, mode:I
    if-ne v0, v2, :cond_0

    .line 520
    const-string v1, "task"

    const-string v2, "up"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    iget-object v1, p0, Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    const/4 v2, 0x1

    iput v2, v1, Lcom/webuid/mmVideo/OfflineActivity;->loadMore:I

    .line 532
    :goto_0
    const-wide/16 v1, 0x64

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 535
    .end local v0           #mode:I
    :goto_1
    const/4 v1, 0x0

    return-object v1

    .line 523
    .restart local v0       #mode:I
    :cond_0
    iget-object v1, p0, Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    const/4 v2, 0x2

    iput v2, v1, Lcom/webuid/mmVideo/OfflineActivity;->loadMore:I

    .line 524
    const-string v1, "task"

    const-string v2, "down"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 533
    .end local v0           #mode:I
    :catch_0
    move-exception v1

    goto :goto_1
.end method
