.class public abstract Lcom/ibm/mqtt/MqttBaseClient;
.super Lcom/ibm/mqtt/Mqtt;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field protected static final conNotify:I = 0x1

.field private static maxOutstanding:I = 0x0

.field protected static final subNotify:I = 0x4

.field protected static final unsubNotify:I = 0x5


# instance fields
.field private cleanSession:Z

.field private grantedQoS:Ljava/util/Hashtable;

.field private outLock:Ljava/lang/Object;

.field private outLockNotified:Z

.field private outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

.field private persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

.field private qos2PubsArrived:Ljava/util/Hashtable;

.field private readerControl:Ljava/lang/Object;

.field private retryPeriod:I

.field private retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

.field private terminated:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0xa

    sput v0, Lcom/ibm/mqtt/MqttBaseClient;->maxOutstanding:I

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/ibm/mqtt/Mqtt;-><init>()V

    iput-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    iput-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    iput-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->grantedQoS:Ljava/util/Hashtable;

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    return-void
.end method

.method private doConnect(Lcom/ibm/mqtt/MqttConnect;ZS)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation

    const/4 v6, 0x0

    const/4 v3, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->resetTimedEventQueue()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttHashTable;->clear()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    invoke-virtual {p0, v6}, Lcom/ibm/mqtt/MqttBaseClient;->initialiseOutMsgIds(Ljava/util/Vector;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isConnectionLost()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttConnect;->getClientId()Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->connection:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Lcom/ibm/mqtt/MqttPersistence;->open(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz p2, :cond_1

    iput-boolean v3, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->reset()V

    :cond_1
    if-lez p3, :cond_2

    new-instance v0, Lcom/ibm/mqtt/MqttRetry;

    new-instance v2, Lcom/ibm/mqtt/MqttPingreq;

    invoke-direct {v2}, Lcom/ibm/mqtt/MqttPingreq;-><init>()V

    mul-int/lit16 v4, p3, 0x3e8

    int-to-long v4, v4

    invoke-direct {v0, p0, v2, v4, v5}, Lcom/ibm/mqtt/MqttRetry;-><init>(Lcom/ibm/mqtt/MqttBaseClient;Lcom/ibm/mqtt/MqttPacket;J)V

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v2

    :try_start_0
    iget-object v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    const-wide/16 v7, 0x0

    invoke-virtual {v4, v7, v8, v0}, Lcom/ibm/mqtt/MqttHashTable;->put(JLjava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v2, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V

    :cond_2
    if-nez p2, :cond_b

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isConnectionLost()Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->getAllSentMessages()[[B

    move-result-object v7

    if-eqz v7, :cond_7

    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    move v0, v1

    :goto_0
    array-length v2, v7

    if-ge v0, v2, :cond_6

    :try_start_1
    aget-object v9, v7, v0

    move v2, v3

    move v4, v3

    move v5, v1

    :cond_3
    aget-byte v10, v9, v4

    and-int/lit8 v11, v10, 0x7f

    mul-int/2addr v11, v2

    add-int/2addr v5, v11

    mul-int/lit16 v2, v2, 0x80

    add-int/lit8 v4, v4, 0x1

    and-int/lit16 v10, v10, 0x80

    if-nez v10, :cond_3

    add-int v2, v5, v4

    array-length v5, v9

    if-eq v2, v5, :cond_5

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidSentMessageRestored(I)V
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_4
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_5
    const/4 v2, 0x0

    :try_start_3
    aget-byte v2, v9, v2

    invoke-static {v2}, Lcom/ibm/mqtt/MqttPacket;->getMsgType(B)S

    move-result v2

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidSentMessageRestored(I)V

    move-object v2, v6

    :goto_2
    if-eqz v2, :cond_4

    iget-object v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v4
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    :try_start_4
    iget-object v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttRetry;->getMsgId()I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v5, v9, v10, v2}, Lcom/ibm/mqtt/MqttHashTable;->put(JLjava/lang/Object;)Ljava/lang/Object;

    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    iget-object v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v4, v2}, Lcom/ibm/mqtt/MqttTimedEventQueue;->enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V
    :try_end_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidSentMessageRestored(I)V

    goto :goto_1

    :pswitch_1
    :try_start_6
    new-instance v5, Lcom/ibm/mqtt/MqttPublish;

    invoke-direct {v5, v9, v4}, Lcom/ibm/mqtt/MqttPublish;-><init>([BI)V

    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {v5}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v8, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    new-instance v2, Lcom/ibm/mqtt/MqttRetry;

    iget v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    int-to-long v9, v4

    invoke-direct {v2, p0, v5, v9, v10}, Lcom/ibm/mqtt/MqttRetry;-><init>(Lcom/ibm/mqtt/MqttBaseClient;Lcom/ibm/mqtt/MqttPacket;J)V

    goto :goto_2

    :pswitch_2
    new-instance v5, Lcom/ibm/mqtt/MqttPubrel;

    invoke-direct {v5, v9, v4}, Lcom/ibm/mqtt/MqttPubrel;-><init>([BI)V

    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {v5}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v8, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    new-instance v2, Lcom/ibm/mqtt/MqttRetry;

    iget v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    int-to-long v9, v4

    invoke-direct {v2, p0, v5, v9, v10}, Lcom/ibm/mqtt/MqttRetry;-><init>(Lcom/ibm/mqtt/MqttBaseClient;Lcom/ibm/mqtt/MqttPacket;J)V
    :try_end_6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_2

    :catchall_1
    move-exception v2

    :try_start_7
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v2
    :try_end_8
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_0

    :cond_6
    invoke-virtual {p0, v8}, Lcom/ibm/mqtt/MqttBaseClient;->initialiseOutMsgIds(Ljava/util/Vector;)V

    :cond_7
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->getAllReceivedMessages()[[B

    move-result-object v7

    if-eqz v7, :cond_b

    move v0, v1

    :goto_3
    array-length v2, v7

    if-ge v0, v2, :cond_b

    :try_start_9
    aget-object v8, v7, v0

    move v2, v3

    move v4, v3

    move v5, v1

    :cond_8
    aget-byte v9, v8, v4

    and-int/lit8 v10, v9, 0x7f

    mul-int/2addr v10, v2

    add-int/2addr v5, v10

    mul-int/lit16 v2, v2, 0x80

    add-int/lit8 v4, v4, 0x1

    and-int/lit16 v9, v9, 0x80

    if-nez v9, :cond_8

    add-int v2, v5, v4

    array-length v5, v8

    if-eq v2, v5, :cond_9

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidReceivedMessageRestored(I)V

    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_9
    const/4 v2, 0x0

    aget-byte v2, v8, v2

    invoke-static {v2}, Lcom/ibm/mqtt/MqttPacket;->getMsgType(B)S

    move-result v2

    const/4 v5, 0x3

    if-ne v2, v5, :cond_a

    new-instance v2, Lcom/ibm/mqtt/MqttPublish;

    invoke-direct {v2, v8, v4}, Lcom/ibm/mqtt/MqttPublish;-><init>([BI)V

    iget-object v4, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_4

    :catch_1
    move-exception v2

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidReceivedMessageRestored(I)V

    goto :goto_4

    :cond_a
    :try_start_a
    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->invalidReceivedMessageRestored(I)V
    :try_end_a
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_a .. :try_end_a} :catch_1

    goto :goto_4

    :cond_b
    iput-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->registeredException:Lcom/ibm/mqtt/MqttException;

    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->setConnectionLost(Z)V

    :try_start_b
    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1
    :try_end_b
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    :try_start_c
    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipConnect(Lcom/ibm/mqtt/MqttConnect;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_2
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :try_start_d
    throw v0
    :try_end_d
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_d .. :try_end_d} :catch_2
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3

    :catch_2
    move-exception v0

    throw v0

    :catch_3
    move-exception v0

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v1}, Lcom/ibm/mqtt/MqttException;-><init>()V

    invoke-virtual {v1, v0}, Lcom/ibm/mqtt/MqttException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private invalidReceivedMessageRestored(I)V
    .locals 4

    const/16 v0, -0x7555

    const-wide/16 v1, 0x1

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    return-void
.end method

.method private invalidSentMessageRestored(I)V
    .locals 4

    const/16 v0, -0x7554

    const-wide/16 v1, 0x1

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    return-void
.end method

.method private messageAck(I)Lcom/ibm/mqtt/MqttPacket;
    .locals 5

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/ibm/mqtt/MqttHashTable;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttRetry;

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttRetry;->getQoS()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttRetry;->getMsgType()I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->messageAckQoS2(I)Lcom/ibm/mqtt/MqttPacket;

    move-result-object v0

    goto :goto_0

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    monitor-enter v2
    :try_end_0
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0, p1}, Lcom/ibm/mqtt/MqttPersistence;->delSentMessage(I)V

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :try_start_2
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v2
    :try_end_2
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_2 .. :try_end_2} :catch_0

    :try_start_3
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    int-to-long v3, p1

    invoke-virtual {v0, v3, v4}, Lcom/ibm/mqtt/MqttHashTable;->remove(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttRetry;

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->releaseMsgId(I)V

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttRetry;->getMsgType()I
    :try_end_4
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_4 .. :try_end_4} :catch_0

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_3
    :goto_1
    :pswitch_0
    move-object v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_6 .. :try_end_6} :catch_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v0

    :pswitch_1
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v2}, Lcom/ibm/mqtt/MqttHashTable;->size()I

    move-result v2

    sget v3, Lcom/ibm/mqtt/MqttBaseClient;->maxOutstanding:I

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v2
    :try_end_8
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_8 .. :try_end_8} :catch_0

    const/4 v3, 0x1

    :try_start_9
    iput-boolean v3, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    iget-object v3, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :cond_4
    :try_start_a
    invoke-virtual {p0, v0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->notifyAck(II)V
    :try_end_a
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_a .. :try_end_a} :catch_0

    goto :goto_1

    :catchall_2
    move-exception v0

    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :try_start_c
    throw v0
    :try_end_c
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_c .. :try_end_c} :catch_0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private messageAckQoS2(I)Lcom/ibm/mqtt/MqttPacket;
    .locals 6

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ibm/mqtt/MqttBaseClient;->genPubRelPacket(IZ)Lcom/ibm/mqtt/MqttPubrel;

    move-result-object v1

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    monitor-enter v2
    :try_end_0
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v3

    invoke-interface {v0, p1, v3}, Lcom/ibm/mqtt/MqttPersistence;->updSentMessage(I[B)V

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :try_start_2
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v2
    :try_end_2
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_2 .. :try_end_2} :catch_0

    :try_start_3
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    int-to-long v3, p1

    invoke-virtual {v0, v3, v4}, Lcom/ibm/mqtt/MqttHashTable;->remove(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttRetry;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttRetry;->setMessage(Lcom/ibm/mqtt/MqttPacket;)V

    iget-object v3, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    int-to-long v4, p1

    invoke-virtual {v3, v4, v5, v0}, Lcom/ibm/mqtt/MqttHashTable;->put(JLjava/lang/Object;)Ljava/lang/Object;

    :cond_1
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_0
    return-object v1

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v0
    :try_end_5
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v0
    :try_end_7
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_7 .. :try_end_7} :catch_0
.end method

