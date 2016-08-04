.class public Lcom/ibm/mqtt/MqttRetry;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/ibm/mqtt/MqttTimedEvent;


# instance fields
.field protected expires:J

.field private packet:Lcom/ibm/mqtt/MqttPacket;

.field private sessionRef:Lcom/ibm/mqtt/MqttBaseClient;


# direct methods
.method public constructor <init>(Lcom/ibm/mqtt/MqttBaseClient;Lcom/ibm/mqtt/MqttPacket;J)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    iput-object p1, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p3

    iput-wide v0, p0, Lcom/ibm/mqtt/MqttRetry;->expires:J

    return-void
.end method


# virtual methods
.method public getMsgId()I
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v0

    return v0
.end method

.method public getMsgType()I
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPacket;->getMsgType()S

    move-result v0

    return v0
.end method

.method public getQoS()I
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPacket;->getQos()I

    move-result v0

    return v0
.end method

.method public getTime()J
    .locals 2

    iget-wide v0, p0, Lcom/ibm/mqtt/MqttRetry;->expires:J

    return-wide v0
.end method

.method public notifyEvent()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttRetry;->outstanding()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttBaseClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    iget-object v1, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V

    const/16 v1, -0x754f

    const-wide/32 v2, 0x200000

    sget-object v0, Lcom/ibm/mqtt/Mqtt;->msgTypes:[Ljava/lang/String;

    iget-object v4, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v4}, Lcom/ibm/mqtt/MqttPacket;->getMsgType()S

    move-result v4

    aget-object v4, v0, v4

    new-instance v5, Ljava/lang/Integer;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v0

    invoke-direct {v5, v0}, Ljava/lang/Integer;-><init>(I)V

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPacket;->getMsgType()S

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttBaseClient;->getKeepAlivePeriod()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/ibm/mqtt/MqttRetry;->expires:J

    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttBaseClient;->getRetry()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/ibm/mqtt/MqttRetry;->expires:J

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public declared-synchronized outstanding()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttRetry;->sessionRef:Lcom/ibm/mqtt/MqttBaseClient;

    iget-object v1, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->outstanding(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected setMessage(Lcom/ibm/mqtt/MqttPacket;)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lcom/ibm/mqtt/Mqtt;->msgTypes:[Ljava/lang/String;

    iget-object v2, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttPacket;->getMsgType()S

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " MsgId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttRetry;->packet:Lcom/ibm/mqtt/MqttPacket;

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " Expires:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttRetry;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
