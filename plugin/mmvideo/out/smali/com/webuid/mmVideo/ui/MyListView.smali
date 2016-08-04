.class public Lcom/webuid/mmVideo/ui/MyListView;
.super Landroid/widget/ListView;
.source "MyListView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;
    }
.end annotation


# static fields
.field private static final DONE:I = 0x3

.field private static final LOADING:I = 0x4

.field private static final PULL_To_REFRESH:I = 0x1

.field private static final RATIO:I = 0x3

.field private static final REFRESHING:I = 0x2

.field private static final RELEASE_To_REFRESH:I = 0x0

.field private static final TAG:Ljava/lang/String; = "listview"


# instance fields
.field private animation:Landroid/view/animation/RotateAnimation;

.field private arrowImageView:Landroid/widget/ImageView;

.field private firstItemIndex:I

.field private headContentHeight:I

.field private headContentWidth:I

.field private headView:Landroid/widget/LinearLayout;

.field private inflater:Landroid/view/LayoutInflater;

.field private isBack:Z

.field private isRecored:Z

.field private isRefreshable:Z

.field private lastUpdatedTextView:Landroid/widget/TextView;

.field private progressBar:Landroid/widget/ProgressBar;

.field private refreshListener:Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;

.field private reverseAnimation:Landroid/view/animation/RotateAnimation;

.field private startY:I

.field private state:I

