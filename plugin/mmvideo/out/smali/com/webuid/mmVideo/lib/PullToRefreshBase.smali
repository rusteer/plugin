.class public abstract Lcom/webuid/mmVideo/lib/PullToRefreshBase;
.super Landroid/widget/LinearLayout;
.source "PullToRefreshBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;,
        Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;,
        Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Landroid/widget/LinearLayout;"
    }
.end annotation


# static fields
.field static final FRICTION:F = 2.0f

.field static final MANUAL_REFRESHING:I = 0x3

.field public static final MODE_BOTH:I = 0x3

.field public static final MODE_PULL_DOWN_TO_REFRESH:I = 0x1

.field public static final MODE_PULL_UP_TO_REFRESH:I = 0x2

.field static final PULL_TO_REFRESH:I = 0x0

.field static final REFRESHING:I = 0x2

.field static final RELEASE_TO_REFRESH:I = 0x1


# instance fields
.field private currentMode:I

.field private currentSmoothScrollRunnable:Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/webuid/mmVideo/lib/PullToRefreshBase",
            "<TT;>.SmoothScrollRunnable;"
        }
    .end annotation
.end field

.field private disableScrollingWhileRefreshing:Z

.field private footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

.field private final handler:Landroid/os/Handler;

.field private headerHeight:I

.field private headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

.field private initialMotionY:F

.field private isBeingDragged:Z

.field private isPullToRefreshEnabled:Z

.field private lastMotionX:F

.field private lastMotionY:F

.field private mode:I

.field private onRefreshListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;

.field refreshableView:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private state:I

