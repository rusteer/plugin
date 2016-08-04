.class public Lcom/webuid/mmVideo/ImageManager;
.super Ljava/lang/Object;
.source "ImageManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;,
        Lcom/webuid/mmVideo/ImageManager$ImageQueue;,
        Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;,
        Lcom/webuid/mmVideo/ImageManager$ImageRef;
    }
.end annotation


# instance fields
.field private cacheDir:Ljava/io/File;

.field private cacheDuration:J

.field private imageLoaderThread:Ljava/lang/Thread;

.field private imageMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

.field private mDateFormatter:Ljava/text/DateFormat;


# direct methods
.method public constructor <init>(Landroid/content/Context;J)V
    .locals 5
    .parameter "context"
    .parameter "_cacheDuration"

    .prologue
    const/4 v4, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;

    .line 34
    new-instance v2, Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    invoke-direct {v2, p0, v4}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;-><init>(Lcom/webuid/mmVideo/ImageManager;Lcom/webuid/mmVideo/ImageManager$ImageQueue;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    .line 35
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;

    invoke-direct {v3, p0, v4}, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;-><init>(Lcom/webuid/mmVideo/ImageManager;Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->imageLoaderThread:Ljava/lang/Thread;

    .line 39
    iput-wide p2, p0, Lcom/webuid/mmVideo/ImageManager;->cacheDuration:J

    .line 42
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "EEE, dd MMM yyyy HH:mm:ss zzz"

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->mDateFormatter:Ljava/text/DateFormat;

    .line 47
    iget-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->imageLoaderThread:Ljava/lang/Thread;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setPriority(I)V

    .line 50
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    .line 51
    .local v1, sdState:Ljava/lang/String;
    const-string v2, "mounted"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 52
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 53
    .local v0, sdDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "data/mmVideo"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->cacheDir:Ljava/io/File;

    .line 58
    .end local v0           #sdDir:Ljava/io/File;
    :goto_0
    iget-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->cacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 59
    iget-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->cacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 61
    :cond_0
    return-void

    .line 55
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/webuid/mmVideo/ImageManager;->cacheDir:Ljava/io/File;

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/ImageManager;)Ljava/util/HashMap;
    .locals 1
    .parameter

    .prologue
    .line 31
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;

    return-object v0
.end method

.method private queueImage(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 3
    .parameter "url"
    .parameter "imageView"
    .parameter "defaultDrawableId"

    .prologue
    .line 83
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    invoke-virtual {v1, p2}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->Clean(Landroid/widget/ImageView;)V

    .line 84
    new-instance v0, Lcom/webuid/mmVideo/ImageManager$ImageRef;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/webuid/mmVideo/ImageManager$ImageRef;-><init>(Lcom/webuid/mmVideo/ImageManager;Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 86
    .local v0, p:Lcom/webuid/mmVideo/ImageManager$ImageRef;
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v1}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v2

    monitor-enter v2

    .line 87
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v1}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v1}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 86
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageLoaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v1

    sget-object v2, Ljava/lang/Thread$State;->NEW:Ljava/lang/Thread$State;

    if-ne v1, v2, :cond_0

    .line 93
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageLoaderThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 95
    :cond_0
    return-void

    .line 86
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private writeFile(Landroid/graphics/Bitmap;Ljava/io/File;)V
    .locals 5
    .parameter "bmp"
    .parameter "f"

    .prologue
    .line 150
    const/4 v1, 0x0

    .line 152
    .local v1, out:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v1           #out:Ljava/io/FileOutputStream;
    .local v2, out:Ljava/io/FileOutputStream;
    :try_start_1
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x50

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 158
    if-eqz v2, :cond_2

    .line 159
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object v1, v2

    .line 163
    .end local v2           #out:Ljava/io/FileOutputStream;
    .restart local v1       #out:Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 155
    .local v0, e:Ljava/lang/Exception;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 158
    if-eqz v1, :cond_0

    .line 159
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 160
    :catch_1
    move-exception v3

    goto :goto_0

    .line 156
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    .line 158
    :goto_2
    if-eqz v1, :cond_1

    .line 159
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 162
    :cond_1
    :goto_3
    throw v3

    .line 160
    .end local v1           #out:Ljava/io/FileOutputStream;
    .restart local v2       #out:Ljava/io/FileOutputStream;
    :catch_2
    move-exception v3

    move-object v1, v2

    .end local v2           #out:Ljava/io/FileOutputStream;
    .restart local v1       #out:Ljava/io/FileOutputStream;
    goto :goto_0

    :catch_3
    move-exception v4

    goto :goto_3

    .line 156
    .end local v1           #out:Ljava/io/FileOutputStream;
    .restart local v2       #out:Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2           #out:Ljava/io/FileOutputStream;
    .restart local v1       #out:Ljava/io/FileOutputStream;
    goto :goto_2

    .line 154
    .end local v1           #out:Ljava/io/FileOutputStream;
    .restart local v2       #out:Ljava/io/FileOutputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2           #out:Ljava/io/FileOutputStream;
    .restart local v1       #out:Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v1           #out:Ljava/io/FileOutputStream;
    .restart local v2       #out:Ljava/io/FileOutputStream;
    :cond_2
    move-object v1, v2

    .end local v2           #out:Ljava/io/FileOutputStream;
    .restart local v1       #out:Ljava/io/FileOutputStream;
    goto :goto_0
