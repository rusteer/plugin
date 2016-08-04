.class public final Lcom/webuid/mmVideo/Tabdb$listValue;
.super Ljava/lang/Object;
.source "Tabdb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/Tabdb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "listValue"
.end annotation


# static fields
.field public static mImageViewArray:[I

.field public static mImageViewArraySel:[I

.field public static mTabClassArray:[Ljava/lang/Class;

.field public static mTextviewArray:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x4

    .line 8
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArray:[I

    .line 13
    new-array v0, v2, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArraySel:[I

    .line 18
    new-array v0, v2, [Ljava/lang/String;

    const-string v1, "\u63a8\u8350"

    aput-object v1, v0, v3

    const-string v1, "\u6392\u884c\u699c"

    aput-object v1, v0, v4

    const-string v1, "\u4e2a\u4eba\u7a7a\u95f4"

    aput-object v1, v0, v5

    const-string v1, "\u79bb\u7ebf\u89c2\u770b"

    aput-object v1, v0, v6

    sput-object v0, Lcom/webuid/mmVideo/Tabdb$listValue;->mTextviewArray:[Ljava/lang/String;

    .line 21
    new-array v0, v2, [Ljava/lang/Class;

    const-class v1, Lcom/webuid/mmVideo/RecommendActivity;

    aput-object v1, v0, v3

    .line 22
    const-class v1, Lcom/webuid/mmVideo/RankActivity;

    aput-object v1, v0, v4

    .line 23
    const-class v1, Lcom/webuid/mmVideo/MySpaceActivity;

    aput-object v1, v0, v5

    .line 24
    const-class v1, Lcom/webuid/mmVideo/OfflineActivity;

    aput-object v1, v0, v6

    .line 21
    sput-object v0, Lcom/webuid/mmVideo/Tabdb$listValue;->mTabClassArray:[Ljava/lang/Class;

    .line 6
    return-void

    .line 8
    :array_0
    .array-data 0x4
        0x78t 0x0t 0x2t 0x7ft
        0x7at 0x0t 0x2t 0x7ft
        0x7ct 0x0t 0x2t 0x7ft
        0x7et 0x0t 0x2t 0x7ft
    .end array-data

    .line 13
    :array_1
    .array-data 0x4
        0x79t 0x0t 0x2t 0x7ft
        0x7bt 0x0t 0x2t 0x7ft
        0x7dt 0x0t 0x2t 0x7ft
        0x7ft 0x0t 0x2t 0x7ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
