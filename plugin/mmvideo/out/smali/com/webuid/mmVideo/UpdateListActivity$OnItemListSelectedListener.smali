.class Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/UpdateListActivity;
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
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 474
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

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
    .line 477
    .local p1, arg0:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget v4, v4, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 478
    add-int/lit8 v3, p3, -0x1

    .line 479
    .local v3, pos:I
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #getter for: Lcom/webuid/mmVideo/UpdateListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/webuid/mmVideo/UpdateListActivity;->access$4(Lcom/webuid/mmVideo/UpdateListActivity;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 480
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 481
    .local v1, it:Landroid/content/Intent;
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    const-class v5, Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 482
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 483
    .local v0, bundle:Landroid/os/Bundle;
    const-string v4, "video_info"

    invoke-virtual {v0, v4, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 484
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 485
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-virtual {v4, v1}, Lcom/webuid/mmVideo/UpdateListActivity;->startActivity(Landroid/content/Intent;)V

    .line 486
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    const v5, 0x7f040002

    const v6, 0x7f040003

    invoke-virtual {v4, v5, v6}, Lcom/webuid/mmVideo/UpdateListActivity;->overridePendingTransition(II)V

    .line 497
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #it:Landroid/content/Intent;
    .end local v2           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3           #pos:I
    :cond_0
    :goto_0
    return-void

    .line 487
    :cond_1
    iget-object v4, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    iget v4, v4, Lcom/webuid/mmVideo/UpdateListActivity;->search_type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 489
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u63d0\u793a"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "\u8be5\u89c6\u9891\u660e\u5929\u624d\u53ef\u4ee5\u89c2\u770b\uff01"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "\u786e\u5b9a"

    new-instance v6, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener$1;

    invoke-direct {v6, p0}, Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener$1;-><init>(Lcom/webuid/mmVideo/UpdateListActivity$OnItemListSelectedListener;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 495
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method
