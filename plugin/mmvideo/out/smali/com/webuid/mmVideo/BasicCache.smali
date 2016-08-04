.class public Lcom/webuid/mmVideo/BasicCache;
.super Ljava/lang/Object;
.source "BasicCache.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BasicCache"

.field private static bc:Lcom/webuid/mmVideo/BasicCache;


# instance fields
.field private cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/BasicCache;->cache:Ljava/util/Map;

    .line 67
    return-void
.end method

.method private getDrawable(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .parameter "imageUrl"
    .parameter "context"

    .prologue
    .line 359
    const/4 v0, 0x0

    .line 360
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v1

    invoke-virtual {v1, p2, p1}, Lcom/webuid/mmVideo/BasicCache;->loadImageFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 361
    return-object v0
.end method

.method public static getInstance()Lcom/webuid/mmVideo/BasicCache;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/webuid/mmVideo/BasicCache;->bc:Lcom/webuid/mmVideo/BasicCache;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Lcom/webuid/mmVideo/BasicCache;

    invoke-direct {v0}, Lcom/webuid/mmVideo/BasicCache;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/BasicCache;->bc:Lcom/webuid/mmVideo/BasicCache;

    .line 73
    :cond_0
    sget-object v0, Lcom/webuid/mmVideo/BasicCache;->bc:Lcom/webuid/mmVideo/BasicCache;

    return-object v0
.end method


# virtual methods
.method public clearCache()V
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Lcom/webuid/mmVideo/BasicCache;->cache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 328
    return-void
.end method

.method public download(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "urlStr"

    .prologue
    .line 294
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 295
    .local v4, sb:Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .line 296
    .local v3, line:Ljava/lang/String;
    const/4 v0, 0x0

    .line 299
    .local v0, buffer:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 301
    .local v5, url:Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 303
    .local v6, urlConn:Ljava/net/HttpURLConnection;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 305
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .local v1, buffer:Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    if-nez v3, :cond_0

    .line 313
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 314
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "down--close--"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v0, v1

    .line 320
    .end local v1           #buffer:Ljava/io/BufferedReader;
    .end local v5           #url:Ljava/net/URL;
    .end local v6           #urlConn:Ljava/net/HttpURLConnection;
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 306
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .restart local v1       #buffer:Ljava/io/BufferedReader;
    .restart local v5       #url:Ljava/net/URL;
    .restart local v6       #urlConn:Ljava/net/HttpURLConnection;
    :cond_0
    :try_start_3
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 308
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 309
    .end local v1           #buffer:Ljava/io/BufferedReader;
    .end local v5           #url:Ljava/net/URL;
    .end local v6           #urlConn:Ljava/net/HttpURLConnection;
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    .local v2, e:Ljava/lang/Exception;
    :goto_2
    :try_start_4
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "down--debug1--"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 310
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 313
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 314
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "down--close--"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 315
    :catch_1
    move-exception v2

    .line 316
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "down--debug2--"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 317
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 311
    .end local v2           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    .line 313
    :goto_3
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 314
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "down--close--"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 319
    :goto_4
    throw v7

    .line 315
    :catch_2
    move-exception v2

    .line 316
    .restart local v2       #e:Ljava/lang/Exception;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "down--debug2--"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 317
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 315
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v1       #buffer:Ljava/io/BufferedReader;
    .restart local v5       #url:Ljava/net/URL;
    .restart local v6       #urlConn:Ljava/net/HttpURLConnection;
    :catch_3
    move-exception v2

    .line 316
    .restart local v2       #e:Ljava/lang/Exception;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "down--debug2--"

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 317
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v1

    .end local v1           #buffer:Ljava/io/BufferedReader;
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    goto :goto_1

    .line 311
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v1       #buffer:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v7

    move-object v0, v1

    .end local v1           #buffer:Ljava/io/BufferedReader;
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    goto :goto_3

    .line 308
    .end local v5           #url:Ljava/net/URL;
    .end local v6           #urlConn:Ljava/net/HttpURLConnection;
    :catch_4
    move-exception v2

    goto :goto_2
.end method

.method public getMD5Str(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "str"

    .prologue
    .line 334
    const/4 v4, 0x0

    .line 336
    .local v4, messageDigest:Ljava/security/MessageDigest;
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    .line 337
    invoke-virtual {v4}, Ljava/security/MessageDigest;->reset()V

    .line 338
    const-string v5, "UTF-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->update([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 345
    :goto_0
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 346
    .local v0, byteArray:[B
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 347
    .local v3, md5StrBuff:Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v5, v0

    if-lt v2, v5, :cond_0

    .line 354
    const/16 v5, 0x8

    const/16 v6, 0x18

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 339
    .end local v0           #byteArray:[B
    .end local v2           #i:I
    .end local v3           #md5StrBuff:Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 340
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "NoSuchAlgorithmException caught!"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 341
    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 342
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 343
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 348
    .end local v1           #e:Ljava/io/UnsupportedEncodingException;
    .restart local v0       #byteArray:[B
    .restart local v2       #i:I
    .restart local v3       #md5StrBuff:Ljava/lang/StringBuffer;
    :cond_0
    aget-byte v5, v0, v2

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 349
    const-string v5, "0"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    aget-byte v6, v0, v2

    and-int/lit16 v6, v6, 0xff

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 351
    :cond_1
    aget-byte v5, v0, v2

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .parameter "key"

    .prologue
    const/4 v2, 0x0

    .line 84
    :try_start_0
    iget-object v3, p0, Lcom/webuid/mmVideo/BasicCache;->cache:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 85
    .local v1, value:Ljava/lang/Object;
    if-nez v1, :cond_0

    move-object v1, v2

    .line 94
    .end local v1           #value:Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v1

    .line 90
    :catch_0
    move-exception v0

    .line 92
    .local v0, e:Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-object v1, v2

    .line 94
    goto :goto_0
.end method

.method public getValue(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/Object;
    .locals 8
    .parameter "key"
    .parameter "context"

    .prologue
    .line 108
    :try_start_0
    const-string v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, NL:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".cache"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v2

    .line 110
    .local v2, fi:Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 111
    .local v3, new_br:Ljava/io/BufferedReader;
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, ""

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 112
    .local v5, new_sb:Ljava/lang/StringBuffer;
    const-string v4, ""

    .line 113
    .local v4, new_line:Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 116
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 117
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 122
    .end local v0           #NL:Ljava/lang/String;
    .end local v2           #fi:Ljava/io/FileInputStream;
    .end local v3           #new_br:Ljava/io/BufferedReader;
    .end local v4           #new_line:Ljava/lang/String;
    .end local v5           #new_sb:Ljava/lang/StringBuffer;
    :goto_1
    return-object v6

    .line 114
    .restart local v0       #NL:Ljava/lang/String;
    .restart local v2       #fi:Ljava/io/FileInputStream;
    .restart local v3       #new_br:Ljava/io/BufferedReader;
    .restart local v4       #new_line:Ljava/lang/String;
    .restart local v5       #new_sb:Ljava/lang/StringBuffer;
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    .end local v0           #NL:Ljava/lang/String;
    .end local v2           #fi:Ljava/io/FileInputStream;
    .end local v3           #new_br:Ljava/io/BufferedReader;
    .end local v4           #new_line:Ljava/lang/String;
    .end local v5           #new_sb:Ljava/lang/StringBuffer;
    :catch_0
    move-exception v1

    .line 120
    .local v1, e:Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 122
    const/4 v6, 0x0

    goto :goto_1
.end method

.method public loadBitmapFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 12
    .parameter "context"
    .parameter "imageUrl"

    .prologue
    const/4 v9, 0x0

    .line 199
    const/4 v0, 0x0

    .line 200
    .local v0, bmp:Landroid/graphics/Bitmap;
    if-nez p2, :cond_1

    .line 241
    :cond_0
    :goto_0
    return-object v9

    .line 202
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v11, 0x8

    if-lt v10, v11, :cond_0

    .line 203
    const-string v5, ""

    .line 204
    .local v5, imagePath:Ljava/lang/String;
    const-string v3, ""

    .line 206
    .local v3, fileName:Ljava/lang/String;
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_2

    .line 207
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "bmp_"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/"

    invoke-virtual {p2, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {p2, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 210
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 212
    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v2, v9, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 214
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_4

    .line 217
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 218
    .local v4, fos:Ljava/io/FileOutputStream;
    new-instance v9, Ljava/net/URL;

    invoke-direct {v9, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v6

    .line 221
    .local v6, is:Ljava/io/InputStream;
    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 222
    .local v1, data:I
    :goto_1
    const/4 v9, -0x1

    if-ne v1, v9, :cond_3

    .line 226
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 227
    new-instance v7, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v7}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 228
    .local v7, o:Landroid/graphics/BitmapFactory$Options;
    const/4 v9, 0x1

    iput-boolean v9, v7, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 229
    new-instance v8, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v8}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 230
    .local v8, o2:Landroid/graphics/BitmapFactory$Options;
    const/4 v9, 0x1

    iput v9, v8, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 231
    const/4 v9, 0x0

    invoke-static {v6, v9, v8}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 232
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .end local v1           #data:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v6           #is:Ljava/io/InputStream;
    .end local v7           #o:Landroid/graphics/BitmapFactory$Options;
    .end local v8           #o2:Landroid/graphics/BitmapFactory$Options;
    :goto_2
    move-object v9, v0

    .line 241
    goto/16 :goto_0

    .line 223
    .restart local v1       #data:I
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    .restart local v6       #is:Ljava/io/InputStream;
    :cond_3
    invoke-virtual {v4, v1}, Ljava/io/FileOutputStream;->write(I)V

    .line 224
    invoke-virtual {v6}, Ljava/io/InputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_1

    .line 237
    .end local v1           #data:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v6           #is:Ljava/io/InputStream;
    :cond_4
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2

    .line 233
    :catch_0
    move-exception v9

    goto :goto_2
.end method

.method public loadImageFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 10
    .parameter "context"
    .parameter "imageUrl"

    .prologue
    const/4 v7, 0x0

    .line 152
    const/4 v1, 0x0

    .line 153
    .local v1, drawable:Landroid/graphics/drawable/Drawable;
    if-nez p2, :cond_1

    .line 195
    :cond_0
    :goto_0
    return-object v7

    .line 155
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x8

    if-lt v8, v9, :cond_0

    .line 156
    const-string v5, ""

    .line 157
    .local v5, imagePath:Ljava/lang/String;
    const-string v3, ""

    .line 160
    .local v3, fileName:Ljava/lang/String;
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_2

    .line 161
    const-string v7, "/"

    invoke-virtual {p2, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 165
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 168
    new-instance v2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    invoke-direct {v2, v7, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v2, file:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_4

    .line 173
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 174
    .local v4, fos:Ljava/io/FileOutputStream;
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v6

    .line 177
    .local v6, is:Ljava/io/InputStream;
    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 178
    .local v0, data:I
    :goto_1
    const/4 v7, -0x1

    if-ne v0, v7, :cond_3

    .line 182
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 183
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 186
    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .end local v0           #data:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v6           #is:Ljava/io/InputStream;
    :goto_2
    move-object v7, v1

    .line 195
    goto :goto_0

    .line 179
    .restart local v0       #data:I
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    .restart local v6       #is:Ljava/io/InputStream;
    :cond_3
    invoke-virtual {v4, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 180
    invoke-virtual {v6}, Ljava/io/InputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_1

    .line 192
    .end local v0           #data:I
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .end local v6           #is:Ljava/io/InputStream;
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_2

    .line 188
    :catch_0
    move-exception v7

    goto :goto_2
.end method

.method public loadImageFromUrl2(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 8
    .parameter "context"
    .parameter "imageUrl"

    .prologue
    const/4 v5, 0x0

    .line 246
    const/4 v0, 0x0

    .line 247
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-nez p2, :cond_1

    .line 289
    :cond_0
    :goto_0
    return-object v5

    .line 249
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0x8

    if-lt v6, v7, :cond_0

    .line 250
    const-string v4, ""

    .line 251
    .local v4, imagePath:Ljava/lang/String;
    const-string v2, ""

    .line 254
    .local v2, fileName:Ljava/lang/String;
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_2

    .line 255
    const-string v5, "/"

    invoke-virtual {p2, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 259
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 262
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v1, v5, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 264
    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_3

    .line 267
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 269
    .local v3, fos:Ljava/io/FileOutputStream;
    invoke-virtual {p0, p2}, Lcom/webuid/mmVideo/BasicCache;->download(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 276
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 280
    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .end local v3           #fos:Ljava/io/FileOutputStream;
    :goto_1
    move-object v5, v0

    .line 289
    goto :goto_0

    .line 286
    :cond_3
    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1

    .line 282
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .parameter "key"
    .parameter "obj"

    .prologue
    .line 99
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/BasicCache;->cache:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    :goto_0
    return-void

    .line 100
    :catch_0
    move-exception v0

    .line 102
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V
    .locals 4
    .parameter "key"
    .parameter "obj"
    .parameter "context"

    .prologue
    .line 128
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cache"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p3, v2, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 129
    .local v1, fo:Ljava/io/FileOutputStream;
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 130
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 131
    invoke-virtual {p0, p1, p2}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .end local v1           #fo:Ljava/io/FileOutputStream;
    :goto_0
    return-void

    .line 144
    :catch_0
    move-exception v0

    .line 146
    .local v0, e:Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method
