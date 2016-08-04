.class public Lcom/webuid/mmVideo/service/PlayVideoService;
.super Ljava/lang/Object;
.source "PlayVideoService.java"


# instance fields
.field private playVideoDao:Lcom/j256/ormlite/dao/Dao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/PlayVideo;",
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
            "Lcom/webuid/mmVideo/entity/PlayVideo;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p1, dao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<Lcom/webuid/mmVideo/entity/PlayVideo;Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    .line 18
    iput-object p1, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    .line 19
    return-void
.end method


# virtual methods
.method public insert(Lcom/webuid/mmVideo/entity/PlayVideo;)Ljava/lang/String;
    .locals 4
    .parameter "playVideo"

    .prologue
    .line 22
    const/4 v2, 0x0

    .line 25
    .local v2, result:Z
    :try_start_0
    iget-object v3, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v3, p1}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    const/4 v2, 0x1

    .line 30
    :goto_0
    if-eqz v2, :cond_0

    const-string v1, "\u6ce8\u518c\u5ba2\u6237\u6210\u529f\uff01"

    .line 31
    .local v1, msg:Ljava/lang/String;
    :goto_1
    return-object v1

    .line 27
    .end local v1           #msg:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 28
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0

    .line 30
    .end local v0           #e:Ljava/sql/SQLException;
    :cond_0
    const-string v1, "\u6ce8\u518c\u5931\u8d25"

    goto :goto_1
.end method

.method public load(I)Lcom/webuid/mmVideo/entity/PlayVideo;
    .locals 6
    .parameter "id"

    .prologue
    .line 35
    const/4 v2, 0x0

    .line 37
    .local v2, playVideo:Lcom/webuid/mmVideo/entity/PlayVideo;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 38
    .local v3, playVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :try_start_0
    iget-object v4, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v4, v3}, Lcom/j256/ormlite/dao/Dao;->queryForFieldValues(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    .line 42
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/webuid/mmVideo/entity/PlayVideo;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v4

    .line 47
    .end local v1           #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    :goto_0
    return-object v2

    .line 42
    .restart local v1       #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 43
    .end local v1           #list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    :catch_0
    move-exception v0

    .line 44
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public remove(I)I
    .locals 7
    .parameter "id"

    .prologue
    .line 51
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 52
    .local v3, playVideoMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const/4 v1, 0x0

    .line 55
    .local v1, delfig:I
    :try_start_0
    iget-object v4, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v4}, Lcom/j256/ormlite/dao/Dao;->deleteBuilder()Lcom/j256/ormlite/stmt/DeleteBuilder;

    move-result-object v0

    .line 56
    .local v0, deleteBuilder:Lcom/j256/ormlite/stmt/DeleteBuilder;,"Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/webuid/mmVideo/entity/PlayVideo;Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->where()Lcom/j256/ormlite/stmt/Where;

    move-result-object v4

    const-string v5, "Id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/j256/ormlite/stmt/Where;->eq(Ljava/lang/String;Ljava/lang/Object;)Lcom/j256/ormlite/stmt/Where;

    .line 57
    invoke-virtual {v0}, Lcom/j256/ormlite/stmt/DeleteBuilder;->delete()I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v0           #deleteBuilder:Lcom/j256/ormlite/stmt/DeleteBuilder;,"Lcom/j256/ormlite/stmt/DeleteBuilder<Lcom/webuid/mmVideo/entity/PlayVideo;Ljava/lang/Integer;>;"
    :goto_0
    return v1

    .line 59
    :catch_0
    move-exception v2

    .line 60
    .local v2, e:Ljava/sql/SQLException;
    invoke-virtual {v2}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public select()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/webuid/mmVideo/entity/PlayVideo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    const/4 v1, 0x0

    .line 68
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Lcom/webuid/mmVideo/entity/PlayVideo;>;"
    :try_start_0
    iget-object v2, p0, Lcom/webuid/mmVideo/service/PlayVideoService;->playVideoDao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v2}, Lcom/j256/ormlite/dao/Dao;->queryForAll()Ljava/util/List;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 73
    :goto_0
    return-object v1

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method
