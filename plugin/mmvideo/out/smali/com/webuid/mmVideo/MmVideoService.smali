.class public Lcom/webuid/mmVideo/MmVideoService;
.super Landroid/app/Service;
.source "MmVideoService.java"


# static fields
.field public static final BROKER_URL:Ljava/lang/String; = "tcp://mm.xizitu.com:1883"

.field public static TOPIC:Ljava/lang/String;

.field public static clientId:Ljava/lang/String;


# instance fields
.field private mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string v0, "aclient"

    sput-object v0, Lcom/webuid/mmVideo/MmVideoService;->clientId:Ljava/lang/String;

    .line 35
    const-string v0, "mm/aclient"

    sput-object v0, Lcom/webuid/mmVideo/MmVideoService;->TOPIC:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 40
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/MmVideoService;->mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->disconnect(J)V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, e:Lorg/eclipse/paho/client/mqttv3/MqttException;
    invoke-virtual {p0}, Lcom/webuid/mmVideo/MmVideoService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Something went wrong!"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 74
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttException;->printStackTrace()V

    goto :goto_0
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 5
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 47
    :try_start_0
    const-string v1, "----------------clientId"

    sget-object v2, Lcom/webuid/mmVideo/MmVideoService;->clientId:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    const-string v1, "----------------BROKER_URL"

    const-string v2, "tcp://mm.xizitu.com:1883"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    new-instance v1, Lorg/eclipse/paho/client/mqttv3/MqttClient;

    const-string v2, "tcp://mm.xizitu.com:1883"

    sget-object v3, Lcom/webuid/mmVideo/MmVideoService;->clientId:Ljava/lang/String;

    new-instance v4, Lorg/eclipse/paho/client/mqttv3/internal/MemoryPersistence;

    invoke-direct {v4}, Lorg/eclipse/paho/client/mqttv3/internal/MemoryPersistence;-><init>()V

    invoke-direct {v1, v2, v3, v4}, Lorg/eclipse/paho/client/mqttv3/MqttClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    iput-object v1, p0, Lcom/webuid/mmVideo/MmVideoService;->mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;

    .line 51
    iget-object v1, p0, Lcom/webuid/mmVideo/MmVideoService;->mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;

    new-instance v2, Lcom/webuid/mmVideo/PushCallback;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/PushCallback;-><init>(Landroid/content/ContextWrapper;)V

    invoke-virtual {v1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V

    .line 52
    iget-object v1, p0, Lcom/webuid/mmVideo/MmVideoService;->mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;

    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->connect()V

    .line 55
    const-string v1, "----------------TOPIC"

    sget-object v2, Lcom/webuid/mmVideo/MmVideoService;->TOPIC:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    iget-object v1, p0, Lcom/webuid/mmVideo/MmVideoService;->mqttClient:Lorg/eclipse/paho/client/mqttv3/MqttClient;

    sget-object v2, Lcom/webuid/mmVideo/MmVideoService;->TOPIC:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 66
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 62
    .local v0, e:Lorg/eclipse/paho/client/mqttv3/MqttException;
    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/MqttException;->printStackTrace()V

    goto :goto_0
.end method
