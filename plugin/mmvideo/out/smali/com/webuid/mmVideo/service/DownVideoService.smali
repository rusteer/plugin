.class public Lcom/webuid/mmVideo/service/DownVideoService;
.super Ljava/lang/Object;
.source "DownVideoService.java"


# instance fields
.field private downVideoDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/DownVideo;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/j256/ormlite/dao/Dao;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/DownVideo;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, dao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<Lcom/webuid/mmVideo/entity/DownVideo;Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    .line 17
    iput-object p1, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    .line 18
    return-void
.end method


# virtual methods
.method public getListFromFinish(I)Ljava/util/List;
    .locals 5
    .parameter "finish"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Lcom/webuid/mmVideo/entity/DownVideo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    const/4 v2, 0x0

    .line 94
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 95
    .local v0, downVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "finish"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :try_start_0
    iget-object v3, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v3, v0}, Lcom/j256/ormlite/dao/Dao;->queryForFieldValues(Ljava/util/Map;)Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 101
    :goto_0
    return-object v2

    .line 98
    :catch_0
    move-exception v1

    .line 99
    .local v1, e:Ljava/sql/SQLException;
    invoke-virtual {v1}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public insert(Lcom/webuid/mmVideo/entity/DownVideo;)Ljava/lang/String;
    .locals 4
    .parameter "downVideo"

    .prologue
    .line 21
    const/4 v2, 0x0

    .line 24
    .local v2, result:Z
    :try_start_0
    iget-object v3, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v3, p1}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    const/4 v2, 0x1

    .line 29
    :goto_0
    if-eqz v2, :cond_0

    const-string v1, "\u6ce8\u518c\u5ba2\u6237\u6210\u529f\uff01"

    .line 30
    .local v1, msg:Ljava/lang/String;
    :goto_1
    return-object v1

    .line 26
    .end local v1           #msg:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 27
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0

    .line 29
    .end local v0           #e:Ljava/sql/SQLException;
    :cond_0
    const-string v1, "\u6ce8\u518c\u5931\u8d25"

    goto :goto_1
.end method

.method public load(I)Lcom/webuid/mmVideo/entity/DownVideo;
    .locals 6
    .parameter "id"

    .prologue
    .line 34
    const/4 v0, 0x0

    .line 36
    .local v0, downVideo:Lcom/webuid/mmVideo/entity/DownVideo;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 37
    .local v1, downVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    :try_start_0
    iget-object v4, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v4, v1}, Lcom/j256/ormlite/dao/Dao;->queryForFieldValues(Ljava/util/Map;)Ljava/util/List;

    move-result-object v3

    .line 41
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/webuid/mmVideo/entity/DownVideo;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v4

    .line 46
    .end local v3           #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    :goto_0
    return-object v0

    .line 41
    .restart local v3       #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 42
    .end local v3           #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    :catch_0
    move-exception v2

    .line 43
    .local v2, e:Ljava/sql/SQLException;
    invoke-virtual {v2}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public remove(I)I
    .locals 8
    .parameter "id"

    .prologue
    .line 50
    const/4 v2, 0x0

    .line 52
    .local v2, downVideo:Lcom/webuid/mmVideo/entity/DownVideo;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 53
    .local v3, downVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const/4 v1, 0x0

    .line 56
    .local v1, delfig:I
    :try_start_0
    iget-object v5, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v5}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v0

    .line 57
    .local v0, deleteBuilder:Lcom/j256/ormlite/stmt/DeleteBuilder;,"Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/webuid/mmVideo/entity/DownVideo;Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v5

    const-string v6, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 58
    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .end local v0           #deleteBuilder:Lcom/j256/ormlite/stmt/DeleteBuilder;,"Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/webuid/mmVideo/entity/DownVideo;Ljava/lang/Integer;>;"
    :goto_0
    return v1

    .line 60
    :catch_0
    move-exception v4

    .line 61
    .local v4, e:Ljava/sql/SQLException;
    invoke-virtual {v4}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public saveFinish(II)V
    .locals 9
    .parameter "id"
    .parameter "finish"

    .prologue
    .line 67
    const/4 v1, 0x0

    .line 69
    .local v1, downVideo:Lcom/webuid/mmVideo/entity/DownVideo;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 70
    .local v2, downVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, delfig:I
    :try_start_0
    iget-object v4, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    const-string v5, "update downVideo set finish=? where Id=?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/j256/ormlite/dao/Dao;->updateRaw(Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :goto_0
    return-void

    .line 74
    :catch_0
    move-exception v3

    .line 75
    .local v3, e:Ljava/sql/SQLException;
    invoke-virtual {v3}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public select()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/webuid/mmVideo/entity/DownVideo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    const/4 v1, 0x0

    .line 83
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/DownVideo;>;"
    :try_start_0
    iget-object v2, p0, Lcom/webuid/mmVideo/service/DownVideoService;->downVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->queryForAll()Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 88
    :goto_0
    return-object v1

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method
