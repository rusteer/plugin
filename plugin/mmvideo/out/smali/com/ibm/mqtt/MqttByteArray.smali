.class public Lcom/ibm/mqtt/MqttByteArray;
.super Ljava/lang/Object;


# instance fields
.field private byteArray:[B


# direct methods
.method public constructor <init>([B)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttByteArray;->byteArray:[B

    iput-object p1, p0, Lcom/ibm/mqtt/MqttByteArray;->byteArray:[B

    return-void
.end method


# virtual methods
.method public getByteArray()[B
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttByteArray;->byteArray:[B

    return-object v0
.end method
