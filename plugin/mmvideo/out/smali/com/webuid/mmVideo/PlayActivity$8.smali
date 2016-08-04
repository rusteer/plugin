.class Lcom/webuid/mmVideo/PlayActivity$8;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .parameter "v"

    .prologue
    .line 255
    new-instance v8, Lcom/webuid/mmVideo/service/FavService;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #calls: Lcom/webuid/mmVideo/PlayActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$1(Lcom/webuid/mmVideo/PlayActivity;)Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/webuid/mmVideo/dao/DataHelper;->getFavDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    invoke-direct {v8, v1}, Lcom/webuid/mmVideo/service/FavService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 256
    .local v8, favService:Lcom/webuid/mmVideo/service/IFavService;
    new-instance v0, Lcom/webuid/mmVideo/entity/Fav;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v2, v2, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v3, "url"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 257
    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, v3, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v4, "title"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v4, v4, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v5, "source"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 258
    iget-object v5, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v5, v5, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v6, "size"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v6, v6, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v7, "length"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v7, v7, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v9, "star"

    invoke-virtual {v7, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 256
    invoke-direct/range {v0 .. v7}, Lcom/webuid/mmVideo/entity/Fav;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .local v0, theFav:Lcom/webuid/mmVideo/entity/Fav;
    invoke-interface {v8, v0}, Lcom/webuid/mmVideo/service/IFavService;->insert(Lcom/webuid/mmVideo/entity/Fav;)Ljava/lang/String;

    .line 260
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$8;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v2, "\u6dfb\u52a0\u6536\u85cf\u6210\u529f"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 261
    return-void
.end method
