.class public Lcom/ibm/mqtt/MqttConnect;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public CleanStart:Z

.field protected ClientId:Ljava/lang/String;

.field public KeepAlive:S

.field public ProtoName:Ljava/lang/String;

.field public ProtoVersion:S

.field public TopicNameCompression:Z

.field public Will:Z

.field public WillMessage:Ljava/lang/String;

.field public WillQoS:I

.field public WillRetain:Z

.field public WillTopic:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const-string v0, "MQIsdp"

    iput-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoName:Ljava/lang/String;

    const/4 v0, 0x3

    iput-short v0, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoVersion:S

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttConnect;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const-string v0, "MQIsdp"

    iput-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoName:Ljava/lang/String;

    const/4 v0, 0x3

    iput-short v0, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoVersion:S

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttConnect;->setMsgType(S)V

    return-void
.end method


# virtual methods
.method public getClientId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->ClientId:Ljava/lang/String;

    return-object v0
.end method

.method public process(Lcom/ibm/mqtt/MqttProcessor;)V
    .locals 0

    return-void
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ibm/mqtt/MqttException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x17

    if-le v0, v1, :cond_0

    new-instance v0, Lcom/ibm/mqtt/MqttException;

    const-string v1, "MQIsdp ClientId > 23 bytes"

    invoke-direct {v0, v1}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/ibm/mqtt/MqttConnect;->ClientId:Ljava/lang/String;

    return-void
.end method

.method public toBytes()[B
    .locals 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/16 v2, 0x2a

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    iget-object v2, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v3

    aget-byte v3, v3, v1

    aput-byte v3, v2, v1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoName:Ljava/lang/String;

    invoke-static {v2}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v2

    iget-object v3, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    array-length v4, v2

    invoke-static {v2, v1, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    add-int/lit8 v4, v2, 0x1

    iget-short v5, p0, Lcom/ibm/mqtt/MqttConnect;->ProtoVersion:S

    int-to-byte v5, v5

    aput-byte v5, v3, v2

    iget-boolean v2, p0, Lcom/ibm/mqtt/MqttConnect;->TopicNameCompression:Z

    if-eqz v2, :cond_1

    :goto_0
    iget-boolean v2, p0, Lcom/ibm/mqtt/MqttConnect;->CleanStart:Z

    if-eqz v2, :cond_2

    const/4 v2, 0x2

    :goto_1
    iget-boolean v3, p0, Lcom/ibm/mqtt/MqttConnect;->Will:Z

    if-eqz v3, :cond_4

    iget-boolean v3, p0, Lcom/ibm/mqtt/MqttConnect;->WillRetain:Z

    if-eqz v3, :cond_3

    const/16 v3, 0x20

    :goto_2
    iget v5, p0, Lcom/ibm/mqtt/MqttConnect;->WillQoS:I

    and-int/lit8 v5, v5, 0x3

    shl-int/lit8 v5, v5, 0x3

    int-to-byte v5, v5

    or-int/2addr v3, v5

    or-int/lit8 v3, v3, 0x4

    int-to-byte v3, v3

    :goto_3
    iget-object v5, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    add-int/lit8 v6, v4, 0x1

    or-int/2addr v0, v2

    or-int/2addr v0, v3

    int-to-byte v0, v0

    aput-byte v0, v5, v4

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    add-int/lit8 v2, v6, 0x1

    iget-short v3, p0, Lcom/ibm/mqtt/MqttConnect;->KeepAlive:S

    div-int/lit16 v3, v3, 0x100

    int-to-byte v3, v3

    aput-byte v3, v0, v6

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    add-int/lit8 v3, v2, 0x1

    iget-short v4, p0, Lcom/ibm/mqtt/MqttConnect;->KeepAlive:S

    rem-int/lit16 v4, v4, 0x100

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->ClientId:Ljava/lang/String;

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    array-length v4, v0

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, v0

    add-int v2, v3, v0

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttConnect;->Will:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->WillTopic:Ljava/lang/String;

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v3

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->WillMessage:Ljava/lang/String;

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v6

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    array-length v5, v3

    move v4, v1

    invoke-static/range {v0 .. v5}, Lcom/ibm/mqtt/MqttUtils;->concatArray([BII[BII)[B

    move-result-object v0

    invoke-static {v0, v6}, Lcom/ibm/mqtt/MqttUtils;->concatArray([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    array-length v0, v3

    array-length v3, v6

    add-int/2addr v0, v3

    add-int/2addr v2, v0

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    invoke-static {v0, v1, v2}, Lcom/ibm/mqtt/MqttUtils;->SliceByteArray([BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttConnect;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttConnect;->message:[B

    return-object v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v2, v1

    goto :goto_1

    :cond_3
    move v3, v1

    goto :goto_2

    :cond_4
    move v3, v1

    goto :goto_3
.end method
