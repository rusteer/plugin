.class Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/SoftListActivity;
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
.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 444
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
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
    .line 447
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    add-int/lit8 v3, p3, -0x1

    .line 448
    .local v3, pos:I
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #getter for: Lcom/webuid/mmVideo/SoftListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/webuid/mmVideo/SoftListActivity;->access$4(Lcom/webuid/mmVideo/SoftListActivity;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 449
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 450
    .local v1, intent:Landroid/content/Intent;
    const-string v4, "android.intent.action.VIEW"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 451
    const-string v4, "downurl"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 452
    .local v0, content_url:Landroid/net/Uri;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 453
    iget-object v4, p0, Lcom/webuid/mmVideo/SoftListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v4, v1}, Lcom/webuid/mmVideo/SoftListActivity;->startActivity(Landroid/content/Intent;)V

    .line 454
    return-void
.end method
