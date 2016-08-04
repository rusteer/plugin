.class public Lcom/j256/ormlite/dao/ReferenceObjectCache;
.super Ljava/lang/Object;
.source "ReferenceObjectCache.java"

# interfaces
.implements Lcom/j256/ormlite/dao/ObjectCache;


# instance fields
.field private final classMaps:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/Reference",
            "<",
            "Ljava/lang/Object;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final useWeak:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .parameter "useWeak"

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    .line 30
    iput-boolean p1, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->useWeak:Z

    .line 31
    return-void
.end method

.method private cleanMap(Ljava/util/Map;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/Reference",
            "<",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 159
    .local v0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 160
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 161
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 164
    :cond_1
    return-void
.end method

.method private getMapForClass(Ljava/lang/Class;)Ljava/util/Map;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/Reference",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 168
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-nez v0, :cond_0

    .line 169
    const/4 v0, 0x0

    .line 171
    .end local v0           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    :cond_0
    return-object v0
.end method

.method public static makeSoftCache()Lcom/j256/ormlite/dao/ReferenceObjectCache;
    .locals 2

    .prologue
    .line 44
    new-instance v0, Lcom/j256/ormlite/dao/ReferenceObjectCache;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;-><init>(Z)V

    return-object v0
.end method

.method public static makeWeakCache()Lcom/j256/ormlite/dao/ReferenceObjectCache;
    .locals 2

    .prologue
    .line 37
    new-instance v0, Lcom/j256/ormlite/dao/ReferenceObjectCache;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;-><init>(Z)V

    return-object v0
.end method


# virtual methods
.method public cleanNullReferences(Ljava/lang/Class;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 143
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-eqz v0, :cond_0

    .line 144
    invoke-direct {p0, v0}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->cleanMap(Ljava/util/Map;)V

    .line 146
    :cond_0
    return-void
.end method

.method public cleanNullReferencesAll()V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()V"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v2, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 153
    .local v1, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    invoke-direct {p0, v1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->cleanMap(Ljava/util/Map;)V

    goto :goto_0

    .line 155
    .end local v1           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    :cond_0
    return-void
.end method

.method public clear(Ljava/lang/Class;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 88
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-eqz v0, :cond_0

    .line 89
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 91
    :cond_0
    return-void
.end method

.method public clearAll()V
    .locals 3

    .prologue
    .line 94
    iget-object v2, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 95
    .local v1, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    goto :goto_0

    .line 97
    .end local v1           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    :cond_0
    return-void
.end method

.method public get(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TID;)TT;"
        }
    .end annotation

    .prologue
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, id:Ljava/lang/Object;,"TID;"
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v2

    .line 57
    .local v2, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-nez v2, :cond_1

    .line 71
    :cond_0
    :goto_0
    return-object v0

    .line 60
    :cond_1
    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/Reference;

    .line 61
    .local v3, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Ljava/lang/Object;>;"
    if-eqz v3, :cond_0

    .line 64
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 65
    .local v1, obj:Ljava/lang/Object;
    if-nez v1, :cond_2

    .line 66
    invoke-interface {v2, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 70
    :cond_2
    move-object v0, v1

    .line 71
    .local v0, castObj:Ljava/lang/Object;,"TT;"
    goto :goto_0
.end method

.method public put(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TID;TT;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, id:Ljava/lang/Object;,"TID;"
    .local p3, data:Ljava/lang/Object;,"TT;"
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 77
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-eqz v0, :cond_0

    .line 78
    iget-boolean v1, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->useWeak:Z

    if-eqz v1, :cond_1

    .line 79
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 81
    :cond_1
    new-instance v1, Ljava/lang/ref/SoftReference;

    invoke-direct {v1, p3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public declared-synchronized registerClass(Ljava/lang/Class;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 49
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-nez v0, :cond_0

    .line 50
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .end local v0           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 51
    .restart local v0       #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    iget-object v1, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    :cond_0
    monitor-exit p0

    return-void

    .line 48
    .end local v0           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public remove(Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TID;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, id:Ljava/lang/Object;,"TID;"
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 101
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-eqz v0, :cond_0

    .line 102
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    :cond_0
    return-void
.end method

.method public size(Ljava/lang/Class;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 123
    .local v0, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-nez v0, :cond_0

    .line 124
    const/4 v1, 0x0

    .line 126
    :goto_0
    return v1

    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    goto :goto_0
.end method

.method public sizeAll()I
    .locals 4

    .prologue
    .line 131
    const/4 v2, 0x0

    .line 132
    .local v2, size:I
    iget-object v3, p0, Lcom/j256/ormlite/dao/ReferenceObjectCache;->classMaps:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 133
    .local v1, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0

    .line 135
    .end local v1           #objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    :cond_0
    return v2
.end method

.method public updateId(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "ID:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TID;TID;)TT;"
        }
    .end annotation

    .prologue
    .local p1, clazz:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, oldId:Ljava/lang/Object;,"TID;"
    .local p3, newId:Ljava/lang/Object;,"TID;"
    const/4 v0, 0x0

    .line 107
    invoke-direct {p0, p1}, Lcom/j256/ormlite/dao/ReferenceObjectCache;->getMapForClass(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v1

    .line 108
    .local v1, objectMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/Reference<Ljava/lang/Object;>;>;"
    if-nez v1, :cond_1

    .line 118
    :cond_0
    :goto_0
    return-object v0

    .line 111
    :cond_1
    invoke-interface {v1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/Reference;

    .line 112
    .local v2, ref:Ljava/lang/ref/Reference;,"Ljava/lang/ref/Reference<Ljava/lang/Object;>;"
    if-eqz v2, :cond_0

    .line 115
    invoke-interface {v1, p3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 118
    .local v0, castObj:Ljava/lang/Object;,"TT;"
    goto :goto_0
.end method
