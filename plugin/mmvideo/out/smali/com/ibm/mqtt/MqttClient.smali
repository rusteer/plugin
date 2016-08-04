.class public Lcom/ibm/mqtt/MqttClient;
.super Lcom/ibm/mqtt/MqttBaseClient;

# interfaces
.implements Lcom/ibm/mqtt/IMqttClient;


# instance fields
.field private advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

.field private conRetCode:I

.field private connAckLock:Ljava/lang/Object;

.field private connection:Ljava/lang/String;

.field private isAppConnected:Z

.field private persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

.field private reader:Ljava/lang/Thread;

.field private simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

.field private traceClass:Ljava/lang/Class;


# direct methods
.method protected constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttBaseClient;-><init>()V

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ibm/mqtt/MqttClient;-><init>(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttBaseClient;-><init>()V

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    invoke-virtual {p0, p1, p2}, Lcom/ibm/mqtt/MqttClient;->initialise(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)V

    return-void
.end method

.method public static final createMqttClient(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)Lcom/ibm/mqtt/IMqttClient;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    new-instance v0, Lcom/ibm/mqtt/MqttClient;

    invoke-direct {v0, p0, p1}, Lcom/ibm/mqtt/MqttClient;-><init>(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)V

    return-object v0
.end method

.method private invalidApiInvocation()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    new-instance v0, Lcom/ibm/mqtt/MqttException;

    const-string v1, "MqttClient API called in a callback method! Use a different thread."

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private loadLocalBindings()Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "com.ibm.mqtt.local.MqttLocalBindingV2"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    const/4 v1, 0x1

    :goto_0
    if-nez v1, :cond_0

    :try_start_1
    const-string v0, "com.ibm.mqtt.local.MqttLocalBindingV1"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    const-string v2, "LocalBinding unavailable: Microbroker classes not found"

    invoke-direct {v1, v2}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/ibm/mqtt/MqttException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private loadTcpBindings()Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "com.ibm.mqtt.j2se.MqttJavaNetSocket"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    const/4 v1, 0x1

    :goto_0
    if-nez v1, :cond_0

    :try_start_1
    const-string v0, "com.ibm.mqtt.midp.MqttMidpSocket"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    const-string v2, "Cannot locate a J2SE Socket or J2ME StreamConnection class"

    invoke-direct {v1, v2}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/ibm/mqtt/MqttException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private start(Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/16 v0, 0x78

    invoke-super {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->setRetry(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v1, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public connect(Ljava/lang/String;ZS)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttBrokerUnavailableException;,
            Lcom/ibm/mqtt/MqttNotConnectedException;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v6, v4

    move v7, v5

    invoke-virtual/range {v0 .. v7}, Lcom/ibm/mqtt/MqttClient;->connect(Ljava/lang/String;ZSLjava/lang/String;ILjava/lang/String;Z)V

    return-void
.end method

.method public connect(Ljava/lang/String;ZSLjava/lang/String;ILjava/lang/String;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttBrokerUnavailableException;,
            Lcom/ibm/mqtt/MqttNotConnectedException;
        }
    .end annotation

    const/16 v0, -0x7532

    const-wide/32 v1, 0x100004

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->isSocketConnected()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v9, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    monitor-enter v9

    const/4 v0, -0x1

    :try_start_0
    iput v0, p0, Lcom/ibm/mqtt/MqttClient;->conRetCode:I

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    invoke-super/range {v0 .. v8}, Lcom/ibm/mqtt/MqttBaseClient;->connect(Ljava/lang/String;ZZSLjava/lang/String;ILjava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->getRetry()I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    :try_start_2
    iget v0, p0, Lcom/ibm/mqtt/MqttClient;->conRetCode:I

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/16 v1, -0x7533

    const-wide/32 v2, 0x100008

    invoke-static {p0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttClient;->tcpipDisconnect(Z)V

    new-instance v0, Lcom/ibm/mqtt/MqttNotConnectedException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "WMQTT "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Lcom/ibm/mqtt/MqttClient;->msgTypes:[Ljava/lang/String;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " not received"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttNotConnectedException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :pswitch_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    :cond_1
    return-void

    :pswitch_1
    new-instance v0, Lcom/ibm/mqtt/MqttConnect;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttConnect;-><init>()V

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "WMQTT protocol name or version not supported:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, v0, Lcom/ibm/mqtt/MqttConnect;->ProtoName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " Version:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-short v0, v0, Lcom/ibm/mqtt/MqttConnect;->ProtoVersion:S

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_2
    new-instance v0, Lcom/ibm/mqtt/MqttException;

    const-string v1, "WMQTT ClientId is invalid"

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_3
    new-instance v0, Lcom/ibm/mqtt/MqttBrokerUnavailableException;

    const-string v1, "WMQTT Broker is unavailable"

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttBrokerUnavailableException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected connectionLost()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/16 v0, -0x7534

    const-wide/32 v1, 0x200000

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    invoke-super {p0}, Lcom/ibm/mqtt/MqttBaseClient;->connectionLost()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttSimpleCallback;->connectionLost()V

    return-void

    :cond_0
    new-instance v0, Lcom/ibm/mqtt/MqttNotConnectedException;

    const-string v1, "WMQtt Connection Lost"

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttNotConnectedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disconnect()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation

    const/16 v0, -0x7535

    const-wide/32 v1, 0x100004

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/ibm/mqtt/MqttBaseClient;->disconnect()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    :cond_0
    const/16 v0, -0x7536

    const-wide/32 v1, 0x100008

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return-void
.end method

.method public getConnection()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->connection:Ljava/lang/String;

    return-object v0
.end method

.method public getPersistence()Lcom/ibm/mqtt/MqttPersistence;
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    return-object v0
.end method

.method protected initialise(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    iput-object p1, p0, Lcom/ibm/mqtt/MqttClient;->connection:Ljava/lang/String;

    iput-object p2, p0, Lcom/ibm/mqtt/MqttClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    const-string v0, "local://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->loadLocalBindings()Ljava/lang/Class;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/ibm/mqtt/MqttClient;->connection:Ljava/lang/String;

    iget-object v2, p0, Lcom/ibm/mqtt/MqttClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-super {p0, v1, v2, v0}, Lcom/ibm/mqtt/MqttBaseClient;->initialise(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;Ljava/lang/Class;)V

    :try_start_0
    const-string v1, "com.ibm.mqtt.trace.MQeTraceToBinaryFile"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttClient;->start(Ljava/lang/Class;)V

    return-void

    :cond_0
    const-string v0, "tcp://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->loadTcpBindings()Ljava/lang/Class;

    move-result-object v0

    const/16 v1, 0x40

    const/16 v2, 0x3a

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->connection:Ljava/lang/String;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/ibm/mqtt/MqttException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unrecognised connection method:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_0
    move-exception v1

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;

    goto :goto_1
.end method

.method protected notifyAck(II)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v1, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p2, p0, Lcom/ibm/mqtt/MqttClient;->conRetCode:I

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->connAckLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :pswitch_2
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    invoke-virtual {p0, p2}, Lcom/ibm/mqtt/MqttClient;->getReturnedQoS(I)[B

    move-result-object v1

    invoke-interface {v0, p2, v1}, Lcom/ibm/mqtt/MqttAdvancedCallback;->subscribed(I[B)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    invoke-interface {v0, p2}, Lcom/ibm/mqtt/MqttAdvancedCallback;->unsubscribed(I)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    invoke-interface {v0, p2}, Lcom/ibm/mqtt/MqttAdvancedCallback;->published(I)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public ping()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->invalidApiInvocation()V

    :cond_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->pingOut()V

    return-void
.end method

.method public publish(Ljava/lang/String;[BIZ)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttPersistenceException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 v3, -0x1

    const/16 v0, -0x7537

    const-wide/32 v1, 0x100004

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL topic"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL message"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/16 v0, 0x23

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gt v0, v3, :cond_2

    const/16 v0, 0x2b

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-le v0, v3, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Topic contains \'#\' or \'+\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->invalidApiInvocation()V

    :cond_4
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->anyErrors()V

    invoke-super {p0, p1, p2, p3, p4}, Lcom/ibm/mqtt/MqttBaseClient;->publish(Ljava/lang/String;[BIZ)I

    move-result v0

    const/16 v1, -0x7538

    const-wide/32 v2, 0x100008

    invoke-static {p0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return v0
.end method

.method protected publishArrived(Ljava/lang/String;[BIZ)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/16 v2, 0x1e

    const/4 v1, 0x0

    invoke-static {p2, v1, v2}, Lcom/ibm/mqtt/MqttUtils;->toHexString([BII)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v2, :cond_1

    const/16 v0, 0x1f

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_0
    const/16 v1, -0x7539

    const-wide/32 v2, 0x100004

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    array-length v0, p2

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    invoke-static/range {v0 .. v7}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ibm/mqtt/MqttSimpleCallback;->publishArrived(Ljava/lang/String;[BIZ)V

    :cond_0
    const/16 v0, -0x753a

    const-wide/32 v1, 0x100008

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return-void

    :cond_1
    move-object v5, p1

    goto :goto_0
.end method

.method public registerAdvancedHandler(Lcom/ibm/mqtt/MqttAdvancedCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/MqttClient;->advCallbackHandler:Lcom/ibm/mqtt/MqttAdvancedCallback;

    iput-object p1, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    return-void
.end method

.method public registerSimpleHandler(Lcom/ibm/mqtt/MqttSimpleCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/MqttClient;->simpleCallbackHandler:Lcom/ibm/mqtt/MqttSimpleCallback;

    return-void
.end method

.method public startTrace()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Lcom/ibm/mqtt/MQeTrace;->setFilter(J)V

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->traceClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MQeTraceHandler;

    invoke-static {v0}, Lcom/ibm/mqtt/MQeTrace;->setHandler(Lcom/ibm/mqtt/MQeTraceHandler;)Lcom/ibm/mqtt/MQeTraceHandler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v1, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    new-instance v0, Lcom/ibm/mqtt/MqttException;

    const-string v1, "Trace classes (com.ibm.mqtt.trace.*) not found.\nCheck they are in wmqtt.jar."

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopTrace()V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lcom/ibm/mqtt/MQeTrace;->setFilter(J)V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/ibm/mqtt/MQeTrace;->setHandler(Lcom/ibm/mqtt/MQeTraceHandler;)Lcom/ibm/mqtt/MQeTraceHandler;

    return-void
.end method

.method public subscribe([Ljava/lang/String;[I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 v4, 0x2

    const/4 v1, 0x0

    const/16 v0, -0x753b

    const-wide/32 v2, 0x100004

    invoke-static {p0, v0, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL topic array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL requested QoS array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    array-length v0, p1

    array-length v2, p2

    if-eq v0, v2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Array lengths unequal. Topics:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ", QoS:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    array-length v2, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    move v0, v1

    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_4

    aget-object v2, p1, v0

    if-nez v2, :cond_3

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "NULL topic in topic array at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->invalidApiInvocation()V

    :cond_5
    move v0, v1

    :goto_1
    array-length v2, p2

    if-ge v0, v2, :cond_8

    aget v2, p2, v0

    if-le v2, v4, :cond_7

    aput v4, p2, v0

    :cond_6
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    aget v2, p2, v0

    if-gez v2, :cond_6

    aput v1, p2, v0

    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->anyErrors()V

    invoke-super {p0, p1, p2}, Lcom/ibm/mqtt/MqttBaseClient;->subscribe([Ljava/lang/String;[I)I

    move-result v0

    const/16 v1, -0x753c

    const-wide/32 v2, 0x100008

    invoke-static {p0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return v0
.end method

.method public terminate()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttClient;->terminate(Z)V

    return-void
.end method

.method public terminate(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttClient;->isAppConnected:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/ibm/mqtt/MqttBaseClient;->terminate()V

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public unsubscribe([Ljava/lang/String;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttNotConnectedException;,
            Lcom/ibm/mqtt/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/16 v0, -0x753d

    const-wide/32 v1, 0x100004

    invoke-static {p0, v0, v1, v2}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULL topic array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_2

    aget-object v1, p1, v0

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "NULL topic in topic array at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttClient;->reader:Ljava/lang/Thread;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttClient;->invalidApiInvocation()V

    :cond_3
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttClient;->anyErrors()V

    invoke-super {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->unsubscribe([Ljava/lang/String;)I

    move-result v0

    const/16 v1, -0x753e

    const-wide/32 v2, 0x100008

    invoke-static {p0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return v0
.end method
