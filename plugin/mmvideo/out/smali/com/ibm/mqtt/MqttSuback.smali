.class public Lcom/ibm/mqtt/MqttSuback;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public TopicsQoS:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSuback;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSuback;->setMsgType(S)V

    invoke-static {p1, p2}, Lcom/ibm/mqtt/MqttUtils;->toShort([BI)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSuback;->setMsgId(I)V

    add-int/lit8 v0, p2, 0x2

    array-length v1, p1

    add-int/lit8 v2, p2, 0x2

    sub-int/2addr v1, v2

    invoke-static {p1, v0, v1}, Lcom/ibm/mqtt/MqttUtils;->SliceByteArray([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttSuback;->TopicsQoS:[B

    return-void
.end method


# virtual methods
.method public process(Lcom/ibm/mqtt/MqttProcessor;)V
    .locals 0

    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttSuback;)V

    return-void
.end method

.method public toBytes()[B
    .locals 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttSuback;->TopicsQoS:[B

    array-length v1, v1

    add-int/lit8 v1, v1, 0x3

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    iget-object v1, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v2

    aget-byte v2, v2, v0

    aput-byte v2, v1, v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttSuback;->getMsgId()I

    move-result v1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    const/4 v3, 0x1

    div-int/lit16 v4, v1, 0x100

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    const/4 v3, 0x2

    rem-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    aput-byte v1, v2, v3

    :goto_0
    iget-object v1, p0, Lcom/ibm/mqtt/MqttSuback;->TopicsQoS:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    add-int/lit8 v2, v0, 0x3

    iget-object v3, p0, Lcom/ibm/mqtt/MqttSuback;->TopicsQoS:[B

    aget-byte v3, v3, v0

    aput-byte v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttSuback;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttSuback;->message:[B

    return-object v0
.end method
