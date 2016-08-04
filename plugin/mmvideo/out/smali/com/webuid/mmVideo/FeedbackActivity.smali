.class public Lcom/webuid/mmVideo/FeedbackActivity;
.super Landroid/app/Activity;
.source "FeedbackActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;,
        Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;
    }
.end annotation


# static fields
.field public static remaindType:Ljava/lang/Integer;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation
.end field


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field public adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

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

.field public mHandlerSub:Landroid/os/Handler;

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

.field private mListView:Landroid/widget/ListView;

.field private mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

.field private mypDialog:Landroid/app/ProgressDialog;

.field page_now:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/FeedbackActivity;->remaindType:Ljava/lang/Integer;

    .line 69
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;

    .line 72
    iput v1, p0, Lcom/webuid/mmVideo/FeedbackActivity;->loadMore:I

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->page_now:I

    .line 74
    iput v1, p0, Lcom/webuid/mmVideo/FeedbackActivity;->limit_now:I

    .line 75
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->limit_num:I

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 217
    new-instance v0, Lcom/webuid/mmVideo/FeedbackActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/FeedbackActivity$1;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mHandler:Landroid/os/Handler;

    .line 294
    new-instance v0, Lcom/webuid/mmVideo/FeedbackActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/FeedbackActivity$2;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mHandlerSub:Landroid/os/Handler;

    .line 69
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 81
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/FeedbackActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 80
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/FeedbackActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 70
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 326
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 328
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 191
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/FeedbackActivity$9;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/FeedbackActivity$9;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 215
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 216
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

    .line 237
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 240
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 241
    .local v7, regdata:Lorg/json/JSONObject;
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "help_list_"

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

    .line 242
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

    .line 243
    const-string v10, "regdata.toString()"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const-string v10, "getHelp"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 245
    .local v8, result:Ljava/lang/String;
    const-string v10, "help"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x4

    if-le v10, v11, :cond_0

    .line 247
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_1

    .line 260
    iget v10, p0, Lcom/webuid/mmVideo/FeedbackActivity;->loadMore:I

    if-eq v10, v13, :cond_0

    .line 264
    iget-object v10, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 265
    iget-object v10, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 266
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v10, v5, v8, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 275
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 249
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v4       #i:I
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    .restart local v8       #result:Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 250
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 251
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    const-string v10, "name"

    const-string v11, "name"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    const-string v10, "content"

    const-string v11, "content"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    iget v10, p0, Lcom/webuid/mmVideo/FeedbackActivity;->loadMore:I

    if-ne v10, v13, :cond_2

    .line 256
    iget-object v10, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 257
    const-string v10, "Load"

    const-string v11, "add one"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 248
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 271
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v6           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    .end local v9           #temp:Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 273
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 269
    .end local v3           #e:Lorg/json/JSONException;
    :catch_1
    move-exception v10

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

    .line 90
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    const v4, 0x7f030001

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->setContentView(I)V

    .line 92
    const-string v4, "pos"

    const-string v5, "1"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    const v4, 0x7f060005

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 95
    .local v0, btn1:Landroid/widget/Button;
    const v4, 0x7f060006

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 97
    .local v1, btn2:Landroid/widget/Button;
    new-instance v4, Lcom/webuid/mmVideo/FeedbackActivity$3;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/FeedbackActivity$3;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    new-instance v4, Lcom/webuid/mmVideo/FeedbackActivity$4;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/FeedbackActivity$4;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    const v4, 0x7f06000d

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 123
    .local v2, btn3:Landroid/widget/Button;
    new-instance v4, Lcom/webuid/mmVideo/FeedbackActivity$5;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/FeedbackActivity$5;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    const-string v4, "pos"

    const-string v5, "12"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const v4, 0x7f060003

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 157
    .local v3, leftBtnImg:Landroid/widget/ImageView;
    new-instance v4, Lcom/webuid/mmVideo/FeedbackActivity$6;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/FeedbackActivity$6;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    invoke-virtual {p0}, Lcom/webuid/mmVideo/FeedbackActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 163
    const-string v4, "pos"

    const-string v5, "13"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    new-instance v4, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    invoke-direct {v4, p0, p0}, Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;Landroid/content/Context;)V

    iput-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    .line 166
    const v4, 0x7f060007

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    iput-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;

    .line 167
    const-string v4, "pos"

    const-string v5, "14"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;

    iget-object v5, p0, Lcom/webuid/mmVideo/FeedbackActivity;->adapter:Lcom/webuid/mmVideo/FeedbackActivity$ListAdapter;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 169
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->actualListView:Landroid/widget/ListView;

    new-instance v5, Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/FeedbackActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 170
    invoke-direct {p0}, Lcom/webuid/mmVideo/FeedbackActivity;->startSearch()V

    .line 172
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    .line 173
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v7}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 174
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/FeedbackActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090004

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v5, "\u6b63\u5728\u63d0\u4ea4\u53cd\u9988\u6570\u636e\uff0c\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    const v5, 0x7f020026

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 177
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 178
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 179
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v5, Lcom/webuid/mmVideo/FeedbackActivity$7;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/FeedbackActivity$7;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 183
    iget-object v4, p0, Lcom/webuid/mmVideo/FeedbackActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v5, Lcom/webuid/mmVideo/FeedbackActivity$8;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/FeedbackActivity$8;-><init>(Lcom/webuid/mmVideo/FeedbackActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 188
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 314
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 316
    iget-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 317
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 318
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/FeedbackActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 320
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 410
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 411
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 412
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 399
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 400
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/FeedbackActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 401
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 402
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 403
    invoke-virtual {p0}, Lcom/webuid/mmVideo/FeedbackActivity;->finish()V

    .line 405
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 406
    return-void
.end method

.method public submitData()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 279
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .local v3, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v0, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v6, "/index.php?s=/Service/Index"

    invoke-direct {v0, v6}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 282
    .local v0, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 283
    .local v4, regdata:Lorg/json/JSONObject;
    const v6, 0x7f06000a

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 284
    .local v2, content:Landroid/widget/EditText;
    const v6, 0x7f06000c

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/FeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 285
    .local v1, contact:Landroid/widget/EditText;
    const-string v6, "content"

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    const-string v6, "contact"

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    const-string v6, "regdata.toString()"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    const-string v6, "setFeedback"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 289
    .local v5, result:Ljava/lang/String;
    const-string v6, "result"

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    .end local v1           #contact:Landroid/widget/EditText;
    .end local v2           #content:Landroid/widget/EditText;
    .end local v4           #regdata:Lorg/json/JSONObject;
    .end local v5           #result:Ljava/lang/String;
    :goto_0
    return-void

    .line 290
    :catch_0
    move-exception v6

    goto :goto_0
.end method
