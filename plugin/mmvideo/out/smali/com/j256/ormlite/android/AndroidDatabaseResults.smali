.class public Lcom/j256/ormlite/android/AndroidDatabaseResults;
.super Ljava/lang/Object;
.source "AndroidDatabaseResults.java"

# interfaces
.implements Lcom/j256/ormlite/support/DatabaseResults;


# static fields
.field private static final MIN_NUM_COLUMN_NAMES_MAP:I = 0x8

.field private static final databaseType:Lcom/j256/ormlite/db/DatabaseType;


# instance fields
.field private final columnNameMap:Ljava/util/Map;
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

.field private final columnNames:[Ljava/lang/String;

.field private final cursor:Landroid/database/Cursor;

.field private final objectCache:Lcom/j256/ormlite/dao/ObjectCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/j256/ormlite/db/SqliteAndroidDatabaseType;

    invoke-direct {v0}, Lcom/j256/ormlite/db/SqliteAndroidDatabaseType;-><init>()V

    sput-object v0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->databaseType:Lcom/j256/ormlite/db/DatabaseType;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;Lcom/j256/ormlite/dao/ObjectCache;)V
    .locals 4
    .parameter "cursor"
    .parameter "objectCache"

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    .line 36
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    .line 37
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    array-length v1, v1

    const/16 v2, 0x8

    if-lt v1, v2, :cond_0

    .line 38
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNameMap:Ljava/util/Map;

    .line 39
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 41
    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNameMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 44
    .end local v0           #i:I
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNameMap:Ljava/util/Map;

    .line 46
    :cond_1
    iput-object p2, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->objectCache:Lcom/j256/ormlite/dao/ObjectCache;

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;ZLcom/j256/ormlite/dao/ObjectCache;)V
    .locals 0
    .parameter "cursor"
    .parameter "firstCall"
    .parameter "objectCache"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0, p1, p3}, Lcom/j256/ormlite/android/AndroidDatabaseResults;-><init>(Landroid/database/Cursor;Lcom/j256/ormlite/dao/ObjectCache;)V

    .line 57
    return-void
.end method

.method private lookupColumn(Ljava/lang/String;)I
    .locals 4
    .parameter "columnName"

    .prologue
    const/4 v2, -0x1

    .line 226
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNameMap:Ljava/util/Map;

    if-nez v3, :cond_2

    .line 227
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_1

    .line 229
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNames:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 240
    .end local v0           #i:I
    :goto_1
    return v0

    .line 227
    .restart local v0       #i:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 233
    goto :goto_1

    .line 236
    .end local v0           #i:I
    :cond_2
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->columnNameMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 237
    .local v1, index:Ljava/lang/Integer;
    if-nez v1, :cond_3

    move v0, v2

    .line 238
    goto :goto_1

    .line 240
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 206
    return-void
.end method

.method public closeQuietly()V
    .locals 0

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->close()V

    .line 210
    return-void
.end method

.method public findColumn(Ljava/lang/String;)I
    .locals 7
    .parameter "columnName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->lookupColumn(Ljava/lang/String;)I

    move-result v1

    .line 112
    .local v1, index:I
    if-ltz v1, :cond_0

    move v2, v1

    .line 125
    .end local v1           #index:I
    .local v2, index:I
    :goto_0
    return v2

    .line 121
    .end local v2           #index:I
    .restart local v1       #index:I
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 122
    .local v3, sb:Ljava/lang/StringBuilder;
    sget-object v4, Lcom/j256/ormlite/android/AndroidDatabaseResults;->databaseType:Lcom/j256/ormlite/db/DatabaseType;

    invoke-interface {v4, v3, p1}, Lcom/j256/ormlite/db/DatabaseType;->appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 123
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->lookupColumn(Ljava/lang/String;)I

    move-result v1

    .line 124
    if-ltz v1, :cond_1

    move v2, v1

    .line 125
    .end local v1           #index:I
    .restart local v2       #index:I
    goto :goto_0

    .line 127
    .end local v2           #index:I
    .restart local v1       #index:I
    :cond_1
    iget-object v4, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v4}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, columnNames:[Ljava/lang/String;
    new-instance v4, Ljava/sql/SQLException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown field \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\' from the Android sqlite cursor, not in:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public first()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    return v0
.end method

.method public getBigDecimal(I)Ljava/math/BigDecimal;
    .locals 2
    .parameter "columnIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 193
    new-instance v0, Ljava/sql/SQLException;

    const-string v1, "Android does not support BigDecimal type.  Use BIG_DECIMAL or BIG_DECIMAL_STRING types"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBlobStream(I)Ljava/io/InputStream;
    .locals 2
    .parameter "columnIndex"

    .prologue
    .line 189
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v1, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getBoolean(I)Z
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 138
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getShort(I)S

    move-result v0

    if-nez v0, :cond_1

    .line 139
    :cond_0
    const/4 v0, 0x0

    .line 141
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getByte(I)B
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->getShort(I)S

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public getBytes(I)[B
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    return-object v0
.end method

.method public getChar(I)C
    .locals 4
    .parameter "columnIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 146
    iget-object v2, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, string:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 150
    :cond_0
    :goto_0
    return v1

    .line 149
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    goto :goto_0

    .line 152
    :cond_2
    new-instance v1, Ljava/sql/SQLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "More than 1 character stored in database column: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getColumnCount()I
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    return v0
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/j256/ormlite/android/AndroidDatabaseResults;->getColumnCount()I

    move-result v1

    .line 65
    .local v1, colN:I
    new-array v2, v1, [Ljava/lang/String;

    .line 66
    .local v2, columnNames:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, colC:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 67
    iget-object v3, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 66
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 69
    :cond_0
    return-object v2
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0
.end method

.method public getDouble(I)D
    .locals 2
    .parameter "columnIndex"

    .prologue
    .line 181
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(I)F
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 177
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 169
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "columnIndex"

    .prologue
    .line 173
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getObjectCache()Lcom/j256/ormlite/dao/ObjectCache;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->objectCache:Lcom/j256/ormlite/dao/ObjectCache;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    return v0
.end method

.method public getRawCursor()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getShort(I)S
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 165
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 134
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimestamp(I)Ljava/sql/Timestamp;
    .locals 2
    .parameter "columnIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 185
    new-instance v0, Ljava/sql/SQLException;

    const-string v1, "Android does not support timestamp.  Use JAVA_DATE_LONG or JAVA_DATE_STRING types"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public last()Z
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    return v0
.end method

.method public moveAbsolute(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 93
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method

.method public moveRelative(I)Z
    .locals 1
    .parameter "offset"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->move(I)Z

    move-result v0

    return v0
.end method

.method public next()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    return v0
.end method

.method public previous()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToPrevious()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public wasNull(I)Z
    .locals 1
    .parameter "columnIndex"

    .prologue
    .line 197
    iget-object v0, p0, Lcom/j256/ormlite/android/AndroidDatabaseResults;->cursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    return v0
.end method
