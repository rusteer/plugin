.class public Lcom/webuid/mmVideo/PushService;
.super Landroid/app/Service;
.source "PushService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/PushService$MQTTConnection;
    }
.end annotation


# static fields
.field private static final ACTION_KEEPALIVE:Ljava/lang/String; = null

.field private static final ACTION_RECONNECT:Ljava/lang/String; = null

.field private static final ACTION_START:Ljava/lang/String; = null

.field private static final ACTION_STOP:Ljava/lang/String; = null

.field private static final INITIAL_RETRY_INTERVAL:J = 0x2710L

.field private static final KEEP_ALIVE_INTERVAL:J = 0x19a280L

.field private static final MAXIMUM_RETRY_INTERVAL:J = 0x1b7740L

.field private static MQTT_BROKER_PORT_NUM:I = 0x0

.field private static MQTT_CLEAN_START:Z = false

.field public static MQTT_CLIENT_ID:Ljava/lang/String; = null

.field private static final MQTT_HOST:Ljava/lang/String; = "mm.xizitu.com"

.field private static MQTT_KEEP_ALIVE:S = 0x0s

.field private static MQTT_PERSISTENCE:Lcom/ibm/mqtt/MqttPersistence; = null

.field private static MQTT_QUALITIES_OF_SERVICE:[I = null

.field private static MQTT_QUALITY_OF_SERVICE:I = 0x0

.field private static MQTT_RETAINED_PUBLISH:Z = false

.field private static final NOTIF_CONNECTED:I = 0x0

.field public static NOTIF_TITLE:Ljava/lang/String; = null

.field public static final PREF_DEVICE_ID:Ljava/lang/String; = "deviceID"

.field public static final PREF_RETRY:Ljava/lang/String; = "retryInterval"

.field public static final PREF_STARTED:Ljava/lang/String; = "isStarted"

.field public static final TAG:Ljava/lang/String; = "mmVideoService"


# instance fields
.field private mConnMan:Landroid/net/ConnectivityManager;

.field private mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

.field private mConnectivityChanged:Landroid/content/BroadcastReceiver;

.field private mLog:Lcom/webuid/mmVideo/ConnectionLog;

.field private mNotifMan:Landroid/app/NotificationManager;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mStartTime:J

.field private mStarted:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 47
    const/16 v0, 0x75b

    sput v0, Lcom/webuid/mmVideo/PushService;->MQTT_BROKER_PORT_NUM:I

    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/webuid/mmVideo/PushService;->MQTT_PERSISTENCE:Lcom/ibm/mqtt/MqttPersistence;

    .line 51
    sput-boolean v2, Lcom/webuid/mmVideo/PushService;->MQTT_CLEAN_START:Z

    .line 53
    const/16 v0, 0x384

    sput-short v0, Lcom/webuid/mmVideo/PushService;->MQTT_KEEP_ALIVE:S

    .line 56
    new-array v0, v2, [I

    sput-object v0, Lcom/webuid/mmVideo/PushService;->MQTT_QUALITIES_OF_SERVICE:[I

    .line 57
    sput v1, Lcom/webuid/mmVideo/PushService;->MQTT_QUALITY_OF_SERVICE:I

    .line 59
    sput-boolean v1, Lcom/webuid/mmVideo/PushService;->MQTT_RETAINED_PUBLISH:Z

    .line 63
    const-string v0, "MM"

    sput-object v0, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".START"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/PushService;->ACTION_START:Ljava/lang/String;

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".STOP"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/PushService;->ACTION_STOP:Ljava/lang/String;

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".KEEP_ALIVE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/PushService;->ACTION_KEEPALIVE:Ljava/lang/String;

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".RECONNECT"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/webuid/mmVideo/PushService;->ACTION_RECONNECT:Ljava/lang/String;

    .line 100
    const-string v0, "\u7f8e\u5973\u89c6\u9891\u79c0"

    sput-object v0, Lcom/webuid/mmVideo/PushService;->NOTIF_TITLE:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 387
    new-instance v0, Lcom/webuid/mmVideo/PushService$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PushService$1;-><init>(Lcom/webuid/mmVideo/PushService;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnectivityChanged:Landroid/content/BroadcastReceiver;

    .line 39
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 210
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/PushService;)V
    .locals 0
    .parameter

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->reconnectIfNecessary()V

    return-void
.end method

.method static synthetic access$10(Lcom/webuid/mmVideo/PushService;)V
    .locals 0
    .parameter

    .prologue
    .line 316
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->startKeepAlives()V

    return-void
.end method

.method static synthetic access$11(Lcom/webuid/mmVideo/PushService;)V
    .locals 0
    .parameter

    .prologue
    .line 328
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->stopKeepAlives()V

    return-void
.end method

.method static synthetic access$12(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 213
    invoke-direct {p0, p1, p2}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$13()[I
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/webuid/mmVideo/PushService;->MQTT_QUALITIES_OF_SERVICE:[I

    return-object v0
.end method

.method static synthetic access$14()I
    .locals 1

    .prologue
    .line 57
    sget v0, Lcom/webuid/mmVideo/PushService;->MQTT_QUALITY_OF_SERVICE:I

    return v0
.end method

.method static synthetic access$15()Z
    .locals 1

    .prologue
    .line 59
    sget-boolean v0, Lcom/webuid/mmVideo/PushService;->MQTT_RETAINED_PUBLISH:Z

    return v0
.end method

.method static synthetic access$16(Lcom/webuid/mmVideo/PushService;)Z
    .locals 1
    .parameter

    .prologue
    .line 432
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->isNetworkAvailable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$17(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 410
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/PushService;->showNotification(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/PushService;)Lcom/webuid/mmVideo/PushService$MQTTConnection;
    .locals 1
    .parameter

    .prologue
    .line 105
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    return-object v0
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/PushService;Lcom/webuid/mmVideo/PushService$MQTTConnection;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 105
    iput-object p1, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    return-void
.end method

.method static synthetic access$4()I
    .locals 1

    .prologue
    .line 47
    sget v0, Lcom/webuid/mmVideo/PushService;->MQTT_BROKER_PORT_NUM:I

    return v0
.end method

.method static synthetic access$5()Lcom/ibm/mqtt/MqttPersistence;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/webuid/mmVideo/PushService;->MQTT_PERSISTENCE:Lcom/ibm/mqtt/MqttPersistence;

    return-object v0
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/PushService;)Landroid/content/SharedPreferences;
    .locals 1
    .parameter

    .prologue
    .line 91
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$7()Z
    .locals 1

    .prologue
    .line 51
    sget-boolean v0, Lcom/webuid/mmVideo/PushService;->MQTT_CLEAN_START:Z

    return v0
.end method

.method static synthetic access$8()S
    .locals 1

    .prologue
    .line 53
    sget-short v0, Lcom/webuid/mmVideo/PushService;->MQTT_KEEP_ALIVE:S

    return v0
.end method

.method static synthetic access$9(Lcom/webuid/mmVideo/PushService;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 106
    iput-wide p1, p0, Lcom/webuid/mmVideo/PushService;->mStartTime:J

    return-void
.end method

.method public static actionPing(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"

    .prologue
    .line 126
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/PushService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 127
    .local v0, i:Landroid/content/Intent;
    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_KEEPALIVE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 128
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 129
    return-void
.end method

.method public static actionStart(Landroid/content/Context;)V
    .locals 3
    .parameter "ctx"

    .prologue
    .line 111
    const-string v1, "ser2"

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/PushService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 113
    .local v0, i:Landroid/content/Intent;
    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_START:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 114
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 115
    return-void
.end method

.method public static actionStop(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"

    .prologue
    .line 119
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/PushService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 120
    .local v0, i:Landroid/content/Intent;
    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_STOP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 121
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 122
    return-void
.end method

.method private declared-synchronized connect()V
    .locals 5

    .prologue
    .line 280
    monitor-enter p0

    :try_start_0
    const-string v2, "Connecting..."

    invoke-direct {p0, v2}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 282
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "deviceID"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, deviceID:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 285
    const-string v2, "Device ID not found."

    invoke-direct {p0, v2}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    :goto_0
    monitor-exit p0

    return-void

    .line 288
    :cond_0
    :try_start_1
    new-instance v2, Lcom/webuid/mmVideo/PushService$MQTTConnection;

    const-string v3, "mm.xizitu.com"

    invoke-direct {v2, p0, v3, v0}, Lcom/webuid/mmVideo/PushService$MQTTConnection;-><init>(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_1 .. :try_end_1} :catch_0

    .line 296
    :cond_1
    :goto_1
    const/4 v2, 0x1

    :try_start_2
    invoke-direct {p0, v2}, Lcom/webuid/mmVideo/PushService;->setStarted(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 280
    .end local v0           #deviceID:Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 289
    .restart local v0       #deviceID:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 291
    .local v1, e:Lcom/ibm/mqtt/MqttException;
    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v2, "MqttException: "

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttException;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttException;->getMessage()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 292
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->isNetworkAvailable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 293
    iget-wide v2, p0, Lcom/webuid/mmVideo/PushService;->mStartTime:J

    invoke-virtual {p0, v2, v3}, Lcom/webuid/mmVideo/PushService;->scheduleReconnect(J)V

    goto :goto_1

    .line 291
    :cond_2
    const-string v2, "NULL"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2
.end method

.method private handleCrashedService()V
    .locals 1

    .prologue
    .line 159
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->wasStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    const-string v0, "Handling crashed service..."

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 162
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->stopKeepAlives()V

    .line 165
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->start()V

    .line 167
    :cond_0
    return-void
.end method

.method private isNetworkAvailable()Z
    .locals 2

    .prologue
    .line 433
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnMan:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 434
    .local v0, info:Landroid/net/NetworkInfo;
    if-nez v0, :cond_0

    .line 435
    const/4 v1, 0x0

    .line 437
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    goto :goto_0
.end method

.method private declared-synchronized keepAlive()V
    .locals 3

    .prologue
    .line 303
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    if-eqz v1, :cond_0

    .line 304
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->sendKeepAlive()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 306
    :catch_0
    move-exception v0

    .line 307
    .local v0, e:Lcom/ibm/mqtt/MqttException;
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v1, "MqttException: "

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttException;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->disconnect()V

    .line 310
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    .line 311
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PushService;->cancelReconnect()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 303
    .end local v0           #e:Lcom/ibm/mqtt/MqttException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 307
    .restart local v0       #e:Lcom/ibm/mqtt/MqttException;
    :cond_1
    :try_start_2
    const-string v1, "NULL"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 211
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    return-void
.end method

.method private log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .parameter "message"
    .parameter "e"

    .prologue
    .line 214
    if-eqz p2, :cond_1

    .line 215
    const-string v0, "mmVideoService"

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 221
    :goto_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    if-eqz v0, :cond_0

    .line 224
    :try_start_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    invoke-virtual {v0, p1}, Lcom/webuid/mmVideo/ConnectionLog;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :cond_0
    :goto_1
    return-void

    .line 218
    :cond_1
    const-string v0, "mmVideoService"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 225
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private declared-synchronized reconnectIfNecessary()V
    .locals 1

    .prologue
    .line 379
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    if-nez v0, :cond_0

    .line 380
    const-string v0, "Reconnecting..."

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 381
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->connect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 383
    :cond_0
    monitor-exit p0

    return-void

    .line 379
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private setStarted(Z)V
    .locals 2
    .parameter "started"

    .prologue
    .line 236
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "isStarted"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 237
    iput-boolean p1, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    .line 238
    return-void
.end method

.method private showNotification(Ljava/lang/String;)V
    .locals 5
    .parameter "text"

    .prologue
    const/4 v4, 0x0

    .line 411
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    .line 413
    .local v0, n:Landroid/app/Notification;
    iget v2, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x1

    iput v2, v0, Landroid/app/Notification;->flags:I

    .line 414
    iget v2, v0, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x10

    iput v2, v0, Landroid/app/Notification;->flags:I

    .line 416
    const/4 v2, -0x1

    iput v2, v0, Landroid/app/Notification;->defaults:I

    .line 418
    const v2, 0x7f020026

    iput v2, v0, Landroid/app/Notification;->icon:I

    .line 419
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Landroid/app/Notification;->when:J

    .line 420
    const/4 v2, 0x1

    iput v2, v0, Landroid/app/Notification;->number:I

    .line 423
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/webuid/mmVideo/MainActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v4, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 426
    .local v1, pi:Landroid/app/PendingIntent;
    sget-object v2, Lcom/webuid/mmVideo/PushService;->NOTIF_TITLE:Ljava/lang/String;

    invoke-virtual {v0, p0, v2, p1, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 428
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService;->mNotifMan:Landroid/app/NotificationManager;

    invoke-virtual {v2, v4, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 429
    return-void
.end method

.method private declared-synchronized start()V
    .locals 3

    .prologue
    .line 241
    monitor-enter p0

    :try_start_0
    const-string v0, "Starting service..."

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 244
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    if-eqz v0, :cond_0

    .line 245
    const-string v0, "mmVideoService"

    const-string v1, "Attempt to start connection that is already active"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    :goto_0
    monitor-exit p0

    return-void

    .line 250
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->connect()V

    .line 253
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnectivityChanged:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/webuid/mmVideo/PushService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 241
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private startKeepAlives()V
    .locals 8

    .prologue
    const-wide/32 v4, 0x19a280

    const/4 v1, 0x0

    .line 317
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 318
    .local v7, i:Landroid/content/Intent;
    const-class v2, Lcom/webuid/mmVideo/PushService;

    invoke-virtual {v7, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 319
    sget-object v2, Lcom/webuid/mmVideo/PushService;->ACTION_KEEPALIVE:Ljava/lang/String;

    invoke-virtual {v7, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 320
    invoke-static {p0, v1, v7, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 321
    .local v6, pi:Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 323
    .local v0, alarmMgr:Landroid/app/AlarmManager;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v4

    .line 322
    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 325
    return-void
.end method

.method private declared-synchronized stop()V
    .locals 2

    .prologue
    .line 258
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    if-nez v0, :cond_1

    .line 259
    const-string v0, "mmVideoService"

    const-string v1, "Attempt to stop connection not active."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 264
    :cond_1
    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->setStarted(Z)V

    .line 267
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnectivityChanged:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/PushService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 269
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PushService;->cancelReconnect()V

    .line 272
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->disconnect()V

    .line 274
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 258
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private stopKeepAlives()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 329
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 330
    .local v1, i:Landroid/content/Intent;
    const-class v3, Lcom/webuid/mmVideo/PushService;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 331
    sget-object v3, Lcom/webuid/mmVideo/PushService;->ACTION_KEEPALIVE:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 332
    invoke-static {p0, v4, v1, v4}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 333
    .local v2, pi:Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 334
    .local v0, alarmMgr:Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 335
    return-void
.end method

.method private wasStarted()Z
    .locals 3

    .prologue
    .line 231
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "isStarted"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public cancelReconnect()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 370
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 371
    .local v1, i:Landroid/content/Intent;
    const-class v3, Lcom/webuid/mmVideo/PushService;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 372
    sget-object v3, Lcom/webuid/mmVideo/PushService;->ACTION_RECONNECT:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 373
    invoke-static {p0, v4, v1, v4}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 374
    .local v2, pi:Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 375
    .local v0, alarmMgr:Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 376
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 206
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 133
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 135
    const-string v1, "Creating service"

    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/webuid/mmVideo/PushService;->mStartTime:J

    .line 139
    :try_start_0
    new-instance v1, Lcom/webuid/mmVideo/ConnectionLog;

    invoke-direct {v1}, Lcom/webuid/mmVideo/ConnectionLog;-><init>()V

    iput-object v1, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    .line 140
    const-string v1, "mmVideoService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Opened log at "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    invoke-virtual {v3}, Lcom/webuid/mmVideo/ConnectionLog;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :goto_0
    const-string v1, "mmVideoService"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/webuid/mmVideo/PushService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    .line 147
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/webuid/mmVideo/PushService;->mConnMan:Landroid/net/ConnectivityManager;

    .line 148
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    iput-object v1, p0, Lcom/webuid/mmVideo/PushService;->mNotifMan:Landroid/app/NotificationManager;

    .line 153
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->handleCrashedService()V

    .line 154
    return-void

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, e:Ljava/io/IOException;
    const-string v1, "mmVideoService"

    const-string v2, "Failed to open log"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Service destroyed (started="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 174
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PushService;->mStarted:Z

    if-eqz v0, :cond_0

    .line 175
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->stop()V

    .line 179
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    if-eqz v0, :cond_1

    .line 180
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService;->mLog:Lcom/webuid/mmVideo/ConnectionLog;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/ConnectionLog;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :cond_1
    :goto_0
    return-void

    .line 181
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 186
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Service started with intent="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 190
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_STOP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 191
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->stop()V

    .line 192
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PushService;->stopSelf()V

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 193
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_START:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 194
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->start()V

    goto :goto_0

    .line 195
    :cond_2
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_KEEPALIVE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 196
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->keepAlive()V

    goto :goto_0

    .line 197
    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/webuid/mmVideo/PushService;->ACTION_RECONNECT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->isNetworkAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    invoke-direct {p0}, Lcom/webuid/mmVideo/PushService;->reconnectIfNecessary()V

    goto :goto_0
.end method

.method public scheduleReconnect(J)V
    .locals 13
    .parameter "startTime"

    .prologue
    .line 340
    iget-object v9, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    const-string v10, "retryInterval"

    const-wide/16 v11, 0x2710

    invoke-interface {v9, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 343
    .local v4, interval:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 344
    .local v6, now:J
    sub-long v1, v6, p1

    .line 348
    .local v1, elapsed:J
    cmp-long v9, v1, v4

    if-gez v9, :cond_0

    .line 349
    const-wide/16 v9, 0x4

    mul-long/2addr v9, v4

    const-wide/32 v11, 0x1b7740

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 354
    :goto_0
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Rescheduling connection in "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "ms."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V

    .line 357
    iget-object v9, p0, Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "retryInterval"

    invoke-interface {v9, v10, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 360
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 361
    .local v3, i:Landroid/content/Intent;
    const-class v9, Lcom/webuid/mmVideo/PushService;

    invoke-virtual {v3, p0, v9}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 362
    sget-object v9, Lcom/webuid/mmVideo/PushService;->ACTION_RECONNECT:Ljava/lang/String;

    invoke-virtual {v3, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 363
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {p0, v9, v3, v10}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 364
    .local v8, pi:Landroid/app/PendingIntent;
    const-string v9, "alarm"

    invoke-virtual {p0, v9}, Lcom/webuid/mmVideo/PushService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 365
    .local v0, alarmMgr:Landroid/app/AlarmManager;
    const/4 v9, 0x0

    add-long v10, v6, v4

    invoke-virtual {v0, v9, v10, v11, v8}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 366
    return-void

    .line 351
    .end local v0           #alarmMgr:Landroid/app/AlarmManager;
    .end local v3           #i:Landroid/content/Intent;
    .end local v8           #pi:Landroid/app/PendingIntent;
    :cond_0
    const-wide/16 v4, 0x2710

    goto :goto_0
.end method
