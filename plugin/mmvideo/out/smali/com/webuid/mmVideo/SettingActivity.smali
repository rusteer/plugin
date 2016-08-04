.class public Lcom/webuid/mmVideo/SettingActivity;
.super Landroid/app/Activity;
.source "SettingActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/SettingActivity$ListAdapter;,
        Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;
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

.field public adapter:Lcom/webuid/mmVideo/SettingActivity$ListAdapter;

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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/SettingActivity;->remaindType:Ljava/lang/Integer;

    .line 78
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 78
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/SettingActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 79
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method private buildListView()V
    .locals 5

    .prologue
    .line 146
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 147
    .local v0, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "name"

    const-string v4, "\u6bcf\u6b21\u63d0\u9192"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    iget-object v3, p0, Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 150
    .local v1, map2:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "name"

    const-string v4, "\u63d0\u9192\u4e00\u6b21"

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    iget-object v3, p0, Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v2, map3:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "name"

    const-string v4, "\u6c38\u4e0d\u63d0\u9192"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    iget-object v3, p0, Lcom/webuid/mmVideo/SettingActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    return-void
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 172
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    .line 95
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 96
    const v4, 0x7f030010

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SettingActivity;->setContentView(I)V

    .line 97
    const-string v4, "pos"

    const-string v5, "1"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const-string v4, "setting"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/webuid/mmVideo/SettingActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 100
    .local v3, preferences:Landroid/content/SharedPreferences;
    const-string v4, "remaind"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sput-object v4, Lcom/webuid/mmVideo/SettingActivity;->remaindType:Ljava/lang/Integer;

    .line 102
    const v4, 0x7f060005

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 103
    .local v0, btn1:Landroid/widget/Button;
    const v4, 0x7f060006

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 105
    .local v1, btn2:Landroid/widget/Button;
    new-instance v4, Lcom/webuid/mmVideo/SettingActivity$1;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SettingActivity$1;-><init>(Lcom/webuid/mmVideo/SettingActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    new-instance v4, Lcom/webuid/mmVideo/SettingActivity$2;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SettingActivity$2;-><init>(Lcom/webuid/mmVideo/SettingActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    const-string v4, "pos"

    const-string v5, "12"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const v4, 0x7f060003

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 131
    .local v2, leftBtnImg:Landroid/widget/ImageView;
    new-instance v4, Lcom/webuid/mmVideo/SettingActivity$3;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/SettingActivity$3;-><init>(Lcom/webuid/mmVideo/SettingActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    const-string v4, "pos"

    const-string v5, "13"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    invoke-direct {p0}, Lcom/webuid/mmVideo/SettingActivity;->buildListView()V

    .line 138
    new-instance v4, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;

    invoke-direct {v4, p0, p0}, Lcom/webuid/mmVideo/SettingActivity$ListAdapter;-><init>(Lcom/webuid/mmVideo/SettingActivity;Landroid/content/Context;)V

    iput-object v4, p0, Lcom/webuid/mmVideo/SettingActivity;->adapter:Lcom/webuid/mmVideo/SettingActivity$ListAdapter;

    .line 139
    const v4, 0x7f060007

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/SettingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    iput-object v4, p0, Lcom/webuid/mmVideo/SettingActivity;->actualListView:Landroid/widget/ListView;

    .line 140
    const-string v4, "pos"

    const-string v5, "14"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-object v4, p0, Lcom/webuid/mmVideo/SettingActivity;->actualListView:Landroid/widget/ListView;

    iget-object v5, p0, Lcom/webuid/mmVideo/SettingActivity;->adapter:Lcom/webuid/mmVideo/SettingActivity$ListAdapter;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 142
    iget-object v4, p0, Lcom/webuid/mmVideo/SettingActivity;->actualListView:Landroid/widget/ListView;

    new-instance v5, Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;

    invoke-direct {v5, p0}, Lcom/webuid/mmVideo/SettingActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/SettingActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 143
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 160
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 162
    iget-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 163
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 164
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/SettingActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 166
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 258
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 259
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 260
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 247
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 248
    const-string v2, "backRecommend"

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/SettingActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 249
    .local v1, preferences:Landroid/content/SharedPreferences;
    const-string v2, "num"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 250
    .local v0, num:Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 251
    invoke-virtual {p0}, Lcom/webuid/mmVideo/SettingActivity;->finish()V

    .line 253
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 254
    return-void
.end method