.field private touchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 130
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 104
    iput-boolean v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 106
    iput v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 107
    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    .line 110
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    .line 113
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    .line 119
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->handler:Landroid/os/Handler;

    .line 131
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .parameter "context"
    .parameter "mode"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 135
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 104
    iput-boolean v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 106
    iput v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 107
    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    .line 110
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    .line 113
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    .line 119
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->handler:Landroid/os/Handler;

    .line 136
    iput p2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    .line 137
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 141
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 104
    iput-boolean v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 106
    iput v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 107
    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    .line 110
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    .line 113
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    .line 119
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->handler:Landroid/os/Handler;

    .line 142
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 143
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 539
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setOrientation(I)V

    .line 541
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->touchSlop:I

    .line 544
    sget-object v0, Lcom/webuid/mmVideo/R$styleable;->PullToRefresh:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    .line 545
    .local v6, a:Landroid/content/res/TypedArray;
    const/4 v0, 0x3

    invoke-virtual {v6, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 546
    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    .line 551
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->refreshableView:Landroid/view/View;

    .line 552
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->refreshableView:Landroid/view/View;

    invoke-virtual {p0, p1, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->addRefreshableView(Landroid/content/Context;Landroid/view/View;)V

    .line 555
    const/high16 v0, 0x7f09

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 556
    .local v4, pullLabel:Ljava/lang/String;
    const v0, 0x7f090002

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 557
    .local v5, refreshingLabel:Ljava/lang/String;
    const v0, 0x7f090001

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 560
    .local v3, releaseLabel:Ljava/lang/String;
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 561
    :cond_1
    new-instance v0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    const/4 v2, 0x1

    move-object v1, p1

    .line 562
    invoke-direct/range {v0 .. v5}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 561
    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 563
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    const/4 v1, 0x0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    .line 564
    const/4 v9, -0x2

    invoke-direct {v2, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 563
    invoke-virtual {p0, v0, v1, v2}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 565
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->measureView(Landroid/view/View;)V

    .line 566
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    .line 568
    :cond_2
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    .line 569
    :cond_3
    new-instance v0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    const/4 v2, 0x2

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 570
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    .line 571
    const/4 v8, -0x2

    invoke-direct {v1, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 570
    invoke-virtual {p0, v0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 572
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->measureView(Landroid/view/View;)V

    .line 573
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    .line 578
    :cond_4
    const/4 v0, 0x2

    const/4 v1, -0x1

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v7

    .line 579
    .local v7, color:I
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_5

    .line 580
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, v7}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setTextColor(I)V

    .line 582
    :cond_5
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_6

    .line 583
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, v7}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setTextColor(I)V

    .line 586
    :cond_6
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 587
    const/4 v0, 0x1

    const/4 v1, -0x1

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setBackgroundResource(I)V

    .line 589
    :cond_7
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 590
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->refreshableView:Landroid/view/View;

    const/4 v1, 0x0

    .line 591
    const/4 v2, -0x1

    .line 590
    invoke-virtual {v6, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 593
    :cond_8
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 596
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    packed-switch v0, :pswitch_data_0

    .line 605
    const/4 v0, 0x0

    iget v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    neg-int v1, v1

    const/4 v2, 0x0

    const/4 v8, 0x0

    invoke-virtual {p0, v0, v1, v2, v8}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setPadding(IIII)V

    .line 611
    :goto_0
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_9

    .line 612
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    .line 614
    :cond_9
    return-void

    .line 598
    :pswitch_0
    const/4 v0, 0x0

    iget v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    neg-int v1, v1

    const/4 v2, 0x0

    iget v8, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    neg-int v8, v8

    invoke-virtual {p0, v0, v1, v2, v8}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setPadding(IIII)V

    goto :goto_0

    .line 601
    :pswitch_1
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v8, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    neg-int v8, v8

    invoke-virtual {p0, v0, v1, v2, v8}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setPadding(IIII)V

    goto :goto_0

    .line 596
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isReadyForPull()Z
    .locals 2

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x0

    .line 693
    iget v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    packed-switch v1, :pswitch_data_0

    .line 701
    :cond_0
    :goto_0
    return v0

    .line 695
    :pswitch_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullDown()Z

    move-result v0

    goto :goto_0

    .line 697
    :pswitch_1
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullUp()Z

    move-result v0

    goto :goto_0

    .line 699
    :pswitch_2
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullUp()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullDown()Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 693
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private measureView(Landroid/view/View;)V
    .locals 7
    .parameter "child"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v6, 0x0

    .line 617
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 618
    .local v3, p:Landroid/view/ViewGroup$LayoutParams;
    if-nez v3, :cond_0

    .line 619
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    .end local v3           #p:Landroid/view/ViewGroup$LayoutParams;
    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 622
    .restart local v3       #p:Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v6, v6, v4}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 623
    .local v1, childWidthSpec:I
    iget v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 625
    .local v2, lpHeight:I
    if-lez v2, :cond_1

    .line 626
    const/high16 v4, 0x4000

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 630
    .local v0, childHeightSpec:I
    :goto_0
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 631
    return-void

    .line 628
    .end local v0           #childHeightSpec:I
    :cond_1
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .restart local v0       #childHeightSpec:I
    goto :goto_0
.end method

.method private pullEvent()Z
    .locals 8

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v3, 0x0

    const/high16 v7, 0x4000

    const/4 v6, 0x0

    const/4 v2, 0x1

    .line 642
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->getScrollY()I

    move-result v1

    .line 644
    .local v1, oldHeight:I
    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    packed-switch v4, :pswitch_data_0

    .line 651
    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->initialMotionY:F

    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    sub-float/2addr v4, v5

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    div-float/2addr v4, v7

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 656
    .local v0, newHeight:I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setHeaderScroll(I)V

    .line 658
    if-eqz v0, :cond_2

    .line 659
    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    if-nez v4, :cond_1

    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 660
    iput v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 662
    iget v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    packed-switch v3, :pswitch_data_1

    .line 689
    :cond_0
    :goto_1
    return v2

    .line 646
    .end local v0           #newHeight:I
    :pswitch_0
    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->initialMotionY:F

    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    sub-float/2addr v4, v5

    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    div-float/2addr v4, v7

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 648
    .restart local v0       #newHeight:I
    goto :goto_0

    .line 664
    :pswitch_1
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->releaseToRefresh()V

    goto :goto_1

    .line 667
    :pswitch_2
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->releaseToRefresh()V

    goto :goto_1

    .line 673
    :cond_1
    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    if-ne v4, v2, :cond_2

    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 674
    iput v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 676
    iget v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    packed-switch v3, :pswitch_data_2

    goto :goto_1

    .line 681
    :pswitch_3
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullToRefresh()V

    goto :goto_1

    .line 678
    :pswitch_4
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullToRefresh()V

    goto :goto_1

    .line 689
    :cond_2
    if-ne v1, v0, :cond_0

    move v2, v3

    goto :goto_1

    .line 644
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch

    .line 662
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 676
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method protected addRefreshableView(Landroid/content/Context;Landroid/view/View;)V
    .locals 4
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 428
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    .local p2, refreshableView:Landroid/view/View;,"TT;"
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, p2, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 429
    return-void
.end method

.method protected abstract createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            ")TT;"
        }
    .end annotation
.end method

.method public final getAdapterView()Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->refreshableView:Landroid/view/View;

    return-object v0
.end method

.method public getCurrentMode()I
    .locals 1

    .prologue
    .line 452
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    return v0
.end method

.method protected final getFooterLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    .locals 1

    .prologue
    .line 456
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    return-object v0
.end method

.method protected final getHeaderHeight()I
    .locals 1

    .prologue
    .line 464
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    return v0
.end method

.method protected final getHeaderLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    .locals 1

    .prologue
    .line 460
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    return-object v0
.end method

.method protected final getMode()I
    .locals 1

    .prologue
    .line 468
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    return v0
.end method

.method public final getRefreshableView()Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->refreshableView:Landroid/view/View;

    return-object v0
.end method

.method public final hasPullFromTop()Z
    .locals 2

    .prologue
    .line 303
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isDisableScrollingWhileRefreshing()Z
    .locals 1

    .prologue
    .line 185
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    return v0
.end method

.method public final isPullToRefreshEnabled()Z
    .locals 1

    .prologue
    .line 175
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    return v0
.end method

.method protected abstract isReadyForPullDown()Z
.end method

.method protected abstract isReadyForPullUp()Z
.end method

.method public final isRefreshing()Z
    .locals 2

    .prologue
    .line 194
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .parameter "event"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v10, 0x2

    const v9, 0x38d1b717

    const/4 v5, 0x0

    const/4 v8, 0x3

    const/4 v6, 0x1

    .line 366
    iget-boolean v7, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    if-nez v7, :cond_0

    .line 424
    :goto_0
    return v5

    .line 370
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isRefreshing()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-boolean v7, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    if-eqz v7, :cond_1

    move v5, v6

    .line 371
    goto :goto_0

    .line 374
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 376
    .local v0, action:I
    if-eq v0, v8, :cond_2

    if-ne v0, v6, :cond_3

    .line 377
    :cond_2
    iput-boolean v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    goto :goto_0

    .line 381
    :cond_3
    if-eqz v0, :cond_4

    iget-boolean v7, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    if-eqz v7, :cond_4

    move v5, v6

    .line 382
    goto :goto_0

    .line 385
    :cond_4
    packed-switch v0, :pswitch_data_0

    .line 424
    :cond_5
    :goto_1
    :pswitch_0
    iget-boolean v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    goto :goto_0

    .line 387
    :pswitch_1
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPull()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 389
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 390
    .local v3, y:F
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    sub-float v1, v3, v5

    .line 391
    .local v1, dy:F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 392
    .local v4, yDiff:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget v7, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionX:F

    sub-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 394
    .local v2, xDiff:F
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->touchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v4, v5

    if-lez v5, :cond_5

    cmpl-float v5, v4, v2

    if-lez v5, :cond_5

    .line 395
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-eq v5, v6, :cond_6

    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-ne v5, v8, :cond_7

    :cond_6
    cmpl-float v5, v1, v9

    if-ltz v5, :cond_7

    .line 396
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullDown()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 397
    iput v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    .line 398
    iput-boolean v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 399
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-ne v5, v8, :cond_5

    .line 400
    iput v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    goto :goto_1

    .line 402
    :cond_7
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-eq v5, v10, :cond_8

    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-ne v5, v8, :cond_5

    :cond_8
    cmpg-float v5, v1, v9

    if-gtz v5, :cond_5

    .line 403
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPullUp()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 404
    iput v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    .line 405
    iput-boolean v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 406
    iget v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->mode:I

    if-ne v5, v8, :cond_5

    .line 407
    iput v10, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    goto :goto_1

    .line 415
    .end local v1           #dy:F
    .end local v2           #xDiff:F
    .end local v3           #y:F
    .end local v4           #yDiff:F
    :pswitch_2
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPull()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 416
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    iput v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->initialMotionY:F

    iput v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    .line 417
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iput v6, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionX:F

    .line 418
    iput-boolean v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    goto :goto_1

    .line 385
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final onRefreshComplete()V
    .locals 1

    .prologue
    .line 213
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    if-eqz v0, :cond_0

    .line 214
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->resetHeader()V

    .line 216
    :cond_0
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 312
    iget-boolean v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    if-nez v2, :cond_1

    .line 360
    :cond_0
    :goto_0
    return v0

    .line 316
    :cond_1
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isRefreshing()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    if-eqz v2, :cond_2

    move v0, v1

    .line 317
    goto :goto_0

    .line 320
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v2

    if-nez v2, :cond_0

    .line 324
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 336
    :pswitch_0
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isReadyForPull()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 337
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->initialMotionY:F

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    move v0, v1

    .line 338
    goto :goto_0

    .line 327
    :pswitch_1
    iget-boolean v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    if-eqz v2, :cond_0

    .line 328
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->lastMotionY:F

    .line 329
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->pullEvent()Z

    move v0, v1

    .line 330
    goto :goto_0

    .line 345
    :pswitch_2
    iget-boolean v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    if-eqz v2, :cond_0

    .line 346
    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 348
    iget v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    if-ne v2, v1, :cond_4

    iget-object v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->onRefreshListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;

    if-eqz v2, :cond_4

    .line 349
    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setRefreshingInternal(Z)V

    .line 350
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->onRefreshListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;

    invoke-interface {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;->onRefresh()V

    :goto_1
    move v0, v1

    .line 354
    goto :goto_0

    .line 352
    :cond_4
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->smoothScrollTo(I)V

    goto :goto_1

    .line 324
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected resetHeader()V
    .locals 2

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v1, 0x0

    .line 494
    iput v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 495
    iput-boolean v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isBeingDragged:Z

    .line 497
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 498
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->reset()V

    .line 500
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 501
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->reset()V

    .line 504
    :cond_1
    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->smoothScrollTo(I)V

    .line 505
    return-void
.end method

.method public final setDisableScrollingWhileRefreshing(Z)V
    .locals 0
    .parameter "disableScrollingWhileRefreshing"

    .prologue
    .line 205
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iput-boolean p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->disableScrollingWhileRefreshing:Z

    .line 206
    return-void
.end method

.method protected final setHeaderScroll(I)V
    .locals 1
    .parameter "y"

    .prologue
    .line 523
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->scrollTo(II)V

    .line 524
    return-void
.end method

.method public setLongClickable(Z)V
    .locals 1
    .parameter "longClickable"

    .prologue
    .line 722
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setLongClickable(Z)V

    .line 723
    return-void
.end method

.method public final setOnRefreshListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;)V
    .locals 0
    .parameter

    .prologue
    .line 225
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    .local p1, listener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;"
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->onRefreshListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnRefreshListener;

    .line 226
    return-void
.end method

.method public setPullLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "pullLabel"

    .prologue
    .line 261
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setPullLabel(Ljava/lang/String;)V

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 265
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setPullLabel(Ljava/lang/String;)V

    .line 267
    :cond_1
    return-void
.end method

.method public final setPullToRefreshEnabled(Z)V
    .locals 0
    .parameter "enable"

    .prologue
    .line 235
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iput-boolean p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isPullToRefreshEnabled:Z

    .line 236
    return-void
.end method

.method public final setRefreshing()V
    .locals 1

    .prologue
    .line 285
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setRefreshing(Z)V

    .line 286
    return-void
.end method

.method public final setRefreshing(Z)V
    .locals 1
    .parameter "doScroll"

    .prologue
    .line 296
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->isRefreshing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 297
    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setRefreshingInternal(Z)V

    .line 298
    const/4 v0, 0x3

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 300
    :cond_0
    return-void
.end method

.method protected setRefreshingInternal(Z)V
    .locals 2
    .parameter "doScroll"

    .prologue
    .line 508
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    const/4 v0, 0x2

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->state:I

    .line 510
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 511
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshing()V

    .line 513
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 514
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshing()V

    .line 517
    :cond_1
    if-eqz p1, :cond_2

    .line 518
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    neg-int v0, v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->smoothScrollTo(I)V

    .line 520
    :cond_2
    return-void

    .line 518
    :cond_3
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerHeight:I

    goto :goto_0
.end method

.method public setRefreshingLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "refreshingLabel"

    .prologue
    .line 276
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setRefreshingLabel(Ljava/lang/String;)V

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setRefreshingLabel(Ljava/lang/String;)V

    .line 282
    :cond_1
    return-void
.end method

.method public setReleaseLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "releaseLabel"

    .prologue
    .line 246
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->headerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setReleaseLabel(Ljava/lang/String;)V

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 250
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->footerLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setReleaseLabel(Ljava/lang/String;)V

    .line 252
    :cond_1
    return-void
.end method

.method protected final smoothScrollTo(I)V
    .locals 3
    .parameter "y"

    .prologue
    .line 527
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentSmoothScrollRunnable:Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;

    if-eqz v0, :cond_0

    .line 528
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentSmoothScrollRunnable:Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->stop()V

    .line 531
    :cond_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->getScrollY()I

    move-result v0

    if-eq v0, p1, :cond_1

    .line 532
    new-instance v0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->handler:Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->getScrollY()I

    move-result v2

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;-><init>(Lcom/webuid/mmVideo/lib/PullToRefreshBase;Landroid/os/Handler;II)V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentSmoothScrollRunnable:Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;

    .line 533
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->currentSmoothScrollRunnable:Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 535
    :cond_1
    return-void
.end method