.method private sendPacket(Lcom/ibm/mqtt/MqttPacket;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttNotConnectedException;
        }
    .end annotation

    const-wide/16 v2, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->getRetry()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v0, Lcom/ibm/mqtt/MqttNotConnectedException;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttNotConnectedException;-><init>()V

    throw v0

    :cond_0
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getQos()I

    move-result v6

    if-lez v6, :cond_b

    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v6}, Lcom/ibm/mqtt/MqttHashTable;->size()I

    move-result v6

    sget v7, Lcom/ibm/mqtt/MqttBaseClient;->maxOutstanding:I

    if-lt v6, v7, :cond_3

    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v6

    :try_start_0
    iget-boolean v7, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    if-nez v7, :cond_1

    iget-object v7, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->wait()V

    :cond_1
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3

    :cond_2
    :goto_0
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z

    move-result v6

    if-nez v6, :cond_3

    new-instance v0, Lcom/ibm/mqtt/MqttNotConnectedException;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttNotConnectedException;-><init>()V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_3
    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v6, :cond_5

    :try_start_3
    iget-object v7, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    monitor-enter v7
    :try_end_3
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :try_start_4
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v6

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getPayload()[B

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getPayload()[B

    move-result-object v8

    invoke-static {v6, v8}, Lcom/ibm/mqtt/MqttUtils;->concatArray([B[B)[B

    move-result-object v6

    :cond_4
    iget-object v8, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v9

    invoke-interface {v8, v9, v6}, Lcom/ibm/mqtt/MqttPersistence;->addSentMessage(I[B)V

    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_5
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->getKeepAlivePeriod()I

    move-result v6

    if-lez v6, :cond_a

    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v6}, Lcom/ibm/mqtt/MqttHashTable;->size()I

    move-result v6

    if-le v6, v4, :cond_9

    :cond_6
    :goto_1
    if-eqz v4, :cond_7

    move-wide v0, v2

    :cond_7
    new-instance v4, Lcom/ibm/mqtt/MqttRetry;

    invoke-direct {v4, p0, p1, v0, v1}, Lcom/ibm/mqtt/MqttRetry;-><init>(Lcom/ibm/mqtt/MqttBaseClient;Lcom/ibm/mqtt/MqttPacket;J)V

    iget-object v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v5

    :try_start_5
    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8, v4}, Lcom/ibm/mqtt/MqttHashTable;->put(JLjava/lang/Object;)Ljava/lang/Object;

    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    iget-object v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v5, v4}, Lcom/ibm/mqtt/MqttTimedEventQueue;->enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V

    cmp-long v0, v0, v2

    if-lez v0, :cond_8

    :try_start_6
    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_6
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_6 .. :try_end_6} :catch_2

    :cond_8
    :goto_2
    return-void

    :catchall_1
    move-exception v0

    :try_start_7
    monitor-exit v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v0
    :try_end_8
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    :catch_0
    move-exception v0

    throw v0

    :catch_1
    move-exception v0

    new-instance v0, Lcom/ibm/mqtt/MqttPersistenceException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "sendPacket - toBytes failed, msgid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPacket;->getMsgId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttPersistenceException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    move v4, v5

    goto :goto_1

    :cond_a
    iget-object v6, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v6}, Lcom/ibm/mqtt/MqttHashTable;->size()I

    move-result v6

    if-gtz v6, :cond_6

    move v4, v5

    goto :goto_1

    :catchall_2
    move-exception v0

    :try_start_9
    monitor-exit v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    throw v0

    :cond_b
    invoke-virtual {p0, p1}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V

    goto :goto_2

    :catch_2
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v7

    goto/16 :goto_0
.end method

.method public static setWindowSize(I)V
    .locals 0

    sput p0, Lcom/ibm/mqtt/MqttBaseClient;->maxOutstanding:I

    return-void
.end method


# virtual methods
.method public anyErrors()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->registeredException:Lcom/ibm/mqtt/MqttException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->registeredException:Lcom/ibm/mqtt/MqttException;

    throw v0

    :cond_0
    return-void
.end method

.method protected connect(Ljava/lang/String;ZZSLjava/lang/String;ILjava/lang/String;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Lcom/ibm/mqtt/MqttConnect;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttConnect;-><init>()V

    invoke-virtual {v0, p1}, Lcom/ibm/mqtt/MqttConnect;->setClientId(Ljava/lang/String;)V

    iput-boolean p2, v0, Lcom/ibm/mqtt/MqttConnect;->CleanStart:Z

    iput-boolean p3, v0, Lcom/ibm/mqtt/MqttConnect;->TopicNameCompression:Z

    iput-short p4, v0, Lcom/ibm/mqtt/MqttConnect;->KeepAlive:S

    if-eqz p5, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/ibm/mqtt/MqttConnect;->Will:Z

    iput-object p5, v0, Lcom/ibm/mqtt/MqttConnect;->WillTopic:Ljava/lang/String;

    iput p6, v0, Lcom/ibm/mqtt/MqttConnect;->WillQoS:I

    iput-boolean p8, v0, Lcom/ibm/mqtt/MqttConnect;->WillRetain:Z

    iput-object p7, v0, Lcom/ibm/mqtt/MqttConnect;->WillMessage:Ljava/lang/String;

    :goto_0
    invoke-virtual {p0, p4}, Lcom/ibm/mqtt/MqttBaseClient;->setKeepAlive(I)V

    invoke-direct {p0, v0, p2, p4}, Lcom/ibm/mqtt/MqttBaseClient;->doConnect(Lcom/ibm/mqtt/MqttConnect;ZS)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_0
    iput-boolean v2, v0, Lcom/ibm/mqtt/MqttConnect;->Will:Z

    goto :goto_0
.end method

.method protected connectionLost()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected disconnect()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation

    const/4 v5, 0x0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->setConnectionState(Z)V

    new-instance v0, Lcom/ibm/mqtt/MqttDisconnect;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttDisconnect;-><init>()V

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {p0, v5}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipDisconnect(Z)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    move-result v0

    if-eqz v0, :cond_0

    :try_start_2
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_0
    :goto_0
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->resetTimedEventQueue()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttHashTable;->clear()V

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    if-eqz v0, :cond_1

    iput-boolean v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->reset()V

    :cond_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    :goto_1
    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->close()V

    :cond_2
    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p0, v5}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipDisconnect(Z)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result v2

    if-eqz v2, :cond_3

    :try_start_6
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    const-wide/16 v3, 0x7530

    invoke-virtual {v2, v3, v4}, Ljava/lang/Object;->wait(J)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2

    :cond_3
    :goto_2
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x1

    :try_start_8
    iput-boolean v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/util/Hashtable;->clear()V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttTimedEventQueue;->resetTimedEventQueue()V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v1}, Lcom/ibm/mqtt/MqttHashTable;->clear()V

    iget-boolean v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    if-eqz v1, :cond_4

    iput-boolean v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v1}, Lcom/ibm/mqtt/MqttPersistence;->reset()V

    :cond_4
    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v1}, Lcom/ibm/mqtt/MqttPersistence;->close()V

    :cond_5
    throw v0

    :catch_0
    move-exception v0

    invoke-virtual {p0, v5}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipDisconnect(Z)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    :try_start_9
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    move-result v0

    if-eqz v0, :cond_6

    :try_start_a
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_3

    :cond_6
    :goto_3
    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_c
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLockNotified:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->resetTimedEventQueue()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttHashTable;->clear()V

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    if-eqz v0, :cond_7

    iput-boolean v5, p0, Lcom/ibm/mqtt/MqttBaseClient;->cleanSession:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttPersistence;->reset()V

    :cond_7
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    goto/16 :goto_1

    :catchall_1
    move-exception v0

    :try_start_d
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    throw v0

    :catchall_2
    move-exception v0

    :try_start_e
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw v0

    :catchall_3
    move-exception v0

    :try_start_f
    monitor-exit v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    throw v0

    :catchall_4
    move-exception v0

    :try_start_10
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4

    throw v0

    :catchall_5
    move-exception v0

    :try_start_11
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    throw v0

    :catchall_6
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    throw v0

    :catch_1
    move-exception v0

    goto/16 :goto_0

    :catch_2
    move-exception v2

    goto/16 :goto_2

    :catch_3
    move-exception v0

    goto :goto_3
