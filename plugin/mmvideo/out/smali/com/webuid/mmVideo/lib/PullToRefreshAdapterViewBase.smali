.class public abstract Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;
.super Lcom/webuid/mmVideo/lib/PullToRefreshBase;
.source "PullToRefreshAdapterViewBase.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/widget/AbsListView;",
        ">",
        "Lcom/webuid/mmVideo/lib/PullToRefreshBase",
        "<TT;>;",
        "Landroid/widget/AbsListView$OnScrollListener;"
    }
.end annotation


# instance fields
.field private emptyView:Landroid/view/View;

.field private lastSavedFirstVisibleItem:I

.field private mTopImageView:Landroid/widget/ImageView;

.field private onLastItemVisibleListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;

.field private onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private refreshableViewHolder:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 31
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;-><init>(Landroid/content/Context;)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->lastSavedFirstVisibleItem:I

    .line 32
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v0, Landroid/widget/AbsListView;

    invoke-virtual {v0, p0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "mode"

    .prologue
    .line 36
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;-><init>(Landroid/content/Context;I)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->lastSavedFirstVisibleItem:I

    .line 37
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v0, Landroid/widget/AbsListView;

    invoke-virtual {v0, p0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 41
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->lastSavedFirstVisibleItem:I

    .line 42
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v0, Landroid/widget/AbsListView;

    invoke-virtual {v0, p0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 43
    return-void
.end method

.method private isFirstItemVisible()Z
    .locals 5

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 147
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getCount()I

    move-result v1

    if-nez v1, :cond_0

    move v1, v2

    .line 158
    :goto_0
    return v1

    .line 149
    :cond_0
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v1

    if-nez v1, :cond_2

    .line 151
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1, v3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 153
    .local v0, firstVisibleChild:Landroid/view/View;
    if-eqz v0, :cond_2

    .line 154
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v4

    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getTop()I

    move-result v1

    if-lt v4, v1, :cond_1

    move v1, v2

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_0

    .end local v0           #firstVisibleChild:Landroid/view/View;
    :cond_2
    move v1, v3

    .line 158
    goto :goto_0
.end method

.method private isLastItemVisible()Z
    .locals 8

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 162
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/AbsListView;

    invoke-virtual {v4}, Landroid/widget/AbsListView;->getCount()I

    move-result v1

    .line 163
    .local v1, count:I
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/AbsListView;

    invoke-virtual {v4}, Landroid/widget/AbsListView;->getLastVisiblePosition()I

    move-result v3

    .line 165
    .local v3, lastVisiblePosition:I
    if-nez v1, :cond_0

    move v4, v5

    .line 176
    :goto_0
    return v4

    .line 167
    :cond_0
    add-int/lit8 v4, v1, -0x1

    if-ne v3, v4, :cond_2

    .line 169
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/AbsListView;

    invoke-virtual {v4}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v4

    sub-int v0, v3, v4

    .line 170
    .local v0, childIndex:I
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/AbsListView;

    invoke-virtual {v4, v0}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 172
    .local v2, lastVisibleChild:Landroid/view/View;
    if-eqz v2, :cond_2

    .line 173
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v7

    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/AbsListView;

    invoke-virtual {v4}, Landroid/widget/AbsListView;->getBottom()I

    move-result v4

    if-gt v7, v4, :cond_1

    move v4, v5

    goto :goto_0

    :cond_1
    move v4, v6

    goto :goto_0

    .end local v0           #childIndex:I
    .end local v2           #lastVisibleChild:Landroid/view/View;
    :cond_2
    move v4, v6

    .line 176
    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic addRefreshableView(Landroid/content/Context;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p2, Landroid/widget/AbsListView;

    invoke-virtual {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->addRefreshableView(Landroid/content/Context;Landroid/widget/AbsListView;)V

    return-void
.end method

.method protected addRefreshableView(Landroid/content/Context;Landroid/widget/AbsListView;)V
    .locals 5
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
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    .local p2, refreshableView:Landroid/widget/AbsListView;,"TT;"
    const/4 v4, -0x1

    .line 132
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableViewHolder:Landroid/widget/FrameLayout;

    .line 133
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p2, v4, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 135
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableViewHolder:Landroid/widget/FrameLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v0, v1}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    return-void
.end method

.method public abstract getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
.end method

.method protected isReadyForPullDown()Z
    .locals 1

    .prologue
    .line 139
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->isFirstItemVisible()Z

    move-result v0

    return v0
.end method

.method protected isReadyForPullUp()Z
    .locals 1

    .prologue
    .line 143
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    invoke-direct {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->isLastItemVisible()Z

    move-result v0

    return v0
.end method

.method public final onScroll(Landroid/widget/AbsListView;III)V
    .locals 1
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    .line 50
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onLastItemVisibleListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;

    if-eqz v0, :cond_0

    .line 52
    if-lez p3, :cond_0

    add-int v0, p2, p3

    if-ne v0, p4, :cond_0

    .line 54
    iget v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->lastSavedFirstVisibleItem:I

    if-eq p2, v0, :cond_0

    .line 55
    iput p2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->lastSavedFirstVisibleItem:I

    .line 56
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onLastItemVisibleListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;

    invoke-interface {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;->onLastItemVisible()V

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_1

    .line 62
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 64
    :cond_1
    return-void
.end method

.method public final onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 67
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 70
    :cond_0
    return-void
.end method

.method public setBackToTopView(Landroid/widget/ImageView;)V
    .locals 1
    .parameter "mTopImageView"

    .prologue
    .line 73
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->mTopImageView:Landroid/widget/ImageView;

    .line 74
    new-instance v0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase$1;-><init>(Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    return-void
.end method

.method public final setEmptyView(Landroid/view/View;)V
    .locals 4
    .parameter "newEmptyView"

    .prologue
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    const/4 v3, -0x1

    .line 102
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->emptyView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableViewHolder:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->emptyView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 106
    :cond_0
    if-eqz p1, :cond_2

    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 108
    .local v0, newEmptyViewParent:Landroid/view/ViewParent;
    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    .line 109
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0           #newEmptyViewParent:Landroid/view/ViewParent;
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 112
    :cond_1
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableViewHolder:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p1, v3, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 116
    :cond_2
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    instance-of v1, v1, Lcom/webuid/mmVideo/lib/internal/EmptyViewMethodAccessor;

    if-eqz v1, :cond_3

    .line 117
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Lcom/webuid/mmVideo/lib/internal/EmptyViewMethodAccessor;

    invoke-interface {v1, p1}, Lcom/webuid/mmVideo/lib/internal/EmptyViewMethodAccessor;->setEmptyViewInternal(Landroid/view/View;)V

    .line 121
    :goto_0
    return-void

    .line 119
    :cond_3
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->refreshableView:Landroid/view/View;

    check-cast v1, Landroid/widget/AbsListView;

    invoke-virtual {v1, p1}, Landroid/widget/AbsListView;->setEmptyView(Landroid/view/View;)V

    goto :goto_0
.end method

.method public final setOnLastItemVisibleListener(Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;)V
    .locals 0
    .parameter

    .prologue
    .line 124
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    .local p1, listener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;,"Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;"
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onLastItemVisibleListener:Lcom/webuid/mmVideo/lib/PullToRefreshBase$OnLastItemVisibleListener;

    .line 125
    return-void
.end method

.method public final setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 128
    .local p0, this:Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;,"Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase<TT;>;"
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->onScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 129
    return-void
.end method
