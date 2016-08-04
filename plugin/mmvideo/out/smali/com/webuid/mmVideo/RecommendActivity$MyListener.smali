.class Lcom/webuid/mmVideo/RecommendActivity$MyListener;
.super Ljava/lang/Object;
.source "RecommendActivity.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RecommendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RecommendActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 855
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyListener;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 863
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 870
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3
    .parameter "arg0"

    .prologue
    .line 875
    const/4 v1, 0x2

    if-le p1, v1, :cond_0

    .line 876
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyListener;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->list:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    rem-int/2addr p1, v1

    .line 878
    :cond_0
    invoke-static {p1}, Lcom/webuid/mmVideo/RecommendActivity;->access$6(I)V

    .line 879
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyListener;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 887
    return-void

    .line 880
    :cond_1
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyListener;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, p1

    .line 881
    const v2, 0x7f020022

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 882
    if-eq p1, v0, :cond_2

    .line 883
    iget-object v1, p0, Lcom/webuid/mmVideo/RecommendActivity$MyListener;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/RecommendActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    .line 884
    const v2, 0x7f020021

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 879
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
