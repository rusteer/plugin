.class public Lcom/webuid/mmVideo/UpdateListActivity;
.super Landroid/app/Activity;
.source "UpdateListActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/UpdateListActivity$GetDataTask;,
        Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/UpdateListActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

.field private dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

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


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    .line 72
    iput v1, p0, Lcom/webuid/mmVideo/UpdateListActivity;->loadMore:I

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->page_now:I

    .line 74
    iput v1, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    .line 75
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_num:I

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->nowNamePre:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->q_text:Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 207
    new-instance v0, Lcom/webuid/mmVideo/UpdateListActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/UpdateListActivity$1;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mainHandler:Landroid/os/Handler;

    .line 250
    new-instance v0, Lcom/webuid/mmVideo/UpdateListActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/UpdateListActivity$2;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mHandler:Landroid/os/Handler;

    .line 500
    new-instance v0, Lcom/webuid/mmVideo/UpdateListActivity$3;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/UpdateListActivity$3;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mHandlerClick:Landroid/os/Handler;

    .line 66
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 83
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/UpdateListActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/UpdateListActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    .locals 1
    .parameter

    .prologue
    .line 81
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/UpdateListActivity;)Ljava/util/LinkedList;
    .locals 1
    .parameter

    .prologue
    .line 80
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mListItems:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/UpdateListActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 68
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateListActivity;->setMainView()V

    return-void
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 221
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateListActivity;->startSearch()V

    return-void
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 468
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 469
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 471
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private setMainView()V
    .locals 2

    .prologue
    .line 183
    const v0, 0x7f060021

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    .line 186
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    new-instance v1, Lcom/webuid/mmVideo/UpdateListActivity$10;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/UpdateListActivity$10;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setOnRefreshListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;)V

    .line 193
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;

    .line 194
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mListItems:Ljava/util/LinkedList;

    .line 196
    new-instance v0, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v0, p0, p0, v1}, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    .line 202
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;

    new-instance v1, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 204
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->actualListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 205
    return-void
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 222
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/UpdateListActivity$11;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/UpdateListActivity$11;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 246
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 247
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

    .line 271
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 274
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 275
    .local v7, regdata:Lorg/json/JSONObject;
    const-string v10, "regdata. search_type"

    iget v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    if-ne v10, v14, :cond_3

    .line 278
    const-string v10, "search_type"

    const-string v11, "today"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 282
    :cond_0
    :goto_0
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 283
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

    .line 284
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    if-ge v10, v14, :cond_1

    .line 285
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    .line 287
    :cond_1
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->loadMore:I

    if-ne v10, v13, :cond_4

    .line 288
    const-string v10, "offset"

    iget v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 289
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    iget v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_num:I

    add-int/2addr v10, v11

    iput v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I

    .line 293
    :goto_1
    const-string v10, "regdata.toString()"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    const-string v10, "getRecommend"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 295
    .local v8, result:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x4

    if-le v10, v11, :cond_2

    .line 297
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 298
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_5

    .line 316
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->loadMore:I

    if-eq v10, v13, :cond_2

    .line 320
    iget-object v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 321
    iget-object v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 322
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v10, v5, v8, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 331
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :cond_2
    :goto_3
    return-void

    .line 279
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_3
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    if-ne v10, v13, :cond_0

    .line 280
    const-string v10, "search_type"

    const-string v11, "tommory"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 325
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v10

    goto :goto_3

    .line 291
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_4
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->limit_now:I
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 327
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_1
    move-exception v3

    .line 329
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 299
    .end local v3           #e:Lorg/json/JSONException;
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v4       #i:I
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    .restart local v8       #result:Ljava/lang/String;
    :cond_5
    :try_start_1
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 300
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 301
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v10, "url"

    const-string v11, "url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    const-string v10, "title"

    const-string v11, "title"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    const-string v10, "source"

    const-string v11, "source"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    const-string v10, "size"

    const-string v11, "size"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    const-string v10, "length"

    const-string v11, "length"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    const-string v10, "recommend"

    const-string v11, "recommend"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string v10, "star"

    const-string v11, "star"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    const-string v10, "image"

    const-string v11, "image"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    iget v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->loadMore:I

    if-ne v10, v13, :cond_6

    .line 312
    iget-object v10, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    const-string v10, "Load"

    const-string v11, "add one"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 298
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2
.end method

