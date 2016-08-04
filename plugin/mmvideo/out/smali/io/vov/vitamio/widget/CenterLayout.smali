.class public Lio/vov/vitamio/widget/CenterLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/vov/vitamio/widget/CenterLayout$LayoutParams;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 23
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 96
    instance-of v0, p1, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;

    return v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 101
    new-instance v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;

    invoke-direct {v0, p1}, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .parameter
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 70
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getChildCount()I

    move-result v4

    .line 71
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getMeasuredWidth()I

    move-result v0

    iput v0, p0, Lio/vov/vitamio/widget/CenterLayout;->a:I

    .line 72
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lio/vov/vitamio/widget/CenterLayout;->b:I

    .line 73
    const-string v0, "onLayout: %dx%d, %d %d %d %d"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lio/vov/vitamio/widget/CenterLayout;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lio/vov/vitamio/widget/CenterLayout;->b:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    const/4 v0, 0x0

    move v3, v0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 92
    return-void

    .line 75
    :cond_0
    invoke-virtual {p0, v3}, Lio/vov/vitamio/widget/CenterLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 76
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    .line 77
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;

    .line 78
    iget v1, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->x:I

    add-int/lit8 v1, v1, 0x0

    .line 79
    iget v2, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->width:I

    if-lez v2, :cond_2

    .line 80
    iget v2, p0, Lio/vov/vitamio/widget/CenterLayout;->a:I

    iget v6, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->width:I

    sub-int/2addr v2, v6

    int-to-double v6, v2

    const-wide/high16 v8, 0x4000

    div-double/2addr v6, v8

    double-to-int v2, v6

    add-int/2addr v1, v2

    .line 83
    :goto_1
    iget v2, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->y:I

    add-int/lit8 v2, v2, 0x0

    .line 84
    iget v6, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->height:I

    if-lez v6, :cond_3

    .line 85
    iget v6, p0, Lio/vov/vitamio/widget/CenterLayout;->b:I

    iget v7, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->height:I

    sub-int/2addr v6, v7

    int-to-double v6, v6

    const-wide/high16 v8, 0x4000

    div-double/2addr v6, v8

    double-to-int v6, v6

    add-int/2addr v2, v6

    .line 88
    :goto_2
    const-string v6, "child[%s]: %dx%d:%dx%d, x:%d, y:%d"

    const/4 v7, 0x7

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    const/4 v8, 0x1

    iget v9, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    iget v0, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->height:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v8

    const/4 v0, 0x3

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    const/4 v0, 0x4

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    const/4 v0, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    const/4 v0, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    invoke-static {v6, v7}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr v0, v1

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    add-int/2addr v6, v2

    invoke-virtual {v5, v1, v2, v0, v6}, Landroid/view/View;->layout(IIII)V

    .line 74
    :cond_1
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_0

    .line 82
    :cond_2
    iget v2, p0, Lio/vov/vitamio/widget/CenterLayout;->a:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    sub-int/2addr v2, v6

    int-to-double v6, v2

    const-wide/high16 v8, 0x4000

    div-double/2addr v6, v8

    double-to-int v2, v6

    add-int/2addr v1, v2

    goto :goto_1

    .line 87
    :cond_3
    iget v6, p0, Lio/vov/vitamio/widget/CenterLayout;->b:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-double v6, v6

    const-wide/high16 v8, 0x4000

    div-double/2addr v6, v8

    double-to-int v6, v6

    add-int/2addr v2, v6

    goto :goto_2
.end method

.method protected onMeasure(II)V
    .locals 8
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getChildCount()I

    move-result v4

    .line 41
    invoke-virtual {p0, p1, p2}, Lio/vov/vitamio/widget/CenterLayout;->measureChildren(II)V

    move v3, v0

    move v1, v0

    move v2, v0

    .line 43
    :goto_0
    if-lt v3, v4, :cond_0

    .line 62
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 63
    invoke-virtual {p0}, Lio/vov/vitamio/widget/CenterLayout;->getSuggestedMinimumWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 65
    invoke-static {v1, p1}, Lio/vov/vitamio/widget/CenterLayout;->resolveSize(II)I

    move-result v1

    invoke-static {v0, p2}, Lio/vov/vitamio/widget/CenterLayout;->resolveSize(II)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lio/vov/vitamio/widget/CenterLayout;->setMeasuredDimension(II)V

    .line 66
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0, v3}, Lio/vov/vitamio/widget/CenterLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 45
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v6, 0x8

    if-eq v0, v6, :cond_1

    .line 49
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;

    .line 51
    iget v6, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->x:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v6, v7

    .line 52
    iget v0, v0, Lio/vov/vitamio/widget/CenterLayout$LayoutParams;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v0

    .line 54
    invoke-static {v1, v6}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 55
    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 43
    :goto_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    move v2, v1

    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v1

    move v1, v2

    goto :goto_1
.end method
