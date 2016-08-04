.class public Lcom/ibm/mqtt/MqttPubrec;
.super Lcom/ibm/mqtt/MqttPacket;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPubrec;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPubrec;->setMsgType(S)V

    invoke-static {p1, p2}, Lcom/ibm/mqtt/MqttUtils;->toShort([BI)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttPubrec;->setMsgId(I)V

    return-void
.end method


# virtual methods
.method public process(Lcom/ibm/mqtt/MqttProcessor;)V
    .locals 0

    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttPubrec;)V

    return-void
.end method

.method public toBytes()[B
    .locals 4

    const/4 v2, 0x0

    const/4 v0, 0x3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/ibm/mqtt/MqttPubrec;->message:[B

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPubrec;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v1

    aget-byte v1, v1, v2

    aput-byte v1, v0, v2

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPubrec;->getMsgId()I

    move-result v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttPubrec;->message:[B

    const/4 v2, 0x1

    div-int/lit16 v3, v0, 0x100

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    iget-object v1, p0, Lcom/ibm/mqtt/MqttPubrec;->message:[B

    const/4 v2, 0x2

    rem-int/lit16 v0, v0, 0x100

    int-to-byte v0, v0

    aput-byte v0, v1, v2

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttPubrec;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPubrec;->message:[B

    return-object v0
.end method
