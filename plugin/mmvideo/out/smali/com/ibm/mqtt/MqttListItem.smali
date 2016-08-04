.class public final Lcom/ibm/mqtt/MqttListItem;
.super Ljava/lang/Object;


# instance fields
.field public data:Ljava/lang/Object;

.field public key:J

.field public next:Lcom/ibm/mqtt/MqttListItem;


# direct methods
.method public constructor <init>(JLcom/ibm/mqtt/MqttListItem;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    iput-object p3, p0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iput-wide p1, p0, Lcom/ibm/mqtt/MqttListItem;->key:J

    return-void
.end method


# virtual methods
.method public isEnd()Z
    .locals 1

    iget-object v0, p0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keysMatch(J)Z
    .locals 2

    iget-wide v0, p0, Lcom/ibm/mqtt/MqttListItem;->key:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
