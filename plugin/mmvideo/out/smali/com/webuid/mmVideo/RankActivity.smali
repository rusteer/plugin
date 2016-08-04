.class public Lcom/webuid/mmVideo/RankActivity;
.super Landroid/app/Activity;
.source "RankActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/RankActivity$GetDataTask;,
        Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/RankActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

.field private dataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field limit_now:I

.field limit_num:I

.field loadMore:I

.field private mAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mHandler:Landroid/os/Handler;

.field public mHandlerClick:Landroid/os/Handler;

.field private mListItems:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mListView1:Landroid/widget/ListView;

.field private mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

.field public mainHandler:Landroid/os/Handler;

.field private mypDialog:Landroid/app/ProgressDialog;

.field nowNamePre:Ljava/lang/String;

.field page_now:I

.field private q_text:Ljava/lang/String;

.field private searchText:Landroid/widget/EditText;

.field public search_type:I

.field touchTime:J

.field waitTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    .line 59
    iput v1, p0, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    .line 60
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/RankActivity;->page_now:I

    .line 61
    iput v1, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    .line 62
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/RankActivity;->limit_num:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->nowNamePre:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->q_text:Ljava/lang/String;

    .line 220
    new-instance v0, Lcom/webuid/mmVideo/RankActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RankActivity$1;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mainHandler:Landroid/os/Handler;

    .line 263
    new-instance v0, Lcom/webuid/mmVideo/RankActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RankActivity$2;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mHandler:Landroid/os/Handler;

    .line 523
    new-instance v0, Lcom/webuid/mmVideo/RankActivity$3;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RankActivity$3;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mHandlerClick:Landroid/os/Handler;

    .line 624
    const-wide/16 v0, 0x7d0

    iput-wide v0, p0, Lcom/webuid/mmVideo/RankActivity;->waitTime:J

    .line 625
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/webuid/mmVideo/RankActivity;->touchTime:J

    .line 53
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/RankActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 70
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/RankActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 71
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/RankActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    .locals 1
    .parameter

    .prologue
    .line 68
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/RankActivity;)Ljava/util/LinkedList;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->mListItems:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/RankActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 55
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/webuid/mmVideo/RankActivity;->setMainView()V

    return-void
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 235
    invoke-direct {p0}, Lcom/webuid/mmVideo/RankActivity;->startSearch()V

    return-void
.end method

.method private setMainView()V
    .locals 4

    .prologue
    .line 166
    const v2, 0x7f060021

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    .line 169
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    new-instance v3, Lcom/webuid/mmVideo/RankActivity$10;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/RankActivity$10;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setOnRefreshListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;)V

    .line 176
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getRefreshableView()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;

    .line 177
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->mListItems:Ljava/util/LinkedList;

    .line 179
    new-instance v2, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    iget-object v3, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v2, p0, p0, v3}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/RankActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    .line 185
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;

    new-instance v3, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 187
    iget-object v2, p0, Lcom/webuid/mmVideo/RankActivity;->actualListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 189
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 190
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 191
    .local v1, btn2:Landroid/widget/Button;
    new-instance v2, Lcom/webuid/mmVideo/RankActivity$11;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/RankActivity$11;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    new-instance v2, Lcom/webuid/mmVideo/RankActivity$12;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/RankActivity$12;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 218
    return-void
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 236
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/RankActivity$13;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/RankActivity$13;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 260
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 261
    return-void
.end method


