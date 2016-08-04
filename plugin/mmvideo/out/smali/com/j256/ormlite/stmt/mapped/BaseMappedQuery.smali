.class public abstract Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;
.super Lcom/j256/ormlite/stmt/mapped/BaseMappedStatement;
.source "BaseMappedQuery.java"

# interfaces
.implements Lcom/j256/ormlite/stmt/GenericRowMapper;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "ID:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/j256/ormlite/stmt/mapped/BaseMappedStatement",
        "<TT;TID;>;",
        "Lcom/j256/ormlite/stmt/GenericRowMapper",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private columnPositions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private parent:Ljava/lang/Object;

.field private parentId:Ljava/lang/Object;

.field protected final resultsFieldTypes:[Lcom/j256/ormlite/field/FieldType;


# direct methods
.method protected constructor <init>(Lcom/j256/ormlite/table/TableInfo;Ljava/lang/String;[Lcom/j256/ormlite/field/FieldType;[Lcom/j256/ormlite/field/FieldType;)V
    .locals 1
    .parameter
    .parameter "statement"
    .parameter "argFieldTypes"
    .parameter "resultsFieldTypes"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/table/TableInfo",
            "<TT;TID;>;",
            "Ljava/lang/String;",
            "[",
            "Lcom/j256/ormlite/field/FieldType;",
            "[",
            "Lcom/j256/ormlite/field/FieldType;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, this:Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;,"Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery<TT;TID;>;"
    .local p1, tableInfo:Lcom/j256/ormlite/table/TableInfo;,"Lcom/j256/ormlite/table/TableInfo<TT;TID;>;"
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/j256/ormlite/stmt/mapped/BaseMappedStatement;-><init>(Lcom/j256/ormlite/table/TableInfo;Ljava/lang/String;[Lcom/j256/ormlite/field/FieldType;)V

    .line 23
    iput-object v0, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->columnPositions:Ljava/util/Map;

    .line 24
    iput-object v0, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parent:Ljava/lang/Object;

    .line 25
    iput-object v0, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parentId:Ljava/lang/Object;

    .line 30
    iput-object p4, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->resultsFieldTypes:[Lcom/j256/ormlite/field/FieldType;

    .line 31
    return-void
.end method


# virtual methods
.method public mapRow(Lcom/j256/ormlite/support/DatabaseResults;)Ljava/lang/Object;
    .locals 14
    .parameter "results"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/DatabaseResults;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 35
    .local p0, this:Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;,"Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery<TT;TID;>;"
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->columnPositions:Ljava/util/Map;

    if-nez v12, :cond_0

    .line 36
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 41
    .local v2, colPosMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_0
    invoke-interface {p1}, Lcom/j256/ormlite/support/DatabaseResults;->getObjectCache()Lcom/j256/ormlite/dao/ObjectCache;

    move-result-object v10

    .line 42
    .local v10, objectCache:Lcom/j256/ormlite/dao/ObjectCache;
    if-eqz v10, :cond_1

    .line 43
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->idField:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v12, p1, v2}, Lcom/j256/ormlite/field/FieldType;->resultToJava(Lcom/j256/ormlite/support/DatabaseResults;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v7

    .line 44
    .local v7, id:Ljava/lang/Object;
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->clazz:Ljava/lang/Class;

    invoke-interface {v10, v12, v7}, Lcom/j256/ormlite/dao/ObjectCache;->get(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 45
    .local v1, cachedInstance:Ljava/lang/Object;,"TT;"
    if-eqz v1, :cond_1

    .line 96
    .end local v1           #cachedInstance:Ljava/lang/Object;,"TT;"
    .end local v7           #id:Ljava/lang/Object;
    :goto_1
    return-object v1

    .line 38
    .end local v2           #colPosMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v10           #objectCache:Lcom/j256/ormlite/dao/ObjectCache;
    :cond_0
    iget-object v2, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->columnPositions:Ljava/util/Map;

    .restart local v2       #colPosMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 52
    .restart local v10       #objectCache:Lcom/j256/ormlite/dao/ObjectCache;
    :cond_1
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->tableInfo:Lcom/j256/ormlite/table/TableInfo;

    invoke-virtual {v12}, Lcom/j256/ormlite/table/TableInfo;->createObject()Ljava/lang/Object;

    move-result-object v8

    .line 54
    .local v8, instance:Ljava/lang/Object;,"TT;"
    const/4 v7, 0x0

    .line 55
    .restart local v7       #id:Ljava/lang/Object;
    const/4 v5, 0x0

    .line 56
    .local v5, foreignCollections:Z
    iget-object v0, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->resultsFieldTypes:[Lcom/j256/ormlite/field/FieldType;

    .local v0, arr$:[Lcom/j256/ormlite/field/FieldType;
    array-length v9, v0

    .local v9, len$:I
    const/4 v6, 0x0

    .end local v7           #id:Ljava/lang/Object;
    .local v6, i$:I
    :goto_2
    if-ge v6, v9, :cond_5

    aget-object v4, v0, v6

    .line 57
    .local v4, fieldType:Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v4}, Lcom/j256/ormlite/field/FieldType;->isForeignCollection()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 58
    const/4 v5, 0x1

    .line 56
    :cond_2
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 60
    :cond_3
    invoke-virtual {v4, p1, v2}, Lcom/j256/ormlite/field/FieldType;->resultToJava(Lcom/j256/ormlite/support/DatabaseResults;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v11

    .line 67
    .local v11, val:Ljava/lang/Object;
    if-eqz v11, :cond_4

    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parent:Ljava/lang/Object;

    if-eqz v12, :cond_4

    invoke-virtual {v4}, Lcom/j256/ormlite/field/FieldType;->getField()Ljava/lang/reflect/Field;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v12

    iget-object v13, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parent:Ljava/lang/Object;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    if-ne v12, v13, :cond_4

    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parentId:Ljava/lang/Object;

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 69
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parent:Ljava/lang/Object;

    const/4 v13, 0x1

    invoke-virtual {v4, v8, v12, v13, v10}, Lcom/j256/ormlite/field/FieldType;->assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V

    .line 73
    :goto_4
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->idField:Lcom/j256/ormlite/field/FieldType;

    if-ne v4, v12, :cond_2

    .line 74
    move-object v7, v11

    .restart local v7       #id:Ljava/lang/Object;
    goto :goto_3

    .line 71
    .end local v7           #id:Ljava/lang/Object;
    :cond_4
    const/4 v12, 0x0

    invoke-virtual {v4, v8, v11, v12, v10}, Lcom/j256/ormlite/field/FieldType;->assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V

    goto :goto_4

    .line 78
    .end local v4           #fieldType:Lcom/j256/ormlite/field/FieldType;
    .end local v11           #val:Ljava/lang/Object;
    :cond_5
    if-eqz v5, :cond_7

    .line 80
    iget-object v0, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->resultsFieldTypes:[Lcom/j256/ormlite/field/FieldType;

    array-length v9, v0

    const/4 v6, 0x0

    :goto_5
    if-ge v6, v9, :cond_7

    aget-object v4, v0, v6

    .line 81
    .restart local v4       #fieldType:Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v4}, Lcom/j256/ormlite/field/FieldType;->isForeignCollection()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 82
    const/4 v12, 0x0

    invoke-virtual {v4, v8, v7, v12}, Lcom/j256/ormlite/field/FieldType;->buildForeignCollection(Ljava/lang/Object;Ljava/lang/Object;Z)Lcom/j256/ormlite/dao/BaseForeignCollection;

    move-result-object v3

    .line 83
    .local v3, collection:Lcom/j256/ormlite/dao/BaseForeignCollection;,"Lcom/j256/ormlite/dao/BaseForeignCollection<**>;"
    if-eqz v3, :cond_6

    .line 84
    const/4 v12, 0x0

    invoke-virtual {v4, v8, v3, v12, v10}, Lcom/j256/ormlite/field/FieldType;->assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V

    .line 80
    .end local v3           #collection:Lcom/j256/ormlite/dao/BaseForeignCollection;,"Lcom/j256/ormlite/dao/BaseForeignCollection<**>;"
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 90
    .end local v4           #fieldType:Lcom/j256/ormlite/field/FieldType;
    :cond_7
    if-eqz v10, :cond_8

    if-eqz v7, :cond_8

    .line 91
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->clazz:Ljava/lang/Class;

    invoke-interface {v10, v12, v7, v8}, Lcom/j256/ormlite/dao/ObjectCache;->put(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    :cond_8
    iget-object v12, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->columnPositions:Ljava/util/Map;

    if-nez v12, :cond_9

    .line 94
    iput-object v2, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->columnPositions:Ljava/util/Map;

    :cond_9
    move-object v1, v8

    .line 96
    goto :goto_1
.end method

.method public setParentInformation(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "parent"
    .parameter "parentId"

    .prologue
    .line 103
    .local p0, this:Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;,"Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery<TT;TID;>;"
    iput-object p1, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parent:Ljava/lang/Object;

    .line 104
    iput-object p2, p0, Lcom/j256/ormlite/stmt/mapped/BaseMappedQuery;->parentId:Ljava/lang/Object;

    .line 105
    return-void
.end method
