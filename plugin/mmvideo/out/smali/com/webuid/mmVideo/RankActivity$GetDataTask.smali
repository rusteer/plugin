.class Lcom/webuid/mmVideo/RankActivity$GetDataTask;
.super Landroid/os/AsyncTask;
.source "RankActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RankActivity;
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
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 348
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/webuid/mmVideo/RankActivity;Lcom/webuid/mmVideo/RankActivity$GetDataTask;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 348
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/RankActivity$GetDataTask;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->doInBackground([Ljava/lang/Void;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)[Ljava/lang/String;
    .locals 4
    .parameter "params"

    .prologue
    const/4 v3, 0x1

    .line 353
    :try_start_0
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    invoke-static {v2}, Lcom/webuid/mmVideo/RankActivity;->access$2(Lcom/webuid/mmVideo/RankActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getCurrentMode()I

    move-result v1

    .line 354
    .local v1, mode:I
    if-ne v1, v3, :cond_0

    .line 355
    const-string v2, "task"

    const-string v3, "up"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const/4 v3, 0x1

    iput v3, v2, Lcom/webuid/mmVideo/RankActivity;->loadMore:I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/RankActivity;->getDataSource1()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 367
    :goto_1
    const-wide/16 v2, 0x64

    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 370
    .end local v1           #mode:I
    :goto_2
    const/4 v2, 0x0

    return-object v2

    .line 358
    .restart local v1       #mode:I
    :cond_0
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const/4 v3, 0x2

    iput v3, v2, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    .line 359
    const-string v2, "task"

    const-string v3, "down"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 368
    .end local v1           #mode:I
    :catch_0
    move-exception v2

    goto :goto_2

    .line 363
    .restart local v1       #mode:I
    :catch_1
    move-exception v0

    .line 365
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->onPostExecute([Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute([Ljava/lang/String;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 375
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const/4 v1, 0x0

    iput v1, v0, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    .line 376
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mListItems:Ljava/util/LinkedList;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$3(Lcom/webuid/mmVideo/RankActivity;)Ljava/util/LinkedList;

    move-result-object v0

    const-string v1, "Added after refresh..."

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 377
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 380
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$2(Lcom/webuid/mmVideo/RankActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->onRefreshComplete()V

    .line 382
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 383
    return-void
.end method