# virtual methods
.method public getDataSource1()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x2

    .line 284
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 285
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 287
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 288
    .local v7, regdata:Lorg/json/JSONObject;
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    if-ne v10, v14, :cond_3

    .line 289
    const-string v10, "order"

    const-string v11, "new"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    :cond_0
    :goto_0
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 297
    .local v5, k_name:Ljava/lang/String;
    const-string v10, "k_name"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " - "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    if-ge v10, v14, :cond_1

    .line 299
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    .line 301
    :cond_1
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    if-ne v10, v13, :cond_5

    .line 302
    const-string v10, "offset"

    iget v11, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 303
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    iget v11, p0, Lcom/webuid/mmVideo/RankActivity;->limit_num:I

    add-int/2addr v10, v11

    iput v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    .line 307
    :goto_1
    const-string v10, "regdata.toString()"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const-string v10, "getRecommend"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 309
    .local v8, result:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x4

    if-le v10, v11, :cond_2

    .line 310
    const-string v10, "myNear"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 312
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_6

    .line 330
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    if-eq v10, v13, :cond_2

    .line 333
    const-string v10, "Load"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "add new list"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    iget-object v10, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 335
    iget-object v10, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 336
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v10, v5, v8, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 345
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :cond_2
    :goto_3
    return-void

    .line 290
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_3
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    if-ne v10, v13, :cond_4

    .line 291
    const-string v10, "order"

    const-string v11, "hot"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 339
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v10

    goto :goto_3

    .line 292
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_4
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    const/4 v11, 0x3

    if-ne v10, v11, :cond_0

    .line 293
    const-string v10, "order"

    const-string v11, "star"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 341
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_1
    move-exception v3

    .line 343
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 305
    .end local v3           #e:Lorg/json/JSONException;
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_5
    :try_start_1
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/RankActivity;->limit_now:I

    goto/16 :goto_1

    .line 313
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v4       #i:I
    .restart local v8       #result:Ljava/lang/String;
    :cond_6
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 314
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 315
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    const-string v10, "url"

    const-string v11, "url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    const-string v10, "title"

    const-string v11, "title"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    const-string v10, "source"

    const-string v11, "source"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    const-string v10, "size"

    const-string v11, "size"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    const-string v10, "length"

    const-string v11, "length"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    const-string v10, "recommend"

    const-string v11, "recommend"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    const-string v10, "star"

    const-string v11, "star"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    const-string v10, "image"

    const-string v11, "image"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 325
    iget v10, p0, Lcom/webuid/mmVideo/RankActivity;->loadMore:I

    if-ne v10, v13, :cond_7

    .line 326
    iget-object v10, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 327
    const-string v10, "Load"

    const-string v11, "add one"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 312
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2
.end method

