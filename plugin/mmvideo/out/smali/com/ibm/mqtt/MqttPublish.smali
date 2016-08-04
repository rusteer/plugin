.class public Lcom/ibm/mqtt/MqttPublish;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public topicName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPublish;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPublish;->setMsgType(S)V

    invoke-static {p1, p2}, Lcom/ibm/mqtt/MqttUtils;->UTFToString([BI)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, 0x2

    invoke-static {p1, v0}, Lcom/ibm/mqtt/MqttUtils;->toShort([BI)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPublish;->setMsgId(I)V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, 0x4

    array-length v1, p1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, p2

    add-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    invoke-static {p1, v0, v1}, Lcom/ibm/mqtt/MqttUtils;->SliceByteArray([BII)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPublish;->setPayload([B)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, 0x2

    array-length v1, p1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, p2

    add-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    invoke-static {p1, v0, v1}, Lcom/ibm/mqtt/MqttUtils;->SliceByteArray([BII)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPublish;->setPayload([B)V

    goto :goto_0
.end method

.method private uncompressTopic()V
    .locals 0

    return-void
.end method


# virtual methods
.method public compressTopic()V
    .locals 0

    return-void
.end method

.method public process(Lcom/ibm/mqtt/MqttProcessor;)V
    .locals 1

    invoke-interface {p1}, Lcom/ibm/mqtt/MqttProcessor;->supportTopicNameCompression()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPublish;->uncompressTopic()V

    :cond_0
    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttPublish;)V

    return-void
.end method

.method public toBytes()[B
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->topicName:Ljava/lang/String;

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v1

    if-lez v1, :cond_1

    array-length v1, v0

    add-int/lit8 v1, v1, 0x3

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    :goto_0
    iget-object v1, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    const/4 v2, 0x1

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v3

    aget-byte v3, v3, v4

    aput-byte v3, v1, v4

    iget-object v1, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    array-length v3, v0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPublish;->getQos()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPublish;->getMsgId()I

    move-result v1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    add-int/lit8 v3, v0, 0x1

    div-int/lit16 v4, v1, 0x100

    int-to-byte v4, v4

    aput-byte v4, v2, v0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    add-int/lit8 v2, v3, 0x1

    rem-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    :cond_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPublish;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    return-object v0

    :cond_1
    array-length v1, v0

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/ibm/mqtt/MqttPublish;->message:[B

    goto :goto_0
.end method
