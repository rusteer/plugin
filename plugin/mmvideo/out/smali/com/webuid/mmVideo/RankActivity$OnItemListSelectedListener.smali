.class Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "RankActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/RankActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OnItemListSelectedListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 468
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .parameter
    .parameter "arg1"
    .parameter "pos0"
    .parameter "arg3"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 471
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    add-int/lit8 v3, p3, -0x1

    .line 472
    .local v3, pos:I
    iget-object v4, p0, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #getter for: Lcom/webuid/mmVideo/RankActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/webuid/mmVideo/RankActivity;->access$4(Lcom/webuid/mmVideo/RankActivity;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 513
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 514
    .local v1, it:Landroid/content/Intent;
    iget-object v4, p0, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const-class v5, Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 515
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 516
    .local v0, bundle:Landroid/os/Bundle;
    const-string v4, "video_info"

    invoke-virtual {v0, v4, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 517
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 518
    iget-object v4, p0, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-virtual {v4, v1}, Lcom/webuid/mmVideo/RankActivity;->startActivity(Landroid/content/Intent;)V

    .line 519
    iget-object v4, p0, Lcom/webuid/mmVideo/RankActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/RankActivity;

    const v5, 0x7f040002

    const v6, 0x7f040003

    invoke-virtual {v4, v5, v6}, Lcom/webuid/mmVideo/RankActivity;->overridePendingTransition(II)V

    .line 520
    return-void
.end method
