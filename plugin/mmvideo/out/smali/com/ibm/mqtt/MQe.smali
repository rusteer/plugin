.class public Lcom/ibm/mqtt/MQe;
.super Ljava/lang/Object;


# static fields
.field public static final Hex:[C = null

.field public static final copyright:Ljava/lang/String; = "Licensed Materials - Property of IBM\nProduct number: 5765-E63\nCopyright IBM Corp. 1999,2002 All Rights Reserved.\nUS Government Users Restriced Rights - use, duplication or\ndisclosure restriced by GSA ADP Schedule Contract with IBM Corp."

.field public static final sccsid:Ljava/lang/String; = "mqe_java/source/com/ibm/mqe/MQe.java, MQeBase, la000 1.111"

.field public static version:[S


# instance fields
.field private traceService:Lcom/ibm/mqtt/MQeTrace;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [S

    fill-array-data v0, :array_0

    sput-object v0, Lcom/ibm/mqtt/MQe;->version:[S

    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/ibm/mqtt/MQe;->Hex:[C

    return-void

    :array_0
    .array-data 0x2
        0x2t 0x0t
        0x0t 0x0t
        0x0t 0x0t
        0x2t 0x0t
    .end array-data

    :array_1
    .array-data 0x2
        0x30t 0x0t
        0x31t 0x0t
        0x32t 0x0t
        0x33t 0x0t
        0x34t 0x0t
        0x35t 0x0t
        0x36t 0x0t
        0x37t 0x0t
        0x38t 0x0t
        0x39t 0x0t
        0x41t 0x0t
        0x42t 0x0t
        0x43t 0x0t
        0x44t 0x0t
        0x45t 0x0t
        0x46t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ibm/mqtt/MQeTrace;

    invoke-direct {v0}, Lcom/ibm/mqtt/MQeTrace;-><init>()V

    iput-object v0, p0, Lcom/ibm/mqtt/MQe;->traceService:Lcom/ibm/mqtt/MQeTrace;

    return-void
.end method

.method public static asciiToByte(Ljava/lang/String;)[B
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    new-array v1, v1, [B

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    new-array v2, v2, [C

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v0, v3, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_1

    aget-char v3, v2, v0

    int-to-byte v3, v3

    aput-byte v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method

.method public static byteToAscii([B)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    array-length v0, p0

    new-array v1, v0, [C

    const/4 v0, 0x0

    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_1

    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method public static byteToHex([B)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/ibm/mqtt/MQe;->byteToHex([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static byteToHex([BII)Ljava/lang/String;
    .locals 4

    new-instance v1, Ljava/lang/StringBuffer;

    const/16 v0, 0x80

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    if-eqz p0, :cond_0

    move v0, p1

    :goto_0
    add-int v2, p1, p2

    if-ge v0, v2, :cond_0

    sget-object v2, Lcom/ibm/mqtt/MQe;->Hex:[C

    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    sget-object v2, Lcom/ibm/mqtt/MQe;->Hex:[C

    aget-byte v3, p0, v0

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static byteToInt([BI)I
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    shl-int/lit8 v1, v1, 0x8

    add-int v2, p1, v0

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public static byteToLong([BI)J
    .locals 6

    const/16 v5, 0x8

    const-wide/16 v1, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v5, :cond_0

    shl-long/2addr v1, v5

    add-int v3, p1, v0

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    int-to-long v3, v3

    add-long/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-wide v1
.end method

.method public static byteToShort([BI)S
    .locals 2

    add-int/lit8 v0, p1, 0x0

    aget-byte v0, p0, v0

    int-to-short v0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    int-to-short v1, v1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public static byteToUnicode([B)Ljava/lang/String;
    .locals 5

    const/4 v1, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    array-length v0, p0

    div-int/lit8 v0, v0, 0x2

    new-array v2, v0, [C

    move v0, v1

    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_1

    mul-int/lit8 v3, v0, 0x2

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    mul-int/lit8 v4, v0, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    int-to-char v3, v3

    aput-char v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/String;

    array-length v3, v2

    invoke-direct {v0, v2, v1, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public static intToByte(I)[B
    .locals 5

    const/4 v4, 0x4

    new-array v1, v4, [B

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v4, :cond_0

    rsub-int/lit8 v2, v0, 0x3

    and-int/lit16 v3, p0, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    shr-int/lit8 p0, p0, 0x8

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static longToByte(J)[B
    .locals 6

    const/16 v5, 0x8

    new-array v1, v5, [B

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v5, :cond_0

    rsub-int/lit8 v2, v0, 0x7

    const-wide/16 v3, 0xff

    and-long/2addr v3, p0

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    shr-long/2addr p0, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public static shortToByte(S)[B
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [B

    const/4 v1, 0x0

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public static unicodeToByte(Ljava/lang/String;)[B
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    new-array v2, v1, [C

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    array-length v1, v2

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [B

    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_1

    mul-int/lit8 v3, v0, 0x2

    aget-char v4, v2, v0

    shr-int/lit8 v4, v4, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    mul-int/lit8 v3, v0, 0x2

    add-int/lit8 v3, v3, 0x1

    aget-char v4, v2, v0

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0
.end method
