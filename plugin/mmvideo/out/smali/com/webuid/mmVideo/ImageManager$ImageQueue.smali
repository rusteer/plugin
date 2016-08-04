.class Lcom/webuid/mmVideo/ImageManager$ImageQueue;
.super Ljava/lang/Object;
.source "ImageManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageQueue"
.end annotation


# instance fields
.field private imageRefs:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/webuid/mmVideo/ImageManager$ImageRef;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/webuid/mmVideo/ImageManager;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/ImageManager;)V
    .locals 1
    .parameter

    .prologue
    .line 180
    iput-object p1, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->this$0:Lcom/webuid/mmVideo/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;

    return-void
.end method

.method synthetic constructor <init>(Lcom/webuid/mmVideo/ImageManager;Lcom/webuid/mmVideo/ImageManager$ImageQueue;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;-><init>(Lcom/webuid/mmVideo/ImageManager;)V

    return-void
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;
    .locals 1
    .parameter

    .prologue
    .line 181
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;

    return-object v0
.end method


# virtual methods
.method public Clean(Landroid/widget/ImageView;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 186
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 192
    return-void

    .line 187
    :cond_0
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;

    invoke-virtual {v1, v0}, Ljava/util/Stack;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/webuid/mmVideo/ImageManager$ImageRef;

    iget-object v1, v1, Lcom/webuid/mmVideo/ImageManager$ImageRef;->imageView:Landroid/widget/ImageView;

    if-ne v1, p1, :cond_1

    .line 188
    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;

    invoke-virtual {v1, v0}, Ljava/util/Stack;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 190
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
