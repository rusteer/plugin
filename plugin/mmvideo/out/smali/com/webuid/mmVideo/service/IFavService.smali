.class public interface abstract Lcom/webuid/mmVideo/service/IFavService;
.super Ljava/lang/Object;
.source "IFavService.java"


# virtual methods
.method public abstract insert(Lcom/webuid/mmVideo/entity/Fav;)Ljava/lang/String;
.end method

.method public abstract load(I)Lcom/webuid/mmVideo/entity/Fav;
.end method

.method public abstract select()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/webuid/mmVideo/entity/Fav;",
            ">;"
        }
    .end annotation
.end method