.end method

.method protected genPubRelPacket(IZ)Lcom/ibm/mqtt/MqttPubrel;
    .locals 1

    new-instance v0, Lcom/ibm/mqtt/MqttPubrel;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPubrel;-><init>()V

    invoke-virtual {v0, p1}, Lcom/ibm/mqtt/MqttPubrel;->setMsgId(I)V

    invoke-virtual {v0, p2}, Lcom/ibm/mqtt/MqttPubrel;->setDup(Z)V

    return-object v0
.end method

.method public getRetry()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    div-int/lit16 v0, v0, 0x3e8

    return v0
.end method

.method protected getReturnedQoS(I)[B
    .locals 2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->grantedQoS:Ljava/util/Hashtable;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttByteArray;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttByteArray;->getByteArray()[B

    move-result-object v0

    goto :goto_0
.end method

.method protected initialise(Ljava/lang/String;Lcom/ibm/mqtt/MqttPersistence;Ljava/lang/Class;)V
    .locals 2

    invoke-super {p0, p1, p3}, Lcom/ibm/mqtt/Mqtt;->initialise(Ljava/lang/String;Ljava/lang/Class;)V

    const/16 v0, 0x2710

    iput v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    new-instance v0, Lcom/ibm/mqtt/MqttHashTable;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttHashTable;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    new-instance v0, Lcom/ibm/mqtt/MqttTimedEventQueue;

    const/16 v1, 0xa

    invoke-direct {v0, v1, p0}, Lcom/ibm/mqtt/MqttTimedEventQueue;-><init>(ILcom/ibm/mqtt/MqttBaseClient;)V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->start()V

    iput-object p2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    return-void
.end method

.method protected abstract notifyAck(II)V
.end method

.method public outstanding(I)Z
    .locals 4

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/ibm/mqtt/MqttHashTable;->containsKey(J)Z

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public process(Lcom/ibm/mqtt/MqttConnack;)V
    .locals 5

    const/16 v0, -0x7541

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    iget-short v4, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-super {p0, p1}, Lcom/ibm/mqtt/Mqtt;->process(Lcom/ibm/mqtt/MqttConnack;)V

    const/4 v0, 0x1

    iget-short v1, p1, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    invoke-virtual {p0, v0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->notifyAck(II)V

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPuback;)V
    .locals 5

    const/16 v0, -0x7542

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPuback;->getMsgId()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPuback;->getMsgId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->messageAck(I)Lcom/ibm/mqtt/MqttPacket;

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPubcomp;)V
    .locals 5

    const/16 v0, -0x7543

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubcomp;->getMsgId()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubcomp;->getMsgId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->messageAck(I)Lcom/ibm/mqtt/MqttPacket;

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttPublish;)V
    .locals 10

    const-wide/32 v2, 0x200000

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v0

    array-length v0, v0

    :goto_0
    const/16 v1, -0x7544

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/Boolean;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->isRetain()Z

    move-result v7

    invoke-direct {v6, v7}, Ljava/lang/Boolean;-><init>(Z)V

    invoke-virtual {v6}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    move-object v0, p0

    invoke-static/range {v0 .. v7}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    :try_start_0
    iget-object v0, p1, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v1

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v4

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->isRetain()Z

    move-result v5

    invoke-virtual {p0, v0, v1, v4, v5}, Lcom/ibm/mqtt/MqttBaseClient;->publishArrived(Ljava/lang/String;[BIZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v0

    if-lez v0, :cond_1

    if-nez v8, :cond_1

    const/16 v1, -0x7545

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v0

    if-ne v0, v9, :cond_2

    const-string v4, "PUBACK"

    :goto_2
    new-instance v5, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v0

    invoke-direct {v5, v0}, Ljava/lang/Integer;-><init>(I)V

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v0

    if-ne v0, v9, :cond_3

    new-instance v0, Lcom/ibm/mqtt/MqttPuback;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPuback;-><init>()V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttPuback;->setMsgId(I)V

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    :cond_1
    :goto_3
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "publishArrived Exception caught (QoS "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "):"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v8, v9

    goto :goto_1

    :cond_2
    const-string v4, "PUBREC"

    goto :goto_2

    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;
    :try_end_2
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_2 .. :try_end_2} :catch_3

    if-eqz v0, :cond_5

    :try_start_3
    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    monitor-enter v1
    :try_end_3
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    :try_start_4
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->toBytes()[B

    move-result-object v0

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ibm/mqtt/MqttUtils;->concatArray([B[B)[B

    move-result-object v0

    :cond_4
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v3

    invoke-interface {v2, v3, v0}, Lcom/ibm/mqtt/MqttPersistence;->addReceivedMessage(I[B)V

    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/ibm/mqtt/MqttPubrec;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttPubrec;-><init>()V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttPubrec;->setMsgId(I)V
    :try_end_5
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_5 .. :try_end_5} :catch_3

    :try_start_6
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_6 .. :try_end_6} :catch_3

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_3

    :catchall_0
    move-exception v0

    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw v0
    :try_end_8
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    :catch_2
    move-exception v0

    :try_start_9
    throw v0

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    new-instance v0, Lcom/ibm/mqtt/MqttPersistenceException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "process(MqttPublish) - packet.toBytes() failed - msgid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttPersistenceException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_9 .. :try_end_9} :catch_3

    :catch_5
    move-exception v0

    goto/16 :goto_3

    :cond_6
    move v0, v8

    goto/16 :goto_0
.end method

.method public process(Lcom/ibm/mqtt/MqttPubrec;)V
    .locals 5

    const/16 v0, -0x7546

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrec;->getMsgId()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->outstandingQueue:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrec;->getMsgId()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/ibm/mqtt/MqttHashTable;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttRetry;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttRetry;->getMsgType()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrec;->getMsgId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->messageAck(I)Lcom/ibm/mqtt/MqttPacket;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public process(Lcom/ibm/mqtt/MqttPubrel;)V
    .locals 6

    const/4 v1, 0x0

    const/16 v0, -0x7547

    const-wide/32 v2, 0x200000

    new-instance v4, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v2, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ibm/mqtt/MqttPublish;

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v2, v0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPublish;->getPayload()[B

    move-result-object v3

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v4

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttPublish;->isRetain()Z

    move-result v0

    invoke-virtual {p0, v2, v3, v4, v0}, Lcom/ibm/mqtt/MqttBaseClient;->publishArrived(Ljava/lang/String;[BIZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    :goto_0
    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->qos2PubsArrived:Ljava/util/Hashtable;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    monitor-enter v1
    :try_end_1
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->persistenceLayer:Lcom/ibm/mqtt/MqttPersistence;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v3

    invoke-interface {v2, v3}, Lcom/ibm/mqtt/MqttPersistence;->delReceivedMessage(I)V

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    :goto_1
    new-instance v1, Lcom/ibm/mqtt/MqttPubcomp;

    invoke-direct {v1}, Lcom/ibm/mqtt/MqttPubcomp;-><init>()V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttPubrel;->getMsgId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/ibm/mqtt/MqttPubcomp;->setMsgId(I)V

    :try_start_3
    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->writePacket(Lcom/ibm/mqtt/MqttPacket;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :goto_2
    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->setRegisteredThrowable(Ljava/lang/Throwable;)V

    :cond_1
    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x1

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "publishArrived Exception caught (QoS 2):"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v0
    :try_end_5
    .catch Lcom/ibm/mqtt/MqttPersistenceException; {:try_start_5 .. :try_end_5} :catch_1

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_2
.end method

.method public process(Lcom/ibm/mqtt/MqttSuback;)V
    .locals 5

    const/16 v0, -0x7548

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttSuback;->getMsgId()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->grantedQoS:Ljava/util/Hashtable;

    new-instance v1, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttSuback;->getMsgId()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    new-instance v2, Lcom/ibm/mqtt/MqttByteArray;

    iget-object v3, p1, Lcom/ibm/mqtt/MqttSuback;->TopicsQoS:[B

    invoke-direct {v2, v3}, Lcom/ibm/mqtt/MqttByteArray;-><init>([B)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttSuback;->getMsgId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->messageAck(I)Lcom/ibm/mqtt/MqttPacket;

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttUnsuback;)V
    .locals 5

    const/16 v0, -0x7549

    const-wide/32 v1, 0x200000

    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttUnsuback;->getMsgId()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/ibm/mqtt/MqttUnsuback;->getMsgId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->messageAck(I)Lcom/ibm/mqtt/MqttPacket;

    return-void
.end method

.method protected publish(Ljava/lang/String;[BIZ)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;,
            Lcom/ibm/mqtt/MqttPersistenceException;
        }
    .end annotation

    const/4 v6, 0x0

    if-lez p3, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->nextMsgId()I

    move-result v1

    :goto_0
    move-object v0, p0

    move v2, p3

    move-object v3, p1

    move-object v4, p2

    move v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/ibm/mqtt/MqttBaseClient;->genPublishPacket(IILjava/lang/String;[BZZ)Lcom/ibm/mqtt/MqttPublish;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->sendPacket(Lcom/ibm/mqtt/MqttPacket;)V

    const/16 v3, -0x754a

    const-wide/32 v4, 0x200000

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, p3}, Ljava/lang/Integer;-><init>(I)V

    new-instance v8, Ljava/lang/Boolean;

    invoke-direct {v8, p4}, Ljava/lang/Boolean;-><init>(Z)V

    move-object v2, p0

    invoke-static/range {v2 .. v8}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return v1

    :cond_0
    move v1, v6

    goto :goto_0
.end method

.method protected abstract publishArrived(Ljava/lang/String;[BIZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public run()V
    .locals 5

    const-wide/32 v3, 0x200000

    const/16 v0, -0x754b

    invoke-static {p0, v0, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :try_start_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_0
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z

    if-nez v0, :cond_3

    iget v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    int-to-long v0, v0

    :goto_1
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z

    if-nez v0, :cond_3

    :try_start_3
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->process()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    :cond_1
    :goto_2
    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    :goto_3
    :try_start_4
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isSocketConnected()Z

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-nez v0, :cond_2

    :try_start_5
    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_3

    :catchall_0
    move-exception v0

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0

    :catch_2
    move-exception v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_7
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipDisconnect(Z)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x1f4

    :try_start_8
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_4

    :goto_4
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->setRegisteredThrowable(Ljava/lang/Throwable;)V

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "WMQtt client:Lost connection..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    new-instance v0, Lcom/ibm/mqtt/MqttReconn;

    invoke-direct {v0, p0}, Lcom/ibm/mqtt/MqttReconn;-><init>(Lcom/ibm/mqtt/MqttBaseClient;)V

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttReconn;->start()V

    goto :goto_2

    :catchall_1
    move-exception v0

    :try_start_9
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    throw v0

    :catch_3
    move-exception v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x1

    :try_start_a
    invoke-virtual {p0, v2}, Lcom/ibm/mqtt/MqttBaseClient;->tcpipDisconnect(Z)V

    iget-object v2, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->setRegisteredThrowable(Ljava/lang/Throwable;)V

    goto :goto_2

    :catchall_2
    move-exception v0

    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    throw v0

    :cond_2
    :try_start_c
    monitor-exit v1

    goto :goto_1

    :catchall_3
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    throw v0

    :cond_3
    const/16 v0, -0x754c

    invoke-static {p0, v0, v3, v4}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJ)V

    return-void

    :catch_4
    move-exception v0

    goto :goto_4
.end method

.method protected declared-synchronized setConnectionState(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Lcom/ibm/mqtt/Mqtt;->setConnectionState(Z)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0, p1}, Lcom/ibm/mqtt/MqttTimedEventQueue;->canDeliverEvents(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setRetry(I)V
    .locals 1

    const/16 v0, 0xa

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    mul-int/lit16 v0, p1, 0x3e8

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iput v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryPeriod:I

    return-void
.end method

.method protected subscribe([Ljava/lang/String;[I)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->nextMsgId()I

    move-result v2

    array-length v0, p2

    new-array v3, v0, [B

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->grantedQoS:Ljava/util/Hashtable;

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v4}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move v0, v1

    :goto_0
    array-length v4, p2

    if-ge v0, v4, :cond_0

    aget v4, p2, v0

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/ibm/mqtt/MqttSubscribe;

    invoke-direct {v0}, Lcom/ibm/mqtt/MqttSubscribe;-><init>()V

    invoke-virtual {v0, v2}, Lcom/ibm/mqtt/MqttSubscribe;->setMsgId(I)V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/ibm/mqtt/MqttSubscribe;->setQos(I)V

    iput-object p1, v0, Lcom/ibm/mqtt/MqttSubscribe;->topics:[Ljava/lang/String;

    iput-object v3, v0, Lcom/ibm/mqtt/MqttSubscribe;->topicsQoS:[B

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttSubscribe;->setDup(Z)V

    const/16 v1, -0x754d

    const-wide/32 v3, 0x200000

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v1, v3, v4, v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttBaseClient;->sendPacket(Lcom/ibm/mqtt/MqttPacket;)V

    return v2
.end method

.method protected terminate()V
    .locals 2

    iget-object v1, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->terminated:Z

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->readerControl:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttBaseClient;->retryQueue:Lcom/ibm/mqtt/MqttTimedEventQueue;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->close()V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected unsubscribe([Ljava/lang/String;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttBaseClient;->nextMsgId()I

    move-result v0

    new-instance v1, Lcom/ibm/mqtt/MqttUnsubscribe;

    invoke-direct {v1}, Lcom/ibm/mqtt/MqttUnsubscribe;-><init>()V

    invoke-virtual {v1, v0}, Lcom/ibm/mqtt/MqttUnsubscribe;->setMsgId(I)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/ibm/mqtt/MqttUnsubscribe;->setQos(I)V

    iput-object p1, v1, Lcom/ibm/mqtt/MqttUnsubscribe;->topics:[Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/ibm/mqtt/MqttUnsubscribe;->setDup(Z)V

    const/16 v2, -0x754e

    const-wide/32 v3, 0x200000

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v2, v3, v4, v5}, Lcom/ibm/mqtt/MQeTrace;->trace(Ljava/lang/Object;SJLjava/lang/Object;)V

    invoke-direct {p0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->sendPacket(Lcom/ibm/mqtt/MqttPacket;)V

    return v0
.end method