.field private tipsTextview:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 71
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 72
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/ui/MyListView;->init(Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/ui/MyListView;->init(Landroid/content/Context;)V

    .line 78
    return-void
.end method

.method private changeHeaderViewByState()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 265
    iget v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    packed-switch v0, :pswitch_data_0

    .line 322
    :goto_0
    return-void

    .line 267
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 268
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 269
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 270
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 272
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 273
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->animation:Landroid/view/animation/RotateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 275
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    const-string v1, "\u677e\u5f00\u5237\u65b0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    const-string v0, "listview"

    const-string v1, "\u5f53\u524d\u72b6\u6001\uff0c\u677e\u5f00\u5237\u65b0"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 280
    :pswitch_1
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 281
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 282
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 283
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 284
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 286
    iget-boolean v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->isBack:Z

    if-eqz v0, :cond_0

    .line 287
    iput-boolean v2, p0, Lcom/webuid/mmVideo/ui/MyListView;->isBack:Z

    .line 288
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 289
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->reverseAnimation:Landroid/view/animation/RotateAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 291
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    const-string v1, "\u4e0b\u62c9\u5237\u65b0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 295
    :goto_1
    const-string v0, "listview"

    const-string v1, "\u5f53\u524d\u72b6\u6001\uff0c\u4e0b\u62c9\u5237\u65b0"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    const-string v1, "\u4e0b\u62c9\u5237\u65b0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 300
    :pswitch_2
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 302
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 303
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 304
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 305
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u5237\u65b0..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 308
    const-string v0, "listview"

    const-string v1, "\u5f53\u524d\u72b6\u6001,\u6b63\u5728\u5237\u65b0..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 311
    :pswitch_3
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    mul-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 313
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 314
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 315
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    const v1, 0x7f020002

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 316
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    const-string v1, "\u4e0b\u62c9\u5237\u65b0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 319
    const-string v0, "listview"

    const-string v1, "\u5f53\u524d\u72b6\u6001\uff0cdone"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 265
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private init(Landroid/content/Context;)V
    .locals 13
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    const/high16 v2, -0x3ccc

    const/high16 v4, 0x3f00

    const/4 v12, 0x0

    const/4 v3, 0x1

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f070007

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/ui/MyListView;->setCacheColorHint(I)V

    .line 82
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->inflater:Landroid/view/LayoutInflater;

    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->inflater:Landroid/view/LayoutInflater;

    const v5, 0x7f03001b

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    .line 86
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    .line 87
    const v5, 0x7f06002c

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 86
    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    .line 88
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    const/16 v5, 0x46

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setMinimumWidth(I)V

    .line 89
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->arrowImageView:Landroid/widget/ImageView;

    const/16 v5, 0x32

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    .line 90
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    .line 91
    const v5, 0x7f06002d

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 90
    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->progressBar:Landroid/widget/ProgressBar;

    .line 92
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    const v5, 0x7f06002e

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->tipsTextview:Landroid/widget/TextView;

    .line 93
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    .line 94
    const v5, 0x7f06002f

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 93
    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    .line 96
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/ui/MyListView;->measureView(Landroid/view/View;)V

    .line 97
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    .line 98
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentWidth:I

    .line 100
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    iget v5, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    mul-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v12, v5, v12, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 101
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 103
    const-string v0, "size"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "width:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v6, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentWidth:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " height:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 104
    iget v6, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 103
    invoke-static {v0, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    const/4 v5, 0x0

    invoke-virtual {p0, v0, v5, v12}, Lcom/webuid/mmVideo/ui/MyListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 107
    invoke-virtual {p0, p0}, Lcom/webuid/mmVideo/ui/MyListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 109
    new-instance v0, Landroid/view/animation/RotateAnimation;

    move v5, v3

    move v6, v4

    .line 111
    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 109
    iput-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->animation:Landroid/view/animation/RotateAnimation;

    .line 112
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->animation:Landroid/view/animation/RotateAnimation;

    new-instance v5, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v5}, Landroid/view/animation/RotateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 113
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->animation:Landroid/view/animation/RotateAnimation;

    const-wide/16 v5, 0xfa

    invoke-virtual {v0, v5, v6}, Landroid/view/animation/RotateAnimation;->setDuration(J)V

    .line 114
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->animation:Landroid/view/animation/RotateAnimation;

    invoke-virtual {v0, v3}, Landroid/view/animation/RotateAnimation;->setFillAfter(Z)V

    .line 116
    new-instance v5, Landroid/view/animation/RotateAnimation;

    move v6, v2

    move v7, v1

    move v8, v3

    move v9, v4

    move v10, v3

    move v11, v4

    .line 118
    invoke-direct/range {v5 .. v11}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 116
    iput-object v5, p0, Lcom/webuid/mmVideo/ui/MyListView;->reverseAnimation:Landroid/view/animation/RotateAnimation;

    .line 119
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->reverseAnimation:Landroid/view/animation/RotateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/RotateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 120
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->reverseAnimation:Landroid/view/animation/RotateAnimation;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/RotateAnimation;->setDuration(J)V

    .line 121
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->reverseAnimation:Landroid/view/animation/RotateAnimation;

    invoke-virtual {v0, v3}, Landroid/view/animation/RotateAnimation;->setFillAfter(Z)V

    .line 123
    const/4 v0, 0x3

    iput v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 124
    iput-boolean v12, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRefreshable:Z

    .line 125
    return-void
.end method

.method private measureView(Landroid/view/View;)V
    .locals 7
    .parameter "child"

    .prologue
    const/4 v6, 0x0

    .line 347
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 348
    .local v3, p:Landroid/view/ViewGroup$LayoutParams;
    if-nez v3, :cond_0

    .line 349
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .end local v3           #p:Landroid/view/ViewGroup$LayoutParams;
    const/4 v4, -0x1

    .line 350
    const/4 v5, -0x2

    .line 349
    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 352
    .restart local v3       #p:Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v6, v6, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 353
    .local v1, childWidthSpec:I
    iget v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 355
    .local v2, lpHeight:I
    if-lez v2, :cond_1

    .line 357
    const/high16 v4, 0x4000

    .line 356
    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 362
    .local v0, childHeightSpec:I
    :goto_0
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 363
    return-void

    .line 359
    .end local v0           #childHeightSpec:I
    :cond_1
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .restart local v0       #childHeightSpec:I
    goto :goto_0
.end method

.method private onRefresh()V
    .locals 1

    .prologue
    .line 340
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->refreshListener:Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->refreshListener:Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;

    invoke-interface {v0}, Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;->onRefresh()V

    .line 343
    :cond_0
    return-void
.end method


# virtual methods
.method public onRefreshComplete()V
    .locals 3

    .prologue
    .line 334
    const/4 v0, 0x3

    iput v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 335
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u6700\u8fd1\u66f4\u65b0:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->toLocaleString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 337
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0
    .parameter "arg0"
    .parameter "firstVisiableItem"
    .parameter "arg2"
    .parameter "arg3"

    .prologue
    .line 129
    iput p2, p0, Lcom/webuid/mmVideo/ui/MyListView;->firstItemIndex:I

    .line 130
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 133
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "event"

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 137
    iget-boolean v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRefreshable:Z

    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 260
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 140
    :pswitch_0
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->firstItemIndex:I

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    if-nez v1, :cond_0

    .line 141
    iput-boolean v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    .line 142
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    .line 143
    const-string v1, "listview"

    const-string v2, "\u5728down\u65f6\u5019\u8bb0\u5f55\u5f53\u524d\u4f4d\u7f6e\u2018"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 149
    :pswitch_1
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-eq v1, v6, :cond_2

    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-eq v1, v7, :cond_2

    .line 153
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-ne v1, v3, :cond_1

    .line 154
    iput v5, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 155
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 157
    const-string v1, "listview"

    const-string v2, "\u7531\u4e0b\u62c9\u5237\u65b0\u72b6\u6001\uff0c\u5230done\u72b6\u6001"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_1
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-nez v1, :cond_2

    .line 160
    iput v6, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 161
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 162
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->onRefresh()V

    .line 164
    const-string v1, "listview"

    const-string v2, "\u7531\u677e\u5f00\u5237\u65b0\u72b6\u6001\uff0c\u5230done\u72b6\u6001"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_2
    iput-boolean v4, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    .line 169
    iput-boolean v4, p0, Lcom/webuid/mmVideo/ui/MyListView;->isBack:Z

    goto :goto_0

    .line 174
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v0, v1

    .line 176
    .local v0, tempY:I
    iget-boolean v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    if-nez v1, :cond_3

    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->firstItemIndex:I

    if-nez v1, :cond_3

    .line 177
    const-string v1, "listview"

    const-string v2, "\u5728move\u65f6\u5019\u8bb0\u5f55\u4e0b\u4f4d\u7f6e"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    iput-boolean v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    .line 179
    iput v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    .line 182
    :cond_3
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-eq v1, v6, :cond_0

    iget-boolean v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRecored:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-eq v1, v7, :cond_0

    .line 187
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-nez v1, :cond_4

    .line 189
    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/ui/MyListView;->setSelection(I)V

    .line 192
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    div-int/lit8 v1, v1, 0x3

    iget v2, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    if-ge v1, v2, :cond_8

    .line 193
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    if-lez v1, :cond_8

    .line 194
    iput v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 195
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 197
    const-string v1, "listview"

    const-string v2, "\u7531\u677e\u5f00\u5237\u65b0\u72b6\u6001\u8f6c\u53d8\u5230\u4e0b\u62c9\u5237\u65b0\u72b6\u6001"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    :cond_4
    :goto_1
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-ne v1, v3, :cond_5

    .line 214
    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/ui/MyListView;->setSelection(I)V

    .line 217
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    div-int/lit8 v1, v1, 0x3

    iget v2, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    if-lt v1, v2, :cond_9

    .line 218
    iput v4, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 219
    iput-boolean v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->isBack:Z

    .line 220
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 222
    const-string v1, "listview"

    const-string v2, "\u7531done\u6216\u8005\u4e0b\u62c9\u5237\u65b0\u72b6\u6001\u8f6c\u53d8\u5230\u677e\u5f00\u5237\u65b0"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    :cond_5
    :goto_2
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-ne v1, v5, :cond_6

    .line 235
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    if-lez v1, :cond_6

    .line 236
    iput v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 237
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 242
    :cond_6
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-ne v1, v3, :cond_7

    .line 243
    iget-object v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    mul-int/lit8 v2, v2, -0x1

    .line 244
    iget v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v3, v0, v3

    div-int/lit8 v3, v3, 0x3

    add-int/2addr v2, v3

    .line 243
    invoke-virtual {v1, v4, v2, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 249
    :cond_7
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    if-nez v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->headView:Landroid/widget/LinearLayout;

    iget v2, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v2, v0, v2

    div-int/lit8 v2, v2, 0x3

    .line 251
    iget v3, p0, Lcom/webuid/mmVideo/ui/MyListView;->headContentHeight:I

    sub-int/2addr v2, v3

    .line 250
    invoke-virtual {v1, v4, v2, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    goto/16 :goto_0

    .line 200
    :cond_8
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    if-gtz v1, :cond_4

    .line 201
    iput v5, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 202
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 204
    const-string v1, "listview"

    const-string v2, "\u7531\u677e\u5f00\u5237\u65b0\u72b6\u6001\u8f6c\u53d8\u5230done\u72b6\u6001"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 225
    :cond_9
    iget v1, p0, Lcom/webuid/mmVideo/ui/MyListView;->startY:I

    sub-int v1, v0, v1

    if-gtz v1, :cond_5

    .line 226
    iput v5, p0, Lcom/webuid/mmVideo/ui/MyListView;->state:I

    .line 227
    invoke-direct {p0}, Lcom/webuid/mmVideo/ui/MyListView;->changeHeaderViewByState()V

    .line 229
    const-string v1, "listview"

    const-string v2, "\u7531DOne\u6216\u8005\u4e0b\u62c9\u5237\u65b0\u72b6\u6001\u8f6c\u53d8\u5230done\u72b6\u6001"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setAdapter(Landroid/widget/BaseAdapter;)V
    .locals 3
    .parameter "adapter"

    .prologue
    .line 366
    iget-object v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->lastUpdatedTextView:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u6700\u8fd1\u66f4\u65b0:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->toLocaleString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 368
    return-void
.end method

.method public setonRefreshListener(Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;)V
    .locals 1
    .parameter "refreshListener"

    .prologue
    .line 325
    iput-object p1, p0, Lcom/webuid/mmVideo/ui/MyListView;->refreshListener:Lcom/webuid/mmVideo/ui/MyListView$OnRefreshListener;

    .line 326
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/ui/MyListView;->isRefreshable:Z

    .line 327
    return-void
.end method
