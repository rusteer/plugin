.class public Lcom/ibm/mqtt/MqttHashTable;
.super Ljava/lang/Object;


# static fields
.field private static final INITIAL_CAPACITY:I = 0x65

.field private static final LOAD_FACTOR_DENOMINATOR:I = 0x4

.field private static final LOAD_FACTOR_NUMERATOR:I = 0x3

.field private static m_init_capacity:I


# instance fields
.field public hashTable:[Lcom/ibm/mqtt/MqttListItem;

.field public m_capacity:I

.field private m_ceiling:I

.field private recycle_bin:Lcom/ibm/mqtt/MqttListItem;

.field private recycle_length:I

.field private size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x65

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttHashTable;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    invoke-direct {p0, p1}, Lcom/ibm/mqtt/MqttHashTable;->findPower(I)I

    move-result v0

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    sput v0, Lcom/ibm/mqtt/MqttHashTable;->m_init_capacity:I

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_ceiling:I

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    new-array v0, v0, [Lcom/ibm/mqtt/MqttListItem;

    iput-object v0, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    return-void
.end method

.method private findPower(I)I
    .locals 1

    const/4 v0, 0x2

    :cond_0
    mul-int/lit8 v0, v0, 0x2

    if-lt v0, p1, :cond_0

    return v0
.end method

.method private recycleCreate(JLcom/ibm/mqtt/MqttListItem;Ljava/lang/Object;)Lcom/ibm/mqtt/MqttListItem;
    .locals 2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    iget-object v1, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    iput-wide p1, v0, Lcom/ibm/mqtt/MqttListItem;->key:J

    iput-object p3, v0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iput-object p4, v0, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/ibm/mqtt/MqttListItem;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/ibm/mqtt/MqttListItem;-><init>(JLcom/ibm/mqtt/MqttListItem;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private rehash(I)V
    .locals 9

    iget-object v3, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    new-array v4, v0, [Lcom/ibm/mqtt/MqttListItem;

    iput-object v4, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, p1, :cond_1

    aget-object v0, v3, v2

    :goto_1
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iget-wide v5, v0, Lcom/ibm/mqtt/MqttListItem;->key:J

    const/16 v7, 0x20

    ushr-long v7, v5, v7

    xor-long/2addr v5, v7

    iget v7, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    add-int/lit8 v7, v7, -0x1

    int-to-long v7, v7

    and-long/2addr v5, v7

    long-to-int v5, v5

    aget-object v6, v4, v5

    iput-object v6, v0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    aput-object v0, v4, v5

    move-object v0, v1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    const/4 v1, 0x0

    move v0, v1

    :goto_0
    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x0

    move v0, v1

    :goto_0
    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    if-ge v0, v2, :cond_0

    iget-object v2, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v2, v2, v0

    :goto_1
    if-eqz v2, :cond_2

    iget-object v3, v2, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    iget-object v2, v2, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public containsKey(J)Z
    .locals 1

    invoke-virtual {p0, p1, p2}, Lcom/ibm/mqtt/MqttHashTable;->get(J)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public elements()Ljava/util/Enumeration;
    .locals 2

    new-instance v0, Lcom/ibm/mqtt/MqttEnumList;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ibm/mqtt/MqttEnumList;-><init>(Lcom/ibm/mqtt/MqttHashTable;Z)V

    return-object v0
.end method

.method public get(J)Ljava/lang/Object;
    .locals 4

    const/16 v0, 0x20

    ushr-long v0, p1, v0

    xor-long/2addr v0, p1

    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    add-int/lit8 v2, v2, -0x1

    int-to-long v2, v2

    and-long/2addr v0, v2

    long-to-int v0, v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v1, v1, v0

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v0, v1, v0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Lcom/ibm/mqtt/MqttListItem;->keysMatch(J)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    :goto_1
    return-object v0

    :cond_0
    iget-object v0, v0, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public isEmpty()Z
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keys()Ljava/util/Enumeration;
    .locals 2

    new-instance v0, Lcom/ibm/mqtt/MqttEnumList;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/ibm/mqtt/MqttEnumList;-><init>(Lcom/ibm/mqtt/MqttHashTable;Z)V

    return-object v0
.end method

.method public put(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 5

    const/4 v0, 0x0

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->m_ceiling:I

    if-le v1, v2, :cond_0

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    shl-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_ceiling:I

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttHashTable;->rehash(I)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/ibm/mqtt/MqttHashTable;->put(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/16 v1, 0x20

    ushr-long v1, p1, v1

    xor-long/2addr v1, p1

    iget v3, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    add-int/lit8 v3, v3, -0x1

    int-to-long v3, v3

    and-long/2addr v1, v3

    long-to-int v3, v1

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v2, v1, v3

    if-nez v2, :cond_1

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/ibm/mqtt/MqttHashTable;->recycleCreate(JLcom/ibm/mqtt/MqttListItem;Ljava/lang/Object;)Lcom/ibm/mqtt/MqttListItem;

    move-result-object v2

    aput-object v2, v1, v3

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_1
    if-eqz v1, :cond_3

    invoke-virtual {v1, p1, p2}, Lcom/ibm/mqtt/MqttListItem;->keysMatch(J)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v0, v1, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    iput-object p3, v1, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    goto :goto_0

    :cond_2
    iget-object v1, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    invoke-direct {p0, p1, p2, v2, p3}, Lcom/ibm/mqtt/MqttHashTable;->recycleCreate(JLcom/ibm/mqtt/MqttListItem;Ljava/lang/Object;)Lcom/ibm/mqtt/MqttListItem;

    move-result-object v2

    aput-object v2, v1, v3

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    goto :goto_0
.end method

.method public remove(J)Ljava/lang/Object;
    .locals 6

    const/4 v0, 0x0

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->m_ceiling:I

    div-int/lit8 v2, v2, 0x4

    if-ge v1, v2, :cond_1

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    sget v2, Lcom/ibm/mqtt/MqttHashTable;->m_init_capacity:I

    shl-int/lit8 v2, v2, 0x1

    if-lt v1, v2, :cond_1

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    shr-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_ceiling:I

    invoke-direct {p0, v0}, Lcom/ibm/mqtt/MqttHashTable;->rehash(I)V

    invoke-virtual {p0, p1, p2}, Lcom/ibm/mqtt/MqttHashTable;->remove(J)Ljava/lang/Object;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/16 v1, 0x20

    ushr-long v1, p1, v1

    xor-long/2addr v1, p1

    iget v3, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    add-int/lit8 v3, v3, -0x1

    int-to-long v3, v3

    and-long/2addr v1, v3

    long-to-int v3, v1

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v1, v1, v3

    move-object v2, v0

    :goto_1
    if-eqz v1, :cond_0

    invoke-virtual {v1, p1, p2}, Lcom/ibm/mqtt/MqttListItem;->keysMatch(J)Z

    move-result v4

    if-eqz v4, :cond_4

    if-nez v2, :cond_3

    iget-object v0, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    iget-object v2, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    aput-object v2, v0, v3

    :goto_2
    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    div-int/lit8 v2, v2, 0x8

    if-ge v0, v2, :cond_2

    iget-object v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    iput-object v0, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iput-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_bin:Lcom/ibm/mqtt/MqttListItem;

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/MqttHashTable;->recycle_length:I

    :cond_2
    iget-object v0, v1, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    goto :goto_0

    :cond_3
    iget-object v0, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    iput-object v0, v2, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    goto :goto_2

    :cond_4
    iget-object v2, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    move-object v5, v2

    move-object v2, v1

    move-object v1, v5

    goto :goto_1
.end method

.method public size()I
    .locals 1

    iget v0, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    return v0
.end method

.method public final view()V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/ibm/mqtt/MqttHashTable;->m_capacity:I

    if-ge v0, v1, :cond_1

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "\nBucket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/ibm/mqtt/MqttHashTable;->hashTable:[Lcom/ibm/mqtt/MqttListItem;

    aget-object v1, v1, v0

    :goto_1
    if-eqz v1, :cond_0

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, v1, Lcom/ibm/mqtt/MqttListItem;->data:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    iget-object v1, v1, Lcom/ibm/mqtt/MqttListItem;->next:Lcom/ibm/mqtt/MqttListItem;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "\nSize = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/ibm/mqtt/MqttHashTable;->size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method
