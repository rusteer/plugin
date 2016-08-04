.class Lcom/webuid/mmVideo/ImageManager$ImageRef;
.super Ljava/lang/Object;
.source "ImageManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageRef"
.end annotation


# instance fields
.field public defDrawableId:I

.field public imageView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/webuid/mmVideo/ImageManager;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/ImageManager;Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 0
    .parameter
    .parameter "u"
    .parameter "i"
    .parameter "defaultDrawableId"

    .prologue
    .line 172
    iput-object p1, p0, Lcom/webuid/mmVideo/ImageManager$ImageRef;->this$0:Lcom/webuid/mmVideo/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-object p2, p0, Lcom/webuid/mmVideo/ImageManager$ImageRef;->url:Ljava/lang/String;

    .line 174
    iput-object p3, p0, Lcom/webuid/mmVideo/ImageManager$ImageRef;->imageView:Landroid/widget/ImageView;

    .line 175
    iput p4, p0, Lcom/webuid/mmVideo/ImageManager$ImageRef;->defDrawableId:I

    .line 176
    return-void
.end method
