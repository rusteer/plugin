.class public Lcom/webuid/mmVideo/OfflineActivity;
.super Landroid/app/Activity;
.source "OfflineActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/OfflineActivity$GetDataTask;,
        Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;,
        Lcom/webuid/mmVideo/OfflineActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/OfflineActivity$ViewHolder;
    }
.end annotation


# static fields
.field public static adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

.field public static asyncListTask:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary",
            "<",
            "Ljava/lang/String;",
            "Lcom/webuid/mmVideo/Async;",
            ">;"
        }
    .end annotation
.end field

.field public static btnListStart:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary",
            "<",
            "Ljava/lang/String;",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field public static dataList:Ljava/util/ArrayList;
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

.field private static listContinue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field private static listPause:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field private static listStart:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field private static listStop:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field public static listTask:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/webuid/mmVideo/Async;",
            ">;>;"
        }
    .end annotation
.end field

.field public static progressTask:Ljava/util/Dictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Dictionary",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapterFinish:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

.field private dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

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

.field private mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

.field private mypDialog:Landroid/app/ProgressDialog;

.field nowNamePre:Ljava/lang/String;

.field page_now:I

.field private q_text:Ljava/lang/String;

.field private searchText:Landroid/widget/EditText;

.field public search_type:I

.field touchTime:J

.field waitTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    .line 67
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->progressTask:Ljava/util/Dictionary;

    .line 68
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->asyncListTask:Ljava/util/Dictionary;

    .line 69
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->btnListStart:Ljava/util/Dictionary;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listStart:Ljava/util/List;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listStop:Ljava/util/List;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listPause:Ljava/util/List;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listContinue:Ljava/util/List;

    .line 61
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 76
    iput v1, p0, Lcom/webuid/mmVideo/OfflineActivity;->loadMore:I

    .line 77
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->page_now:I

    .line 78
    iput v1, p0, Lcom/webuid/mmVideo/OfflineActivity;->limit_now:I

    .line 79
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->limit_num:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->nowNamePre:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->q_text:Ljava/lang/String;

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 687
    const-wide/16 v0, 0x7d0

    iput-wide v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->waitTime:J

    .line 688
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->touchTime:J

    .line 61
    return-void
.end method

.method static synthetic access$0()Ljava/util/List;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listStart:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1()Ljava/util/List;
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listPause:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$2()Ljava/util/List;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/webuid/mmVideo/OfflineActivity;->listContinue:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/OfflineActivity;)Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1
    .parameter

    .prologue
    .line 304
    invoke-direct {p0}, Lcom/webuid/mmVideo/OfflineActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/OfflineActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    .locals 1
    .parameter

    .prologue
    .line 83
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/OfflineActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 86
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 306
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 308
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method