.method public getListFromCache()V
    .locals 14

    .prologue
    .line 388
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 389
    .local v6, regdata:Lorg/json/JSONObject;
    iget v11, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_2

    .line 390
    const-string v11, "order"

    const-string v12, "new"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 396
    :cond_0
    :goto_0
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 397
    .local v4, k_name:Ljava/lang/String;
    const-string v11, "getListFromCache"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, " - "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v11, v4, p0}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v7

    .line 399
    .local v7, result:Ljava/lang/Object;
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 400
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 401
    .local v1, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v10, 0x0

    .line 402
    .local v10, use_cache_bool:I
    if-eqz v7, :cond_1

    .line 403
    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 404
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lt v3, v11, :cond_4

    .line 420
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    :cond_1
    const-string v11, "cache use"

    const-string v12, "use - 222222222222222222222222222"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 422
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->adapter1:Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/RankActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 423
    new-instance v9, Ljava/lang/Thread;

    new-instance v11, Lcom/webuid/mmVideo/RankActivity$14;

    invoke-direct {v11, p0}, Lcom/webuid/mmVideo/RankActivity$14;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-direct {v9, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 452
    .local v9, thread:Ljava/lang/Thread;
    if-nez v10, :cond_5

    .line 453
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v12, "\u9996\u6b21\u8fd0\u884c\uff0c\u9700\u4e0b\u8f7d\u6570\u636e\u3002\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 454
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 455
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 456
    iget-object v11, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v11}, Landroid/app/ProgressDialog;->show()V

    .line 457
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    .line 465
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :goto_2
    return-void

    .line 391
    .restart local v6       #regdata:Lorg/json/JSONObject;
    :cond_2
    iget v11, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_3

    .line 392
    const-string v11, "order"

    const-string v12, "hot"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 461
    .end local v6           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 463
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 393
    .end local v2           #e:Lorg/json/JSONException;
    .restart local v6       #regdata:Lorg/json/JSONObject;
    :cond_3
    :try_start_1
    iget v11, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    const/4 v12, 0x3

    if-ne v11, v12, :cond_0

    .line 394
    const-string v11, "order"

    const-string v12, "star"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 405
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v1       #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3       #i:I
    .restart local v4       #k_name:Ljava/lang/String;
    .restart local v7       #result:Ljava/lang/Object;
    .restart local v10       #use_cache_bool:I
    :cond_4
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 406
    .local v8, temp:Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 407
    .local v5, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v11, "id"

    const-string v12, "id"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    const-string v11, "url"

    const-string v12, "url"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    const-string v11, "title"

    const-string v12, "title"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    const-string v11, "source"

    const-string v12, "source"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    const-string v11, "size"

    const-string v12, "size"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    const-string v11, "length"

    const-string v12, "length"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    const-string v11, "recommend"

    const-string v12, "recommend"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    const-string v11, "star"

    const-string v12, "star"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    const-string v11, "image"

    const-string v12, "image"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    const/4 v10, 0x1

    .line 404
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 459
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    .end local v5           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8           #temp:Lorg/json/JSONObject;
    .restart local v9       #thread:Ljava/lang/Thread;
    :cond_5
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method public onBackPressed()V
    .locals 6

    .prologue
    .line 629
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 630
    .local v0, currentTime:J
    iget-wide v2, p0, Lcom/webuid/mmVideo/RankActivity;->touchTime:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/webuid/mmVideo/RankActivity;->waitTime:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 632
    const-string v2, "\u518d\u6309\u4e00\u6b21\u9000\u51fa"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RankActivity;->setToast(Ljava/lang/String;)V

    .line 633
    iput-wide v0, p0, Lcom/webuid/mmVideo/RankActivity;->touchTime:J

    .line 637
    :goto_0
    return-void

    .line 635
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RankActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 76
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v5, 0x7f03000d

    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RankActivity;->setContentView(I)V

    .line 79
    new-instance v5, Landroid/app/ProgressDialog;

    invoke-direct {v5, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    .line 80
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v8}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 81
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/RankActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f090004

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v6, "\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    const v6, 0x7f020026

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 84
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v8}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 85
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v9}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 86
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v6, Lcom/webuid/mmVideo/RankActivity$4;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/RankActivity$4;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 92
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v6, Lcom/webuid/mmVideo/RankActivity$5;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/RankActivity$5;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 98
    iget-object v5, p0, Lcom/webuid/mmVideo/RankActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v5}, Landroid/app/ProgressDialog;->show()V

    .line 99
    new-instance v0, Ljava/lang/Thread;

    new-instance v5, Lcom/webuid/mmVideo/RankActivity$6;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/RankActivity$6;-><init>(Lcom/webuid/mmVideo/RankActivity;)V

    invoke-direct {v0, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 115
    .local v0, background:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 117
    const v5, 0x7f06001a

    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 118
    .local v4, topBg:Landroid/widget/LinearLayout;
    const v5, 0x7f06001b

    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 119
    .local v1, btn1:Landroid/widget/Button;
    const v5, 0x7f06001c

    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 120
    .local v2, btn2:Landroid/widget/Button;
    const v5, 0x7f060020

    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RankActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 121
    .local v3, btn3:Landroid/widget/Button;
    iput v9, p0, Lcom/webuid/mmVideo/RankActivity;->search_type:I

    .line 122
    new-instance v5, Lcom/webuid/mmVideo/RankActivity$7;

    invoke-direct {v5, p0, v4}, Lcom/webuid/mmVideo/RankActivity$7;-><init>(Lcom/webuid/mmVideo/RankActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    new-instance v5, Lcom/webuid/mmVideo/RankActivity$8;

    invoke-direct {v5, p0, v4}, Lcom/webuid/mmVideo/RankActivity$8;-><init>(Lcom/webuid/mmVideo/RankActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    new-instance v5, Lcom/webuid/mmVideo/RankActivity$9;

    invoke-direct {v5, p0, v4}, Lcom/webuid/mmVideo/RankActivity$9;-><init>(Lcom/webuid/mmVideo/RankActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 620
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 621
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 622
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 605
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 606
    const-string v3, "backRecommend"

    invoke-virtual {p0, v3, v5}, Lcom/webuid/mmVideo/RankActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 607
    .local v2, preferences:Landroid/content/SharedPreferences;
    const-string v3, "num"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 608
    .local v1, num:Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 609
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v3, v5}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 610
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 611
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v3, "num"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 612
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 614
    .end local v0           #edit:Landroid/content/SharedPreferences$Editor;
    :cond_0
    const-string v3, "Recommend"

    const-string v4, "onResume"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 615
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 616
    return-void
.end method

.method public setToast(Ljava/lang/String;)V
    .locals 6
    .parameter "text"

    .prologue
    .line 639
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RankActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030028

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 640
    .local v2, toastRoot:Landroid/view/View;
    const v3, 0x7f060004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 641
    .local v0, title:Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 642
    new-instance v1, Landroid/widget/Toast;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/RankActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 643
    .local v1, toast:Landroid/widget/Toast;
    invoke-virtual {v1, v2}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 644
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Toast;->setDuration(I)V

    .line 645
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 647
    return-void
.end method
