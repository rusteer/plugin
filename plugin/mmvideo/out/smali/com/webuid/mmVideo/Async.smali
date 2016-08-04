.class public Lcom/webuid/mmVideo/Async;
.super Landroid/os/AsyncTask;
.source "Async.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static listPb:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ProgressBar;",
            ">;"
        }
    .end annotation
.end field

.field public static pbList:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/widget/ProgressBar;",
            ">;"
        }
    .end annotation
.end field

.field private static pbList0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private context:Landroid/content/Context;

.field private dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

.field private dataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private finished:Z

.field private paused:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/Async;->listPb:Ljava/util/List;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/Async;->pbList0:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/webuid/mmVideo/Async;->pbList:Ljava/util/Map;

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context0"

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/Async;->dataList:Ljava/util/ArrayList;

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/Async;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 45
    iput-object p1, p0, Lcom/webuid/mmVideo/Async;->context:Landroid/content/Context;

    .line 46
    return-void
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/webuid/mmVideo/Async;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/webuid/mmVideo/Async;->context:Landroid/content/Context;

    const-class v1, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {v0, v1}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/Async;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/Async;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method


# virtual methods
.method public continued()V
    .locals 3

    .prologue
    .line 244
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    .line 245
    const-string v0, "debug"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "paused------------"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    return-void
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/Async;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .parameter "Params"

    .prologue
    .line 95
    const-string v26, "async"

    const-string v27, "doInBackground"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    const-string v26, "dataList"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/Async;->dataList:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const/16 v16, 0x0

    .line 99
    .local v16, position:I
    const/4 v9, 0x0

    .line 100
    .local v9, idval:I
    const/16 v26, 0x0

    aget-object v26, p1, v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v24

    .line 101
    .local v24, xidKey:Ljava/lang/String;
    const-string v25, ""

    .line 102
    .local v25, xidUrl:Ljava/lang/String;
    new-instance v17, Lcom/webuid/mmVideo/service/DownVideoService;

    invoke-direct/range {p0 .. p0}, Lcom/webuid/mmVideo/Async;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v26

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 103
    .local v17, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Integer;->intValue()I

    move-result v26

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/service/DownVideoService;->load(I)Lcom/webuid/mmVideo/entity/DownVideo;

    move-result-object v6

    .line 104
    .local v6, dv:Lcom/webuid/mmVideo/entity/DownVideo;
    invoke-virtual {v6}, Lcom/webuid/mmVideo/entity/DownVideo;->getPath()Ljava/lang/String;

    move-result-object v25

    .line 105
    invoke-virtual {v6}, Lcom/webuid/mmVideo/entity/DownVideo;->getId()I

    move-result v9

    .line 116
    sget-object v26, Lcom/webuid/mmVideo/OfflineActivity;->asyncListTask:Ljava/util/Dictionary;

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v26, "debug"

    new-instance v27, Ljava/lang/StringBuilder;

    const-string v28, "xidUrl:"

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    const/16 v22, 0x0

    .line 119
    .local v22, url:Ljava/net/URL;
    const/4 v8, 0x0

    .line 120
    .local v8, httpURLConnection:Ljava/net/HttpURLConnection;
    const/4 v10, 0x0

    .line 121
    .local v10, inputStream:Ljava/io/InputStream;
    const/4 v13, 0x0

    .line 122
    .local v13, outputStream:Ljava/io/RandomAccessFile;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    .line 125
    .local v15, path:Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v20

    .line 126
    .local v20, sdState:Ljava/lang/String;
    const-string v26, "mounted"

    move-object/from16 v0, v20

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_4

    .line 127
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v19

    .line 128
    .local v19, sdDir:Ljava/io/File;
    new-instance v4, Ljava/io/File;

    const-string v26, "data/mmVideo"

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-direct {v4, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 132
    .end local v19           #sdDir:Ljava/io/File;
    .local v4, cacheDir:Ljava/io/File;
    :goto_0
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v26

    if-nez v26, :cond_0

    .line 133
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 135
    :cond_0
    const/4 v11, 0x0

    .line 138
    .local v11, length:I
    :try_start_0
    new-instance v23, Ljava/net/URL;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_4

    .line 139
    .end local v22           #url:Ljava/net/URL;
    .local v23, url:Ljava/net/URL;
    :try_start_1
    invoke-virtual/range {v23 .. v23}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v26

    move-object/from16 v0, v26

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v8, v0

    .line 140
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v8, v0}, Ljava/net/HttpURLConnection;->setAllowUserInteraction(Z)V

    .line 142
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v11

    .line 143
    const/16 v21, 0x0

    .line 148
    .local v21, startPosition:I
    const-string v26, "debug"

    new-instance v27, Ljava/lang/StringBuilder;

    const-string v28, "getContentLength:"

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    sget-object v26, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v27, Ljava/lang/StringBuilder;

    const-string v28, "getContentLength:"

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 150
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    .line 157
    new-instance v12, Ljava/io/File;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-static/range {v24 .. v24}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v27

    invoke-direct/range {v26 .. v27}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v27, ".mp4"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-direct {v12, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 158
    .local v12, outFile:Ljava/io/File;
    const-string v26, "debug"

    new-instance v27, Ljava/lang/StringBuilder;

    const-string v28, "outFile:"

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "/"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "mmVideo/"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".mp4"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    new-instance v14, Ljava/io/RandomAccessFile;

    const-string v26, "rw"

    move-object/from16 v0, v26

    invoke-direct {v14, v12, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_8

    .line 162
    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .local v14, outputStream:Ljava/io/RandomAccessFile;
    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v26, v0

    :try_start_2
    move-wide/from16 v0, v26

    invoke-virtual {v14, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 164
    const/16 v26, 0x2800

    move/from16 v0, v26

    new-array v3, v0, [B

    .line 165
    .local v3, buf:[B
    const/16 v18, 0x0

    .line 166
    .local v18, read:I
    move/from16 v5, v21

    .line 167
    .local v5, curSize:I
    const-string v26, "debug"

    new-instance v27, Ljava/lang/StringBuilder;

    const-string v28, "buf\uff1a"

    invoke-direct/range {v27 .. v28}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v0, v3

    move/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/webuid/mmVideo/Async;->finished:Z

    move/from16 v26, v0

    if-nez v26, :cond_6

    .line 189
    :cond_1
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 190
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V

    .line 191
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_9

    .line 207
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 208
    if-eqz v10, :cond_c

    .line 212
    :try_start_3
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 213
    if-eqz v14, :cond_2

    .line 215
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V

    .line 217
    :cond_2
    if-eqz v8, :cond_c

    .line 219
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .line 229
    .end local v3           #buf:[B
    .end local v5           #curSize:I
    .end local v12           #outFile:Ljava/io/File;
    .end local v18           #read:I
    .end local v21           #startPosition:I
    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    :cond_3
    :goto_2
    return-object v24

    .line 130
    .end local v4           #cacheDir:Ljava/io/File;
    .end local v11           #length:I
    :cond_4
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .restart local v4       #cacheDir:Ljava/io/File;
    goto/16 :goto_0

    .line 172
    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .end local v22           #url:Ljava/net/URL;
    .restart local v3       #buf:[B
    .restart local v5       #curSize:I
    .restart local v11       #length:I
    .restart local v12       #outFile:Ljava/io/File;
    .restart local v14       #outputStream:Ljava/io/RandomAccessFile;
    .restart local v18       #read:I
    .restart local v21       #startPosition:I
    .restart local v23       #url:Ljava/net/URL;
    :cond_5
    const-wide/16 v26, 0x1f4

    :try_start_4
    invoke-static/range {v26 .. v27}, Ljava/lang/Thread;->sleep(J)V

    .line 170
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/webuid/mmVideo/Async;->paused:Z

    move/from16 v26, v0

    if-nez v26, :cond_5

    .line 174
    invoke-virtual {v10, v3}, Ljava/io/InputStream;->read([B)I

    move-result v18

    .line 175
    const/16 v26, -0x1

    move/from16 v0, v18

    move/from16 v1, v26

    if-eq v0, v1, :cond_1

    .line 179
    const/16 v26, 0x0

    move/from16 v0, v26

    move/from16 v1, v18

    invoke-virtual {v14, v3, v0, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 180
    add-int v5, v5, v18

    .line 182
    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    int-to-float v0, v5

    move/from16 v28, v0

    const/high16 v29, 0x42c8

    mul-float v28, v28, v29

    int-to-float v0, v11

    move/from16 v29, v0

    div-float v28, v28, v29

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v28, v0

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    const/16 v27, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    const/16 v27, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/Async;->publishProgress([Ljava/lang/Object;)V

    .line 183
    if-eq v5, v11, :cond_1

    .line 187
    const-wide/16 v26, 0xa

    invoke-static/range {v26 .. v27}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_b
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_9

    goto/16 :goto_1

    .line 193
    .end local v3           #buf:[B
    .end local v5           #curSize:I
    .end local v18           #read:I
    :catch_0
    move-exception v7

    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .line 195
    .end local v12           #outFile:Ljava/io/File;
    .end local v21           #startPosition:I
    .end local v23           #url:Ljava/net/URL;
    .local v7, e:Ljava/net/MalformedURLException;
    .restart local v22       #url:Ljava/net/URL;
    :goto_3
    :try_start_5
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 207
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 208
    if-eqz v10, :cond_3

    .line 212
    :try_start_6
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 213
    if-eqz v13, :cond_7

    .line 215
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V

    .line 217
    :cond_7
    if-eqz v8, :cond_3

    .line 219
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_2

    .line 222
    :catch_1
    move-exception v7

    .line 224
    .local v7, e:Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 197
    .end local v7           #e:Ljava/io/IOException;
    :catch_2
    move-exception v7

    .line 199
    .restart local v7       #e:Ljava/io/IOException;
    :goto_4
    :try_start_7
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 207
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 208
    if-eqz v10, :cond_3

    .line 212
    :try_start_8
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 213
    if-eqz v13, :cond_8

    .line 215
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V

    .line 217
    :cond_8
    if-eqz v8, :cond_3

    .line 219
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    goto/16 :goto_2

    .line 222
    :catch_3
    move-exception v7

    .line 224
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 201
    .end local v7           #e:Ljava/io/IOException;
    :catch_4
    move-exception v7

    .line 203
    .local v7, e:Ljava/lang/InterruptedException;
    :goto_5
    :try_start_9
    invoke-virtual {v7}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 207
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 208
    if-eqz v10, :cond_3

    .line 212
    :try_start_a
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 213
    if-eqz v13, :cond_9

    .line 215
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V

    .line 217
    :cond_9
    if-eqz v8, :cond_3

    .line 219
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5

    goto/16 :goto_2

    .line 222
    :catch_5
    move-exception v7

    .line 224
    .local v7, e:Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 206
    .end local v7           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v26

    .line 207
    :goto_6
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 208
    if-eqz v10, :cond_b

    .line 212
    :try_start_b
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 213
    if-eqz v13, :cond_a

    .line 215
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V

    .line 217
    :cond_a
    if-eqz v8, :cond_b

    .line 219
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 227
    :cond_b
    :goto_7
    throw v26

    .line 222
    :catch_6
    move-exception v7

    .line 224
    .restart local v7       #e:Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 222
    .end local v7           #e:Ljava/io/IOException;
    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .end local v22           #url:Ljava/net/URL;
    .restart local v3       #buf:[B
    .restart local v5       #curSize:I
    .restart local v12       #outFile:Ljava/io/File;
    .restart local v14       #outputStream:Ljava/io/RandomAccessFile;
    .restart local v18       #read:I
    .restart local v21       #startPosition:I
    .restart local v23       #url:Ljava/net/URL;
    :catch_7
    move-exception v7

    .line 224
    .restart local v7       #e:Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .end local v7           #e:Ljava/io/IOException;
    :cond_c
    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto/16 :goto_2

    .line 206
    .end local v3           #buf:[B
    .end local v5           #curSize:I
    .end local v12           #outFile:Ljava/io/File;
    .end local v18           #read:I
    .end local v21           #startPosition:I
    .end local v22           #url:Ljava/net/URL;
    .restart local v23       #url:Ljava/net/URL;
    :catchall_1
    move-exception v26

    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto :goto_6

    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .end local v22           #url:Ljava/net/URL;
    .restart local v12       #outFile:Ljava/io/File;
    .restart local v14       #outputStream:Ljava/io/RandomAccessFile;
    .restart local v21       #startPosition:I
    .restart local v23       #url:Ljava/net/URL;
    :catchall_2
    move-exception v26

    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto :goto_6

    .line 201
    .end local v12           #outFile:Ljava/io/File;
    .end local v21           #startPosition:I
    .end local v22           #url:Ljava/net/URL;
    .restart local v23       #url:Ljava/net/URL;
    :catch_8
    move-exception v7

    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto :goto_5

    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .end local v22           #url:Ljava/net/URL;
    .restart local v12       #outFile:Ljava/io/File;
    .restart local v14       #outputStream:Ljava/io/RandomAccessFile;
    .restart local v21       #startPosition:I
    .restart local v23       #url:Ljava/net/URL;
    :catch_9
    move-exception v7

    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto :goto_5

    .line 197
    .end local v12           #outFile:Ljava/io/File;
    .end local v21           #startPosition:I
    .end local v22           #url:Ljava/net/URL;
    .restart local v23       #url:Ljava/net/URL;
    :catch_a
    move-exception v7

    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto/16 :goto_4

    .end local v13           #outputStream:Ljava/io/RandomAccessFile;
    .end local v22           #url:Ljava/net/URL;
    .restart local v12       #outFile:Ljava/io/File;
    .restart local v14       #outputStream:Ljava/io/RandomAccessFile;
    .restart local v21       #startPosition:I
    .restart local v23       #url:Ljava/net/URL;
    :catch_b
    move-exception v7

    move-object v13, v14

    .end local v14           #outputStream:Ljava/io/RandomAccessFile;
    .restart local v13       #outputStream:Ljava/io/RandomAccessFile;
    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto/16 :goto_4

    .line 193
    .end local v12           #outFile:Ljava/io/File;
    .end local v21           #startPosition:I
    :catch_c
    move-exception v7

    goto/16 :goto_3

    .end local v22           #url:Ljava/net/URL;
    .restart local v23       #url:Ljava/net/URL;
    :catch_d
    move-exception v7

    move-object/from16 v22, v23

    .end local v23           #url:Ljava/net/URL;
    .restart local v22       #url:Ljava/net/URL;
    goto/16 :goto_3
.end method

.method public getDataList()V
    .locals 12

    .prologue
    .line 49
    new-instance v1, Lcom/google/gson/GsonBuilder;

    invoke-direct {v1}, Lcom/google/gson/GsonBuilder;-><init>()V

    .line 50
    .local v1, builder:Lcom/google/gson/GsonBuilder;
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->excludeFieldsWithoutExposeAnnotation()Lcom/google/gson/GsonBuilder;

    .line 51
    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v3

    .line 52
    .local v3, gson:Lcom/google/gson/Gson;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v10

    const-string v11, "my_down_list"

    invoke-virtual {v10, v11}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 53
    .local v7, result:Ljava/lang/Object;
    const/4 v4, 0x0

    .line 54
    .local v4, have_fav:I
    iget-object v10, p0, Lcom/webuid/mmVideo/Async;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 55
    if-eqz v7, :cond_0

    .line 56
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 57
    new-instance v11, Lcom/webuid/mmVideo/Async$1;

    invoke-direct {v11, p0}, Lcom/webuid/mmVideo/Async$1;-><init>(Lcom/webuid/mmVideo/Async;)V

    .line 58
    invoke-virtual {v11}, Lcom/webuid/mmVideo/Async$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v11

    .line 56
    invoke-virtual {v3, v10, v11}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 59
    .local v2, favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 60
    .local v5, keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 73
    .end local v2           #favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5           #keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    return-void

    .line 61
    .restart local v2       #favMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5       #keySetIterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 62
    .local v9, xid:Ljava/lang/String;
    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 63
    .local v8, val:Ljava/lang/String;
    const-string v10, "---"

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, arr:[Ljava/lang/String;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 65
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "xid"

    invoke-virtual {v6, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v10, "id"

    const/4 v11, 0x0

    aget-object v11, v0, v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v10, "name"

    const/4 v11, 0x1

    aget-object v11, v0, v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string v10, "url"

    const/4 v11, 0x2

    aget-object v11, v0, v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v10, "size"

    const/4 v11, 0x4

    aget-object v11, v0, v11

    invoke-virtual {v6, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v10, p0, Lcom/webuid/mmVideo/Async;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    return v0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 253
    const-string v0, "debug"

    const-string v1, "onCancelled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/Async;->finished:Z

    .line 255
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 256
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/Async;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 10
    .parameter "result"

    .prologue
    const/4 v9, 0x1

    .line 268
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    :try_start_0
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lt v2, v6, :cond_0

    .line 277
    :goto_1
    const-string v6, "debug"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "onPostExecute:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    :goto_2
    const-string v6, "pro update1 result"

    invoke-static {v6, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    new-instance v4, Lcom/webuid/mmVideo/service/DownVideoService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/Async;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v6

    invoke-virtual {v6}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 285
    .local v4, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/webuid/mmVideo/service/DownVideoService;->load(I)Lcom/webuid/mmVideo/entity/DownVideo;

    move-result-object v0

    .line 286
    .local v0, dv:Lcom/webuid/mmVideo/entity/DownVideo;
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v4, v6, v9}, Lcom/webuid/mmVideo/service/DownVideoService;->saveFinish(II)V

    .line 287
    invoke-virtual {v0, v9}, Lcom/webuid/mmVideo/entity/DownVideo;->setFinish(I)V

    .line 288
    const/4 v2, 0x0

    :goto_3
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v2, v6, :cond_2

    .line 296
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-virtual {v6}, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->notifyDataSetChanged()V

    .line 297
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 298
    return-void

    .line 270
    .end local v0           #dv:Lcom/webuid/mmVideo/entity/DownVideo;
    .end local v4           #pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    :cond_0
    :try_start_1
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 272
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/webuid/mmVideo/Async;->finished:Z
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 279
    :catch_0
    move-exception v1

    .line 281
    .local v1, e:Ljava/lang/NumberFormatException;
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_2

    .line 268
    .end local v1           #e:Ljava/lang/NumberFormatException;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 290
    .restart local v0       #dv:Lcom/webuid/mmVideo/entity/DownVideo;
    .restart local v4       #pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    :cond_2
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 291
    .local v3, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "id"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 292
    .local v5, xid:Ljava/lang/String;
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 293
    sget-object v6, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 288
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 303
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 304
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 8
    .parameter "values"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 311
    aget-object v4, p1, v6

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    rem-int/lit8 v4, v4, 0xa

    if-nez v4, :cond_0

    .line 312
    const-string v4, "pro update1"

    aget-object v5, p1, v6

    invoke-virtual {v5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    new-instance v3, Lcom/webuid/mmVideo/service/DownVideoService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/Async;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 314
    .local v3, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    aget-object v4, p1, v7

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/webuid/mmVideo/service/DownVideoService;->load(I)Lcom/webuid/mmVideo/entity/DownVideo;

    move-result-object v0

    .line 315
    .local v0, dv:Lcom/webuid/mmVideo/entity/DownVideo;
    aget-object v4, p1, v6

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/webuid/mmVideo/entity/DownVideo;->setProgress(I)V

    .line 317
    .end local v0           #dv:Lcom/webuid/mmVideo/entity/DownVideo;
    .end local v3           #pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    :cond_0
    const/4 v1, 0x0

    .local v1, isHas:Z
    const/4 v2, 0x0

    .line 324
    .local v2, ival:I
    sget-object v4, Lcom/webuid/mmVideo/Async;->pbList:Ljava/util/Map;

    aget-object v5, p1, v7

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 326
    sget-object v4, Lcom/webuid/mmVideo/Async;->pbList:Ljava/util/Map;

    aget-object v5, p1, v7

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ProgressBar;

    aget-object v5, p1, v6

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 337
    :cond_1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 338
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/Async;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public pause()V
    .locals 3

    .prologue
    .line 236
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    .line 237
    const-string v0, "debug"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "paused------------"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/webuid/mmVideo/Async;->paused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    return-void
.end method
