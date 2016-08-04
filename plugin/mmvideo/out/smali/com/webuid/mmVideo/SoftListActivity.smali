.class public Lcom/webuid/mmVideo/SoftListActivity;
.super Landroid/app/Activity;
.source "SoftListActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/SoftListActivity$GetDataTask;,
        Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/SoftListActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

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

    .line 73
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    .line 79
    iput v1, p0, Lcom/webuid/mmVideo/SoftListActivity;->loadMore:I

    .line 80
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->page_now:I

    .line 81
    iput v1, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    .line 82
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_num:I

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->nowNamePre:Ljava/lang/String;

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->q_text:Ljava/lang/String;

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 199
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/SoftListActivity$1;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mainHandler:Landroid/os/Handler;

    .line 242
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/SoftListActivity$2;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mHandler:Landroid/os/Handler;

    .line 457
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$3;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/SoftListActivity$3;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mHandlerClick:Landroid/os/Handler;

    .line 73
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/SoftListActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 90
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/SoftListActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 91
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/SoftListActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    .locals 1
    .parameter

    .prologue
    .line 88
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/SoftListActivity;)Ljava/util/LinkedList;
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mListItems:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/SoftListActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 75
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 173
    invoke-direct {p0}, Lcom/webuid/mmVideo/SoftListActivity;->setMainView()V

    return-void
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 438
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 440
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private setMainView()V
    .locals 2

    .prologue
    .line 175
    const v0, 0x7f060021

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/SoftListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    .line 178
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    new-instance v1, Lcom/webuid/mmVideo/SoftListActivity$10;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/SoftListActivity$10;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setOnRefreshListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;)V

    .line 185
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;

    .line 186
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->mListItems:Ljava/util/LinkedList;

    .line 188
    new-instance v0, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v0, p0, p0, v1}, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/SoftListActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    .line 194
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;

    new-instance v1, Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 196
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->actualListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/webuid/mmVideo/SoftListActivity;->adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 197
    return-void
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 214
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/SoftListActivity$11;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/SoftListActivity$11;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 238
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 239
    return-void
.end method


