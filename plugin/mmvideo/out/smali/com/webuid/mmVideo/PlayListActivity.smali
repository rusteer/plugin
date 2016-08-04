.class public Lcom/webuid/mmVideo/PlayListActivity;
.super Landroid/app/Activity;
.source "PlayListActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/PlayListActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/PlayListActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

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

    .line 44
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;

    .line 50
    iput v1, p0, Lcom/webuid/mmVideo/PlayListActivity;->loadMore:I

    .line 51
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->page_now:I

    .line 52
    iput v1, p0, Lcom/webuid/mmVideo/PlayListActivity;->limit_now:I

    .line 53
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->limit_num:I

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->nowNamePre:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->q_text:Ljava/lang/String;

    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 202
    new-instance v0, Lcom/webuid/mmVideo/PlayListActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayListActivity$1;-><init>(Lcom/webuid/mmVideo/PlayListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->mHandlerClick:Landroid/os/Handler;

    .line 44
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/PlayListActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 46
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/PlayListActivity;)Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1
    .parameter

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayListActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/PlayListActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 62
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 116
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private setMainView()V
    .locals 4

    .prologue
    .line 122
    const v2, 0x7f060007

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/PlayListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->actualListView:Landroid/widget/ListView;

    .line 135
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->mListItems:Ljava/util/LinkedList;

    .line 137
    new-instance v2, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v2, p0, p0, v3}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/PlayListActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->adapter1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    .line 145
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->actualListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayListActivity;->adapter1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 147
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->adapter1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 148
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->actualListView:Landroid/widget/ListView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 149
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->adapter1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 150
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayListActivity;->actualListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 154
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/PlayListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 155
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/PlayListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 156
    .local v1, btn2:Landroid/widget/Button;
    new-instance v2, Lcom/webuid/mmVideo/PlayListActivity$3;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/PlayListActivity$3;-><init>(Lcom/webuid/mmVideo/PlayListActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    new-instance v2, Lcom/webuid/mmVideo/PlayListActivity$4;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/PlayListActivity$4;-><init>(Lcom/webuid/mmVideo/PlayListActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    return-void
.end method


# virtual methods
.method public getDataList()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v4, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 84
    new-instance v1, Lcom/webuid/mmVideo/service/PlayVideoService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayListActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/webuid/mmVideo/dao/DataHelper;->getPlayVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/webuid/mmVideo/service/PlayVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 85
    .local v1, pvService:Lcom/webuid/mmVideo/service/PlayVideoService;
    invoke-virtual {v1}, Lcom/webuid/mmVideo/service/PlayVideoService;->select()Ljava/util/List;

    move-result-object v3

    .line 86
    .local v3, videos:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 99
    return-void

    .line 86
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/webuid/mmVideo/entity/PlayVideo;

    .line 87
    .local v2, video:Lcom/webuid/mmVideo/entity/PlayVideo;
    const-string v5, "fav sqlite title"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v0, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "id"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string v5, "title"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v5, "source"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getSource()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v5, "length"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getLength()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v5, "recommend"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getRecommend()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v5, "url"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v5, "size"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getSize()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string v5, "star"

    invoke-virtual {v2}, Lcom/webuid/mmVideo/entity/PlayVideo;->getStar()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v5, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 69
    const v1, 0x7f03000b

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PlayListActivity;->setContentView(I)V

    .line 71
    const v1, 0x7f060003

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PlayListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 72
    .local v0, leftBtnImg:Landroid/widget/ImageView;
    new-instance v1, Lcom/webuid/mmVideo/PlayListActivity$2;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/PlayListActivity$2;-><init>(Lcom/webuid/mmVideo/PlayListActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PlayListActivity;->getDataList()V

    .line 78
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayListActivity;->setMainView()V

    .line 79
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 104
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 106
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 107
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 110
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 330
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 331
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 332
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 319
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 320
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/PlayListActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 321
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 322
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 323
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PlayListActivity;->finish()V

    .line 325
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 326
    return-void
.end method
