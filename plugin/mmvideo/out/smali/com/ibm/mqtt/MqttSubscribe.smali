.class public Lcom/ibm/mqtt/MqttSubscribe;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public topics:[Ljava/lang/String;

.field public topicsQoS:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSubscribe;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 7

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSubscribe;->setMsgType(S)V

    invoke-static {p1, p2}, Lcom/ibm/mqtt/MqttUtils;->toShort([BI)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttSubscribe;->setMsgId(I)V

    add-int/lit8 v0, p2, 0x2

    array-length v2, p1

    add-int/lit8 v3, p2, 0x2

    sub-int/2addr v2, v3

    invoke-static {p1, v0, v2}, Lcom/ibm/mqtt/MqttUtils;->SliceByteArray([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->getTopicsWithQoS([B)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v0, v3, [B

    iput-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->topicsQoS:[B

    new-array v0, v3, [Ljava/lang/String;

    iput-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->topics:[Ljava/lang/String;

    move v0, v1

    :goto_0
    if-ge v0, v3, :cond_0

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/ibm/mqtt/MqttSubscribe;->topics:[Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v4, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    iget-object v5, p0, Lcom/ibm/mqtt/MqttSubscribe;->topicsQoS:[B

    const/16 v6, 0xa

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v5, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
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
    .locals 0

    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttSubscribe;)V

    return-void
.end method

.method public toBytes()[B
    .locals 6

    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    iget-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v2

    aget-byte v2, v2, v1

    aput-byte v2, v0, v1

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttSubscribe;->getMsgId()I

    move-result v0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    div-int/lit16 v3, v0, 0x100

    int-to-byte v3, v3

    aput-byte v3, v2, v5

    iget-object v2, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    const/4 v3, 0x2

    rem-int/lit16 v0, v0, 0x100

    int-to-byte v0, v0

    aput-byte v0, v2, v3

    move v4, v1

    :goto_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->topics:[Ljava/lang/String;

    array-length v0, v0

    if-ge v4, v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->topics:[Ljava/lang/String;

    aget-object v0, v0, v4

    invoke-static {v0}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    invoke-static {v0, v2}, Lcom/ibm/mqtt/MqttUtils;->concatArray([B[B)[B

    move-result-object v0

    iget-object v3, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    array-length v3, v3

    array-length v2, v2

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/ibm/mqtt/MqttSubscribe;->topicsQoS:[B

    invoke-static/range {v0 .. v5}, Lcom/ibm/mqtt/MqttUtils;->concatArray([BII[BII)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttSubscribe;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttSubscribe;->message:[B

    return-object v0
.end method
