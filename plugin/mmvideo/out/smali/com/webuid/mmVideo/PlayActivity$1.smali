.class Lcom/webuid/mmVideo/PlayActivity$1;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 17
    .parameter "v"

    .prologue
    .line 287
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;
    invoke-static {v2}, Lcom/webuid/mmVideo/PlayActivity;->access$0(Lcom/webuid/mmVideo/PlayActivity;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 288
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v3, "\u6ca1\u6709\u83b7\u53d6\u5230\u4e0b\u8f7d\u5730\u5740\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 323
    :goto_0
    return-void

    .line 290
    :cond_0
    new-instance v14, Lcom/webuid/mmVideo/service/DownVideoService;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #calls: Lcom/webuid/mmVideo/PlayActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    invoke-static {v2}, Lcom/webuid/mmVideo/PlayActivity;->access$1(Lcom/webuid/mmVideo/PlayActivity;)Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    invoke-direct {v14, v2}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 291
    .local v14, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    new-instance v1, Lcom/webuid/mmVideo/entity/DownVideo;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v2, v2, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, v3, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v4, "url"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 292
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v4, v4, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v5, "title"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v5, v5, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v6, "source"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 293
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v6, v6, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v7, "size"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v7, v7, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v8, "length"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v8, v8, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v9, "star"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;
    invoke-static {v9}, Lcom/webuid/mmVideo/PlayActivity;->access$0(Lcom/webuid/mmVideo/PlayActivity;)Ljava/lang/String;

    move-result-object v9

    .line 291
    invoke-direct/range {v1 .. v9}, Lcom/webuid/mmVideo/entity/DownVideo;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .local v1, theVideo:Lcom/webuid/mmVideo/entity/DownVideo;
    invoke-virtual {v14, v1}, Lcom/webuid/mmVideo/service/DownVideoService;->insert(Lcom/webuid/mmVideo/entity/DownVideo;)Ljava/lang/String;

    .line 295
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v2, v2, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 296
    .local v16, xid:Ljava/lang/String;
    const/4 v10, 0x0

    .line 297
    .local v10, asyncTask:Lcom/webuid/mmVideo/Async;
    const/4 v13, 0x0

    .line 298
    .local v13, map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    const/4 v15, 0x0

    .line 299
    .local v15, startTask:Lcom/webuid/mmVideo/Async;
    const/4 v12, 0x0

    .line 301
    .local v12, isHas:Z
    const/4 v11, 0x0

    .local v11, i:I
    :goto_1
    sget-object v2, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v11, v2, :cond_2

    .line 311
    :goto_2
    if-nez v12, :cond_1

    .line 313
    const-string v2, "getDataList start"

    const-string v3, "002"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    new-instance v10, Lcom/webuid/mmVideo/Async;

    .end local v10           #asyncTask:Lcom/webuid/mmVideo/Async;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-direct {v10, v2}, Lcom/webuid/mmVideo/Async;-><init>(Landroid/content/Context;)V

    .line 315
    .restart local v10       #asyncTask:Lcom/webuid/mmVideo/Async;
    new-instance v13, Ljava/util/Hashtable;

    .end local v13           #map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    invoke-direct {v13}, Ljava/util/Hashtable;-><init>()V

    .line 316
    .restart local v13       #map001:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/webuid/mmVideo/Async;>;"
    move-object/from16 v0, v16

    invoke-interface {v13, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    sget-object v2, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v2, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v16, v2, v3

    invoke-virtual {v10, v2}, Lcom/webuid/mmVideo/Async;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 321
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/webuid/mmVideo/PlayActivity$1;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v3, "\u6dfb\u52a0\u4e0b\u8f7d\u6210\u529f"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 303
    :cond_2
    sget-object v2, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15           #startTask:Lcom/webuid/mmVideo/Async;
    check-cast v15, Lcom/webuid/mmVideo/Async;

    .line 304
    .restart local v15       #startTask:Lcom/webuid/mmVideo/Async;
    if-eqz v15, :cond_3

    .line 306
    const/4 v12, 0x1

    .line 307
    goto :goto_2

    .line 301
    :cond_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_1
.end method
