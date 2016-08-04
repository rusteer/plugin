.class Lcom/webuid/mmVideo/PushService$MQTTConnection;
.super Ljava/lang/Object;
.source "PushService.java"

# interfaces
.implements Lcom/ibm/mqtt/MqttSimpleCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MQTTConnection"
.end annotation


# instance fields
.field mqttClient:Lcom/ibm/mqtt/IMqttClient;

.field final synthetic this$0:Lcom/webuid/mmVideo/PushService;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter
    .parameter "brokerHostName"
    .parameter "initTopic"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    .prologue
    .line 445
    iput-object p1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 442
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    .line 447
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "tcp://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$4()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 448
    .local v1, mqttConnSpec:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mqttConnSpec "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {p1, v2}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 450
    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$5()Lcom/ibm/mqtt/MqttPersistence;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ibm/mqtt/MqttClient;->createMqttClient(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;)Lcom/ibm/mqtt/IMqttClient;

    move-result-object v2

    iput-object v2, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    .line 453
    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    #getter for: Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {p1}, Lcom/webuid/mmVideo/PushService;->access$6(Lcom/webuid/mmVideo/PushService;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "deviceID"

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 454
    .local v0, clientID:Ljava/lang/String;
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$7()Z

    move-result v3

    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$8()S

    move-result v4

    invoke-interface {v2, v0, v3, v4}, Lcom/ibm/mqtt/IMqttClient;->connect(Ljava/lang/String;ZS)V

    .line 455
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "clientID "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " on clientID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {p1, v2}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 458
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-interface {v2, p0}, Lcom/ibm/mqtt/IMqttClient;->registerSimpleHandler(Lcom/ibm/mqtt/MqttSimpleCallback;)V

    .line 461
    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 462
    invoke-direct {p0, p3}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->subscribeToTopic(Ljava/lang/String;)V

    .line 464
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Connection established to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " on topic "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {p1, v2}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 467
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    #setter for: Lcom/webuid/mmVideo/PushService;->mStartTime:J
    invoke-static {p1, v2, v3}, Lcom/webuid/mmVideo/PushService;->access$9(Lcom/webuid/mmVideo/PushService;J)V

    .line 469
    #calls: Lcom/webuid/mmVideo/PushService;->startKeepAlives()V
    invoke-static {p1}, Lcom/webuid/mmVideo/PushService;->access$10(Lcom/webuid/mmVideo/PushService;)V

    .line 470
    return-void
.end method

.method private publishToTopic(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "topicName"
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    .prologue
    .line 501
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-interface {v0}, Lcom/ibm/mqtt/IMqttClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 504
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    const-string v1, "No connection to public to"

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 511
    :goto_0
    return-void

    .line 506
    :cond_1
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    .line 507
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 508
    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$14()I

    move-result v2

    .line 509
    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$15()Z

    move-result v3

    .line 506
    invoke-interface {v0, p1, v1, v2, v3}, Lcom/ibm/mqtt/IMqttClient;->publish(Ljava/lang/String;[BIZ)I

    goto :goto_0
.end method

.method private subscribeToTopic(Ljava/lang/String;)V
    .locals 3
    .parameter "topicName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    .prologue
    .line 487
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-interface {v1}, Lcom/ibm/mqtt/IMqttClient;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 490
    :cond_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    const-string v2, "Connection errorNo connection"

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 495
    :goto_0
    return-void

    .line 492
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 493
    .local v0, topics:[Ljava/lang/String;
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-static {}, Lcom/webuid/mmVideo/PushService;->access$13()[I

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/ibm/mqtt/IMqttClient;->subscribe([Ljava/lang/String;[I)I

    goto :goto_0
.end method


# virtual methods
.method public connectionLost()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 517
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    const-string v1, "Loss of connectionconnection downed"

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 518
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->stopKeepAlives()V
    invoke-static {v0}, Lcom/webuid/mmVideo/PushService;->access$11(Lcom/webuid/mmVideo/PushService;)V

    .line 520
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    const/4 v1, 0x0

    #setter for: Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PushService;->access$3(Lcom/webuid/mmVideo/PushService;Lcom/webuid/mmVideo/PushService$MQTTConnection;)V

    .line 521
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->isNetworkAvailable()Z
    invoke-static {v0}, Lcom/webuid/mmVideo/PushService;->access$16(Lcom/webuid/mmVideo/PushService;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 522
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->reconnectIfNecessary()V
    invoke-static {v0}, Lcom/webuid/mmVideo/PushService;->access$1(Lcom/webuid/mmVideo/PushService;)V

    .line 524
    :cond_0
    return-void
.end method

.method public disconnect()V
    .locals 4

    .prologue
    .line 475
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->stopKeepAlives()V
    invoke-static {v1}, Lcom/webuid/mmVideo/PushService;->access$11(Lcom/webuid/mmVideo/PushService;)V

    .line 476
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->mqttClient:Lcom/ibm/mqtt/IMqttClient;

    invoke-interface {v1}, Lcom/ibm/mqtt/IMqttClient;->disconnect()V
    :try_end_0
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_0 .. :try_end_0} :catch_0

    .line 480
    :goto_0
    return-void

    .line 477
    :catch_0
    move-exception v0

    .line 478
    .local v0, e:Lcom/ibm/mqtt/MqttPersistenceException;
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "MqttException"

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPersistenceException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPersistenceException;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    invoke-static {v2, v1, v0}, Lcom/webuid/mmVideo/PushService;->access$12(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const-string v1, " NULL"

    goto :goto_1
.end method

.method public publishArrived(Ljava/lang/String;[BIZ)V
    .locals 4
    .parameter "topicName"
    .parameter "payload"
    .parameter "qos"
    .parameter "retained"

    .prologue
    .line 531
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2}, Ljava/lang/String;-><init>([B)V

    .line 532
    .local v0, s:Ljava/lang/String;
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->showNotification(Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/webuid/mmVideo/PushService;->access$17(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 533
    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Got message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 534
    return-void
.end method

.method public sendKeepAlive()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    .prologue
    .line 537
    iget-object v0, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    const-string v1, "Sending keep alive"

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 539
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/webuid/mmVideo/PushService;->MQTT_CLIENT_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/keepalive"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PushService$MQTTConnection;->this$0:Lcom/webuid/mmVideo/PushService;

    #getter for: Lcom/webuid/mmVideo/PushService;->mPrefs:Landroid/content/SharedPreferences;
    invoke-static {v1}, Lcom/webuid/mmVideo/PushService;->access$6(Lcom/webuid/mmVideo/PushService;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "deviceID"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->publishToTopic(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    return-void
.end method
