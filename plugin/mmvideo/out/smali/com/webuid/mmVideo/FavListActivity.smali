.class public Lcom/webuid/mmVideo/FavListActivity;
.super Landroid/app/Activity;
.source "FavListActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/FavListActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/FavListActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

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

    .line 66
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;

    .line 72
    iput v1, p0, Lcom/webuid/mmVideo/FavListActivity;->loadMore:I

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/FavListActivity;->page_now:I

    .line 74
    iput v1, p0, Lcom/webuid/mmVideo/FavListActivity;->limit_now:I

    .line 75
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/FavListActivity;->limit_num:I

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->nowNamePre:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->q_text:Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 223
    new-instance v0, Lcom/webuid/mmVideo/FavListActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/FavListActivity$1;-><init>(Lcom/webuid/mmVideo/FavListActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->mHandlerClick:Landroid/os/Handler;

    .line 66
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/FavListActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 68
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/FavListActivity;)Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1
    .parameter

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/webuid/mmVideo/FavListActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/FavListActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 203
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private setMainView()V
    .locals 4

    .prologue
    .line 124
    const v2, 0x7f060007

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/FavListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;

    .line 137
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->mListItems:Ljava/util/LinkedList;

    .line 139
    new-instance v2, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v2, p0, p0, v3}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/FavListActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    .line 147
    iget-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 149
    iget-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 150
    iget-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 151
    iget-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->adapter1:Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/FavListActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 152
    iget-object v2, p0, Lcom/webuid/mmVideo/FavListActivity;->actualListView:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 156
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/FavListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 157
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/FavListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 158
    .local v1, btn2:Landroid/widget/Button;
    new-instance v2, Lcom/webuid/mmVideo/FavListActivity$3;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/FavListActivity$3;-><init>(Lcom/webuid/mmVideo/FavListActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    new-instance v2, Lcom/webuid/mmVideo/FavListActivity$4;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/FavListActivity$4;-><init>(Lcom/webuid/mmVideo/FavListActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
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
    .line 105
    iget-object v4, p0, Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 106
    new-instance v1, Lcom/webuid/mmVideo/service/FavService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/FavListActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/webuid/mmVideo/dao/DataHelper;->getFavDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/webuid/mmVideo/service/FavService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 107
    .local v1, favService:Lcom/webuid/mmVideo/service/IFavService;
    invoke-interface {v1}, Lcom/webuid/mmVideo/service/IFavService;->select()Ljava/util/List;

    move-result-object v2

    .line 108
    .local v2, favs:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/Fav;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 121
    return-void

    .line 108
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/entity/Fav;

    .line 109
    .local v0, fav:Lcom/webuid/mmVideo/entity/Fav;
    const-string v5, "fav sqlite title"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 111
    .local v3, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "id"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v5, "title"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v5, "source"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getSource()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v5, "length"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getLength()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v5, "recommend"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getRecommend()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v5, "url"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v5, "size"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getSize()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v5, "star"

    invoke-virtual {v0}, Lcom/webuid/mmVideo/entity/Fav;->getStar()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v5, p0, Lcom/webuid/mmVideo/FavListActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

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
    .line 90
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 91
    const/high16 v1, 0x7f03

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/FavListActivity;->setContentView(I)V

    .line 93
    const v1, 0x7f060003

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/FavListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 94
    .local v0, leftBtnImg:Landroid/widget/ImageView;
    new-instance v1, Lcom/webuid/mmVideo/FavListActivity$2;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/FavListActivity$2;-><init>(Lcom/webuid/mmVideo/FavListActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    invoke-virtual {p0}, Lcom/webuid/mmVideo/FavListActivity;->getDataList()V

    .line 100
    invoke-direct {p0}, Lcom/webuid/mmVideo/FavListActivity;->setMainView()V

    .line 101
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 191
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 193
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 194
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/FavListActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 197
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 352
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 353
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 354
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 341
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 342
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/FavListActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 343
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 344
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 345
    invoke-virtual {p0}, Lcom/webuid/mmVideo/FavListActivity;->finish()V

    .line 347
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 348
    return-void
.end method
