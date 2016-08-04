.class public final Lio/vov/a/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static b:I

.field private static c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    .line 16
    const/4 v0, -0x1

    sput v0, Lio/vov/a/a;->b:I

    .line 17
    const/4 v0, 0x0

    sput-object v0, Lio/vov/a/a;->c:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()I
    .locals 7

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 31
    sget v0, Lio/vov/a/a;->b:I

    if-lez v0, :cond_0

    .line 32
    invoke-static {}, Lio/vov/a/a;->b()I

    move-result v0

    .line 112
    :goto_0
    return v0

    .line 34
    :cond_0
    sput v2, Lio/vov/a/a;->b:I

    .line 36
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 37
    const/4 v4, 0x0

    .line 39
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/FileReader;

    new-instance v5, Ljava/io/File;

    const-string v6, "/proc/cpuinfo"

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v5}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    .line 42
    :cond_1
    :goto_1
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    if-nez v0, :cond_b

    .line 54
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 62
    :cond_2
    :goto_2
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    .line 63
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_d

    .line 69
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    const-string v1, "CPU architecture"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 70
    if-eqz v0, :cond_f

    .line 72
    :try_start_3
    invoke-static {v0}, Lio/vov/a/c;->a(Ljava/lang/String;)I

    move-result v0

    .line 73
    const-string v1, "CPU architecture: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v1, v4}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_4

    .line 74
    const/4 v1, 0x7

    if-lt v0, v1, :cond_e

    move v1, v2

    move v4, v2

    .line 86
    :goto_4
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    const-string v5, "Processor"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 87
    if-eqz v0, :cond_3

    const-string v5, "(v7l)"

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    :cond_3
    const-string v5, "ARMv7"

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_4
    move v1, v2

    move v4, v2

    .line 91
    :cond_5
    if-eqz v0, :cond_6

    const-string v5, "(v6l)"

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    :cond_6
    const-string v5, "ARMv6"

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 96
    :cond_7
    :goto_5
    if-eqz v2, :cond_8

    .line 97
    sget v0, Lio/vov/a/a;->b:I

    or-int/lit8 v0, v0, 0x2

    sput v0, Lio/vov/a/a;->b:I

    .line 98
    :cond_8
    if-eqz v3, :cond_9

    .line 99
    sget v0, Lio/vov/a/a;->b:I

    or-int/lit8 v0, v0, 0x8

    sput v0, Lio/vov/a/a;->b:I

    .line 101
    :cond_9
    sget-object v0, Lio/vov/a/a;->a:Ljava/util/Map;

    const-string v1, "Features"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 102
    if-eqz v0, :cond_a

    .line 103
    const-string v1, "neon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 104
    sget v0, Lio/vov/a/a;->b:I

    or-int/lit8 v0, v0, 0x34

    sput v0, Lio/vov/a/a;->b:I

    .line 112
    :cond_a
    :goto_6
    invoke-static {}, Lio/vov/a/a;->b()I

    move-result v0

    goto/16 :goto_0

    .line 43
    :cond_b
    const/4 v4, 0x0

    :try_start_4
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v4}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 45
    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 46
    array-length v4, v0

    if-le v4, v2, :cond_1

    .line 47
    sget-object v4, Lio/vov/a/a;->a:Ljava/util/Map;

    const/4 v5, 0x0

    aget-object v5, v0, v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v0, v0, v6

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_1

    .line 50
    :catch_0
    move-exception v0

    .line 51
    :goto_7
    :try_start_5
    const-string v4, "getCPUFeature"

    invoke-static {v4, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_2

    .line 56
    :catch_1
    move-exception v0

    .line 57
    const-string v1, "getCPUFeature"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 52
    :catchall_0
    move-exception v0

    move-object v1, v4

    .line 54
    :goto_8
    if-eqz v1, :cond_c

    .line 55
    :try_start_7
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 59
    :cond_c
    :goto_9
    throw v0

    .line 56
    :catch_2
    move-exception v1

    .line 57
    const-string v2, "getCPUFeature"

    invoke-static {v2, v1}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9

    .line 56
    :catch_3
    move-exception v0

    .line 57
    const-string v1, "getCPUFeature"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 63
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    const-string v4, "%s:%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v3

    sget-object v6, Lio/vov/a/a;->a:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-static {v4, v5}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 77
    :cond_e
    const/4 v1, 0x6

    if-lt v0, v1, :cond_f

    move v1, v3

    move v4, v2

    .line 79
    goto/16 :goto_4

    .line 81
    :catch_4
    move-exception v0

    .line 82
    const-string v1, "getCPUFeature"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_f
    move v1, v3

    move v4, v3

    goto/16 :goto_4

    .line 105
    :cond_10
    const-string v1, "vfpv3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 106
    sget v0, Lio/vov/a/a;->b:I

    or-int/lit8 v0, v0, 0x14

    sput v0, Lio/vov/a/a;->b:I

    goto/16 :goto_6

    .line 107
    :cond_11
    const-string v1, "vfp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 108
    sget v0, Lio/vov/a/a;->b:I

    or-int/lit8 v0, v0, 0x4

    sput v0, Lio/vov/a/a;->b:I

    goto/16 :goto_6

    .line 52
    :catchall_1
    move-exception v0

    goto :goto_8

    .line 50
    :catch_5
    move-exception v0

    move-object v1, v4

    goto :goto_7

    :cond_12
    move v3, v1

    move v2, v4

    goto/16 :goto_5
.end method

.method private static b()I
    .locals 4

    .prologue
    .line 116
    sget-object v0, Lio/vov/a/a;->c:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 117
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 118
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_0

    .line 119
    const-string v1, "V5TE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    :cond_0
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x2

    if-lez v1, :cond_1

    .line 121
    const-string v1, "V6 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    :cond_1
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x4

    if-lez v1, :cond_2

    .line 123
    const-string v1, "VFP "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    :cond_2
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x8

    if-lez v1, :cond_3

    .line 125
    const-string v1, "V7A "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    :cond_3
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x10

    if-lez v1, :cond_4

    .line 127
    const-string v1, "VFPV3 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    :cond_4
    sget v1, Lio/vov/a/a;->b:I

    and-int/lit8 v1, v1, 0x20

    if-lez v1, :cond_5

    .line 129
    const-string v1, "NEON "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/vov/a/a;->c:Ljava/lang/String;

    .line 132
    :cond_6
    const-string v0, "GET CPU FATURE: %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Lio/vov/a/a;->c:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    sget v0, Lio/vov/a/a;->b:I

    return v0
.end method
