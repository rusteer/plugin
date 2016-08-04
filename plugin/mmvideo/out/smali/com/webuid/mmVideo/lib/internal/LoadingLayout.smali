.class public Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
.super Landroid/widget/FrameLayout;
.source "LoadingLayout.java"


# static fields
.field static final DEFAULT_ROTATION_ANIMATION_DURATION:I = 0x96


# instance fields
.field private final headerImage:Landroid/widget/ImageView;

.field private final headerProgress:Landroid/widget/ProgressBar;

.field private final headerText:Landroid/widget/TextView;

.field private pullLabel:Ljava/lang/String;

.field private refreshingLabel:Ljava/lang/String;

.field private releaseLabel:Ljava/lang/String;

.field private final resetRotateAnimation:Landroid/view/animation/Animation;

.field private final rotateAnimation:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "context"
    .parameter "mode"
    .parameter "releaseLabel"
    .parameter "pullLabel"
    .parameter "refreshingLabel"

    .prologue
    .line 34
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 35
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030024

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    .line 36
    .local v7, header:Landroid/view/ViewGroup;
    const v0, 0x7f060057

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    .line 37
    const v0, 0x7f060059

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    .line 38
    const v0, 0x7f060058

    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerProgress:Landroid/widget/ProgressBar;

    .line 40
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .local v8, interpolator:Landroid/view/animation/Interpolator;
    new-instance v0, Landroid/view/animation/RotateAnimation;

    const/4 v1, 0x0

    const/high16 v2, -0x3ccc

    const/4 v3, 0x1

    const/high16 v4, 0x3f00

    const/4 v5, 0x1

    .line 42
    const/high16 v6, 0x3f00

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 41
    iput-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->rotateAnimation:Landroid/view/animation/Animation;

    .line 43
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->rotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v8}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 44
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->rotateAnimation:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 45
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->rotateAnimation:Landroid/view/animation/Animation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 47
    new-instance v0, Landroid/view/animation/RotateAnimation;

    const/high16 v1, -0x3ccc

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, 0x3f00

    .line 48
    const/4 v5, 0x1

    const/high16 v6, 0x3f00

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 47
    iput-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->resetRotateAnimation:Landroid/view/animation/Animation;

    .line 49
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->resetRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v8}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 50
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->resetRotateAnimation:Landroid/view/animation/Animation;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 51
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->resetRotateAnimation:Landroid/view/animation/Animation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 53
    iput-object p3, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->releaseLabel:Ljava/lang/String;

    .line 54
    iput-object p4, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullLabel:Ljava/lang/String;

    .line 55
    iput-object p5, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshingLabel:Ljava/lang/String;

    .line 57
    packed-switch p2, :pswitch_data_0

    .line 63
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    const v1, 0x7f020046

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 66
    :goto_0
    return-void

    .line 59
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    const v1, 0x7f020047

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 57
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public pullToRefresh()V
    .locals 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 102
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->resetRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 103
    return-void
.end method

.method public refreshing()V
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshingLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 87
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 88
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 89
    return-void
.end method

.method public releaseToRefresh()V
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->releaseLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 77
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->rotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 78
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 71
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 72
    return-void
.end method

.method public setPullLabel(Ljava/lang/String;)V
    .locals 0
    .parameter "pullLabel"

    .prologue
    .line 81
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->pullLabel:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setRefreshingLabel(Ljava/lang/String;)V
    .locals 0
    .parameter "refreshingLabel"

    .prologue
    .line 92
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshingLabel:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setReleaseLabel(Ljava/lang/String;)V
    .locals 0
    .parameter "releaseLabel"

    .prologue
    .line 96
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->releaseLabel:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 106
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->headerText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    return-void
.end method
