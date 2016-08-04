.class public Lcom/webuid/mmVideo/RecommendActivity;
.super Landroid/app/Activity;
.source "RecommendActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;,
        Lcom/webuid/mmVideo/RecommendActivity$GetDataTask;,
        Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;,
        Lcom/webuid/mmVideo/RecommendActivity$MyListener;,
        Lcom/webuid/mmVideo/RecommendActivity$OnItemListSelectedListener;,
        Lcom/webuid/mmVideo/RecommendActivity$ViewHolder;
    }
.end annotation


# static fields
.field protected static final GUIUPDATEIDENTIFIER:I = 0x101

.field private static c_id:I


# instance fields
.field private actualListView:Landroid/widget/ListView;

.field adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

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

.field private dataList2:Ljava/util/ArrayList;
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

.field group:Landroid/view/ViewGroup;

.field imageView:Landroid/widget/ImageView;

.field imageViews:[Landroid/widget/ImageView;

.field limit_now:I

.field limit_num:I

.field list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

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

.field main:Landroid/view/ViewGroup;

.field public mainHandler:Landroid/os/Handler;

.field public mainHandler2:Landroid/os/Handler;

.field public mobile_connect:Z

.field private mypDialog:Landroid/app/ProgressDialog;

.field nowNamePre:Ljava/lang/String;

.field page_now:I

.field private q_text:Ljava/lang/String;

.field private searchText:Landroid/widget/EditText;

.field public search_type:I

.field touchTime:J

.field viewPager:Landroid/support/v4/view/ViewPager;

.field waitTime:J

.field public wifi_connect:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    sput v0, Lcom/webuid/mmVideo/RecommendActivity;->c_id:I

    .line 70
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    .line 76
    iput v1, p0, Lcom/webuid/mmVideo/RecommendActivity;->loadMore:I

    .line 77
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->page_now:I

    .line 78
    iput v1, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    .line 79
    const/16 v0, 0x14

    iput v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_num:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->nowNamePre:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->q_text:Ljava/lang/String;

    .line 97
    iput-boolean v1, p0, Lcom/webuid/mmVideo/RecommendActivity;->wifi_connect:Z

    .line 98
    iput-boolean v1, p0, Lcom/webuid/mmVideo/RecommendActivity;->mobile_connect:Z

    .line 292
    new-instance v0, Lcom/webuid/mmVideo/RecommendActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RecommendActivity$1;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mainHandler:Landroid/os/Handler;

    .line 335
    new-instance v0, Lcom/webuid/mmVideo/RecommendActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RecommendActivity$2;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mHandler:Landroid/os/Handler;

    .line 532
    new-instance v0, Lcom/webuid/mmVideo/RecommendActivity$3;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/RecommendActivity$3;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mainHandler2:Landroid/os/Handler;

    .line 892
    const-wide/16 v0, 0x7d0

    iput-wide v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->waitTime:J

    .line 893
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->touchTime:J

    .line 70
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/RecommendActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 88
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/RecommendActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter

    .prologue
    .line 89
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 566
    invoke-direct {p0}, Lcom/webuid/mmVideo/RecommendActivity;->setViewPager()V

    return-void
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/RecommendActivity;)Lcom/webuid/mmVideo/lib/PullToRefreshListView;
    .locals 1
    .parameter

    .prologue
    .line 86
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/RecommendActivity;)Ljava/util/LinkedList;
    .locals 1
    .parameter

    .prologue
    .line 85
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->mListItems:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/RecommendActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 71
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$6(I)V
    .locals 0
    .parameter

    .prologue
    .line 96
    sput p0, Lcom/webuid/mmVideo/RecommendActivity;->c_id:I

    return-void
.end method

