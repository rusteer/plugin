.class Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;
.super Landroid/widget/ListView;
.source "PullToRefreshListView.java"

# interfaces
.implements Lcom/webuid/mmVideo/lib/internal/EmptyViewMethodAccessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/lib/PullToRefreshListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InternalListView"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/lib/PullToRefreshListView;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/lib/PullToRefreshListView;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 20
    iput-object p1, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;->this$0:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    .line 21
    invoke-direct {p0, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    return-void
.end method


# virtual methods
.method public getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Landroid/widget/ListView;->getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    return-object v0
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 1
    .parameter "emptyView"

    .prologue
    .line 26
    iget-object v0, p0, Lcom/webuid/mmVideo/lib/PullToRefreshListView$InternalListView;->this$0:Lcom/webuid/mmVideo/lib/PullToRefreshListView;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/lib/PullToRefreshListView;->setEmptyView(Landroid/view/View;)V

    .line 27
    return-void
.end method

.method public setEmptyViewInternal(Landroid/view/View;)V
    .locals 0
    .parameter "emptyView"

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 32
    return-void
.end method
