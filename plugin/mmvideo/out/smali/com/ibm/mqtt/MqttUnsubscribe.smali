.class public Lcom/ibm/mqtt/MqttUnsubscribe;
.super Lcom/ibm/mqtt/MqttPacket;


# instance fields
.field public topics:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/ibm/mqtt/MqttPacket;-><init>()V

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttUnsubscribe;->setMsgType(S)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 5

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttPacket;-><init>([B)V

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttUnsubscribe;->setMsgType(S)V

    invoke-static {p1, p2}, Lcom/ibm/mqtt/MqttUtils;->toShort([BI)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/MqttUnsubscribe;->setMsgId(I)V

    add-int/lit8 v0, p2, 0x2

    invoke-static {p1, v0}, Lcom/ibm/mqtt/MqttUtils;->UTFToStrings([BI)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    iput-object v0, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->topics:[Ljava/lang/String;

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    iget-object v3, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->topics:[Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

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

    invoke-interface {p1, p0}, Lcom/ibm/mqtt/MqttProcessor;->process(Lcom/ibm/mqtt/MqttUnsubscribe;)V

    return-void
.end method

.method public toBytes()[B
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x3

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    iget-object v1, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    invoke-super {p0}, Lcom/ibm/mqtt/MqttPacket;->toBytes()[B

    move-result-object v2

    aget-byte v2, v2, v0

    aput-byte v2, v1, v0

    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttUnsubscribe;->getMsgId()I

    move-result v1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    const/4 v3, 0x1

    div-int/lit16 v4, v1, 0x100

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    iget-object v2, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    const/4 v3, 0x2

    rem-int/lit16 v1, v1, 0x100

    int-to-byte v1, v1

    aput-byte v1, v2, v3

    :goto_0
    iget-object v1, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->topics:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->topics:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {v1}, Lcom/ibm/mqtt/MqttUtils;->StringToUTF(Ljava/lang/String;)[B

    move-result-object v1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    invoke-static {v2, v1}, Lcom/ibm/mqtt/MqttUtils;->concatArray([B[B)[B

    move-result-object v1

    iput-object v1, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/ibm/mqtt/MqttUnsubscribe;->createMsgLength()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttUnsubscribe;->message:[B

    return-object v0
.end method
