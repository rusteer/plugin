.class public Lcom/webuid/mmVideo/AsyncImageLoader;
.super Ljava/lang/Object;
.source "AsyncImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/AsyncImageLoader$FlushedInputStream;,
        Lcom/webuid/mmVideo/AsyncImageLoader$ImageCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AsyncImageLoader"


# instance fields
.field private executor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private imageCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/drawable/Drawable;",
            ">;>;"
        }
    .end annotation
.end field

.field private queue:Ljava/util/concurrent/BlockingQueue;


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->imageCache:Ljava/util/HashMap;

    .line 48
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->queue:Ljava/util/concurrent/BlockingQueue;

    .line 49
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const/16 v1, 0xa

    const/16 v2, 0x32

    const-wide/16 v3, 0xb4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v6, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 50
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/AsyncImageLoader;)Ljava/util/HashMap;
    .locals 1
    .parameter

    .prologue
    .line 40
    iget-object v0, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->imageCache:Ljava/util/HashMap;

    return-object v0
.end method

.method public static loadImageFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 11
    .parameter "context"
    .parameter "imageUrl"

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 91
    .local v1, drawable:Landroid/graphics/drawable/Drawable;
    if-nez p1, :cond_0

    .line 92
    const/4 v8, 0x0

    .line 134
    :goto_0
    return-object v8

    .line 93
    :cond_0
    const-string v6, ""

    .line 94
    .local v6, imagePath:Ljava/lang/String;
    const-string v4, ""

    .line 97
    .local v4, fileName:Ljava/lang/String;
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    .line 98
    const-string v8, "/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 102
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 105
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v8

    invoke-direct {v3, v8, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    .local v3, file:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_3

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_3

    .line 112
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 113
    .local v5, fos:Ljava/io/FileOutputStream;
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v7

    .line 114
    .local v7, is:Ljava/io/InputStream;
    invoke-virtual {v7}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 115
    .local v0, data:I
    :goto_1
    const/4 v8, -0x1

    if-ne v0, v8, :cond_2

    .line 119
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 120
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 123
    const-string v8, "AsyncImageLoader"

    const-string v9, "Drawable.createFromPath"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .end local v0           #data:I
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .end local v7           #is:Ljava/io/InputStream;
    :goto_2
    move-object v8, v1

    .line 134
    goto :goto_0

    .line 116
    .restart local v0       #data:I
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    .restart local v7       #is:Ljava/io/InputStream;
    :cond_2
    invoke-virtual {v5, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 117
    invoke-virtual {v7}, Ljava/io/InputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_1

    .line 126
    .end local v0           #data:I
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .end local v7           #is:Ljava/io/InputStream;
    :catch_0
    move-exception v2

    .line 127
    .local v2, e:Ljava/io/IOException;
    const-string v8, "AsyncImageLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "\u56fe\u7247\u4e0b\u8f7d\u53ca\u4fdd\u5b58\u65f6\u51fa\u73b0\u5f02\u5e38\uff01"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 131
    .end local v2           #e:Ljava/io/IOException;
    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_2
.end method


# virtual methods
.method public loadDrawable(Landroid/content/Context;Ljava/lang/String;Lcom/webuid/mmVideo/AsyncImageLoader$ImageCallback;)Landroid/graphics/drawable/Drawable;
    .locals 5
    .parameter "context"
    .parameter "imageUrl"
    .parameter "imageCallback"

    .prologue
    .line 53
    iget-object v3, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v3, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    iget-object v3, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->imageCache:Ljava/util/HashMap;

    invoke-virtual {v3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/SoftReference;

    .line 55
    .local v2, softReference:Ljava/lang/ref/SoftReference;,"Ljava/lang/ref/SoftReference<Landroid/graphics/drawable/Drawable;>;"
    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 56
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 85
    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    .end local v2           #softReference:Ljava/lang/ref/SoftReference;,"Ljava/lang/ref/SoftReference<Landroid/graphics/drawable/Drawable;>;"
    :goto_0
    return-object v0

    .line 60
    :cond_0
    const-string v3, "async"

    const-string v4, "003"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v1, Lcom/webuid/mmVideo/AsyncImageLoader$1;

    invoke-direct {v1, p0, p3, p2}, Lcom/webuid/mmVideo/AsyncImageLoader$1;-><init>(Lcom/webuid/mmVideo/AsyncImageLoader;Lcom/webuid/mmVideo/AsyncImageLoader$ImageCallback;Ljava/lang/String;)V

    .line 69
    .local v1, handler:Landroid/os/Handler;
    iget-object v3, p0, Lcom/webuid/mmVideo/AsyncImageLoader;->executor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v4, Lcom/webuid/mmVideo/AsyncImageLoader$2;

    invoke-direct {v4, p0, p1, p2, v1}, Lcom/webuid/mmVideo/AsyncImageLoader$2;-><init>(Lcom/webuid/mmVideo/AsyncImageLoader;Landroid/content/Context;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 85
    const/4 v0, 0x0

    goto :goto_0
.end method
