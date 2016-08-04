.class public Lcom/webuid/mmVideo/dao/DataHelper;
.super Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;
.source "DataHelper.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "mmVideo.db"

.field private static final DATABASE_VERSION:I = 0x1


# instance fields
.field daoMaps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/j256/ormlite/dao/Dao;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 37
    const-string v0, "mmVideo.db"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v2, v1}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 26
    iput-object v2, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    .line 38
    invoke-direct {p0}, Lcom/webuid/mmVideo/dao/DataHelper;->initDaoMaps()V

    .line 39
    return-void
.end method

.method private initDaoMaps()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    .line 31
    iget-object v0, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v1, "favDao"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    iget-object v0, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v1, "playVideoDao"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    iget-object v0, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v1, "downVideoDao"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;->close()V

    .line 75
    iget-object v0, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 76
    return-void
.end method

.method public getDownVideoDao()Lcom/j256/ormlite/dao/Dao;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/DownVideo;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    iget-object v2, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v3, "downVideoDao"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/j256/ormlite/dao/Dao;

    .line 108
    .local v0, downVideoDao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<Lcom/webuid/mmVideo/entity/DownVideo;Ljava/lang/Integer;>;"
    if-nez v0, :cond_0

    .line 110
    :try_start_0
    const-class v2, Lcom/webuid/mmVideo/entity/DownVideo;

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/dao/DataHelper;->getDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 115
    :cond_0
    :goto_0
    return-object v0

    .line 111
    :catch_0
    move-exception v1

    .line 112
    .local v1, e:Ljava/sql/SQLException;
    invoke-virtual {v1}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public getFavDao()Lcom/j256/ormlite/dao/Dao;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/Fav;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v2, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v3, "favDao"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/j256/ormlite/dao/Dao;

    .line 82
    .local v1, favDao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<Lcom/webuid/mmVideo/entity/Fav;Ljava/lang/Integer;>;"
    if-nez v1, :cond_0

    .line 84
    :try_start_0
    const-class v2, Lcom/webuid/mmVideo/entity/Fav;

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/dao/DataHelper;->getDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 89
    :cond_0
    :goto_0
    return-object v1

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public getPlayVideoDao()Lcom/j256/ormlite/dao/Dao;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/Dao",
            "<",
            "Lcom/webuid/mmVideo/entity/PlayVideo;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v2, p0, Lcom/webuid/mmVideo/dao/DataHelper;->daoMaps:Ljava/util/Map;

    const-string v3, "playVideoDao"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/j256/ormlite/dao/Dao;

    .line 95
    .local v1, playVideoDao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<Lcom/webuid/mmVideo/entity/PlayVideo;Ljava/lang/Integer;>;"
    if-nez v1, :cond_0

    .line 97
    :try_start_0
    const-class v2, Lcom/webuid/mmVideo/entity/PlayVideo;

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/dao/DataHelper;->getDao(Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 102
    :cond_0
    :goto_0
    return-object v1

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, e:Ljava/sql/SQLException;
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V
    .locals 3
    .parameter "db"
    .parameter "connectionSource"

    .prologue
    .line 45
    :try_start_0
    const-class v1, Lcom/webuid/mmVideo/entity/Fav;

    invoke-static {p2, v1}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    .line 46
    const-class v1, Lcom/webuid/mmVideo/entity/PlayVideo;

    invoke-static {p2, v1}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    .line 47
    const-class v1, Lcom/webuid/mmVideo/entity/DownVideo;

    invoke-static {p2, v1}, Lcom/j256/ormlite/table/TableUtils;->createTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)I

    .line 48
    const-class v1, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u521b\u5efa\u6570\u636e\u5e93\u6210\u529f\uff01"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, e:Ljava/lang/Exception;
    const-class v1, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u521b\u5efa\u6570\u636e\u5e93\u5931\u8d25\uff01"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;II)V
    .locals 3
    .parameter "db"
    .parameter "connectionSource"
    .parameter "arg2"
    .parameter "arg3"

    .prologue
    .line 61
    :try_start_0
    const-class v1, Lcom/webuid/mmVideo/entity/Fav;

    const/4 v2, 0x1

    invoke-static {p2, v1, v2}, Lcom/j256/ormlite/table/TableUtils;->dropTable(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;Z)I

    .line 64
    invoke-virtual {p0, p1, p2}, Lcom/webuid/mmVideo/dao/DataHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;Lcom/j256/ormlite/support/ConnectionSource;)V

    .line 65
    const-class v1, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u66f4\u65b0\u6570\u636e\u5e93\u6210\u529f"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/sql/SQLException;
    const-class v1, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u66f4\u65b0\u6570\u636e\u5e93\u5931\u8d25"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    invoke-virtual {v0}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_0
.end method