# virtual methods
.method public getDataSource1()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v13, 0x2

    .line 263
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 266
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 267
    .local v7, regdata:Lorg/json/JSONObject;
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "soft_list_"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 268
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

    .line 269
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    const/4 v11, 0x1

    if-ge v10, v11, :cond_0

    .line 270
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    .line 272
    :cond_0
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->loadMore:I

    if-ne v10, v13, :cond_2

    .line 273
    const-string v10, "offset"

    iget v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 274
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    iget v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_num:I

    add-int/2addr v10, v11

    iput v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    .line 278
    :goto_0
    const-string v10, "regdata.toString()"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const-string v10, "getSoft"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 280
    .local v8, result:Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x4

    if-le v10, v11, :cond_1

    .line 282
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 283
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_3

    .line 297
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->loadMore:I

    if-eq v10, v13, :cond_1

    .line 301
    iget-object v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 302
    iget-object v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 303
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v10, v5, v8, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 312
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :cond_1
    :goto_2
    return-void

    .line 276
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_2
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->limit_now:I

    goto :goto_0

    .line 306
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v10

    goto :goto_2

    .line 284
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v4       #i:I
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    .restart local v8       #result:Ljava/lang/String;
    :cond_3
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 285
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 286
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    const-string v10, "name"

    const-string v11, "name"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    const-string v10, "downurl"

    const-string v11, "downurl"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    const-string v10, "content"

    const-string v11, "content"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    const-string v10, "image"

    const-string v11, "image"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    iget v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->loadMore:I

    if-ne v10, v13, :cond_4

    .line 293
    iget-object v10, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    const-string v10, "Load"

    const-string v11, "add one"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 283
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 308
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v6           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    .end local v9           #temp:Lorg/json/JSONObject;
    :catch_1
    move-exception v3

    .line 310
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method public getListFromCache()V
    .locals 14

    .prologue
    .line 355
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 357
    .local v6, regdata:Lorg/json/JSONObject;
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "soft_list_"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v12

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 358
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

    .line 361
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v11, v4, p0}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v7

    .line 362
    .local v7, result:Ljava/lang/Object;
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 363
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v1, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v10, 0x0

    .line 365
    .local v10, use_cache_bool:I
    if-eqz v7, :cond_0

    .line 366
    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 367
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lt v3, v11, :cond_1

    .line 379
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    :cond_0
    const-string v11, "cache use"

    const-string v12, "use - 222222222222222222222222222"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 381
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->adapter1:Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/SoftListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 382
    new-instance v9, Ljava/lang/Thread;

    new-instance v11, Lcom/webuid/mmVideo/SoftListActivity$12;

    invoke-direct {v11, p0}, Lcom/webuid/mmVideo/SoftListActivity$12;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-direct {v9, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 408
    .local v9, thread:Ljava/lang/Thread;
    if-nez v10, :cond_2

    .line 409
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v12, "\u9996\u6b21\u8fd0\u884c\uff0c\u9700\u4e0b\u8f7d\u6570\u636e\u3002\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 410
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 411
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 412
    iget-object v11, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v11}, Landroid/app/ProgressDialog;->show()V

    .line 413
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    .line 421
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :goto_1
    return-void

    .line 368
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v1       #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3       #i:I
    .restart local v4       #k_name:Ljava/lang/String;
    .restart local v6       #regdata:Lorg/json/JSONObject;
    .restart local v7       #result:Ljava/lang/Object;
    .restart local v10       #use_cache_bool:I
    :cond_1
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 369
    .local v8, temp:Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 370
    .local v5, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v11, "id"

    const-string v12, "id"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    const-string v11, "name"

    const-string v12, "name"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    const-string v11, "downurl"

    const-string v12, "downurl"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    const-string v11, "content"

    const-string v12, "content"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    const-string v11, "image"

    const-string v12, "image"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    const/4 v10, 0x1

    .line 367
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 415
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    .end local v5           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8           #temp:Lorg/json/JSONObject;
    .restart local v9       #thread:Ljava/lang/Thread;
    :cond_2
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 417
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :catch_0
    move-exception v2

    .line 419
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 97
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 98
    const v4, 0x7f030013

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SoftListActivity;->setContentView(I)V

    .line 100
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    .line 101
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v7}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 102
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/SoftListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090004

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v5, "\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const v5, 0x7f020026

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 105
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 106
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 107
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v5, Lcom/webuid/mmVideo/SoftListActivity$4;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/SoftListActivity$4;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 113
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v5, Lcom/webuid/mmVideo/SoftListActivity$5;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/SoftListActivity$5;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 119
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->show()V

    .line 121
    const v4, 0x7f060005

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SoftListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 122
    .local v1, btn1:Landroid/widget/Button;
    const v4, 0x7f060006

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SoftListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 124
    .local v2, btn2:Landroid/widget/Button;
    new-instance v4, Lcom/webuid/mmVideo/SoftListActivity$6;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SoftListActivity$6;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    new-instance v4, Lcom/webuid/mmVideo/SoftListActivity$7;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SoftListActivity$7;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    const v4, 0x7f060003

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SoftListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 149
    .local v3, leftBtnImg:Landroid/widget/ImageView;
    new-instance v4, Lcom/webuid/mmVideo/SoftListActivity$8;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SoftListActivity$8;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    new-instance v0, Ljava/lang/Thread;

    new-instance v4, Lcom/webuid/mmVideo/SoftListActivity$9;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SoftListActivity$9;-><init>(Lcom/webuid/mmVideo/SoftListActivity;)V

    invoke-direct {v0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 170
    .local v0, background:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 171
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 426
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 428
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 429
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 430
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 432
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 556
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 557
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 558
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 545
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 546
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/SoftListActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 547
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 548
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 549
    invoke-virtual {p0}, Lcom/webuid/mmVideo/SoftListActivity;->finish()V

    .line 551
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 552
    return-void
.end method
