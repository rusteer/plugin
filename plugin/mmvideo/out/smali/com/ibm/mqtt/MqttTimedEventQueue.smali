.class public Lcom/ibm/mqtt/MqttTimedEventQueue;
.super Ljava/lang/Thread;


# instance fields
.field private canDeliverEvents:Z

.field private m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

.field private m_head:I

.field private m_tail:I

.field private running:Z

.field private session:Lcom/ibm/mqtt/MqttBaseClient;

.field private stopping:Z


# direct methods
.method public constructor <init>(ILcom/ibm/mqtt/MqttBaseClient;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->session:Lcom/ibm/mqtt/MqttBaseClient;

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->stopping:Z

    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->canDeliverEvents:Z

    iput v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iput v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    const/4 p1, 0x4

    :cond_0
    new-array v0, p1, [Lcom/ibm/mqtt/MqttTimedEvent;

    iput-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iput-object p2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->session:Lcom/ibm/mqtt/MqttBaseClient;

    return-void
.end method

.method private adjust(I)I
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    :goto_0
    return p1

    :cond_0
    sub-int/2addr p1, v0

    goto :goto_0
.end method

.method private expand_array()V
    .locals 6

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v0, v0

    mul-int/lit8 v1, v0, 0x2

    new-array v1, v1, [Lcom/ibm/mqtt/MqttTimedEvent;

    iget-object v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v4, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    sub-int v5, v0, v5

    invoke-static {v2, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    const/4 v3, 0x0

    iget v4, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    invoke-static {v2, v3, v1, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    iput-object v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    return-void
.end method


# virtual methods
.method public declared-synchronized canDeliverEvents(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->canDeliverEvents:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->stopping:Z

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Lcom/ibm/mqtt/MqttTimedEvent;->getTime()J

    move-result-wide v1

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    aget-object v0, v0, v3

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttTimedEvent;->getTime()J

    move-result-wide v3

    cmp-long v0, v1, v3

    if-gez v0, :cond_4

    :cond_0
    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    :cond_1
    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    aput-object p1, v0, v1

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-ne v0, v1, :cond_2

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->expand_array()V

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    :goto_0
    monitor-exit p0

    return-void

    :cond_4
    :try_start_1
    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    if-ge v0, v3, :cond_5

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    iget-object v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v3, v3

    add-int/2addr v0, v3

    :goto_1
    add-int/lit8 v0, v0, -0x1

    :goto_2
    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    if-lt v0, v3, :cond_7

    iget-object v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->adjust(I)I

    move-result v4

    aget-object v3, v3, v4

    invoke-interface {v3}, Lcom/ibm/mqtt/MqttTimedEvent;->getTime()J

    move-result-wide v3

    cmp-long v3, v1, v3

    if-gez v3, :cond_6

    iget-object v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    add-int/lit8 v4, v0, 0x1

    invoke-direct {p0, v4}, Lcom/ibm/mqtt/MqttTimedEventQueue;->adjust(I)I

    move-result v4

    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->adjust(I)I

    move-result v6

    aget-object v5, v5, v6

    aput-object v5, v3, v4

    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_5
    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    goto :goto_1

    :cond_6
    iget-object v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->adjust(I)I

    move-result v0

    aput-object p1, v1, v0

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->adjust(I)I

    move-result v0

    iput v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-ne v0, v1, :cond_3

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->expand_array()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_7
    :try_start_2
    const-string v0, "MqttTimedEventQueue enqueue out of bounds"

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\nAdding event:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\nEvent queue:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    invoke-direct {v1, v0}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resetTimedEventQueue()V
    .locals 3

    const/4 v0, 0x0

    monitor-enter p0

    const/4 v1, 0x0

    :try_start_0
    iput v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    :goto_0
    iget-object v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    const/4 v2, 0x0

    aput-object v2, v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 10

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v1, 0x0

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->stopping:Z

    if-nez v0, :cond_0

    iput-boolean v4, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    :cond_0
    move-object v2, v1

    :goto_0
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->stopping:Z

    if-nez v0, :cond_1

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->stopping:Z

    if-eqz v0, :cond_2

    monitor-exit p0

    :cond_1
    return-void

    :cond_2
    :goto_1
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-eq v0, v5, :cond_3

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->canDeliverEvents:Z

    if-nez v0, :cond_6

    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    :catch_0
    move-exception v0

    move-object v0, v2

    :goto_2
    if-eqz v0, :cond_5

    :try_start_3
    invoke-interface {v0}, Lcom/ibm/mqtt/MqttTimedEvent;->notifyEvent()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_4

    :cond_4
    move-object v0, v1

    :cond_5
    move-object v2, v0

    goto :goto_0

    :cond_6
    :try_start_4
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    if-eqz v0, :cond_7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v7, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    aget-object v0, v0, v7

    invoke-interface {v0}, Lcom/ibm/mqtt/MqttTimedEvent;->getTime()J

    move-result-wide v7

    cmp-long v0, v5, v7

    if-gez v0, :cond_8

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->running:Z

    if-eqz v0, :cond_8

    sub-long v5, v7, v5

    invoke-virtual {p0, v5, v6}, Ljava/lang/Object;->wait(J)V

    :cond_7
    :goto_3
    monitor-exit p0

    move-object v0, v2

    goto :goto_2

    :cond_8
    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->canDeliverEvents:Z

    if-nez v0, :cond_9

    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->session:Lcom/ibm/mqtt/MqttBaseClient;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v6, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    aget-object v0, v0, v6

    check-cast v0, Lcom/ibm/mqtt/MqttRetry;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttRetry;->getMsgId()I

    move-result v0

    invoke-virtual {v5, v0}, Lcom/ibm/mqtt/MqttBaseClient;->outstanding(I)Z

    move-result v0

    if-nez v0, :cond_7

    :cond_9
    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    aget-object v2, v0, v5

    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    iget v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    const/4 v6, 0x0

    aput-object v6, v0, v5

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v5, v5

    if-ne v0, v5, :cond_7

    const/4 v0, 0x0

    iput v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    :catch_1
    move-exception v2

    move v2, v3

    :goto_4
    if-nez v2, :cond_4

    :try_start_5
    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttTimedEventQueue;->enqueue(Lcom/ibm/mqtt/MqttTimedEvent;)V
    :try_end_5
    .catch Lcom/ibm/mqtt/MqttException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4

    move v2, v4

    goto :goto_4

    :catch_2
    move-exception v0

    move-object v9, v0

    move-object v0, v2

    move-object v2, v9

    :goto_5
    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->session:Lcom/ibm/mqtt/MqttBaseClient;

    if-eqz v5, :cond_a

    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->session:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v5, v2}, Lcom/ibm/mqtt/MqttBaseClient;->setRegisteredThrowable(Ljava/lang/Throwable;)V

    :cond_a
    move-object v2, v0

    goto/16 :goto_0

    :catch_3
    move-exception v5

    goto :goto_4

    :catch_4
    move-exception v2

    goto :goto_5
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 6

    monitor-enter p0

    :try_start_0
    iget v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    const/4 v1, 0x0

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-gt v0, v3, :cond_0

    iget v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    move v4, v0

    :goto_0
    const-string v0, "["

    :goto_1
    if-ge v2, v4, :cond_1

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v5, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    add-int/lit8 v3, v2, 0x1

    aget-object v2, v5, v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    move v2, v3

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v0, v0

    move v4, v0

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    array-length v2, v2

    if-ne v4, v2, :cond_2

    :goto_2
    iget v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-ge v1, v2, :cond_2

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v3, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_array:[Lcom/ibm/mqtt/MqttTimedEvent;

    add-int/lit8 v2, v1, 0x1

    aget-object v1, v3, v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    move v1, v2

    goto :goto_2

    :cond_2
    iget v1, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_head:I

    iget v2, p0, Lcom/ibm/mqtt/MqttTimedEventQueue;->m_tail:I

    if-eq v1, v2, :cond_3

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
