.class public Lcom/ibm/mqtt/MqttReconn;
.super Ljava/lang/Thread;


# instance fields
.field private client:Lcom/ibm/mqtt/MqttBaseClient;


# direct methods
.method public constructor <init>(Lcom/ibm/mqtt/MqttBaseClient;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttReconn;->client:Lcom/ibm/mqtt/MqttBaseClient;

    iput-object p1, p0, Lcom/ibm/mqtt/MqttReconn;->client:Lcom/ibm/mqtt/MqttBaseClient;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttReconn;->client:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttBaseClient;->connectionLost()V

    iget-object v0, p0, Lcom/ibm/mqtt/MqttReconn;->client:Lcom/ibm/mqtt/MqttBaseClient;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->setConnectionLost(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ibm/mqtt/MqttException;

    const-string v2, "ConnectionLost exception caught"

    invoke-direct {v1, v2}, Lcom/ibm/mqtt/MqttException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/ibm/mqtt/MqttException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttReconn;->client:Lcom/ibm/mqtt/MqttBaseClient;

    invoke-virtual {v0, v1}, Lcom/ibm/mqtt/MqttBaseClient;->setRegisteredThrowable(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
