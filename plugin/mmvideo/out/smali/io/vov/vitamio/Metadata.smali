.class public Lio/vov/vitamio/Metadata;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/vov/vitamio/Metadata$TimedText;
    }
.end annotation


# static fields
.field public static final ALBUM:I = 0x4

.field public static final ALBUM_ART:I = 0xe

.field public static final ANY:I = 0x0

.field public static final ARTIST:I = 0x5

.field public static final AUDIO_BIT_RATE:I = 0x12

.field public static final AUDIO_CODEC:I = 0x17

.field public static final AUDIO_SAMPLE_RATE:I = 0x14

.field public static final AUTHOR:I = 0x6

.field public static final BIT_RATE:I = 0x11

.field public static final BOOLEAN_VAL:I = 0x3

.field public static final BYTE_ARRAY_VAL:I = 0x8

.field public static final CAPTION:I = 0x10

.field public static final CD_TRACK_MAX:I = 0xc

.field public static final CD_TRACK_NUM:I = 0xb

.field public static final COMMENT:I = 0x2

.field public static final COMPOSER:I = 0x7

.field public static final COPYRIGHT:I = 0x3

.field public static final DATE:I = 0x9

.field public static final DATE_VAL:I = 0x7

.field public static final DOUBLE_VAL:I = 0x5

.field public static final DRM_CRIPPLED:I = 0x1c

.field public static final DURATION:I = 0xa

.field public static final GENRE:I = 0x8

.field public static final INTEGER_VAL:I = 0x2

.field public static final LONG_VAL:I = 0x4

.field public static final MATCH_ALL:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MATCH_NONE:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final MIME_TYPE:I = 0x16

.field public static final NUM_TRACKS:I = 0x1b

.field public static final PAUSE_AVAILABLE:I = 0x1d

.field public static final RATING:I = 0xd

.field public static final SEEK_AVAILABLE:I = 0x20

.field public static final SEEK_BACKWARD_AVAILABLE:I = 0x1e

.field public static final SEEK_FORWARD_AVAILABLE:I = 0x1f

.field public static final STRING_VAL:I = 0x1

.field public static final TIMED_TEXT_VAL:I = 0x6

.field public static final TITLE:I = 0x1

.field public static final VIDEO_BIT_RATE:I = 0x13

.field public static final VIDEO_CODEC:I = 0x18

.field public static final VIDEO_FRAME:I = 0xf

.field public static final VIDEO_FRAME_RATE:I = 0x15

.field public static final VIDEO_HEIGHT:I = 0x19

.field public static final VIDEO_WIDTH:I = 0x1a


# instance fields
.field private a:Landroid/os/Parcel;

.field private final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lio/vov/vitamio/Metadata;->MATCH_NONE:Ljava/util/Set;

    .line 61
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lio/vov/vitamio/Metadata;->MATCH_ALL:Ljava/util/Set;

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    .line 103
    return-void
.end method

.method private a(II)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 333
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 335
    iget-object v1, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 337
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 338
    if-eq v0, p2, :cond_0

    .line 339
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Wrong type "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " but got "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 341
    :cond_0
    return-void
.end method

.method private static a(I)Z
    .locals 3
    .parameter

    .prologue
    .line 325
    if-lez p0, :cond_0

    const/16 v0, 0x20

    if-ge v0, p0, :cond_1

    const/16 v0, 0x2000

    if-ge p0, v0, :cond_1

    .line 326
    :cond_0
    const-string v0, "media.Metadata"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid metadata ID "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    const/4 v0, 0x0

    .line 329
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private a(Landroid/os/Parcel;I)Z
    .locals 9
    .parameter
    .parameter

    .prologue
    const/16 v8, 0xc

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 133
    .line 136
    iget-object v2, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    move v3, v1

    .line 137
    :goto_0
    if-gt p2, v8, :cond_2

    move v2, v1

    .line 181
    :goto_1
    if-nez p2, :cond_0

    if-eqz v2, :cond_1

    .line 182
    :cond_0
    const-string v0, "media.Metadata"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Ran out of data or error on record "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    move v0, v1

    .line 186
    :cond_1
    return v0

    .line 138
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 142
    if-gt v4, v8, :cond_3

    .line 144
    const-string v2, "media.Metadata"

    const-string v4, "Record is too short"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 146
    goto :goto_1

    .line 150
    :cond_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 151
    invoke-static {v5}, Lio/vov/vitamio/Metadata;->a(I)Z

    move-result v6

    if-nez v6, :cond_4

    move v2, v0

    .line 153
    goto :goto_1

    .line 159
    :cond_4
    iget-object v6, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 160
    const-string v2, "media.Metadata"

    const-string v4, "Duplicate metadata ID found"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 162
    goto :goto_1

    .line 165
    :cond_5
    iget-object v6, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 169
    if-lez v5, :cond_6

    const/16 v6, 0x8

    if-le v5, v6, :cond_7

    .line 170
    :cond_6
    const-string v2, "media.Metadata"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Invalid metadata type "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v0

    .line 172
    goto/16 :goto_1

    .line 176
    :cond_7
    add-int/2addr v2, v4

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 177
    sub-int/2addr p2, v4

    .line 178
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto/16 :goto_0
.end method