.method static synthetic access$7(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 228
    invoke-direct {p0}, Lcom/webuid/mmVideo/RecommendActivity;->setMainView()V

    return-void
.end method

.method static synthetic access$8(Lcom/webuid/mmVideo/RecommendActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter

    .prologue
    .line 72
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    return-object v0
.end method

.method private setMainView()V
    .locals 4

    .prologue
    .line 230
    const v2, 0x7f060005

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 231
    .local v0, btn1:Landroid/widget/Button;
    const v2, 0x7f060006

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 232
    .local v1, btn2:Landroid/widget/Button;
    const/4 v2, 0x0

    iput v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->search_type:I

    .line 233
    new-instance v2, Lcom/webuid/mmVideo/RecommendActivity$10;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/RecommendActivity$10;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    new-instance v2, Lcom/webuid/mmVideo/RecommendActivity$11;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/RecommendActivity$11;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    const v2, 0x7f060021

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RecommendActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    .line 271
    iget-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    new-instance v3, Lcom/webuid/mmVideo/RecommendActivity$12;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/RecommendActivity$12;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setOnRefreshListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;)V

    .line 278
    iget-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->mPullRefreshListView:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getRefreshableView()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;

    .line 279
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->mListItems:Ljava/util/LinkedList;

    .line 281
    new-instance v2, Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    iget-object v3, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-direct {v2, p0, p0, v3}, Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;-><init>(Lcom/webuid/mmVideo/RecommendActivity;Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    .line 287
    iget-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;

    new-instance v3, Lcom/webuid/mmVideo/RecommendActivity$OnItemListSelectedListener;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/RecommendActivity$OnItemListSelectedListener;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 289
    iget-object v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->actualListView:Landroid/widget/ListView;

    iget-object v3, p0, Lcom/webuid/mmVideo/RecommendActivity;->adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 290
    return-void
.end method

.method private setViewPager()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0xc

    const/4 v11, 0x0

    const/4 v10, -0x1

    .line 567
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 568
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    .line 569
    .local v4, inflater:Landroid/view/LayoutInflater;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    .line 571
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v2, v8, :cond_1

    .line 613
    const-string v8, "discount-list"

    iget-object v9, p0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 616
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    .line 617
    const v8, 0x7f03000e

    invoke-virtual {v4, v8, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 619
    .local v5, main:Landroid/view/ViewGroup;
    const v8, 0x7f060024

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 621
    .local v1, group:Landroid/view/ViewGroup;
    const v8, 0x7f060023

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/support/v4/view/ViewPager;

    iput-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 623
    const/4 v2, 0x0

    :goto_1
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v2, v8, :cond_2

    .line 636
    const v8, 0x7f060022

    invoke-virtual {v5, v8}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    .line 637
    .local v7, viewPageLine:Landroid/widget/LinearLayout;
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 639
    const/4 v8, -0x2

    .line 637
    invoke-direct {v0, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 640
    .local v0, Scrollparams:Landroid/widget/LinearLayout$LayoutParams;
    iput v10, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 641
    const/16 v8, 0x64

    iput v8, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 642
    iput v11, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 643
    iput v11, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 644
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 646
    invoke-virtual {p0, v5}, Lcom/webuid/mmVideo/RecommendActivity;->setContentView(Landroid/view/View;)V

    .line 650
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    new-instance v9, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;

    invoke-direct {v9, p0}, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 651
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    new-instance v9, Lcom/webuid/mmVideo/RecommendActivity$MyListener;

    invoke-direct {v9, p0}, Lcom/webuid/mmVideo/RecommendActivity$MyListener;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 652
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->viewPager:Landroid/support/v4/view/ViewPager;

    const/16 v9, 0x12c

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 656
    .end local v0           #Scrollparams:Landroid/widget/LinearLayout$LayoutParams;
    .end local v1           #group:Landroid/view/ViewGroup;
    .end local v2           #i:I
    .end local v4           #inflater:Landroid/view/LayoutInflater;
    .end local v5           #main:Landroid/view/ViewGroup;
    .end local v7           #viewPageLine:Landroid/widget/LinearLayout;
    :cond_0
    return-void

    .line 572
    .restart local v2       #i:I
    .restart local v4       #inflater:Landroid/view/LayoutInflater;
    :cond_1
    const v8, 0x7f03001a

    invoke-virtual {v4, v8, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 576
    .local v6, view:Landroid/view/View;
    const v8, 0x7f06002a

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 579
    .local v3, imageView:Landroid/widget/ImageView;
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, "image_url"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/webuid/mmVideo/RecommendActivity;->getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 580
    const-string v8, "img width:"

    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    const-string v8, "img height:"

    invoke-virtual {v3}, Landroid/widget/ImageView;->getHeight()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 584
    new-instance v8, Lcom/webuid/mmVideo/RecommendActivity$15;

    invoke-direct {v8, p0}, Lcom/webuid/mmVideo/RecommendActivity$15;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 610
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 611
    const-string v8, "list"

    const-string v9, "add view"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 624
    .end local v3           #imageView:Landroid/widget/ImageView;
    .end local v6           #view:Landroid/view/View;
    .restart local v1       #group:Landroid/view/ViewGroup;
    .restart local v5       #main:Landroid/view/ViewGroup;
    :cond_2
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageView:Landroid/widget/ImageView;

    .line 625
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageView:Landroid/widget/ImageView;

    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v9, v12, v12}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 627
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    iget-object v9, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageView:Landroid/widget/ImageView;

    aput-object v9, v8, v2

    .line 628
    if-nez v2, :cond_3

    .line 629
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v8, v8, v2

    const v9, 0x7f020022

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 633
    :goto_2
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 623
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 631
    :cond_3
    iget-object v8, p0, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v8, v8, v2

    const v9, 0x7f020021

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    goto :goto_2
.end method

.method private startSearch()V
    .locals 2

    .prologue
    .line 308
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/RecommendActivity$13;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/RecommendActivity$13;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 332
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 333
    return-void
.end method


# virtual methods
.method public checkNetworkIsAvailable()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 195
    const-string v4, "connectivity"

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/RecommendActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 196
    .local v0, manager:Landroid/net/ConnectivityManager;
    invoke-virtual {v0, v2}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v4

    iput-boolean v4, p0, Lcom/webuid/mmVideo/RecommendActivity;->wifi_connect:Z

    .line 197
    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v4

    iput-boolean v4, p0, Lcom/webuid/mmVideo/RecommendActivity;->mobile_connect:Z

    .line 198
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 199
    .local v1, networkinfo:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 200
    :cond_0
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "********************network is no available"

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move v2, v3

    .line 204
    :goto_0
    return v2

    .line 203
    :cond_1
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "********************network is  available"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

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

    .line 356
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 357
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 359
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 360
    .local v7, regdata:Lorg/json/JSONObject;
    const-string v10, "recommend"

    const-string v11, "1"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 361
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 362
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

    .line 363
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    if-ge v10, v14, :cond_0

    .line 364
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    .line 366
    :cond_0
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->search_type:I

    if-ne v10, v14, :cond_3

    .line 367
    const-string v10, "search_type"

    const-string v11, "today"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 371
    :cond_1
    :goto_0
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->loadMore:I

    if-ne v10, v13, :cond_4

    .line 372
    const-string v10, "offset"

    iget v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 373
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    iget v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_num:I

    add-int/2addr v10, v11

    iput v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I

    .line 377
    :goto_1
    const-string v10, "regdata.toString()"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    const-string v10, "getRecommend"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 379
    .local v8, result:Ljava/lang/String;
    const-string v10, "recommend"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x4

    if-le v10, v11, :cond_2

    .line 381
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 382
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_5

    .line 400
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->loadMore:I

    if-eq v10, v13, :cond_2

    .line 404
    iget-object v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 405
    iget-object v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 406
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    invoke-virtual {v10, v5, v8, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 415
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :cond_2
    :goto_3
    return-void

    .line 368
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_3
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->search_type:I

    if-ne v10, v13, :cond_1

    .line 369
    const-string v10, "search_type"

    const-string v11, "tommory"

    invoke-virtual {v7, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 409
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_0
    move-exception v10

    goto :goto_3

    .line 375
    .restart local v5       #k_name:Ljava/lang/String;
    .restart local v7       #regdata:Lorg/json/JSONObject;
    :cond_4
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_num:I

    iput v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->limit_now:I
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 411
    .end local v5           #k_name:Ljava/lang/String;
    .end local v7           #regdata:Lorg/json/JSONObject;
    :catch_1
    move-exception v3

    .line 413
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 383
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

    .line 384
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 385
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    const-string v10, "url"

    const-string v11, "url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    const-string v10, "title"

    const-string v11, "title"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    const-string v10, "source"

    const-string v11, "source"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    const-string v10, "size"

    const-string v11, "size"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    const-string v10, "length"

    const-string v11, "length"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v10, "recommend"

    const-string v11, "recommend"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v10, "star"

    const-string v11, "star"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    const-string v10, "image"

    const-string v11, "image"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    iget v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->loadMore:I

    if-ne v10, v13, :cond_6

    .line 396
    iget-object v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    const-string v10, "Load"

    const-string v11, "add one"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 382
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2
.end method

.method public getDataSource2()V
    .locals 12

    .prologue
    .line 658
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 659
    .local v2, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v10, "/index.php?s=/Service/Index"

    invoke-direct {v1, v10}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 661
    .local v1, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 663
    .local v7, regdata:Lorg/json/JSONObject;
    const-string v10, "getRecommendAd"

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 662
    check-cast v8, Ljava/lang/String;

    .line 664
    .local v8, result:Ljava/lang/String;
    const-string v10, "getRecommendAd"

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    if-eqz v8, :cond_0

    .line 666
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 667
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v4, v10, :cond_1

    .line 688
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    :cond_0
    iget-object v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 689
    iget-object v10, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList2:Ljava/util/ArrayList;

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 698
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    :goto_1
    return-void

    .line 668
    .restart local v0       #arr:Lorg/json/JSONArray;
    .restart local v4       #i:I
    .restart local v7       #regdata:Lorg/json/JSONObject;
    .restart local v8       #result:Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    .line 669
    .local v9, temp:Lorg/json/JSONObject;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 670
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "id"

    const-string v11, "id"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    const-string v10, "url"

    const-string v11, "url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    const-string v10, "downurl"

    const-string v11, "downurl"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    const-string v10, "title"

    const-string v11, "title"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    const-string v10, "source"

    const-string v11, "source"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    const-string v10, "size"

    const-string v11, "size"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    const-string v10, "length"

    const-string v11, "length"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    const-string v10, "recommend"

    const-string v11, "recommend"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    const-string v10, "star"

    const-string v11, "star"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    const-string v10, "image_url"

    const-string v11, "image"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    const-string v10, "image"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/webuid/mmVideo/RecommendActivity;->getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 681
    .local v5, imgD:Landroid/graphics/drawable/Drawable;
    if-nez v5, :cond_2

    .line 667
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 684
    :cond_2
    const-string v10, "image"

    invoke-virtual {v6, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 692
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #imgD:Landroid/graphics/drawable/Drawable;
    .end local v6           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7           #regdata:Lorg/json/JSONObject;
    .end local v8           #result:Ljava/lang/String;
    .end local v9           #temp:Lorg/json/JSONObject;
    :catch_0
    move-exception v10

    goto/16 :goto_1

    .line 694
    :catch_1
    move-exception v3

    .line 696
    .local v3, e:Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter "imageUrl"

    .prologue
    .line 701
    const/4 v0, 0x0

    .line 702
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Lcom/webuid/mmVideo/BasicCache;->loadImageFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 703
    if-nez v0, :cond_0

    .line 704
    const-string v1, "Drawable"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "null:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 708
    :goto_0
    return-object v0

    .line 706
    :cond_0
    const-string v1, "Drawable"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "yes:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getListFromCache()V
    .locals 13

    .prologue
    .line 458
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 459
    .local v6, regdata:Lorg/json/JSONObject;
    const-string v11, "recommend"

    const-string v12, "1"

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 460
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 462
    .local v4, k_name:Ljava/lang/String;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v11

    invoke-virtual {v11, v4, p0}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v7

    .line 463
    .local v7, result:Ljava/lang/Object;
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 464
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 465
    .local v1, dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v10, 0x0

    .line 466
    .local v10, use_cache_bool:I
    if-eqz v7, :cond_0

    .line 467
    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 468
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lt v3, v11, :cond_1

    .line 484
    .end local v0           #arr:Lorg/json/JSONArray;
    .end local v3           #i:I
    :cond_0
    const-string v11, "cache use"

    const-string v12, "use - 222222222222222222222222222"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 486
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->adapter1:Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/RecommendActivity$CustomListAdapter;->notifyDataSetChanged()V

    .line 487
    new-instance v9, Ljava/lang/Thread;

    new-instance v11, Lcom/webuid/mmVideo/RecommendActivity$14;

    invoke-direct {v11, p0}, Lcom/webuid/mmVideo/RecommendActivity$14;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-direct {v9, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 516
    .local v9, thread:Ljava/lang/Thread;
    if-nez v10, :cond_2

    .line 517
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v12, "\u9996\u6b21\u8fd0\u884c\uff0c\u9700\u4e0b\u8f7d\u6570\u636e\u3002\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 518
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 519
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 520
    iget-object v11, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v11}, Landroid/app/ProgressDialog;->show()V

    .line 521
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    .line 529
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :goto_1
    return-void

    .line 469
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

    .line 470
    .local v8, temp:Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 471
    .local v5, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v11, "id"

    const-string v12, "id"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const-string v11, "url"

    const-string v12, "url"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    const-string v11, "title"

    const-string v12, "title"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    const-string v11, "source"

    const-string v12, "source"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    const-string v11, "size"

    const-string v12, "size"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    const-string v11, "length"

    const-string v12, "length"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    const-string v11, "recommend"

    const-string v12, "recommend"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    const-string v11, "star"

    const-string v12, "star"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    const-string v11, "image"

    const-string v12, "image"

    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    const/4 v10, 0x1

    .line 468
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 523
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

    .line 525
    .end local v1           #dataList0:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #k_name:Ljava/lang/String;
    .end local v6           #regdata:Lorg/json/JSONObject;
    .end local v7           #result:Ljava/lang/Object;
    .end local v9           #thread:Ljava/lang/Thread;
    .end local v10           #use_cache_bool:I
    :catch_0
    move-exception v2

    .line 527
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 6

    .prologue
    .line 897
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 898
    .local v0, currentTime:J
    iget-wide v2, p0, Lcom/webuid/mmVideo/RecommendActivity;->touchTime:J

    sub-long v2, v0, v2

    iget-wide v4, p0, Lcom/webuid/mmVideo/RecommendActivity;->waitTime:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 900
    const-string v2, "\u518d\u6309\u4e00\u6b21\u9000\u51fa"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/RecommendActivity;->setToast(Ljava/lang/String;)V

    .line 901
    iput-wide v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->touchTime:J

    .line 905
    :goto_0
    return-void

    .line 903
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 102
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 103
    const v6, 0x7f03000e

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/RecommendActivity;->setContentView(I)V

    .line 105
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-direct {v6, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    .line 106
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v10}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 107
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f090004

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    const-string v7, "\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u2026\u2026"

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 109
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    const v7, 0x7f020026

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 110
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v10}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 111
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v9}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 112
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v7, Lcom/webuid/mmVideo/RecommendActivity$4;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/RecommendActivity$4;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 118
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    new-instance v7, Lcom/webuid/mmVideo/RecommendActivity$5;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/RecommendActivity$5;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 125
    new-instance v0, Ljava/lang/Thread;

    new-instance v6, Lcom/webuid/mmVideo/RecommendActivity$6;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/RecommendActivity$6;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-direct {v0, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 142
    .local v0, background2:Ljava/lang/Thread;
    const-string v6, "setting"

    invoke-virtual {p0, v6, v9}, Lcom/webuid/mmVideo/RecommendActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 144
    .local v2, preferences:Landroid/content/SharedPreferences;
    const-string v6, "remaind"

    invoke-interface {v2, v6, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 145
    .local v5, remaindType:Ljava/lang/Integer;
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->checkNetworkIsAvailable()Z

    move-result v6

    if-nez v6, :cond_0

    .line 146
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v7, "\u63d0\u793a"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u5f53\u524d\u6ca1\u6709\u627e\u5230\u7f51\u7edc\uff0c\u8bf7\u5148\u8bbe\u7f6e\u597d\u7f51\u7edc\u4ee5\u4fbf\u83b7\u53d6\u5230\u6570\u636e\uff01"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u786e\u5b9a"

    new-instance v8, Lcom/webuid/mmVideo/RecommendActivity$7;

    invoke-direct {v8, p0}, Lcom/webuid/mmVideo/RecommendActivity$7;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 151
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 192
    :goto_0
    return-void

    .line 154
    :cond_0
    iget-boolean v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->wifi_connect:Z

    if-nez v6, :cond_1

    iget-boolean v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mobile_connect:Z

    if-eqz v6, :cond_1

    .line 155
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_2

    .line 156
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v7, "\u63d0\u793a"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u5f53\u524d\u672a\u4f7f\u7528wifi\u65e0\u7ebf\uff0c\u53ef\u80fd\u4ea7\u751f\u79fb\u52a8\u6d41\u91cf!"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u786e\u5b9a"

    new-instance v8, Lcom/webuid/mmVideo/RecommendActivity$8;

    invoke-direct {v8, p0}, Lcom/webuid/mmVideo/RecommendActivity$8;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 161
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 184
    :cond_1
    :goto_1
    iget-object v6, p0, Lcom/webuid/mmVideo/RecommendActivity;->mypDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    .line 185
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 163
    :cond_2
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v9, :cond_4

    .line 164
    const-string v6, "setting"

    const/4 v7, 0x2

    invoke-virtual {p0, v6, v7}, Lcom/webuid/mmVideo/RecommendActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 166
    .local v3, preferences2:Landroid/content/SharedPreferences;
    const-string v6, "remaindNum"

    invoke-interface {v2, v6, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 167
    .local v4, remaindNum:Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_3

    .line 168
    new-instance v6, Landroid/app/AlertDialog$Builder;

    invoke-direct {v6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v7, "\u63d0\u793a"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u5f53\u524d\u672a\u4f7f\u7528wifi\u65e0\u7ebf\uff0c\u53ef\u80fd\u4ea7\u751f\u79fb\u52a8\u6d41\u91cf!"

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const-string v7, "\u786e\u5b9a"

    new-instance v8, Lcom/webuid/mmVideo/RecommendActivity$9;

    invoke-direct {v8, p0}, Lcom/webuid/mmVideo/RecommendActivity$9;-><init>(Lcom/webuid/mmVideo/RecommendActivity;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 173
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 176
    :cond_3
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 177
    .local v1, edit:Landroid/content/SharedPreferences$Editor;
    const-string v6, "remaindNum"

    invoke-interface {v1, v6, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 178
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_1

    .line 180
    .end local v1           #edit:Landroid/content/SharedPreferences$Editor;
    .end local v3           #preferences2:Landroid/content/SharedPreferences;
    .end local v4           #remaindNum:Ljava/lang/Integer;
    :cond_4
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    goto :goto_1
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 224
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 225
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 226
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 216
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 217
    const/4 v0, 0x0

    iput v0, p0, Lcom/webuid/mmVideo/RecommendActivity;->search_type:I

    .line 218
    const-string v0, "Recommend"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 220
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 210
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 211
    const-string v0, "Recommend"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    return-void
.end method

.method public setToast(Ljava/lang/String;)V
    .locals 6
    .parameter "text"

    .prologue
    .line 907
    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030028

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 908
    .local v2, toastRoot:Landroid/view/View;
    const v3, 0x7f060004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 909
    .local v0, title:Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 910
    new-instance v1, Landroid/widget/Toast;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/RecommendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 911
    .local v1, toast:Landroid/widget/Toast;
    invoke-virtual {v1, v2}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 912
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/Toast;->setDuration(I)V

    .line 913
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 915
    return-void
.end method