.end method


# virtual methods
.method public displayImage(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 2
    .parameter "url"
    .parameter "imageView"
    .parameter "defaultDrawableId"

    .prologue
    .line 65
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 67
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 68
    invoke-direct {p0, p1, p2, p3}, Lcom/webuid/mmVideo/ImageManager;->queueImage(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 69
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 77
    .end local v0           #bm:Landroid/graphics/Bitmap;
    :goto_0
    return-void

    .line 71
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    :cond_0
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 74
    .end local v0           #bm:Landroid/graphics/Bitmap;
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/webuid/mmVideo/ImageManager;->queueImage(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 75
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 19
    .parameter "url"

    .prologue
    .line 99
    const/4 v14, 0x0

    .line 100
    .local v14, openConnection:Ljava/net/URLConnection;
    :try_start_0
    const-string v10, ""

    .line 101
    .local v10, filename:Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v15

    const/16 v16, 0xa

    move/from16 v0, v16

    if-le v15, v0, :cond_0

    .line 102
    const-string v15, "/"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v15

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 107
    new-instance v3, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/webuid/mmVideo/ImageManager;->cacheDir:Ljava/io/File;

    invoke-direct {v3, v15, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 108
    .local v3, bitmapFile:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 109
    .local v2, bitmap:Landroid/graphics/Bitmap;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 110
    .local v6, currentTimeMillis:J
    const-string v15, "getBitmap"

    invoke-static {v15, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    if-eqz v2, :cond_2

    .line 114
    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 115
    .local v4, bitmapTimeMillis:J
    sub-long v15, v6, v4

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/webuid/mmVideo/ImageManager;->cacheDuration:J

    move-wide/from16 v17, v0

    cmp-long v15, v15, v17

    if-gez v15, :cond_1

    .line 145
    .end local v2           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #bitmapFile:Ljava/io/File;
    .end local v4           #bitmapTimeMillis:J
    .end local v6           #currentTimeMillis:J
    .end local v10           #filename:Ljava/lang/String;
    :goto_0
    return-object v2

    .line 104
    .restart local v10       #filename:Ljava/lang/String;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 118
    .restart local v2       #bitmap:Landroid/graphics/Bitmap;
    .restart local v3       #bitmapFile:Ljava/io/File;
    .restart local v4       #bitmapTimeMillis:J
    .restart local v6       #currentTimeMillis:J
    :cond_1
    const-string v15, "getBitmap"

    const-string v16, "getnew"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    new-instance v15, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v14

    .line 122
    const-string v15, "Last-Modified"

    invoke-virtual {v14, v15}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 125
    .local v11, lastMod:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/webuid/mmVideo/ImageManager;->mDateFormatter:Ljava/text/DateFormat;

    invoke-virtual {v15, v11}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    .line 127
    .local v8, d1:Ljava/util/Date;
    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    .line 129
    .local v12, lastModTimeMillis:J
    cmp-long v15, v12, v4

    if-gtz v15, :cond_2

    .line 131
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/webuid/mmVideo/ImageManager;->writeFile(Landroid/graphics/Bitmap;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 143
    .end local v2           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #bitmapFile:Ljava/io/File;
    .end local v4           #bitmapTimeMillis:J
    .end local v6           #currentTimeMillis:J
    .end local v8           #d1:Ljava/util/Date;
    .end local v10           #filename:Ljava/lang/String;
    .end local v11           #lastMod:Ljava/lang/String;
    .end local v12           #lastModTimeMillis:J
    :catch_0
    move-exception v9

    .line 144
    .local v9, ex:Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 145
    const/4 v2, 0x0

    goto :goto_0

    .line 135
    .end local v9           #ex:Ljava/lang/Exception;
    .restart local v2       #bitmap:Landroid/graphics/Bitmap;
    .restart local v3       #bitmapFile:Ljava/io/File;
    .restart local v6       #currentTimeMillis:J
    .restart local v10       #filename:Ljava/lang/String;
    :cond_2
    if-nez v14, :cond_3

    .line 136
    :try_start_1
    new-instance v15, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v14

    .line 139
    :cond_3
    invoke-virtual {v14}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v15

    invoke-static {v15}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 141
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/webuid/mmVideo/ImageManager;->writeFile(Landroid/graphics/Bitmap;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
