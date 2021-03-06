.class public Lorg/eclipse/paho/client/mqttv3/MqttClient;
.super Ljava/lang/Object;
.source "MqttClient.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/internal/DestinationProvider;


# static fields
.field private static final URI_TYPE_LOCAL:I = 0x2

.field private static final URI_TYPE_SSL:I = 0x1

.field private static final URI_TYPE_TCP:I


# instance fields
.field private clientId:Ljava/lang/String;

.field private comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

.field private persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

.field private serverURI:Ljava/lang/String;

.field private serverURIType:I

.field private topics:Ljava/util/Hashtable;

.field private trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "serverURI"
    .parameter "clientId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 106
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttDefaultFilePersistence;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttDefaultFilePersistence;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;)V
    .locals 5
    .parameter "serverURI"
    .parameter "clientId"
    .parameter "persistence"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x17

    if-le v0, v1, :cond_1

    .line 170
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 172
    :cond_1
    invoke-static {p2}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->getTrace(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    .line 174
    iput-object p1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURI:Ljava/lang/String;

    .line 175
    invoke-direct {p0, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->validateURI(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURIType:I

    .line 176
    iput-object p2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->clientId:Ljava/lang/String;

    .line 178
    iput-object p3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    .line 179
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    if-nez v0, :cond_2

    .line 180
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/MemoryPersistence;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/internal/MemoryPersistence;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    .line 184
    :cond_2
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v1, 0x65

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    aput-object p1, v2, v4

    const/4 v3, 0x2

    aput-object p3, v2, v3

    invoke-virtual {v0, v4, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;)V

    .line 186
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    invoke-interface {v0, p2, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->open(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    invoke-direct {v0, p0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/DestinationProvider;Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;)V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    .line 188
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    invoke-interface {v0}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->close()V

    .line 189
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->topics:Ljava/util/Hashtable;

    .line 191
    return-void
.end method

.method public static generateClientId()Ljava/lang/String;
    .locals 3

    .prologue
    .line 644
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "user.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHostName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "uri"

    .prologue
    .line 294
    const/16 v2, 0x2f

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 295
    .local v1, schemeIndex:I
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 296
    .local v0, portIndex:I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 297
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 299
    :cond_0
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private getPort(Ljava/lang/String;I)I
    .locals 3
    .parameter "uri"
    .parameter "defaultPort"

    .prologue
    .line 283
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 284
    .local v1, portIndex:I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 285
    move v0, p2

    .line 290
    .local v0, port:I
    :goto_0
    return v0

    .line 288
    .end local v0           #port:I
    :cond_0
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .restart local v0       #port:I
    goto :goto_0
.end method

.method private validateURI(Ljava/lang/String;)I
    .locals 1
    .parameter "serverURI"

    .prologue
    .line 194
    const-string v0, "tcp://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 195
    const/4 v0, 0x0

    .line 201
    :goto_0
    return v0

    .line 197
    :cond_0
    const-string v0, "ssl://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 198
    const/4 v0, 0x1

    goto :goto_0

    .line 200
    :cond_1
    const-string v0, "local://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 201
    const/4 v0, 0x2

    goto :goto_0

    .line 204
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 308
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)V

    .line 309
    return-void
.end method

.method public connect(Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)V
    .locals 9
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;,
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 317
    invoke-virtual {p0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    const/16 v0, 0x7d64

    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v0

    throw v0

    .line 322
    :cond_0
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->isOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 323
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v2, 0x67

    const/4 v0, 0x6

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    new-instance v4, Ljava/lang/Boolean;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Boolean;-><init>(Z)V

    aput-object v4, v3, v0

    new-instance v0, Ljava/lang/Integer;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/lang/Integer;-><init>(I)V

    aput-object v0, v3, v6

    const/4 v0, 0x2

    new-instance v4, Ljava/lang/Integer;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getKeepAliveInterval()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v3, v0

    const/4 v0, 0x3

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getUserName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

    const/4 v4, 0x4

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getPassword()[C

    move-result-object v0

    if-nez v0, :cond_3

    const-string v0, "[null]"

    :goto_0
    aput-object v0, v3, v4

    const/4 v4, 0x5

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, "[null]"

    :goto_1
    aput-object v0, v3, v4

    invoke-virtual {v1, v6, v2, v3}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;)V

    .line 332
    :cond_1
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURI:Ljava/lang/String;

    invoke-virtual {p0, v1, p1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->createNetworkModule(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setNetworkModule(Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;)V

    .line 334
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->clientId:Ljava/lang/String;

    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURI:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->open(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 337
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->persistence:Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;

    invoke-interface {v0}, Lorg/eclipse/paho/client/mqttv3/MqttClientPersistence;->clear()V

    .line 339
    :cond_2
    iget-object v8, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnect;

    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->clientId:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v2

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getKeepAliveInterval()I

    move-result v3

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getPassword()[C

    move-result-object v5

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillMessage()Lorg/eclipse/paho/client/mqttv3/MqttMessage;

    move-result-object v6

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getWillDestination()Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnect;-><init>(Ljava/lang/String;ZILjava/lang/String;[CLorg/eclipse/paho/client/mqttv3/MqttMessage;Lorg/eclipse/paho/client/mqttv3/MqttTopic;)V

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result v3

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getKeepAliveInterval()I

    move-result v1

    int-to-long v4, v1

    invoke-virtual {p1}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->isCleanSession()Z

    move-result v6

    move-object v1, v8

    move-object v2, v0

    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->connect(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnect;IJZ)Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttConnack;

    .line 351
    return-void

    .line 323
    :cond_3
    const-string v0, "[notnull]"

    goto :goto_0

    :cond_4
    const-string v0, "[notnull]"

    goto :goto_1
.end method

.method protected createNetworkModule(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 12
    .parameter "address"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v2

    .line 221
    .local v2, factory:Ljavax/net/SocketFactory;
    iget v10, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURIType:I

    packed-switch v10, :pswitch_data_0

    .line 276
    const/4 v6, 0x0

    .line 278
    .local v6, netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    :cond_0
    :goto_0
    return-object v6

    .line 223
    .end local v6           #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    :pswitch_0
    const/4 v10, 0x6

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 224
    .local v8, shortAddress:Ljava/lang/String;
    invoke-direct {p0, v8}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getHostName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, host:Ljava/lang/String;
    const/16 v10, 0x75b

    invoke-direct {p0, v8, v10}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getPort(Ljava/lang/String;I)I

    move-result v7

    .line 226
    .local v7, port:I
    if-nez v2, :cond_2

    .line 227
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v2

    .line 228
    invoke-virtual {p2, v2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->setSocketFactory(Ljavax/net/SocketFactory;)V

    .line 233
    :cond_1
    new-instance v6, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;

    iget-object v10, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    invoke-direct {v6, v10, v2, v5, v7}, Lorg/eclipse/paho/client/mqttv3/internal/TCPNetworkModule;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;Ljavax/net/SocketFactory;Ljava/lang/String;I)V

    .line 234
    .restart local v6       #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    goto :goto_0

    .line 230
    .end local v6           #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    :cond_2
    instance-of v10, v2, Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v10, :cond_1

    .line 231
    const/16 v10, 0x7d69

    invoke-static {v10}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v10

    throw v10

    .line 236
    .end local v5           #host:Ljava/lang/String;
    .end local v7           #port:I
    .end local v8           #shortAddress:Ljava/lang/String;
    :pswitch_1
    const/4 v10, 0x6

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 237
    .restart local v8       #shortAddress:Ljava/lang/String;
    invoke-direct {p0, v8}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getHostName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 238
    .restart local v5       #host:Ljava/lang/String;
    const/16 v10, 0x22b3

    invoke-direct {p0, v8, v10}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->getPort(Ljava/lang/String;I)I

    move-result v7

    .line 239
    .restart local v7       #port:I
    const/4 v3, 0x0

    .line 240
    .local v3, factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    if-nez v2, :cond_5

    .line 242
    :try_start_0
    new-instance v4, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;

    invoke-direct {v4}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;-><init>()V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/internal/comms/MqttDirectException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .end local v3           #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    .local v4, factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    :try_start_1
    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getSSLProperties()Ljava/util/Properties;

    move-result-object v9

    .line 244
    .local v9, sslClientProps:Ljava/util/Properties;
    if-eqz v9, :cond_3

    .line 245
    const/4 v10, 0x0

    invoke-virtual {v4, v9, v10}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->initialize(Ljava/util/Properties;Ljava/lang/String;)V

    .line 246
    :cond_3
    const/4 v10, 0x0

    invoke-virtual {v4, v10}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->createSocketFactory(Ljava/lang/String;)Ljavax/net/ssl/SSLSocketFactory;
    :try_end_1
    .catch Lorg/eclipse/paho/client/mqttv3/internal/comms/MqttDirectException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    move-object v3, v4

    .line 261
    .end local v4           #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    .end local v9           #sslClientProps:Ljava/util/Properties;
    .restart local v3       #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    :cond_4
    new-instance v6, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;

    iget-object v11, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    move-object v10, v2

    check-cast v10, Ljavax/net/ssl/SSLSocketFactory;

    invoke-direct {v6, v11, v10, v5, v7}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;-><init>(Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;Ljavax/net/ssl/SSLSocketFactory;Ljava/lang/String;I)V

    .restart local v6       #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    move-object v10, v6

    .line 262
    check-cast v10, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;->getConnectionTimeout()I

    move-result v11

    invoke-virtual {v10, v11}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setSSLhandshakeTimeout(I)V

    .line 264
    if-eqz v3, :cond_0

    .line 265
    const/4 v10, 0x0

    invoke-virtual {v3, v10}, Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;->getEnabledCipherSuites(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, enabledCiphers:[Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v10, v6

    .line 267
    check-cast v10, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;

    invoke-virtual {v10, v0}, Lorg/eclipse/paho/client/mqttv3/internal/SSLNetworkModule;->setEnabledCiphers([Ljava/lang/String;)V

    goto :goto_0

    .line 248
    .end local v0           #enabledCiphers:[Ljava/lang/String;
    .end local v6           #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    :catch_0
    move-exception v1

    .line 253
    .local v1, ex:Lorg/eclipse/paho/client/mqttv3/internal/comms/MqttDirectException;
    :goto_1
    invoke-virtual {v1}, Lorg/eclipse/paho/client/mqttv3/internal/comms/MqttDirectException;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    invoke-static {v10}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(Ljava/lang/Throwable;)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v10

    throw v10

    .line 256
    .end local v1           #ex:Lorg/eclipse/paho/client/mqttv3/internal/comms/MqttDirectException;
    :cond_5
    instance-of v10, v2, Ljavax/net/ssl/SSLSocketFactory;

    if-nez v10, :cond_4

    .line 257
    const/16 v10, 0x7d69

    invoke-static {v10}, Lorg/eclipse/paho/client/mqttv3/internal/ExceptionHelper;->createMqttException(I)Lorg/eclipse/paho/client/mqttv3/MqttException;

    move-result-object v10

    throw v10

    .line 272
    .end local v3           #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    .end local v5           #host:Ljava/lang/String;
    .end local v7           #port:I
    .end local v8           #shortAddress:Ljava/lang/String;
    :pswitch_2
    new-instance v6, Lorg/eclipse/paho/client/mqttv3/internal/LocalNetworkModule;

    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Lorg/eclipse/paho/client/mqttv3/internal/LocalNetworkModule;-><init>(Ljava/lang/String;)V

    .line 273
    .restart local v6       #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    goto/16 :goto_0

    .line 248
    .end local v6           #netModule:Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .restart local v4       #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    .restart local v5       #host:Ljava/lang/String;
    .restart local v7       #port:I
    .restart local v8       #shortAddress:Ljava/lang/String;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4           #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    .restart local v3       #factoryFactory:Lorg/eclipse/paho/client/mqttv3/internal/security/SSLSocketFactoryFactory;
    goto :goto_1

    .line 221
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public disconnect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 361
    const-wide/16 v0, 0x7530

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->disconnect(J)V

    .line 362
    return-void
.end method

.method public disconnect(J)V
    .locals 8
    .parameter "quiesceTimeout"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 382
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v3, 0x68

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/Long;

    invoke-direct {v6, p1, p2}, Ljava/lang/Long;-><init>(J)V

    aput-object v6, v4, v5

    invoke-virtual {v2, v7, v3, v4}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;)V

    .line 383
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;

    invoke-direct {v0}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;-><init>()V

    .line 385
    .local v0, disconnect:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v2, v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->disconnect(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttDisconnect;J)V
    :try_end_0
    .catch Lorg/eclipse/paho/client/mqttv3/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    return-void

    .line 387
    :catch_0
    move-exception v1

    .line 389
    .local v1, ex:Lorg/eclipse/paho/client/mqttv3/MqttException;
    iget-object v2, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v3, 0x69

    const/4 v4, 0x0

    invoke-virtual {v2, v7, v3, v4, v1}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 390
    throw v1
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->clientId:Ljava/lang/String;

    return-object v0
.end method

.method public getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;
    .locals 1

    .prologue
    .line 651
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->getPendingDeliveryTokens()[Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;

    move-result-object v0

    return-object v0
.end method

.method public getServerURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 421
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->serverURI:Ljava/lang/String;

    return-object v0
.end method

.method public getTopic(Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    .locals 3
    .parameter "topic"

    .prologue
    const/4 v2, -0x1

    .line 461
    const/16 v1, 0x23

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    const/16 v1, 0x2b

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ne v1, v2, :cond_1

    .line 462
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->topics:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    .line 463
    .local v0, result:Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    if-nez v0, :cond_0

    .line 464
    new-instance v0, Lorg/eclipse/paho/client/mqttv3/MqttTopic;

    .end local v0           #result:Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-direct {v0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttTopic;-><init>(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;)V

    .line 465
    .restart local v0       #result:Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    iget-object v1, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->topics:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    :cond_0
    return-object v0

    .line 470
    .end local v0           #result:Lorg/eclipse/paho/client/mqttv3/MqttTopic;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 401
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->isConnected()Z

    move-result v0

    return v0
.end method

.method public setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V
    .locals 1
    .parameter "callback"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 631
    iget-object v0, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v0, p1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->setCallback(Lorg/eclipse/paho/client/mqttv3/MqttCallback;)V

    .line 632
    return-void
.end method

.method public subscribe(Ljava/lang/String;)V
    .locals 4
    .parameter "topicFilter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 482
    new-array v0, v2, [Ljava/lang/String;

    aput-object p1, v0, v3

    new-array v1, v2, [I

    aput v2, v1, v3

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    .line 483
    return-void
.end method

.method public subscribe(Ljava/lang/String;I)V
    .locals 3
    .parameter "topicFilter"
    .parameter "qos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 510
    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    new-array v1, v1, [I

    aput p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    .line 511
    return-void
.end method

.method public subscribe([Ljava/lang/String;)V
    .locals 3
    .parameter "topicFilters"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .prologue
    .line 493
    array-length v2, p1

    new-array v1, v2, [I

    .line 494
    .local v1, qos:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 495
    const/4 v2, 0x1

    aput v2, v1, v0

    .line 494
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 497
    :cond_0
    invoke-virtual {p0, p1, v1}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->subscribe([Ljava/lang/String;[I)V

    .line 498
    return-void
.end method

.method public subscribe([Ljava/lang/String;[I)V
    .locals 8
    .parameter "topicFilters"
    .parameter "qos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Lorg/eclipse/paho/client/mqttv3/MqttSecurityException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 573
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_0

    .line 574
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 576
    :cond_0
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    invoke-virtual {v3}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->isOn()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 577
    const-string v2, ""

    .line 578
    .local v2, subs:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 579
    if-lez v0, :cond_1

    .line 580
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 582
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, p2, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 578
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 585
    :cond_2
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v4, 0x6a

    new-array v5, v7, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    invoke-virtual {v3, v7, v4, v5}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;)V

    .line 587
    .end local v0           #i:I
    .end local v2           #subs:Ljava/lang/String;
    :cond_3
    new-instance v1, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSubscribe;

    invoke-direct {v1, p1, p2}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSubscribe;-><init>([Ljava/lang/String;[I)V

    .line 588
    .local v1, register:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttSubscribe;
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3, v1}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->sendAndWait(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V

    .line 589
    return-void
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 2
    .parameter "topicFilter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    .line 597
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/eclipse/paho/client/mqttv3/MqttClient;->unsubscribe([Ljava/lang/String;)V

    .line 598
    return-void
.end method

.method public unsubscribe([Ljava/lang/String;)V
    .locals 8
    .parameter "topicFilters"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 606
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    invoke-virtual {v3}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->isOn()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 607
    const-string v1, ""

    .line 608
    .local v1, subs:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_1

    .line 609
    if-lez v0, :cond_0

    .line 610
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 612
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 608
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 615
    :cond_1
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->trace:Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;

    const/16 v4, 0x6b

    new-array v5, v7, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-virtual {v3, v7, v4, v5}, Lorg/eclipse/paho/client/mqttv3/internal/trace/Trace;->trace(BI[Ljava/lang/Object;)V

    .line 617
    .end local v0           #i:I
    .end local v1           #subs:Ljava/lang/String;
    :cond_2
    new-instance v2, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttUnsubscribe;

    invoke-direct {v2, p1}, Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttUnsubscribe;-><init>([Ljava/lang/String;)V

    .line 618
    .local v2, unregister:Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttUnsubscribe;
    iget-object v3, p0, Lorg/eclipse/paho/client/mqttv3/MqttClient;->comms:Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;

    invoke-virtual {v3, v2}, Lorg/eclipse/paho/client/mqttv3/internal/ClientComms;->sendAndWait(Lorg/eclipse/paho/client/mqttv3/internal/wire/MqttWireMessage;)V

    .line 619
    return-void
.end method
