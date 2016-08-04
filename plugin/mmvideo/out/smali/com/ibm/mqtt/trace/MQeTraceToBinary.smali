.class public abstract Lcom/ibm/mqtt/trace/MQeTraceToBinary;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/ibm/mqtt/MQeTraceHandler;


# static fields
.field private static final ASCII_CHARS_IN_MAX_LENGTH_STRING:I = 0x5000

.field static final DATA_FORMAT_VERSION:S = 0x1s

.field private static final DEBUG:Z = false

.field public static final UNICODE_CHARS_IN_MAX_LENGTH_STRING:I = 0x2800

.field static final V1_MAGIC:I = -0x1125446

.field static prefixes:[Ljava/lang/String;

.field public static version:[S


# instance fields
.field private currentFilter:J

.field private isOn:Z

.field private recordsOutput:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x4

    new-array v0, v3, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->version:[S

    const/16 v0, 0x34

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.ibm.mqe.adapters.MQe"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "a:"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com.ibm.mqe.administration.MQe"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "b:"

    aput-object v2, v0, v1

    const-string v1, "com.ibm.mqe.attributes.MQe"

    aput-object v1, v0, v3

    const/4 v1, 0x5

    const-string v2, "c:"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "com.ibm.mqe.bindings.MQe"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "d:"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "com.ibm.mqe.communications.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "e:"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "com.ibm.mqe.messagestore.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "f:"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "com.ibm.mqe.mqbridge.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "g:"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "com.ibm.mqe.registry.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "h:"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "com.ibm.mqe.server.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "i:"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "com.ibm.mqe.mqemqmessage.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "j:"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "com.ibm.mqe.trace.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "k:"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "com.ibm.mqe.validation.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "l:"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "com.ibm.mqe.MQe"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "m:"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "com.ibm.mqe.adapters."

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "n:"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "com.ibm.mqe.administration."

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "o:"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "com.ibm.mqe.attributes."

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "p:"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "com.ibm.mqe.bindings."

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "q:"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "com.ibm.mqe.communications."

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "r:"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "com.ibm.mqe.messagestore."

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "s:"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "com.ibm.mqe.mqbridge."

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "t:"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "com.ibm.mqe.registry."

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "u:"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "com.ibm.mqe.server."

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "v:"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "com.ibm.mqe.mqemqmessage."

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "w:"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "com.ibm.mqe.trace."

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "x:"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "com.ibm.mqe.validation."

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "y:"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "com.ibm.mqe."

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "z:"

    aput-object v2, v0, v1

    sput-object v0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->prefixes:[Ljava/lang/String;

    return-void

    :array_0
    .array-data 0x2
        0x2t 0x0t
        0x0t 0x0t
        0x0t 0x0t
        0x2t 0x0t
    .end array-data
.end method

.method constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->currentFilter:J

    iput-boolean v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->isOn:Z

    iput v2, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->recordsOutput:I

    return-void
.end method

.method private static encodeAsciiString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x5000

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    const/16 v1, 0x4fff

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    int-to-short v0, v0

    invoke-static {v0}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {p1}, Lcom/ibm/mqtt/MQe;->asciiToByte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method private static encodeUnicodeString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x2800

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    const/16 v1, 0x27ff

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    int-to-short v0, v0

    invoke-static {v0}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {p1}, Lcom/ibm/mqtt/MQe;->unicodeToByte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method private shortenClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const-string v1, "com.ibm.mqe."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v2, v0

    move-object v1, p1

    :goto_0
    if-nez v0, :cond_2

    sget-object v3, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->prefixes:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_2

    sget-object v3, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->prefixes:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v1, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->prefixes:[Ljava/lang/String;

    add-int/lit8 v3, v2, 0x1

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->prefixes:[Ljava/lang/String;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x1

    :cond_0
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    move-object v1, p1

    :cond_2
    return-object v1
.end method

.method private declared-synchronized traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V
    .locals 12

    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->isOn:Z

    if-eqz v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v6

    if-nez p1, :cond_1

    const-string v7, ""

    const/4 v8, 0x0

    :goto_0
    move-object/from16 v0, p5

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->convertInsertsToStrings([Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v11

    move-object v1, p0

    move v4, p2

    move-wide v9, p3

    invoke-virtual/range {v1 .. v11}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->constructRecord(JSLjava/lang/String;ILjava/lang/String;IJ[Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->writeRecord([B)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->shortenClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v8

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method constructRecord(JSLjava/lang/String;ILjava/lang/String;IJ[Ljava/lang/String;)[B
    .locals 3

    iget v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->recordsOutput:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->recordsOutput:I

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    invoke-static {p1, p2}, Lcom/ibm/mqtt/MQe;->longToByte(J)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {p3}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v1, p4}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->encodeAsciiString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    invoke-static {p5}, Lcom/ibm/mqtt/MQe;->intToByte(I)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v1, p6}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->encodeAsciiString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    invoke-static {p7}, Lcom/ibm/mqtt/MQe;->intToByte(I)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    array-length v0, p10

    int-to-short v0, v0

    invoke-static {v0}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    const/4 v0, 0x0

    :goto_0
    array-length v2, p10

    if-ge v0, v2, :cond_0

    aget-object v2, p10, v0

    invoke-static {v1, v2}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->encodeUnicodeString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method convertInsertsToStrings([Ljava/lang/Object;)[Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    :goto_0
    new-array v2, v1, [Ljava/lang/String;

    :goto_1
    if-ge v0, v1, :cond_2

    aget-object v3, p1, v0

    if-nez v3, :cond_1

    const-string v3, ""

    aput-object v3, v2, v0

    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_0
    array-length v1, p1

    goto :goto_0

    :cond_1
    aget-object v3, p1, v0

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    goto :goto_2

    :cond_2
    if-lez v1, :cond_3

    add-int/lit8 v0, v1, -0x1

    aget-object v0, p1, v0

    if-eqz v0, :cond_3

    instance-of v3, v0, Ljava/lang/Throwable;

    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    add-int/lit8 v1, v1, -0x1

    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {p0, v0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->throwableStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v1

    :cond_3
    return-object v2
.end method

.method getFooter(S)[B
    .locals 11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v7

    const-wide/16 v8, 0x0

    const/4 v0, 0x0

    new-array v10, v0, [Ljava/lang/String;

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v10}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->constructRecord(JSLjava/lang/String;ILjava/lang/String;IJ[Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method getHeader()[B
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const v2, -0x1125446

    invoke-static {v2}, Lcom/ibm/mqtt/MQe;->intToByte(I)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    const/4 v2, 0x1

    invoke-static {v2}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    sget-object v2, Lcom/ibm/mqtt/MQe;->version:[S

    const/4 v3, 0x0

    aget-short v3, v2, v3

    invoke-static {v3}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    const/4 v3, 0x1

    aget-short v3, v2, v3

    invoke-static {v3}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V

    const/4 v3, 0x2

    aget-short v2, v2, v3

    invoke-static {v2}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/ibm/mqtt/MQe;->shortToByte(S)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    const-string v2, "mqe_java/source/com/ibm/mqe/MQe.java, MQeBase, la000 1.111"

    invoke-static {v1, v2}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->encodeAsciiString(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/ibm/mqtt/MQe;->longToByte(J)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method declared-synchronized off()Z
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    monitor-exit p0

    return v0
.end method

.method declared-synchronized on()Z
    .locals 2

    monitor-enter p0

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iput v1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->recordsOutput:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFilter(J)V
    .locals 4

    const-wide/16 v2, 0x0

    iget-wide v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->currentFilter:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    cmp-long v0, p1, v2

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->on()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->isOn:Z

    :cond_0
    :goto_0
    iput-wide p1, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->currentFilter:J

    return-void

    :cond_1
    cmp-long v0, p1, v2

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->off()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->isOn:Z

    goto :goto_0
.end method

.method abstract throwableStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
.end method

.method public traceMessage(Ljava/lang/Object;SJ)V
    .locals 6

    const/4 v0, 0x0

    new-array v5, v0, [Ljava/lang/Object;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V

    return-void
.end method

.method public traceMessage(Ljava/lang/Object;SJLjava/lang/Object;)V
    .locals 6

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p5, v5, v0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V

    return-void
.end method

.method public traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    const/4 v0, 0x2

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p5, v5, v0

    const/4 v0, 0x1

    aput-object p6, v5, v0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V

    return-void
.end method

.method public traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p5, v5, v0

    const/4 v0, 0x1

    aput-object p6, v5, v0

    const/4 v0, 0x2

    aput-object p7, v5, v0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V

    return-void
.end method

.method public traceMessage(Ljava/lang/Object;SJLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p5, v5, v0

    const/4 v0, 0x1

    aput-object p6, v5, v0

    const/4 v0, 0x2

    aput-object p7, v5, v0

    const/4 v0, 0x3

    aput-object p8, v5, v0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/ibm/mqtt/trace/MQeTraceToBinary;->traceFilteredMessage(Ljava/lang/Object;SJ[Ljava/lang/Object;)V

    return-void
.end method

.method abstract writeRecord([B)Z
.end method
