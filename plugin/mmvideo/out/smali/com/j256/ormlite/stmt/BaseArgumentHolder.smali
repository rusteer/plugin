.class public abstract Lcom/j256/ormlite/stmt/BaseArgumentHolder;
.super Ljava/lang/Object;
.source "BaseArgumentHolder.java"

# interfaces
.implements Lcom/j256/ormlite/stmt/ArgumentHolder;


# instance fields
.field private columnName:Ljava/lang/String;

.field private fieldType:Lcom/j256/ormlite/field/FieldType;

.field private sqlType:Lcom/j256/ormlite/field/SqlType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    .line 17
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->sqlType:Lcom/j256/ormlite/field/SqlType;

    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/j256/ormlite/field/SqlType;)V
    .locals 1
    .parameter "sqlType"

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    .line 17
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->sqlType:Lcom/j256/ormlite/field/SqlType;

    .line 28
    iput-object p1, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->sqlType:Lcom/j256/ormlite/field/SqlType;

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "columName"

    .prologue
    const/4 v0, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    .line 17
    iput-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->sqlType:Lcom/j256/ormlite/field/SqlType;

    .line 24
    iput-object p1, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    .line 25
    return-void
.end method


# virtual methods
.method public getColumnName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldType()Lcom/j256/ormlite/field/FieldType;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    return-object v0
.end method

.method public getSqlArgValue()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->isValueSet()Z

    move-result v2

    if-nez v2, :cond_0

    .line 78
    new-instance v2, Ljava/sql/SQLException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Column value has not been set for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 81
    .local v1, value:Ljava/lang/Object;
    if-nez v1, :cond_2

    .line 82
    const/4 v1, 0x0

    .line 89
    .end local v1           #value:Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v1

    .line 83
    .restart local v1       #value:Ljava/lang/Object;
    :cond_2
    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    if-eqz v2, :cond_1

    .line 85
    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/FieldType;->isForeign()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/FieldType;->getType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    .line 86
    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/FieldType;->getForeignIdField()Lcom/j256/ormlite/field/FieldType;

    move-result-object v0

    .line 87
    .local v0, idFieldType:Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v0, v1}, Lcom/j256/ormlite/field/FieldType;->extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 89
    .end local v0           #idFieldType:Lcom/j256/ormlite/field/FieldType;
    :cond_3
    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v2, v1}, Lcom/j256/ormlite/field/FieldType;->convertJavaFieldToSqlArgValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getSqlType()Lcom/j256/ormlite/field/SqlType;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->sqlType:Lcom/j256/ormlite/field/SqlType;

    return-object v0
.end method

.method protected abstract getValue()Ljava/lang/Object;
.end method

.method protected abstract isValueSet()Z
.end method

.method public setMetaInfo(Lcom/j256/ormlite/field/FieldType;)V
    .locals 3
    .parameter "fieldType"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    if-nez v0, :cond_1

    .line 68
    :cond_0
    iput-object p1, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    .line 69
    return-void

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    if-eq v0, p1, :cond_0

    .line 65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FieldType name cannot be set twice from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->fieldType:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".  Using a SelectArg twice in query with different columns?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMetaInfo(Ljava/lang/String;)V
    .locals 3
    .parameter "columnName"

    .prologue
    .line 48
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 56
    :cond_0
    iput-object p1, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    .line 57
    return-void

    .line 50
    :cond_1
    iget-object v0, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Column name cannot be set twice from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->columnName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".  Using a SelectArg twice in query with different columns?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMetaInfo(Ljava/lang/String;Lcom/j256/ormlite/field/FieldType;)V
    .locals 0
    .parameter "columnName"
    .parameter "fieldType"

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->setMetaInfo(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0, p2}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->setMetaInfo(Lcom/j256/ormlite/field/FieldType;)V

    .line 74
    return-void
.end method

.method public abstract setValue(Ljava/lang/Object;)V
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->isValueSet()Z

    move-result v2

    if-nez v2, :cond_0

    .line 104
    const-string v2, "[unset]"

    .line 115
    :goto_0
    return-object v2

    .line 108
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/j256/ormlite/stmt/BaseArgumentHolder;->getSqlArgValue()Ljava/lang/Object;

    move-result-object v1

    .line 109
    .local v1, val:Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 110
    const-string v2, "[null]"

    goto :goto_0

    .line 112
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 114
    .end local v1           #val:Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 115
    .local v0, e:Ljava/sql/SQLException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[could not get value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
