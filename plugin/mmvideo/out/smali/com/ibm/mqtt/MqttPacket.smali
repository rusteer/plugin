.class public abstract Lcom/ibm/mqtt/MqttPacket;
.super Ljava/lang/Object;


# static fields
.field public static final MAX_CLIENT_ID_LEN:I = 0x17

.field public static final MAX_MSGID:I = 0xffff


# instance fields
.field private dup:Z

.field protected message:[B

.field private msgId:I

.field private msgLength:I

.field private msgType:S

.field private payload:[B

.field private qos:I

.field private retain:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgId:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Lcom/ibm/mqtt/MqttPacket;->msgId:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    aget-byte v3, p1, v2

    invoke-static {v3}, Lcom/ibm/mqtt/MqttPacket;->getMsgType(B)S

    move-result v0

    iput-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    and-int/lit8 v0, v3, 0x1

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ibm/mqtt/MqttPacket;->retain:Z

    ushr-int/lit8 v0, v3, 0x3

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/ibm/mqtt/MqttPacket;->dup:Z

    ushr-int/lit8 v0, v3, 0x1

    and-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/ibm/mqtt/MqttPacket;->qos:I

    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method protected static getMsgType(B)S
    .locals 1

    ushr-int/lit8 v0, p0, 0x4

    and-int/lit8 v0, v0, 0xf

    int-to-short v0, v0

    return v0
.end method


# virtual methods
.method protected createMsgLength()V
    .locals 7

    const/4 v6, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iget-object v2, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    array-length v2, v2

    add-int/2addr v0, v2

    :cond_0
    iput v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgLength:I

    const/4 v2, 0x4

    new-array v5, v2, [B

    move v2, v0

    move v0, v1

    :goto_0
    rem-int/lit16 v4, v2, 0x80

    div-int/lit16 v3, v2, 0x80

    if-lez v3, :cond_1

    or-int/lit16 v2, v4, 0x80

    move v4, v2

    :cond_1
    add-int/lit8 v2, v0, 0x1

    int-to-byte v4, v4

    aput-byte v4, v5, v0

    if-gtz v3, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    array-length v0, v0

    add-int/2addr v0, v2

    new-array v0, v0, [B

    iget-object v3, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    aget-byte v3, v3, v1

    aput-byte v3, v0, v1

    invoke-static {v5, v1, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v1, v6, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    return-void

    :cond_2
    move v0, v2

    move v2, v3

    goto :goto_0
.end method

.method public getMessage()[B
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    return-object v0
.end method

.method public getMsgId()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgId:I

    return v0
.end method

.method public getMsgLength()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgLength:I

    return v0
.end method

.method public getMsgType()S
    .locals 1

    iget-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    return v0
.end method

.method public getPayload()[B
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    return-object v0
.end method

.method public getQos()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttPacket;->qos:I

    return v0
.end method

.method public isDup()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttPacket;->dup:Z

    return v0
.end method

.method public isRetain()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttPacket;->retain:Z

    return v0
.end method

.method public abstract process(Lcom/ibm/mqtt/MqttProcessor;)V
.end method

.method public setDup(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ibm/mqtt/MqttPacket;->dup:Z

    return-void
.end method

.method public setMessage([B)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/MqttPacket;->message:[B

    return-void
.end method

.method public setMsgId(I)V
    .locals 0

    iput p1, p0, Lcom/ibm/mqtt/MqttPacket;->msgId:I

    return-void
.end method

.method public setMsgLength(I)V
    .locals 0

    iput p1, p0, Lcom/ibm/mqtt/MqttPacket;->msgLength:I

    return-void
.end method

.method public setMsgType(S)V
    .locals 0

    iput-short p1, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    return-void
.end method

.method public setPayload([B)V
    .locals 0

    iput-object p1, p0, Lcom/ibm/mqtt/MqttPacket;->payload:[B

    return-void
.end method

.method public setQos(I)V
    .locals 0

    iput p1, p0, Lcom/ibm/mqtt/MqttPacket;->qos:I

    return-void
.end method

.method public setRetain(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ibm/mqtt/MqttPacket;->retain:Z

    return-void
.end method

.method public toBytes()[B
    .locals 7

    const/16 v4, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    new-array v5, v1, [B

    iget-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    shl-int/lit8 v0, v0, 0x4

    and-int/lit16 v0, v0, 0xf0

    int-to-byte v0, v0

    aput-byte v0, v5, v2

    iget-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    if-ne v0, v4, :cond_1

    move v0, v1

    :goto_0
    iget-short v3, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    const/16 v6, 0x9

    if-ne v3, v6, :cond_2

    move v3, v1

    :goto_1
    or-int/2addr v3, v0

    iget-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    const/16 v6, 0xa

    if-ne v0, v6, :cond_3

    move v0, v1

    :goto_2
    or-int/2addr v3, v0

    iget-short v0, p0, Lcom/ibm/mqtt/MqttPacket;->msgType:S

    const/16 v6, 0xb

    if-ne v0, v6, :cond_4

    move v0, v1

    :goto_3
    or-int/2addr v0, v3

    if-eqz v0, :cond_0

    iput v1, p0, Lcom/ibm/mqtt/MqttPacket;->qos:I

    :cond_0
    iget v0, p0, Lcom/ibm/mqtt/MqttPacket;->qos:I

    and-int/lit8 v0, v0, 0x3

    shl-int/lit8 v0, v0, 0x1

    int-to-byte v3, v0

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttPacket;->dup:Z

    if-eqz v0, :cond_5

    move v0, v4

    :goto_4
    int-to-byte v0, v0

    iget-boolean v4, p0, Lcom/ibm/mqtt/MqttPacket;->retain:Z

    if-eqz v4, :cond_6

    :goto_5
    int-to-byte v1, v1

    aget-byte v4, v5, v2

    or-int/2addr v3, v4

    or-int/2addr v1, v3

    or-int/2addr v0, v1

    int-to-byte v0, v0

    aput-byte v0, v5, v2

    return-object v5

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    move v3, v2

    goto :goto_1

    :cond_3
    move v0, v2

    goto :goto_2

    :cond_4
    move v0, v2

    goto :goto_3

    :cond_5
    move v0, v2

    goto :goto_4

    :cond_6
    move v1, v2

    goto :goto_5
.end method
