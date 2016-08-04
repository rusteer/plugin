.class public Lcom/j256/ormlite/dao/LazyForeignCollection;
.super Lcom/j256/ormlite/dao/BaseForeignCollection;
.source "LazyForeignCollection.java"

# interfaces
.implements Lcom/j256/ormlite/dao/ForeignCollection;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "ID:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/j256/ormlite/dao/BaseForeignCollection",
        "<TT;TID;>;",
        "Lcom/j256/ormlite/dao/ForeignCollection",
        "<TT;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x4bc855175671af79L


# instance fields
.field private transient lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/j256/ormlite/dao/Dao;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .parameter
    .parameter "parent"
    .parameter "parentId"
    .parameter "columnName"
    .parameter "orderColumn"
    .parameter "orderAscending"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/dao/Dao",
            "<TT;TID;>;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    .local p1, dao:Lcom/j256/ormlite/dao/Dao;,"Lcom/j256/ormlite/dao/Dao<TT;TID;>;"
    invoke-direct/range {p0 .. p6}, Lcom/j256/ormlite/dao/BaseForeignCollection;-><init>(Lcom/j256/ormlite/dao/Dao;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 36
    return-void
.end method


# virtual methods
.method public closeLastIterator()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 94
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;

    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;

    .line 98
    :cond_0
    return-void
.end method

.method public closeableIterator()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iteratorThrow()Lcom/j256/ormlite/dao/CloseableIterator;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, e:Ljava/sql/SQLException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not build lazy iterator for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-interface {v3}, Lcom/j256/ormlite/dao/Dao;->getDataClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    .line 136
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    .line 138
    .local v0, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 140
    const/4 v1, 0x1

    .line 146
    :try_start_1
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 149
    :goto_0
    return v1

    .line 143
    :cond_1
    const/4 v1, 0x0

    .line 146
    :try_start_2
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_2
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 147
    :catch_0
    move-exception v2

    goto :goto_0

    .line 145
    :catchall_0
    move-exception v1

    .line 146
    :try_start_3
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_2

    .line 149
    :goto_1
    throw v1

    .line 147
    :catch_1
    move-exception v2

    goto :goto_0

    :catch_2
    move-exception v2

    goto :goto_1
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 154
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    .local p1, collection:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 155
    .local v1, leftOvers:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    .line 157
    .local v0, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :goto_0
    :try_start_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 158
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 162
    :catchall_0
    move-exception v2

    .line 163
    :try_start_1
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 166
    :goto_1
    throw v2

    .line 160
    :cond_0
    :try_start_2
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v2

    .line 163
    :try_start_3
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_0

    .line 166
    :goto_2
    return v2

    .line 164
    :catch_0
    move-exception v3

    goto :goto_2

    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "other"

    .prologue
    .line 290
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getWrappedIterable()Lcom/j256/ormlite/dao/CloseableWrappedIterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableWrappedIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    new-instance v0, Lcom/j256/ormlite/dao/CloseableWrappedIterableImpl;

    new-instance v1, Lcom/j256/ormlite/dao/LazyForeignCollection$1;

    invoke-direct {v1, p0}, Lcom/j256/ormlite/dao/LazyForeignCollection$1;-><init>(Lcom/j256/ormlite/dao/LazyForeignCollection;)V

    invoke-direct {v0, v1}, Lcom/j256/ormlite/dao/CloseableWrappedIterableImpl;-><init>(Lcom/j256/ormlite/dao/CloseableIterable;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 303
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEager()Z
    .locals 1

    .prologue
    .line 101
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 3

    .prologue
    .line 123
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    .line 125
    .local v0, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :try_start_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 128
    :goto_0
    :try_start_1
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    :goto_1
    return v1

    .line 125
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 127
    :catchall_0
    move-exception v1

    .line 128
    :try_start_2
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_2
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 131
    :goto_2
    throw v1

    .line 129
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    goto :goto_2
.end method

.method public iterator()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 45
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->closeableIterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 26
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public iteratorThrow()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 60
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->seperateIteratorThrow()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;

    .line 61
    iget-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->lastIterator:Lcom/j256/ormlite/dao/CloseableIterator;

    return-object v0
.end method

.method public refreshAll()I
    .locals 2

    .prologue
    .line 272
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot call updateAll() on a lazy collection."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public refreshCollection()I
    .locals 1

    .prologue
    .line 277
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 3
    .parameter "data"

    .prologue
    .line 172
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    .line 174
    .local v0, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 175
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 176
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    const/4 v1, 0x1

    .line 183
    :try_start_1
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 186
    :goto_0
    return v1

    .line 180
    :cond_1
    const/4 v1, 0x0

    .line 183
    :try_start_2
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_2
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 184
    :catch_0
    move-exception v2

    goto :goto_0

    .line 182
    :catchall_0
    move-exception v1

    .line 183
    :try_start_3
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_2

    .line 186
    :goto_1
    throw v1

    .line 184
    :catch_1
    move-exception v2

    goto :goto_0

    :catch_2
    move-exception v2

    goto :goto_1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    .local p1, collection:Ljava/util/Collection;,"Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    .line 193
    .local v0, changed:Z
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v1

    .line 195
    .local v1, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 196
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    const/4 v0, 0x1

    goto :goto_0

    .line 204
    :cond_1
    :try_start_1
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    .line 207
    :goto_1
    return v0

    .line 203
    :catchall_0
    move-exception v2

    .line 204
    :try_start_2
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_2
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 207
    :goto_2
    throw v2

    .line 205
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v3

    goto :goto_2
.end method

.method public seperateIteratorThrow()Lcom/j256/ormlite/dao/CloseableIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/j256/ormlite/dao/CloseableIterator",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 70
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->dao:Lcom/j256/ormlite/dao/Dao;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Internal DAO object is null.  Lazy collections cannot be used if they have been deserialized."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/dao/LazyForeignCollection;->dao:Lcom/j256/ormlite/dao/Dao;

    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->getPreparedQuery()Lcom/j256/ormlite/stmt/PreparedQuery;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/j256/ormlite/dao/Dao;->iterator(Lcom/j256/ormlite/stmt/PreparedQuery;)Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 4

    .prologue
    .line 105
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v0

    .line 108
    .local v0, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    const/4 v1, 0x0

    .local v1, sizeC:I
    :goto_0
    :try_start_0
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->moveToNext()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 115
    :cond_0
    :try_start_1
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0

    .line 118
    :goto_1
    return v1

    .line 114
    :catchall_0
    move-exception v2

    .line 115
    :try_start_2
    invoke-interface {v0}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_2
    .catch Ljava/sql/SQLException; {:try_start_2 .. :try_end_2} :catch_1

    .line 118
    :goto_2
    throw v2

    .line 116
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v3

    goto :goto_2
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 4

    .prologue
    .line 212
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 213
    .local v0, items:Ljava/util/List;,"Ljava/util/List<TT;>;"
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v1

    .line 215
    .local v1, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    :goto_0
    :try_start_0
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 216
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 220
    :catchall_0
    move-exception v2

    .line 221
    :try_start_1
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_1

    .line 224
    :goto_1
    throw v2

    .line 218
    :cond_0
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 221
    :try_start_3
    invoke-interface {v1}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_0

    .line 224
    :goto_2
    return-object v2

    .line 222
    :catch_0
    move-exception v3

    goto :goto_2

    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 11
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;)[TE;"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    .local p1, array:[Ljava/lang/Object;,"[TE;"
    const/4 v5, 0x0

    .line 230
    .local v5, items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    const/4 v4, 0x0

    .line 231
    .local v4, itemC:I
    invoke-virtual {p0}, Lcom/j256/ormlite/dao/LazyForeignCollection;->iterator()Lcom/j256/ormlite/dao/CloseableIterator;

    move-result-object v7

    .local v7, iterator:Lcom/j256/ormlite/dao/CloseableIterator;,"Lcom/j256/ormlite/dao/CloseableIterator<TT;>;"
    move-object v6, v5

    .line 233
    .end local v5           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .local v6, items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :goto_0
    :try_start_0
    invoke-interface {v7}, Lcom/j256/ormlite/dao/CloseableIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 235
    invoke-interface {v7}, Lcom/j256/ormlite/dao/CloseableIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 237
    .local v2, castData:Ljava/lang/Object;,"TE;"
    array-length v9, p1

    if-lt v4, v9, :cond_2

    .line 238
    if-nez v6, :cond_0

    .line 239
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    .end local v6           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v5       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/Object;
    :try_start_1
    array-length v8, v0

    .local v8, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v8, :cond_1

    aget-object v1, v0, v3

    .line 241
    .local v1, arrayData:Ljava/lang/Object;,"TE;"
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v1           #arrayData:Ljava/lang/Object;,"TE;"
    .end local v3           #i$:I
    .end local v5           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .end local v8           #len$:I
    .restart local v6       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :cond_0
    move-object v5, v6

    .line 244
    .end local v6           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v5       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :cond_1
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 248
    :goto_2
    add-int/lit8 v4, v4, 0x1

    move-object v6, v5

    .line 249
    .end local v5           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v6       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    goto :goto_0

    .line 246
    :cond_2
    :try_start_2
    aput-object v2, p1, v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v5, v6

    .end local v6           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v5       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    goto :goto_2

    .line 252
    .end local v2           #castData:Ljava/lang/Object;,"TE;"
    .end local v5           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v6       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :cond_3
    :try_start_3
    invoke-interface {v7}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_3
    .catch Ljava/sql/SQLException; {:try_start_3 .. :try_end_3} :catch_0

    .line 257
    :goto_3
    if-nez v6, :cond_5

    .line 258
    array-length v9, p1

    add-int/lit8 v9, v9, -0x1

    if-ge v4, v9, :cond_4

    .line 259
    const/4 v9, 0x0

    aput-object v9, p1, v4

    .line 263
    .end local p1           #array:[Ljava/lang/Object;,"[TE;"
    :cond_4
    :goto_4
    return-object p1

    .line 251
    .restart local p1       #array:[Ljava/lang/Object;,"[TE;"
    :catchall_0
    move-exception v9

    move-object v5, v6

    .line 252
    .end local v6           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v5       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :goto_5
    :try_start_4
    invoke-interface {v7}, Lcom/j256/ormlite/dao/CloseableIterator;->close()V
    :try_end_4
    .catch Ljava/sql/SQLException; {:try_start_4 .. :try_end_4} :catch_1

    .line 255
    :goto_6
    throw v9

    .line 263
    .end local v5           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v6       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :cond_5
    invoke-interface {v6, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    goto :goto_4

    .line 253
    :catch_0
    move-exception v9

    goto :goto_3

    .end local v6           #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    .restart local v5       #items:Ljava/util/List;,"Ljava/util/List<TE;>;"
    :catch_1
    move-exception v10

    goto :goto_6

    .line 251
    .restart local v2       #castData:Ljava/lang/Object;,"TE;"
    :catchall_1
    move-exception v9

    goto :goto_5
.end method

.method public updateAll()I
    .locals 2

    .prologue
    .line 268
    .local p0, this:Lcom/j256/ormlite/dao/LazyForeignCollection;,"Lcom/j256/ormlite/dao/LazyForeignCollection<TT;TID;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot call updateAll() on a lazy collection."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
