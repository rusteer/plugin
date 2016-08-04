.class Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter$1;
.super Ljava/lang/Object;
.source "OfflineActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    .line 621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 624
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 625
    .local v4, pos:Ljava/lang/Integer;
    sget-object v5, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 626
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 627
    .local v3, path:Ljava/lang/String;
    const-string v5, "local_file"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/data/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "mmVideo/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".mp4"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    const-string v5, "map"

    invoke-virtual {v2}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 630
    .local v1, it:Landroid/content/Intent;
    iget-object v5, p0, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;
    invoke-static {v5}, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;)Lcom/webuid/mmVideo/OfflineActivity;

    move-result-object v5

    const-class v6, Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 631
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 632
    .local v0, bundle:Landroid/os/Bundle;
    const-string v5, "video_info"

    invoke-virtual {v0, v5, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 633
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 634
    iget-object v5, p0, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;
    invoke-static {v5}, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;)Lcom/webuid/mmVideo/OfflineActivity;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/webuid/mmVideo/OfflineActivity;->startActivity(Landroid/content/Intent;)V

    .line 635
    iget-object v5, p0, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter$1;->this$1:Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;

    #getter for: Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;
    invoke-static {v5}, Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;->access$0(Lcom/webuid/mmVideo/OfflineActivity$CustomListAdapter;)Lcom/webuid/mmVideo/OfflineActivity;

    move-result-object v5

    const v6, 0x7f040002

    const v7, 0x7f040003

    invoke-virtual {v5, v6, v7}, Lcom/webuid/mmVideo/OfflineActivity;->overridePendingTransition(II)V

    .line 636
    return-void
.end method
