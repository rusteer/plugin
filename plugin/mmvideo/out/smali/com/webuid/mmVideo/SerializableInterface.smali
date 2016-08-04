.class public Lcom/webuid/mmVideo/SerializableInterface;
.super Ljava/lang/Object;
.source "SerializableInterface.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static deserialize([B)Ljava/util/HashMap;
    .locals 5
    .parameter "bytes"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 37
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 38
    .local v3, mem_in:Ljava/io/ByteArrayInputStream;
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 40
    .local v2, in:Ljava/io/ObjectInputStream;
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 42
    .local v1, hashMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    .line 43
    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_0
    .catch Ljava/io/StreamCorruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 51
    .end local v1           #hashMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2           #in:Ljava/io/ObjectInputStream;
    .end local v3           #mem_in:Ljava/io/ByteArrayInputStream;
    :goto_0
    return-object v1

    .line 46
    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/StreamCorruptedException;
    move-object v1, v4

    .line 47
    goto :goto_0

    .line 48
    .end local v0           #e:Ljava/io/StreamCorruptedException;
    :catch_1
    move-exception v0

    .local v0, e:Ljava/lang/ClassNotFoundException;
    move-object v1, v4

    .line 49
    goto :goto_0

    .line 50
    .end local v0           #e:Ljava/lang/ClassNotFoundException;
    :catch_2
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    move-object v1, v4

    .line 51
    goto :goto_0
.end method

.method public static serialize(Ljava/util/HashMap;)[B
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, hashMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 21
    .local v2, mem_out:Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 23
    .local v3, out:Ljava/io/ObjectOutputStream;
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 25
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    .line 26
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 28
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 31
    .end local v2           #mem_out:Ljava/io/ByteArrayOutputStream;
    .end local v3           #out:Ljava/io/ObjectOutputStream;
    :goto_0
    return-object v0

    .line 30
    :catch_0
    move-exception v1

    .line 31
    .local v1, e:Ljava/io/IOException;
    const/4 v0, 0x0

    goto :goto_0
.end method
