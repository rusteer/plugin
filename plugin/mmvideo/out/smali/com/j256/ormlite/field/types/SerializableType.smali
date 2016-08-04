.class public Lcom/j256/ormlite/field/types/SerializableType;
.super Lcom/j256/ormlite/field/types/BaseDataType;
.source "SerializableType.java"


# static fields
.field private static final singleTon:Lcom/j256/ormlite/field/types/SerializableType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lcom/j256/ormlite/field/types/SerializableType;

    invoke-direct {v0}, Lcom/j256/ormlite/field/types/SerializableType;-><init>()V

    sput-object v0, Lcom/j256/ormlite/field/types/SerializableType;->singleTon:Lcom/j256/ormlite/field/types/SerializableType;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 36
    sget-object v0, Lcom/j256/ormlite/field/SqlType;->SERIALIZABLE:Lcom/j256/ormlite/field/SqlType;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/field/types/BaseDataType;-><init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V

    .line 37
    return-void
.end method

.method protected constructor <init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V
    .locals 0
    .parameter "sqlType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/field/SqlType;",
            "[",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p2, classes:[Ljava/lang/Class;,"[Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lcom/j256/ormlite/field/types/BaseDataType;-><init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V

    .line 44
    return-void
.end method

.method public static getSingleton()Lcom/j256/ormlite/field/types/SerializableType;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/j256/ormlite/field/types/SerializableType;->singleTon:Lcom/j256/ormlite/field/types/SerializableType;

    return-object v0
.end method


# virtual methods
.method public isAppropriateId()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public isArgumentHolderRequired()Z
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x1

    return v0
.end method

.method public isComparable()Z
    .locals 1

    .prologue
    .line 115
    const/4 v0, 0x0

    return v0
.end method

.method public isStreamType()Z
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public isValidForField(Ljava/lang/reflect/Field;)Z
    .locals 2
    .parameter "field"

    .prologue
    .line 104
    const-class v0, Ljava/io/Serializable;

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public javaToSqlArg(Lcom/j256/ormlite/field/FieldType;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .parameter "fieldType"
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 82
    .local v1, objOutStream:Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 83
    .local v3, outStream:Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .end local v1           #objOutStream:Ljava/io/ObjectOutputStream;
    .local v2, objOutStream:Ljava/io/ObjectOutputStream;
    :try_start_1
    invoke-virtual {v2, p2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 85
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 86
    const/4 v1, 0x0

    .line 87
    .end local v2           #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v1       #objOutStream:Ljava/io/ObjectOutputStream;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v4

    .line 91
    if-eqz v1, :cond_0

    .line 94
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 97
    :cond_0
    :goto_0
    return-object v4

    .line 88
    .end local v3           #outStream:Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v0

    .line 89
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not write serialized object to byte array: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v4

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 91
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v1, :cond_1

    .line 94
    :try_start_5
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 97
    :cond_1
    :goto_3
    throw v4

    .line 95
    .restart local v3       #outStream:Ljava/io/ByteArrayOutputStream;
    :catch_1
    move-exception v5

    goto :goto_0

    .end local v3           #outStream:Ljava/io/ByteArrayOutputStream;
    :catch_2
    move-exception v5

    goto :goto_3

    .line 91
    .end local v1           #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v2       #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v3       #outStream:Ljava/io/ByteArrayOutputStream;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2           #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v1       #objOutStream:Ljava/io/ObjectOutputStream;
    goto :goto_2

    .line 88
    .end local v1           #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v2       #objOutStream:Ljava/io/ObjectOutputStream;
    :catch_3
    move-exception v0

    move-object v1, v2

    .end local v2           #objOutStream:Ljava/io/ObjectOutputStream;
    .restart local v1       #objOutStream:Ljava/io/ObjectOutputStream;
    goto :goto_1
.end method

.method public parseDefaultString(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .parameter "fieldType"
    .parameter "defaultStr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v0, Ljava/sql/SQLException;

    const-string v1, "Default values for serializable types are not supported"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resultStringToJava(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 2
    .parameter "fieldType"
    .parameter "stringValue"
    .parameter "columnPos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Ljava/sql/SQLException;

    const-string v1, "Serializable type cannot be converted from string to Java"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resultToSqlArg(Lcom/j256/ormlite/field/FieldType;Lcom/j256/ormlite/support/DatabaseResults;I)Ljava/lang/Object;
    .locals 1
    .parameter "fieldType"
    .parameter "results"
    .parameter "columnPos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-interface {p2, p3}, Lcom/j256/ormlite/support/DatabaseResults;->getBytes(I)[B

    move-result-object v0

    return-object v0
.end method

.method public sqlArgToJava(Lcom/j256/ormlite/field/FieldType;Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 6
    .parameter "fieldType"
    .parameter "sqlArg"
    .parameter "columnPos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 58
    check-cast p2, [B

    .end local p2
    move-object v0, p2

    check-cast v0, [B

    .line 59
    .local v0, bytes:[B
    const/4 v2, 0x0

    .line 61
    .local v2, objInStream:Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v3, Ljava/io/ObjectInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v4}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v2           #objInStream:Ljava/io/ObjectInputStream;
    .local v3, objInStream:Ljava/io/ObjectInputStream;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result-object v4

    .line 67
    if-eqz v3, :cond_0

    .line 70
    :try_start_2
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 73
    :cond_0
    :goto_0
    return-object v4

    .line 63
    .end local v3           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v2       #objInStream:Ljava/io/ObjectInputStream;
    :catch_0
    move-exception v1

    .line 64
    .local v1, e:Ljava/lang/Exception;
    :goto_1
    :try_start_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not read serialized object from byte array: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "(len "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v4

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 67
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v2, :cond_1

    .line 70
    :try_start_4
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 73
    :cond_1
    :goto_3
    throw v4

    .line 71
    .end local v2           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v3       #objInStream:Ljava/io/ObjectInputStream;
    :catch_1
    move-exception v5

    goto :goto_0

    .end local v3           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v2       #objInStream:Ljava/io/ObjectInputStream;
    :catch_2
    move-exception v5

    goto :goto_3

    .line 67
    .end local v2           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v3       #objInStream:Ljava/io/ObjectInputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v2       #objInStream:Ljava/io/ObjectInputStream;
    goto :goto_2

    .line 63
    .end local v2           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v3       #objInStream:Ljava/io/ObjectInputStream;
    :catch_3
    move-exception v1

    move-object v2, v3

    .end local v3           #objInStream:Ljava/io/ObjectInputStream;
    .restart local v2       #objInStream:Ljava/io/ObjectInputStream;
    goto :goto_1
.end method