.method public getListFromCache()V
    .locals 14

    .prologue
    .line 374
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 376
    .local v6, regdata:Lorg/json/JSONObject;
    iget v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_2

    .line 377
    const-string v11, "search_type"

    const-string v12, "today"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 381
    :cond_0
    :goto_0
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 382
    .local v4, k_name:Ljava/lang/String;
    const-string v11, "k_name"

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

    .line 385
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v11, v4, p0}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v7

    .line 386
    .local v7, result:Ljava/lang/Object;
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 387
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 388
    .local v1, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v10, 0x0

    .line 389
    .local v10, use_cache_bool:I
    if-eqz v7, :cond_1

    .line 390
    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 391
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lt v3, v11, :cond_3

    .line 407
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    :cond_1
    const-string v11, "cache use"

    const-string v12, "use - 222222222222222222222222222"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 409
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->adapter1:Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/UpdateListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 410
    new-instance v9, Ljava/lang/Thread;

    new-instance v11, Lcom/webuid/mmVideo/UpdateListActivity$12;

    invoke-direct {v11, p0}, Lcom/webuid/mmVideo/UpdateListActivity$12;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-direct {v9, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 439
    .local v9, thread:Ljava/lang/Thread;
    if-nez v10, :cond_4

    .line 440
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v12, "\u9996\u6b21\u8fd0\u884c\uff0c\u9700\u4e0b\u8f7d\u6570\u636e\u3002\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 441
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 442
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 443
    iget-object v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v11}, Landroid/app/ProgressDialog;->show()V

    .line 444
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    .line 452
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :goto_2
    return-void

    .line 378
    .restart local v6       #regdata:Lorg/json/JSONObject;
    :cond_2
    iget v11, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_0

    .line 379
    const-string v11, "search_type"

    const-string v12, "tommory"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 448
    .end local v6           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 450
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 392
    .end local v2           #e:Lorg/json/JSONException;
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v1       #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3       #i:I
    .restart local v4       #k_name:Ljava/lang/String;
    .restart local v6       #regdata:Lorg/json/JSONObject;
    .restart local v7       #result:Ljava/lang/Object;
    .restart local v10       #use_cache_bool:I
    :cond_3
    :try_start_1
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 393
    .local v8, temp:Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 394
    .local v5, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v11, "id"

    const-string v12, "id"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-string v11, "url"

    const-string v12, "url"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string v11, "title"

    const-string v12, "title"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-string v11, "source"

    const-string v12, "source"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    const-string v11, "size"

    const-string v12, "size"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    const-string v11, "length"

    const-string v12, "length"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    const-string v11, "recommend"

    const-string v12, "recommend"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-string v11, "star"

    const-string v12, "star"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const-string v11, "image"

    const-string v12, "image"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    const/4 v10, 0x1

    .line 391
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 446
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    .end local v5           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8           #temp:Lorg/json/JSONObject;
    .restart local v9       #thread:Ljava/lang/Thread;
    :cond_4
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 90
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    const v6, 0x7f030015

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->setContentView(I)V

    .line 93
    invoke-virtual {p0}, Lcom/webuid/mmVideo/UpdateListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 94
    .local v3, bundle:Landroid/os/Bundle;
    const-string v6, "search_type"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    .line 95
    const-string v6, "search_type"

    iget v7, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const v6, 0x7f060004

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 98
    .local v5, titleText:Landroid/widget/TextView;
    iget v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    if-ne v6, v10, :cond_0

    .line 99
    const-string v6, "\u4eca\u65e5\u66f4\u65b0"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    :goto_0
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-direct {v6, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    .line 104
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v9}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 105
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/UpdateListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f090004

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v7, "\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const v7, 0x7f020026

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 108
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v9}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 109
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v10}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 110
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v7, Lcom/webuid/mmVideo/UpdateListActivity$4;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/UpdateListActivity$4;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 116
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v7, Lcom/webuid/mmVideo/UpdateListActivity$5;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/UpdateListActivity$5;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 122
    iget-object v6, p0, Lcom/webuid/mmVideo/UpdateListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    .line 124
    const v6, 0x7f060005

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 125
    .local v1, btn1:Landroid/widget/Button;
    const v6, 0x7f060006

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 127
    .local v2, btn2:Landroid/widget/Button;
    new-instance v6, Lcom/webuid/mmVideo/UpdateListActivity$6;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/UpdateListActivity$6;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    new-instance v6, Lcom/webuid/mmVideo/UpdateListActivity$7;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/UpdateListActivity$7;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    const v6, 0x7f060003

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 154
    .local v4, leftBtnImg:Landroid/widget/ImageView;
    new-instance v6, Lcom/webuid/mmVideo/UpdateListActivity$8;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/UpdateListActivity$8;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    new-instance v0, Ljava/lang/Thread;

    new-instance v6, Lcom/webuid/mmVideo/UpdateListActivity$9;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/UpdateListActivity$9;-><init>(Lcom/webuid/mmVideo/UpdateListActivity;)V

    invoke-direct {v0, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 178
    .local v0, background:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 179
    return-void

    .line 101
    .end local v0           #background:Ljava/lang/Thread;
    .end local v1           #btn1:Landroid/widget/Button;
    .end local v2           #btn2:Landroid/widget/Button;
    .end local v4           #leftBtnImg:Landroid/widget/ImageView;
    :cond_0
    const-string v6, "\u660e\u65e5\u66f4\u65b0"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 457
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 459
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 460
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 461
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 463
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 594
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 595
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 596
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 583
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 584
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/UpdateListActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 585
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 586
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 587
    invoke-virtual {p0}, Lcom/webuid/mmVideo/UpdateListActivity;->finish()V

    .line 589
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 590
    return-void
.end method
