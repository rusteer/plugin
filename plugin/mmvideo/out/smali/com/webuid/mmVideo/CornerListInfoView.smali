.class public Lcom/webuid/mmVideo/CornerListInfoView;
.super Landroid/widget/ListView;
.source "CornerListInfoView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "ev"

    .prologue
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 53
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    return v3

    .line 28
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v1, v3

    .line 29
    .local v1, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v2, v3

    .line 30
    .local v2, y:I
    invoke-virtual {p0, v1, v2}, Lcom/webuid/mmVideo/CornerListInfoView;->pointToPosition(II)I

    move-result v0

    .line 32
    .local v0, itemnum:I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 35
    if-nez v0, :cond_2

    .line 36
    invoke-virtual {p0}, Lcom/webuid/mmVideo/CornerListInfoView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v0, v3, :cond_1

    .line 37
    const v3, 0x7f030016

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/CornerListInfoView;->setSelector(I)V

    goto :goto_0

    .line 39
    :cond_1
    const v3, 0x7f030018

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/CornerListInfoView;->setSelector(I)V

    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {p0}, Lcom/webuid/mmVideo/CornerListInfoView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v0, v3, :cond_3

    .line 42
    const v3, 0x7f030017

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/CornerListInfoView;->setSelector(I)V

    goto :goto_0

    .line 44
    :cond_3
    const v3, 0x7f030019

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/CornerListInfoView;->setSelector(I)V

    goto :goto_0

    .line 26
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onMeasure(II)V
    .locals 3
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 59
    const v1, 0x1fffffff

    .line 60
    const/high16 v2, -0x8000

    .line 59
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 61
    .local v0, expandSpec:I
    invoke-super {p0, p1, v0}, Landroid/widget/ListView;->onMeasure(II)V

    .line 62
    return-void
.end method
