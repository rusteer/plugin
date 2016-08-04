.class Lcom/webuid/mmVideo/UpdateManager$2;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/UpdateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateManager;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateManager;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 137
    :try_start_0
    new-instance v13, Ljava/net/URL;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->apkUrl:Ljava/lang/String;
    invoke-static {v14}, Lcom/webuid/mmVideo/UpdateManager;->access$3(Lcom/webuid/mmVideo/UpdateManager;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 139
    .local v13, url:Ljava/net/URL;
    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 138
    check-cast v4, Ljava/net/HttpURLConnection;

    .line 140
    .local v4, conn:Ljava/net/HttpURLConnection;
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    .line 141
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v9

    .line 142
    .local v9, length:I
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 145
    .local v8, is:Ljava/io/InputStream;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v12

    .line 146
    .local v12, sdState:Ljava/lang/String;
    const-string v14, "mounted"

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 147
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    .line 148
    .local v11, sdDir:Ljava/io/File;
    new-instance v3, Ljava/io/File;

    const-string v14, "data/mmvideo"

    invoke-direct {v3, v11, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 152
    .end local v11           #sdDir:Ljava/io/File;
    .local v3, cacheDir:Ljava/io/File;
    :goto_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_0

    .line 153
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 160
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string v14, "UpdateRelease.apk"

    invoke-direct {v1, v3, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 161
    .local v1, ApkFile:Ljava/io/File;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 162
    .local v7, fos:Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 163
    .local v5, count:I
    const/16 v14, 0x400

    new-array v2, v14, [B

    .line 165
    .local v2, buf:[B
    :cond_1
    invoke-virtual {v8, v2}, Ljava/io/InputStream;->read([B)I

    move-result v10

    .line 166
    .local v10, numread:I
    add-int/2addr v5, v10

    .line 167
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    int-to-float v15, v5

    int-to-float v0, v9

    move/from16 v16, v0

    div-float v15, v15, v16

    const/high16 v16, 0x42c8

    mul-float v15, v15, v16

    float-to-int v15, v15

    #setter for: Lcom/webuid/mmVideo/UpdateManager;->progress:I
    invoke-static {v14, v15}, Lcom/webuid/mmVideo/UpdateManager;->access$5(Lcom/webuid/mmVideo/UpdateManager;I)V

    .line 169
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->mHandler:Landroid/os/Handler;
    invoke-static {v14}, Lcom/webuid/mmVideo/UpdateManager;->access$6(Lcom/webuid/mmVideo/UpdateManager;)Landroid/os/Handler;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 170
    if-gtz v10, :cond_3

    .line 172
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->mHandler:Landroid/os/Handler;
    invoke-static {v14}, Lcom/webuid/mmVideo/UpdateManager;->access$6(Lcom/webuid/mmVideo/UpdateManager;)Landroid/os/Handler;

    move-result-object v14

    const/4 v15, 0x2

    invoke-virtual {v14, v15}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 177
    :goto_1
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 178
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 184
    .end local v1           #ApkFile:Ljava/io/File;
    .end local v2           #buf:[B
    .end local v3           #cacheDir:Ljava/io/File;
    .end local v4           #conn:Ljava/net/HttpURLConnection;
    .end local v5           #count:I
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .end local v8           #is:Ljava/io/InputStream;
    .end local v9           #length:I
    .end local v10           #numread:I
    .end local v12           #sdState:Ljava/lang/String;
    .end local v13           #url:Ljava/net/URL;
    :goto_2
    return-void

    .line 150
    .restart local v4       #conn:Ljava/net/HttpURLConnection;
    .restart local v8       #is:Ljava/io/InputStream;
    .restart local v9       #length:I
    .restart local v12       #sdState:Ljava/lang/String;
    .restart local v13       #url:Ljava/net/URL;
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;
    invoke-static {v14}, Lcom/webuid/mmVideo/UpdateManager;->access$4(Lcom/webuid/mmVideo/UpdateManager;)Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    .restart local v3       #cacheDir:Ljava/io/File;
    goto :goto_0

    .line 175
    .restart local v1       #ApkFile:Ljava/io/File;
    .restart local v2       #buf:[B
    .restart local v5       #count:I
    .restart local v7       #fos:Ljava/io/FileOutputStream;
    .restart local v10       #numread:I
    :cond_3
    const/4 v14, 0x0

    invoke-virtual {v7, v2, v14, v10}, Ljava/io/FileOutputStream;->write([BII)V

    .line 176
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/webuid/mmVideo/UpdateManager$2;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #getter for: Lcom/webuid/mmVideo/UpdateManager;->interceptFlag:Z
    invoke-static {v14}, Lcom/webuid/mmVideo/UpdateManager;->access$7(Lcom/webuid/mmVideo/UpdateManager;)Z
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v14

    .line 164
    if-eqz v14, :cond_1

    goto :goto_1

    .line 179
    .end local v1           #ApkFile:Ljava/io/File;
    .end local v2           #buf:[B
    .end local v3           #cacheDir:Ljava/io/File;
    .end local v4           #conn:Ljava/net/HttpURLConnection;
    .end local v5           #count:I
    .end local v7           #fos:Ljava/io/FileOutputStream;
    .end local v8           #is:Ljava/io/InputStream;
    .end local v9           #length:I
    .end local v10           #numread:I
    .end local v12           #sdState:Ljava/lang/String;
    .end local v13           #url:Ljava/net/URL;
    :catch_0
    move-exception v6

    .line 180
    .local v6, e:Ljava/net/MalformedURLException;
    invoke-virtual {v6}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_2

    .line 181
    .end local v6           #e:Ljava/net/MalformedURLException;
    :catch_1
    move-exception v6

    .line 182
    .local v6, e:Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method
