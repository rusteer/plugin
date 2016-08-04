.class public Lcom/webuid/mmVideo/update/MmUpdateService;
.super Landroid/app/Service;
.source "MmUpdateService.java"


# static fields
.field private static final DOWN_ERROR:I = 0x0

.field private static final DOWN_OK:I = 0x1

.field private static final TIMEOUT:I = 0x2710

.field private static down_url:Ljava/lang/String;


# instance fields
.field private app_name:Ljava/lang/String;

.field contentView:Landroid/widget/RemoteViews;

.field private notification:Landroid/app/Notification;

.field private notificationManager:Landroid/app/NotificationManager;

.field private notification_id:I

.field private pendingIntent:Landroid/app/PendingIntent;

.field private updateIntent:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "http://mmvideo.netuid.net/update/mmVideo_new121302.apk"

    sput-object v0, Lcom/webuid/mmVideo/update/MmUpdateService;->down_url:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 40
    const-string v0, "mmVideo"

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;

    .line 48
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification_id:I

    .line 34
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/update/MmUpdateService;Landroid/app/PendingIntent;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 46
    iput-object p1, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;

    return-void
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/Notification;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/update/MmUpdateService;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 40
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/PendingIntent;
    .locals 1
    .parameter

    .prologue
    .line 46
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/NotificationManager;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/update/MmUpdateService;)I
    .locals 1
    .parameter

    .prologue
    .line 48
    iget v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification_id:I

    return v0
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/content/Intent;
    .locals 1
    .parameter

    .prologue
    .line 45
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->updateIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$7()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/webuid/mmVideo/update/MmUpdateService;->down_url:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public createNotification()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 134
    const-string v0, "filename0"

    const-string v1, "r1"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/update/MmUpdateService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notificationManager:Landroid/app/NotificationManager;

    .line 136
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    .line 137
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    const v1, 0x7f020026

    iput v1, v0, Landroid/app/Notification;->icon:I

    .line 139
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    const-string v1, "\u5f00\u59cb\u4e0b\u8f7d"

    iput-object v1, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 141
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/HomeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->updateIntent:Landroid/content/Intent;

    .line 142
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->updateIntent:Landroid/content/Intent;

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;

    .line 145
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    iget-object v1, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;

    const-string v2, "\u4e0b\u8f7d\uff1a0%"

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 147
    iget-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notificationManager:Landroid/app/NotificationManager;

    iget v1, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification_id:I

    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 171
    const-string v0, "filename0"

    const-string v1, "r4"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    return-void
.end method

.method public createThread()V
    .locals 4

    .prologue
    .line 75
    new-instance v0, Lcom/webuid/mmVideo/update/MmUpdateService$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/update/MmUpdateService$1;-><init>(Lcom/webuid/mmVideo/update/MmUpdateService;)V

    .line 103
    .local v0, handler:Landroid/os/Handler;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 105
    .local v1, message:Landroid/os/Message;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/webuid/mmVideo/update/MmUpdateService$2;

    invoke-direct {v3, p0, v1, v0}, Lcom/webuid/mmVideo/update/MmUpdateService$2;-><init>(Lcom/webuid/mmVideo/update/MmUpdateService;Landroid/os/Message;Landroid/os/Handler;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 125
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 126
    return-void
.end method

.method public downloadUpdateFile(Ljava/lang/String;Ljava/lang/String;)J
    .locals 15
    .parameter "down_url"
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 182
    const/4 v2, 0x5

    .line 184
    .local v2, down_step:I
    const/4 v3, 0x0

    .line 185
    .local v3, downloadCount:I
    const/4 v9, 0x0

    .line 189
    .local v9, updateCount:I
    new-instance v10, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 191
    .local v10, url:Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 190
    check-cast v4, Ljava/net/HttpURLConnection;

    .line 192
    .local v4, httpURLConnection:Ljava/net/HttpURLConnection;
    const/16 v11, 0x2710

    invoke-virtual {v4, v11}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 193
    const/16 v11, 0x2710

    invoke-virtual {v4, v11}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 195
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v8

    .line 196
    .local v8, totalSize:I
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    const/16 v12, 0x194

    if-ne v11, v12, :cond_0

    .line 197
    new-instance v11, Ljava/lang/Exception;

    const-string v12, "fail!"

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 199
    :cond_0
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 200
    .local v5, inputStream:Ljava/io/InputStream;
    new-instance v6, Ljava/io/FileOutputStream;

    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-direct {v6, v0, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 201
    .local v6, outputStream:Ljava/io/OutputStream;
    const/16 v11, 0x400

    new-array v1, v11, [B

    .line 202
    .local v1, buffer:[B
    const/4 v7, 0x0

    .line 203
    .local v7, readsize:I
    :cond_1
    :goto_0
    invoke-virtual {v5, v1}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v11, -0x1

    if-ne v7, v11, :cond_3

    .line 222
    if-eqz v4, :cond_2

    .line 223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 225
    :cond_2
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 226
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 228
    int-to-long v11, v3

    return-wide v11

    .line 204
    :cond_3
    const/4 v11, 0x0

    invoke-virtual {v6, v1, v11, v7}, Ljava/io/OutputStream;->write([BII)V

    .line 205
    add-int/2addr v3, v7

    .line 209
    if-eqz v9, :cond_4

    .line 210
    mul-int/lit8 v11, v3, 0x64

    div-int/2addr v11, v8

    sub-int/2addr v11, v2

    if-lt v11, v9, :cond_1

    .line 211
    :cond_4
    add-int/2addr v9, v2

    .line 213
    iget-object v11, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    const-string v12, "\u6b63\u5728\u4e0b\u8f7d..."

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "%"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iget-object v14, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v11, p0, v12, v13, v14}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 217
    iget-object v11, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notificationManager:Landroid/app/NotificationManager;

    iget v12, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification_id:I

    iget-object v13, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;

    invoke-virtual {v11, v12, v13}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "arg0"

    .prologue
    .line 52
    const/4 v0, 0x0

    return-object v0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 57
    const-string v0, "app_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;

    .line 58
    const-string v0, "source"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/update/MmUpdateService;->down_url:Ljava/lang/String;

    .line 59
    const-string v0, "update2"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "app_name:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const-string v0, "mmvideo"

    invoke-static {v0}, Lcom/webuid/mmVideo/update/FileUtil;->createFile(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0}, Lcom/webuid/mmVideo/update/MmUpdateService;->createNotification()V

    .line 63
    invoke-virtual {p0}, Lcom/webuid/mmVideo/update/MmUpdateService;->createThread()V

    .line 64
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method
