.class final Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;
.super Ljava/lang/Object;
.source "PullToRefreshBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/lib/PullToRefreshBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SmoothScrollRunnable"
.end annotation


# static fields
.field static final ANIMATION_DURATION_MS:I = 0xbe

.field static final ANIMATION_FPS:I = 0x10


# instance fields
.field private continueRunning:Z

.field private currentY:I

.field private final handler:Landroid/os/Handler;

.field private final interpolator:Landroid/view/animation/Interpolator;

.field private final scrollFromY:I

.field private final scrollToY:I

.field private startTime:J

.field final synthetic this$0:Lcom/webuid/mmVideo/lib/PullToRefreshBase;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/lib/PullToRefreshBase;Landroid/os/Handler;II)V
    .locals 2
    .parameter
    .parameter "handler"
    .parameter "fromY"
    .parameter "toY"

    .prologue
    .line 36
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/webuid/mmVideo/lib/PullToRefreshBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->continueRunning:Z

    .line 33
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->startTime:J

    .line 34
    const/4 v0, -0x1

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->currentY:I

    .line 37
    iput-object p2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->handler:Landroid/os/Handler;

    .line 38
    iput p3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollFromY:I

    .line 39
    iput p4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollToY:I

    .line 40
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->interpolator:Landroid/view/animation/Interpolator;

    .line 41
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const-wide/16 v7, 0x3e8

    .line 50
    iget-wide v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->startTime:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->startTime:J

    .line 69
    :goto_0
    iget-boolean v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->continueRunning:Z

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollToY:I

    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->currentY:I

    if-eq v3, v4, :cond_0

    .line 70
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->handler:Landroid/os/Handler;

    const-wide/16 v4, 0x10

    invoke-virtual {v3, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 72
    :cond_0
    return-void

    .line 59
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->startTime:J

    sub-long/2addr v3, v5

    mul-long/2addr v3, v7

    const-wide/16 v5, 0xbe

    div-long v1, v3, v5

    .line 60
    .local v1, normalizedTime:J
    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 62
    iget v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollFromY:I

    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollToY:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    .line 63
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->interpolator:Landroid/view/animation/Interpolator;

    long-to-float v5, v1

    const/high16 v6, 0x447a

    div-float/2addr v5, v6

    invoke-interface {v4, v5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    .line 62
    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 64
    .local v0, deltaY:I
    iget v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->scrollFromY:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->currentY:I

    .line 65
    iget-object v3, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/webuid/mmVideo/lib/PullToRefreshBase;

    iget v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->currentY:I

    invoke-virtual {v3, v4}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;->setHeaderScroll(I)V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->continueRunning:Z

    .line 76
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshBase$SmoothScrollRunnable;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 77
    return-void
.end method
