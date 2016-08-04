.class public Lcom/ibm/mqtt/MqttEnumList;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Enumeration;


# instance fields
.field private count:I

.field private index:I

.field private keys:Z

.field private mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

.field private ptr:Lcom/ibm/mqtt/MqttListItem;

.field private size:I


# direct methods
.method public constructor <init>(Lcom/ibm/mqtt/MqttHashTable;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ibm/mqtt/MqttEnumList;->mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttHashTable;->size()I

    move-result v0

    iput v0, p0, Lcom/ibm/mqtt/MqttEnumList;->size:I

    iput-boolean p2, p0, Lcom/ibm/mqtt/MqttEnumList;->keys:Z

    const/4 v0, 0x0

    iput v0, p0, Lcom/ibm/mqtt/MqttEnumList;->count:I

    iput v0, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

    iget-object v0, v0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    iget v1, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttEnumList;->advance(Lcom/ibm/mqtt/MqttListItem;)Lcom/ibm/mqtt/MqttListItem;

    move-result-object v0

    iput-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    :cond_0
    return-void
.end method

.method private advance(Lcom/ibm/mqtt/MqttListItem;)Lcom/ibm/mqtt/MqttListItem;
    .locals 2

    :cond_0
    iget v0, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/ibm/mqtt/MqttEnumList;->mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

    iget v1, v1, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->mqtt_enum:Lcom/ibm/mqtt/MqttHashTable;

    iget-object v0, v0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    iget v1, p0, Lcom/ibm/mqtt/MqttEnumList;->index:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 2

    iget v0, p0, Lcom/ibm/mqtt/MqttEnumList;->count:I

    iget v1, p0, Lcom/ibm/mqtt/MqttEnumList;->size:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 3

    iget-object v1, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    invoke-virtual {v0}, Lcom/ibm/mqtt/MqttListItem;->isEnd()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    iget-object v0, v0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    :goto_0
    iput-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    iget v0, p0, Lcom/ibm/mqtt/MqttEnumList;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttEnumList;->count:I

    iget-boolean v0, p0, Lcom/ibm/mqtt/MqttEnumList;->keys:Z

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/Long;

    iget-wide v1, v1, Lcom/ibm/mqtt/MqttListItem;->key:J

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    :goto_1
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ibm/mqtt/MqttEnumList;->ptr:Lcom/ibm/mqtt/MqttListItem;

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttEnumList;->advance(Lcom/ibm/mqtt/MqttListItem;)Lcom/ibm/mqtt/MqttListItem;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, v1, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    goto :goto_1
.end method
