.class public Lcom/ibm/mqtt/MqttConnack;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public returnCode:S

.field public topicNameCompression:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttConnack;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttConnack;->setMsgType(S)V

    aget-byte v0, p1, p2

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttConnack;->topicNameCompression:Z

    add-int/lit8 v0, p2, 0x1

    aget-byte v0, p1, v0

    int-to-short v0, v0

    iput-short v0, p0, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public process(Lcom/ibm/mqtt/MqttProcessor;)V
    .locals 0

    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttConnack;)V

    return-void
.end method

.method public toBytes()[B
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v2, 0x3

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/ibm/mqtt/MqttConnack;->message:[B

    iget-object v2, p0, Lcom/ibm/mqtt/MqttConnack;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v3

    aget-byte v3, v3, v0

    aput-byte v3, v2, v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttConnack;->message:[B

    iget-boolean v3, p0, Lcom/ibm/mqtt/MqttConnack;->topicNameCompression:Z

    if-eqz v3, :cond_0

    move v0, v1

    :cond_0
    aput-byte v0, v2, v1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnack;->message:[B

    const/4 v1, 0x2

    iget-short v2, p0, Lcom/ibm/mqtt/MqttConnack;->returnCode:S

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttConnack;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnack;->message:[B

    return-object v0
.end method