# virtual methods
.method public getDataList()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    .line 269
    sget-object v5, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 270
    const/4 v0, 0x1

    .line 271
    .local v0, finish:I
    iget v5, p0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    .line 272
    const/4 v0, 0x0

    .line 274
    :cond_0
    const-string v5, "finish"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    new-instance v2, Lcom/webuid/mmVideo/service/DownVideoService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/OfflineActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 276
    .local v2, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    invoke-virtual {v2, v0}, Lcom/webuid/mmVideo/service/DownVideoService;->getListFromFinish(I)Ljava/util/List;

    move-result-object v4

    .line 277
    .local v4, videos:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 291
    return-void

    .line 277
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/webuid/mmVideo/entity/DownVideo;

    .line 278
    .local v3, video:Lcom/webuid/mmVideo/entity/DownVideo;
    const-string v6, "fav sqlite title"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 280
    .local v1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "id"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    const-string v6, "title"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    const-string v6, "source"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getSource()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    const-string v6, "length"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getLength()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    const-string v6, "recommend"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getRecommend()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    const-string v6, "url"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    const-string v6, "size"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getSize()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    const-string v6, "star"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getStar()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    const-string v6, "progress"

    invoke-virtual {v3}, Lcom/webuid/mmVideo/entity/DownVideo;->getProgress()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getDataList0()V
    .locals 25

    .prologue
    .line 191
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    const-string v24, "my_down_list_finish"

    invoke-virtual/range {v23 .. v24}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    .line 192
    .local v18, result0:Ljava/lang/Object;
    if-eqz v18, :cond_0

    .line 193
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    const-string v24, "my_down_list_finish"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v18

    move-object/from16 v3, p0

    invoke-virtual {v0, v1, v2, v3}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 195
    :cond_0
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    const-string v24, "my_down_list"

    invoke-virtual/range {v23 .. v24}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    .line 196
    .local v19, result1:Ljava/lang/Object;
    if-eqz v19, :cond_1

    .line 197
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    const-string v24, "my_down_list"

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    move-object/from16 v3, p0

    invoke-virtual {v0, v1, v2, v3}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 199
    :cond_1
    const-string v15, "my_down_list_finish"

    .line 200
    .local v15, my_down_list:Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_2

    .line 201
    const-string v15, "my_down_list"

    .line 203
    :cond_2
    new-instance v6, Lcom/google/gson/GsonBuilder;

    invoke-direct {v6}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 204
    .local v6, builder:Lcom/google/gson/GsonBuilder;
    invoke-virtual {v6}, Lcom/google/gson/GsonBuilder;->excludeFieldsWithoutExposeAnnotation()Lcom/google/gson/GsonBuilder;

    .line 205
    invoke-virtual {v6}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v8

    .line 206
    .local v8, gson:Lcom/google/gson/Gson;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v15, v1}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v17

    .line 207
    .local v17, result:Ljava/lang/Object;
    const/4 v9, 0x0

    .line 208
    .local v9, have_fav:I
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->clear()V

    .line 209
    if-eqz v17, :cond_4

    .line 210
    const-string v23, "getDataList0"

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-virtual {v0, v15, v1}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 212
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    .line 213
    new-instance v24, Lcom/webuid/mmVideo/OfflineActivity$5;

    invoke-direct/range {v24 .. v25}, Lcom/webuid/mmVideo/OfflineActivity$5;-><init>(Lcom/webuid/mmVideo/OfflineActivity;)V

    .line 214
    invoke-virtual/range {v24 .. v24}, Lcom/webuid/mmVideo/OfflineActivity$5;->getType()Ljava/lang/reflect/Type;

    move-result-object v24

    .line 212
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v8, v0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 215
    .local v7, favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 216
    .local v12, keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-nez v23, :cond_5

    .line 264
    .end local v7           #favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12           #keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    const-string v23, "getDataList2"

    sget-object v24, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    return-void

    .line 217
    .restart local v7       #favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v12       #keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_5
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 218
    .local v22, xid:Ljava/lang/String;
    move-object/from16 v0, v22

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 219
    .local v21, val:Ljava/lang/String;
    const-string v23, "---"

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 220
    .local v4, arr:[Ljava/lang/String;
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 221
    .local v13, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v23, "xid"

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string v23, "id"

    const/16 v24, 0x0

    aget-object v24, v4, v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    const-string v23, "name"

    const/16 v24, 0x1

    aget-object v24, v4, v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    const-string v23, "url"

    const/16 v24, 0x2

    aget-object v24, v4, v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->progressTask:Ljava/util/Dictionary;

    const/16 v24, 0x0

    aget-object v24, v4, v24

    invoke-virtual/range {v23 .. v24}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 228
    .local v16, proi:Ljava/lang/String;
    if-nez v16, :cond_6

    .line 229
    const-string v16, "0"

    .line 231
    :cond_6
    const-string v23, "progress"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const-string v23, "size"

    const/16 v24, 0x4

    aget-object v24, v4, v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    move-object/from16 v0, p0

    iget v0, v0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    move/from16 v23, v0

    const/16 v24, 0x2

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_3

    .line 235
    const-string v23, "getDataList start"

    const-string v24, "001"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    const/4 v5, 0x0

    .line 237
    .local v5, asyncTask:Lcom/webuid/mmVideo/Async;
    const/4 v14, 0x0

    .line 238
    .local v14, map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    const/16 v20, 0x0

    .line 239
    .local v20, startTask:Lcom/webuid/mmVideo/Async;
    const/4 v11, 0x0

    .line 241
    .local v11, isHas:Z
    const/4 v10, 0x0

    .local v10, i:I
    :goto_1
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v23

    move/from16 v0, v23

    if-lt v10, v0, :cond_7

    .line 251
    :goto_2
    if-nez v11, :cond_3

    .line 253
    const-string v23, "getDataList start"

    const-string v24, "002"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    new-instance v5, Lcom/webuid/mmVideo/Async;

    .end local v5           #asyncTask:Lcom/webuid/mmVideo/Async;
    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/webuid/mmVideo/Async;-><init>(Landroid/content/Context;)V

    .line 255
    .restart local v5       #asyncTask:Lcom/webuid/mmVideo/Async;
    new-instance v14, Ljava/util/Hashtable;

    .end local v14           #map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    invoke-direct {v14}, Ljava/util/Hashtable;-><init>()V

    .line 256
    .restart local v14       #map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    move-object/from16 v0, v22

    invoke-interface {v14, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    move-object/from16 v0, v23

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v22, v23, v24

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Lcom/webuid/mmVideo/Async;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 243
    :cond_7
    sget-object v23, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    move-object/from16 v0, v23

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Map;

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .end local v20           #startTask:Lcom/webuid/mmVideo/Async;
    check-cast v20, Lcom/webuid/mmVideo/Async;

    .line 244
    .restart local v20       #startTask:Lcom/webuid/mmVideo/Async;
    if-eqz v20, :cond_8

    .line 246
    const/4 v11, 0x1

    .line 247
    goto :goto_2

    .line 241
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 6

    .prologue
    .line 692
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 693
    .local v0, currentTime:J
    iget-wide v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->touchTime:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/webuid/mmVideo/OfflineActivity;->waitTime:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 695
    const-string v2, "\u518d\u6309\u4e00\u6b21\u9000\u51fa"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/OfflineActivity;->setToast(Ljava/lang/String;)V

    .line 696
    iput-wide v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->touchTime:J

    .line 700
    :goto_0
    return-void

    .line 698
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/OfflineActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 92
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 93
    const v3, 0x7f030009

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/OfflineActivity;->setContentView(I)V

    .line 95
    const v3, 0x7f06001a

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 96
    .local v2, topBg:Landroid/widget/LinearLayout;
    const v3, 0x7f06001b

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 97
    .local v0, btn1:Landroid/widget/Button;
    const v3, 0x7f06001c

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 98
    .local v1, btn2:Landroid/widget/Button;
    const/4 v3, 0x1

    iput v3, p0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    .line 99
    new-instance v3, Lcom/webuid/mmVideo/OfflineActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/webuid/mmVideo/OfflineActivity$1;-><init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    new-instance v3, Lcom/webuid/mmVideo/OfflineActivity$2;

    invoke-direct {v3, p0, v2}, Lcom/webuid/mmVideo/OfflineActivity$2;-><init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 294
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 296
    iget-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 297
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 298
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 300
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 683
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 684
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 685
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 668
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 669
    const-string v3, "backRecommend"

    invoke-virtual {p0, v3, v5}, Lcom/webuid/mmVideo/OfflineActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 670
    .local v2, preferences:Landroid/content/SharedPreferences;
    const-string v3, "num"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 671
    .local v1, num:Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 672
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v3, v5}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 673
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 674
    .local v0, edit:Landroid/content/SharedPreferences$Editor;
    const-string v3, "num"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 675
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 677
    .end local v0           #edit:Landroid/content/SharedPreferences$Editor;
    :cond_0
    const-string v3, "Recommend"

    const-string v4, "onResume"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 679
    return-void
.end method

.method protected onStart()V
    .locals 4

    .prologue
    .line 135
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 136
    const-string v2, "start"

    const-string v3, "---11"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    invoke-virtual {p0}, Lcom/webuid/mmVideo/OfflineActivity;->getDataList()V

    .line 138
    new-instance v2, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-direct {v2, p0, p0}, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;-><init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/content/Context;)V

    sput-object v2, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    .line 139
    const v2, 0x7f060007

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->actualListView:Landroid/widget/ListView;

    .line 141
    new-instance v2, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    sget-object v3, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v2, p0, p0, v3}, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->adapterFinish:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    .line 144
    iget v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->search_type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 145
    const-string v2, "ccc"

    const-string v3, "onStart1"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    iget-object v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->actualListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/webuid/mmVideo/OfflineActivity;->adapterFinish:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 158
    :goto_0
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 159
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/OfflineActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 160
    .local v1, btn2:Landroid/widget/Button;
    new-instance v2, Lcom/webuid/mmVideo/OfflineActivity$3;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/OfflineActivity$3;-><init>(Lcom/webuid/mmVideo/OfflineActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    new-instance v2, Lcom/webuid/mmVideo/OfflineActivity$4;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/OfflineActivity$4;-><init>(Lcom/webuid/mmVideo/OfflineActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    return-void

    .line 153
    .end local v0           #btn1:Landroid/widget/Button;
    .end local v1           #btn2:Landroid/widget/Button;
    :cond_0
    const-string v2, "ccc"

    const-string v3, "onStart2"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v2, p0, Lcom/webuid/mmVideo/OfflineActivity;->actualListView:Landroid/widget/ListView;

    sget-object v3, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_0
.end method

.method public setToast(Ljava/lang/String;)V
    .locals 6
    .parameter "text"

    .prologue
    .line 702
    invoke-virtual {p0}, Lcom/webuid/mmVideo/OfflineActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030028

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 703
    .local v2, toastRoot:Landroid/view/View;
    const v3, 0x7f060004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 704
    .local v0, title:Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    new-instance v1, Landroid/widget/Toast;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/OfflineActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 706
    .local v1, toast:Landroid/widget/Toast;
    invoke-virtual {v1, v2}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 707
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Toast;->setDuration(I)V

    .line 708
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 710
    return-void
.end method
