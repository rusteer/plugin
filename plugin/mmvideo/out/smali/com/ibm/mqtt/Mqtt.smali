.class public Lcom/ibm/mqtt/Mqtt;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/ibm/mqtt/MqttProcessor;


# static fields
.field public static final CONNACK:S = 0x2s

.field public static final CONNECT:S = 0x1s

.field public static final DISCONNECT:S = 0xes

.field public static final PINGREQ:S = 0xcs

.field public static final PINGRESP:S = 0xds

.field public static final PUBACK:S = 0x4s

.field public static final PUBCOMP:S = 0x7s

.field public static final PUBLISH:S = 0x3s

.field public static final PUBREC:S = 0x5s

.field public static final PUBREL:S = 0x6s

.field public static final SUBACK:S = 0x9s

.field public static final SUBSCRIBE:S = 0x8s

.field public static final UNSUBACK:S = 0xbs

.field public static final UNSUBSCRIBE:S = 0xas

.field public static final msgTypes:[Ljava/lang/String;


# instance fields
.field private connected:Z

.field protected connection:Ljava/lang/String;

.field private connectionLost:Z

.field private curMsgId:I

.field private haveWill:Z

.field private isSocketConnected:Z

.field private keepAlivePeriod:I

.field private outMsgIdsAllocated:Ljava/util/Hashtable;

.field protected registeredException:Lcom/ibm/mqtt/MqttException;

.field private socket:Lcom/ibm/mqtt/MqttAdapter;

.field private socketClass:Ljava/lang/Class;

.field private streamReadLock:Ljava/lang/Object;

.field private streamWriteLock:Ljava/lang/Object;

.field private stream_in:Ljava/io/DataInputStream;

.field private stream_out:Ljava/io/DataOutputStream;

.field private topicNameCompression:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "CONNECT"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "CONNACK"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "PUBLISH"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "PUBACK"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "PUBREC"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "PUBREL"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "PUBCOMP"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "SUBSCRIBE"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "SUBACK"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "UNSUBSCRIBE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "UNSUBACK"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "PINGREQ"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "PINGRESP"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "DISCONNECT"

    aput-object v2, v0, v1

    sput-object v0, Lcom/ibm/mqtt/Mqtt;->msgTypes:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/ibm/mqtt/Mqtt;->socketClass:Ljava/lang/Class;

    iput-object v2, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    iput-object v2, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    iput-object v2, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    iput-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->haveWill:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->isSocketConnected:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->connected:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->connectionLost:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->streamReadLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    iput v1, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    iput-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->topicNameCompression:Z

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    iput-object v2, p0, Lcom/ibm/mqtt/Mqtt;->registeredException:Lcom/ibm/mqtt/MqttException;

    return-void
.end method

.method private decodePacket([BIS)Lcom/ibm/mqtt/MqttPacket;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/ibm/mqtt/Mqtt;->isSocketConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    packed-switch p3, :pswitch_data_0

    new-instance v0, Lcom/ibm/mqtt/MqttException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Mqtt: Unknown message type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v0, Lcom/ibm/mqtt/MqttPingreq;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPingreq;-><init>([BI)V

    :cond_0
    :goto_0
    :pswitch_1
    return-object v0

    :pswitch_2
    new-instance v0, Lcom/ibm/mqtt/MqttPingresp;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPingresp;-><init>([BI)V

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/ibm/mqtt/MqttPublish;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPublish;-><init>([BI)V

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/ibm/mqtt/MqttPuback;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPuback;-><init>([BI)V

    goto :goto_0

    :pswitch_5
    new-instance v0, Lcom/ibm/mqtt/MqttPubrec;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPubrec;-><init>([BI)V

    goto :goto_0

    :pswitch_6
    new-instance v0, Lcom/ibm/mqtt/MqttPubrel;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPubrel;-><init>([BI)V

    goto :goto_0

    :pswitch_7
    new-instance v0, Lcom/ibm/mqtt/MqttPubcomp;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttPubcomp;-><init>([BI)V

    goto :goto_0

    :pswitch_8
    new-instance v0, Lcom/ibm/mqtt/MqttSubscribe;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttSubscribe;-><init>([BI)V

    goto :goto_0

    :pswitch_9
    new-instance v0, Lcom/ibm/mqtt/MqttSuback;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttSuback;-><init>([BI)V

    goto :goto_0

    :pswitch_a
    new-instance v0, Lcom/ibm/mqtt/MqttUnsubscribe;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttUnsubscribe;-><init>([BI)V

    goto :goto_0

    :pswitch_b
    new-instance v0, Lcom/ibm/mqtt/MqttUnsuback;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttUnsuback;-><init>([BI)V

    goto :goto_0

    :pswitch_c
    new-instance v0, Lcom/ibm/mqtt/MqttConnack;

    invoke-direct {v0, p1, p2}, Lcom/ibm/mqtt/MqttConnack;-><init>([BI)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_c
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private setSocketState(Z)V
    .locals 2

    iget-object v1, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-boolean p1, p0, Lcom/ibm/mqtt/Mqtt;->isSocketConnected:Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method protected final genPublishPacket(IILjava/lang/String;[BZZ)Lcom/ibm/mqtt/MqttPublish;
    .locals 2

    new-instance v0, Lcom/ibm/mqtt/MqttPublish;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPublish;-><init>()V

    invoke-virtual {v0, p1}, Lcom/ibm/mqtt/MqttPublish;->setMsgId(I)V

    invoke-virtual {v0, p2}, Lcom/ibm/mqtt/MqttPublish;->setQos(I)V

    iput-object p3, v0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v0, p4}, Lcom/ibm/mqtt/MqttPublish;->setPayload([B)V

    invoke-virtual {v0, p6}, Lcom/ibm/mqtt/MqttPublish;->setDup(Z)V

    invoke-virtual {v0, p5}, Lcom/ibm/mqtt/MqttPublish;->setRetain(Z)V

    iget-boolean v1, p0, Lcom/ibm/mqtt/Mqtt;->topicNameCompression:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPublish;->compressTopic()V

    :cond_0
    return-object v0
.end method

.method protected getKeepAlivePeriod()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/Mqtt;->keepAlivePeriod:I

    return v0
.end method

.method protected hasKeepAlive()Z
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/Mqtt;->keepAlivePeriod:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hasWill()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->haveWill:Z

    return v0
.end method

.method protected initialise(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/Mqtt;->connection:Ljava/lang/String;

    iput-object p2, p0, Lcom/ibm/mqtt/Mqtt;->socketClass:Ljava/lang/Class;

    return-void
.end method

.method protected initialiseOutMsgIds(Ljava/util/Vector;)V
    .locals 3

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    invoke-virtual {v2, v0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public declared-synchronized isConnected()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized isConnectionLost()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->connectionLost:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isSocketConnected()Z
    .locals 2

    iget-object v1, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->isSocketConnected:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected nextMsgId()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const v4, 0xffff

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    if-ne v0, v4, :cond_0

    new-instance v0, Lcom/ibm/mqtt/MqttException;

    const-string v1, "All available msgIds in use:65535"

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    if-nez v0, :cond_3

    iget v2, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    if-ge v2, v4, :cond_2

    iget v2, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    :goto_1
    new-instance v2, Ljava/lang/Integer;

    iget v3, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    iget-object v3, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    invoke-virtual {v3, v2}, Ljava/util/Hashtable;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    invoke-virtual {v0, v2, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    goto :goto_0

    :cond_2
    iput v1, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/ibm/mqtt/Mqtt;->curMsgId:I

    return v0
.end method

.method protected pingOut()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    new-instance v0, Lcom/ibm/mqtt/MqttPingreq;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPingreq;-><init>()V

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/Mqtt;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V

    return-void
.end method

.method protected process()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ibm/mqtt/Mqtt;->readPacket()Lcom/ibm/mqtt/MqttPacket;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/ibm/mqtt/MqttPacket;->process(Lcom/ibm/mqtt/MqttProcessor;)V

    :goto_0
    return-void

    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Mqtt: Read a null packet from the socket"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public process(Lcom/ibm/mqtt/MqttConnack;)V
    .locals 3

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-short v0, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    if-nez v0, :cond_2

    iget-boolean v0, p1, Lcom/ibm/mqtt/MqttConnack;->topicNameCompression:Z

    iput-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->topicNameCompression:Z

    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    :cond_0
    :goto_0
    iget-short v0, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    if-eqz v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    :cond_1
    return-void

    :cond_2
    iget-short v0, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    if-ne v0, v1, :cond_3

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    goto :goto_0

    :cond_3
    iget-short v0, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    goto :goto_0

    :cond_4
    iget-short v0, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    goto :goto_0
.end method

.method public process(Lcom/ibm/mqtt/MqttConnect;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttDisconnect;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPingreq;)V
    .locals 1

    :try_start_0
    new-instance v0, Lcom/ibm/mqtt/MqttPingresp;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPingresp;-><init>()V

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/Mqtt;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public process(Lcom/ibm/mqtt/MqttPingresp;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPuback;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPubcomp;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPublish;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPubrec;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPubrel;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttSuback;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttSubscribe;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttUnsuback;)V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttUnsubscribe;)V
    .locals 0

    return-void
.end method

.method protected final readPacket()Lcom/ibm/mqtt/MqttPacket;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Ljava/io/InterruptedIOException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v2, 0x5

    new-array v4, v2, [B

    iget-object v8, p0, Lcom/ibm/mqtt/Mqtt;->streamReadLock:Ljava/lang/Object;

    monitor-enter v8

    :try_start_0
    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    const/4 v3, 0x0

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v3, v5}, Ljava/io/DataInputStream;->read([BII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-gez v2, :cond_0

    :try_start_1
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "DataInputStream.read returned -1"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    const/16 v1, -0x7551

    const-wide/32 v2, 0x200000

    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v1, v2, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    throw v0

    :cond_0
    move v2, v1

    move v3, v1

    move v1, v0

    :goto_0
    iget-object v5, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->read()I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v4, v2

    and-int/lit8 v6, v5, 0x7f

    mul-int/2addr v6, v3

    add-int/2addr v6, v1

    mul-int/lit16 v1, v3, 0x80

    add-int/lit8 v7, v2, 0x1

    and-int/lit16 v2, v5, 0x80

    if-nez v2, :cond_3

    add-int v1, v6, v7

    new-array v9, v1, [B

    :goto_1
    if-ge v0, v7, :cond_1

    aget-byte v1, v4, v0

    aput-byte v1, v9, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const/16 v1, -0x7553

    const-wide/32 v2, 0x200000

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V

    if-lez v6, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    invoke-virtual {v0, v9, v7, v6}, Ljava/io/DataInputStream;->readFully([BII)V

    :cond_2
    const/4 v0, 0x0

    aget-byte v0, v9, v0

    ushr-int/lit8 v0, v0, 0x4

    and-int/lit8 v0, v0, 0xf

    int-to-short v0, v0

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-direct {p0, v9, v7, v0}, Lcom/ibm/mqtt/Mqtt;->decodePacket([BIS)Lcom/ibm/mqtt/MqttPacket;

    move-result-object v0

    return-object v0

    :cond_3
    move v2, v7

    move v3, v1

    move v1, v6

    goto :goto_0
.end method

.method protected releaseMsgId(I)V
    .locals 2

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->outMsgIdsAllocated:Ljava/util/Hashtable;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected declared-synchronized setConnectionLost(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/ibm/mqtt/Mqtt;->connectionLost:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setConnectionState(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/ibm/mqtt/Mqtt;->connected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected setKeepAlive(I)V
    .locals 0

    iput p1, p0, Lcom/ibm/mqtt/Mqtt;->keepAlivePeriod:I

    return-void
.end method

.method protected setRegisteredThrowable(Ljava/lang/Throwable;)V
    .locals 2

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/ibm/mqtt/MqttException;

    if-eqz v0, :cond_1

    :cond_0
    check-cast p1, Lcom/ibm/mqtt/MqttException;

    iput-object p1, p0, Lcom/ibm/mqtt/Mqtt;->registeredException:Lcom/ibm/mqtt/MqttException;

    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/Mqtt;->setConnectionLost(Z)V

    return-void

    :cond_1
    new-instance v0, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v0, p1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/Throwable;)V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->registeredException:Lcom/ibm/mqtt/MqttException;

    goto :goto_0
.end method

.method protected subscribeOut(I[Ljava/lang/String;[BZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method public supportTopicNameCompression()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ibm/mqtt/Mqtt;->topicNameCompression:Z

    return v0
.end method

.method protected tcpipConnect(Lcom/ibm/mqtt/MqttConnect;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v1, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socketClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttAdapter;

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->connection:Ljava/lang/String;

    iget-short v3, p1, Lcom/ibm/mqtt/MqttConnect;->KeepAlive:S

    invoke-interface {v0, v2, v3}, Lcom/ibm/mqtt/MqttAdapter;->setConnection(Ljava/lang/String;I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/Mqtt;->setSocketState(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    new-instance v0, Ljava/io/DataInputStream;

    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    invoke-interface {v2}, Lcom/ibm/mqtt/MqttAdapter;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/DataOutputStream;

    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    invoke-interface {v2}, Lcom/ibm/mqtt/MqttAdapter;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/Mqtt;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V

    monitor-exit v1

    return-void

    :catch_0
    move-exception v0

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_1
    move-exception v0

    const/4 v2, 0x1

    :try_start_3
    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method protected tcpipDisconnect(Z)V
    .locals 2

    iget-object v1, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttAdapter;->closeOutputStream()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    :goto_0
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/Mqtt;->setSocketState(Z)V

    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_1

    :try_start_3
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttAdapter;->closeInputStream()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    :goto_1
    const/4 v0, 0x0

    :try_start_4
    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_in:Ljava/io/DataInputStream;

    :cond_1
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v0, :cond_2

    :try_start_5
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttAdapter;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    :goto_2
    const/4 v0, 0x0

    :try_start_6
    iput-object v0, p0, Lcom/ibm/mqtt/Mqtt;->socket:Lcom/ibm/mqtt/MqttAdapter;

    :cond_2
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method protected unsubscribeOut(I[Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    return-void
.end method

.method protected final writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    iget-object v1, p0, Lcom/ibm/mqtt/Mqtt;->streamWriteLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getPayload()[B

    move-result-object v0

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lcom/ibm/mqtt/MqttPacket;->setDup(Z)V

    iget-object v3, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->write([B)V

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/Mqtt;->stream_out:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    monitor-exit v1

    return-void

    :catch_0
    move-exception v0

    const/16 v2, -0x7552

    const-wide/32 v3, 0x200000

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v2, v3, v4, v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    new-instance v2, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v2, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_1
    move-exception v0

    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/Mqtt;->tcpipDisconnect(Z)V

    new-instance v2, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v2, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :cond_1
    new-instance v0, Lcom/ibm/mqtt/MqttNotConnectedException;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttNotConnectedException;-><init>()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