.method public static firstCustomId()I
    .locals 1

    .prologue
    .line 317
    const/16 v0, 0x2000

    return v0
.end method

.method public static lastSytemId()I
    .locals 1

    .prologue
    .line 313
    const/16 v0, 0x20

    return v0
.end method

.method public static lastType()I
    .locals 1

    .prologue
    .line 321
    const/16 v0, 0x8

    return v0
.end method


# virtual methods
.method public getBoolean(I)Z
    .locals 2
    .parameter "key"

    .prologue
    const/4 v0, 0x1

    .line 269
    const/4 v1, 0x3

    invoke-direct {p0, p1, v1}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 270
    iget-object v1, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getByteArray(I)[B
    .locals 1
    .parameter "key"

    .prologue
    .line 284
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 285
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public getDate(I)Ljava/util/Date;
    .locals 4
    .parameter "key"

    .prologue
    .line 289
    const/4 v0, 0x7

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 290
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    .line 291
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 294
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 300
    :goto_0
    return-object v0

    .line 296
    :cond_0
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 297
    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 299
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 300
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    goto :goto_0
.end method

.method public getDouble(I)D
    .locals 2
    .parameter "key"

    .prologue
    .line 279
    const/4 v0, 0x5

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 280
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public getInt(I)I
    .locals 1
    .parameter "key"

    .prologue
    .line 264
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 265
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .parameter "key"

    .prologue
    .line 274
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 275
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 259
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 260
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimedText(I)Lio/vov/vitamio/Metadata$TimedText;
    .locals 4
    .parameter "key"

    .prologue
    .line 305
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lio/vov/vitamio/Metadata;->a(II)V

    .line 306
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 307
    iget-object v1, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 309
    new-instance v2, Lio/vov/vitamio/Metadata$TimedText;

    iget-object v3, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    invoke-virtual {v3}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v0, v1, v3}, Lio/vov/vitamio/Metadata$TimedText;-><init>(Lio/vov/vitamio/Metadata;Ljava/util/Date;ILjava/lang/String;)V

    return-object v2
.end method

.method public has(I)Z
    .locals 3
    .parameter "metadataId"

    .prologue
    .line 252
    invoke-static {p1}, Lio/vov/vitamio/Metadata;->a(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 253
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid key: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 248
    iget-object v0, p0, Lio/vov/vitamio/Metadata;->b:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public parse(Landroid/os/Parcel;)Z
    .locals 6
    .parameter "parcel"

    .prologue
    const/16 v4, 0x8

    const/4 v0, 0x0

    .line 219
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v1

    if-ge v1, v4, :cond_0

    .line 220
    const-string v1, "media.Metadata"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Not enough data "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    :goto_0
    return v0

    .line 224
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 225
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 226
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v3

    add-int/lit8 v3, v3, 0x4

    if-lt v3, v2, :cond_1

    if-ge v2, v4, :cond_2

    .line 227
    :cond_1
    const-string v3, "media.Metadata"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Bad size "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " avail "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " position "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    goto :goto_0

    .line 232
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 233
    const v4, 0x4d455441

    if-eq v3, v4, :cond_3

    .line 234
    const-string v2, "media.Metadata"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Marker missing "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    goto :goto_0

    .line 239
    :cond_3
    add-int/lit8 v2, v2, -0x8

    invoke-direct {p0, p1, v2}, Lio/vov/vitamio/Metadata;->a(Landroid/os/Parcel;I)Z

    move-result v2

    if-nez v2, :cond_4

    .line 240
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    goto :goto_0

    .line 243
    :cond_4
    iput-object p1, p0, Lio/vov/vitamio/Metadata;->a:Landroid/os/Parcel;

    .line 244
    const/4 v0, 0x1

    goto :goto_0
.end method
