.class public Lcom/webuid/mmVideo/lib/PullToRefreshListView;
.super Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;
.source "PullToRefreshListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase",
        "<",
        "Landroid/widget/ListView;",
        ">;"
    }
.end annotation


# instance fields
.field private footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

.field private headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;-><init>(Landroid/content/Context;)V

    .line 41
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setDisableScrollingWhileRefreshing(Z)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "mode"

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;-><init>(Landroid/content/Context;I)V

    .line 46
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setDisableScrollingWhileRefreshing(Z)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setDisableScrollingWhileRefreshing(Z)V

    .line 52
    return-void
.end method


# virtual methods
.method protected bridge synthetic createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/ListView;

    move-result-object v0

    return-object v0
.end method

.method protected final createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/widget/ListView;
    .locals 13
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v2, 0x1

    const/4 v10, -0x1

    const/4 v9, -0x2

    .line 96
    new-instance v7, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;

    invoke-direct {v7, p0, p1, p2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;-><init>(Lcom/webuid/mmVideo/lib/PullToRefreshListView;Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 97
    .local v7, lv:Landroid/widget/ListView;
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getMode()I

    move-result v8

    .line 100
    .local v8, mode:I
    const-string v4, "11"

    .line 101
    .local v4, pullLabel:Ljava/lang/String;
    const-string v5, "\u6b63\u5728\u52a0\u8f7d\u4e2d"

    .line 102
    .local v5, refreshingLabel:Ljava/lang/String;
    const-string v3, "333"

    .line 105
    .local v3, releaseLabel:Ljava/lang/String;
    if-eq v8, v2, :cond_0

    if-ne v8, v12, :cond_1

    .line 106
    :cond_0
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 107
    .local v6, frame:Landroid/widget/FrameLayout;
    new-instance v0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-object v1, p1

    .line 108
    invoke-direct/range {v0 .. v5}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 109
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v6, v0, v10, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 111
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 112
    invoke-virtual {v7, v6}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 114
    .end local v6           #frame:Landroid/widget/FrameLayout;
    :cond_1
    if-eq v8, v11, :cond_2

    if-ne v8, v12, :cond_3

    .line 115
    :cond_2
    new-instance v6, Landroid/widget/FrameLayout;

    invoke-direct {v6, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 116
    .restart local v6       #frame:Landroid/widget/FrameLayout;
    new-instance v0, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-object v1, p1

    move v2, v11

    .line 117
    invoke-direct/range {v0 .. v5}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iput-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 118
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v6, v0, v10, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 120
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 121
    invoke-virtual {v7, v6}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 125
    .end local v6           #frame:Landroid/widget/FrameLayout;
    :cond_3
    const v0, 0x102000a

    invoke-virtual {v7, v0}, Landroid/widget/ListView;->setId(I)V

    .line 126
    return-object v7
.end method

.method public getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;->getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    return-object v0
.end method

.method protected resetHeader()V
    .locals 5

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getHeaderHeight()I

    move-result v3

    .line 184
    .local v3, scrollToHeight:I
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getCurrentMode()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 192
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getHeaderLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-result-object v2

    .line 193
    .local v2, originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 194
    .local v1, listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    mul-int/lit8 v3, v3, -0x1

    .line 195
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->isReadyForPullDown()Z

    move-result v0

    .line 200
    .local v0, doScroll:Z
    :goto_0
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 204
    if-eqz v0, :cond_0

    .line 205
    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setHeaderScroll(I)V

    .line 209
    :cond_0
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 211
    invoke-super {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->resetHeader()V

    .line 212
    return-void

    .line 186
    .end local v0           #doScroll:Z
    .end local v1           #listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    .end local v2           #originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    :pswitch_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getFooterLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-result-object v2

    .line 187
    .restart local v2       #originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    iget-object v1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 188
    .restart local v1       #listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->isReadyForPullUp()Z

    move-result v0

    .line 189
    .restart local v0       #doScroll:Z
    goto :goto_0

    .line 184
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public setPullLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "pullLabel"

    .prologue
    .line 70
    invoke-super {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->setPullLabel(Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setPullLabel(Ljava/lang/String;)V

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 76
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setPullLabel(Ljava/lang/String;)V

    .line 78
    :cond_1
    return-void
.end method

.method protected setRefreshingInternal(Z)V
    .locals 7
    .parameter "doScroll"

    .prologue
    const/4 v6, 0x0

    .line 131
    invoke-super {p0, v6}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->setRefreshingInternal(Z)V

    .line 136
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getCurrentMode()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 145
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getHeaderLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-result-object v1

    .line 146
    .local v1, originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 147
    .local v0, listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    const/4 v3, 0x0

    .line 148
    .local v3, selection:I
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getScrollY()I

    move-result v4

    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getHeaderHeight()I

    move-result v5

    add-int v2, v4, v5

    .line 152
    .local v2, scrollToY:I
    :goto_0
    if-eqz p1, :cond_0

    .line 155
    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setHeaderScroll(I)V

    .line 159
    :cond_0
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 162
    invoke-virtual {v0, v6}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setVisibility(I)V

    .line 163
    invoke-virtual {v0}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->refreshing()V

    .line 165
    if-eqz p1, :cond_1

    .line 168
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/ListView;

    invoke-virtual {v4, v3}, Landroid/widget/ListView;->setSelection(I)V

    .line 171
    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->smoothScrollTo(I)V

    .line 173
    :cond_1
    return-void

    .line 138
    .end local v0           #listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    .end local v1           #originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    .end local v2           #scrollToY:I
    .end local v3           #selection:I
    :pswitch_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getFooterLayout()Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    move-result-object v1

    .line 139
    .restart local v1       #originalLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    .line 140
    .restart local v0       #listViewLoadingLayout:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;
    iget-object v4, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->refreshableView:Landroid/view/View;

    check-cast v4, Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getCount()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 141
    .restart local v3       #selection:I
    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getScrollY()I

    move-result v4

    invoke-virtual {p0}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->getHeaderHeight()I

    move-result v5

    sub-int v2, v4, v5

    .line 142
    .restart local v2       #scrollToY:I
    goto :goto_0

    .line 136
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public setRefreshingLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "refreshingLabel"

    .prologue
    .line 81
    invoke-super {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->setRefreshingLabel(Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setRefreshingLabel(Ljava/lang/String;)V

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 87
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setRefreshingLabel(Ljava/lang/String;)V

    .line 89
    :cond_1
    return-void
.end method

.method public setReleaseLabel(Ljava/lang/String;)V
    .locals 1
    .parameter "releaseLabel"

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshAdapterViewBase;->setReleaseLabel(Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->headerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setReleaseLabel(Ljava/lang/String;)V

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    if-eqz v0, :cond_1

    .line 65
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->footerLoadingView:Lcom/webuid/mmVideo/lib/internal/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/internal/LoadingLayout;->setReleaseLabel(Ljava/lang/String;)V

    .line 67
    :cond_1
    return-void
.end method
