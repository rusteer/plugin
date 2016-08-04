.class Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "RecommendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RecommendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RecommendActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 795
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/View;ILjava/lang/Object;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 817
    return-void
.end method

.method public finishUpdate(Landroid/view/View;)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 852
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 799
    const v0, 0x7fffffff

    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .parameter "object"

    .prologue
    .line 810
    invoke-super {p0, p1}, Landroid/support/v4/view/PagerAdapter;->getItemPosition(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/View;I)Ljava/lang/Object;
    .locals 2
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 823
    :try_start_0
    check-cast p1, Landroid/support/v4/view/ViewPager;

    .end local p1
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    rem-int v1, p2, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPager;->addView(Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 827
    :goto_0
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyAdapter;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    rem-int v1, p2, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 824
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 804
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public restoreState(Landroid/os/Parcelable;Ljava/lang/ClassLoader;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 834
    return-void
.end method

.method public saveState()Landroid/os/Parcelable;
    .locals 1

    .prologue
    .line 839
    const/4 v0, 0x0

    return-object v0
.end method

.method public startUpdate(Landroid/view/View;)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 846
    return-void
.end method
