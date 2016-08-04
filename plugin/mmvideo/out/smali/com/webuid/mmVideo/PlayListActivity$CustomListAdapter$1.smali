.class Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;
.super Ljava/lang/Object;
.source "PlayListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .parameter "v"

    .prologue
    .line 279
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 280
    .local v3, pos:Ljava/lang/Integer;
    iget-object v4, p0, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/PlayListActivity;
    invoke-static {v4}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/PlayListActivity;

    move-result-object v4

    #getter for: Lcom/webuid/mmVideo/PlayListActivity;->dataList:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/webuid/mmVideo/PlayListActivity;->access$0(Lcom/webuid/mmVideo/PlayListActivity;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 281
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 282
    .local v1, it:Landroid/content/Intent;
    iget-object v4, p0, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/PlayListActivity;
    invoke-static {v4}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/PlayListActivity;

    move-result-object v4

    const-class v5, Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 283
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 284
    .local v0, bundle:Landroid/os/Bundle;
    const-string v4, "video_info"

    invoke-virtual {v0, v4, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 285
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 286
    iget-object v4, p0, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/PlayListActivity;
    invoke-static {v4}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/PlayListActivity;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/webuid/mmVideo/PlayListActivity;->startActivity(Landroid/content/Intent;)V

    .line 287
    iget-object v4, p0, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/PlayListActivity;
    invoke-static {v4}, Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/PlayListActivity$CustomListAdapter;)Lcom/webuid/mmVideo/PlayListActivity;

    move-result-object v4

    const v5, 0x7f040002

    const v6, 0x7f040003

    invoke-virtual {v4, v5, v6}, Lcom/webuid/mmVideo/PlayListActivity;->overridePendingTransition(II)V

    .line 288
    return-void
.end method
