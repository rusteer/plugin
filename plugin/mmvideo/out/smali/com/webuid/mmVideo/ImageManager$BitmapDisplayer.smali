.class Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;
.super Ljava/lang/Object;
.source "ImageManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BitmapDisplayer"
.end annotation


# instance fields
.field bitmap:Landroid/graphics/Bitmap;

.field defDrawableId:I

.field imageView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/webuid/mmVideo/ImageManager;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/ImageManager;Landroid/graphics/Bitmap;Landroid/widget/ImageView;I)V
    .locals 0
    .parameter
    .parameter "b"
    .parameter "i"
    .parameter "defaultDrawableId"

    .prologue
    .line 247
    iput-object p1, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->this$0:Lcom/webuid/mmVideo/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 248
    iput-object p2, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->bitmap:Landroid/graphics/Bitmap;

    .line 249
    iput-object p3, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->imageView:Landroid/widget/ImageView;

    .line 250
    iput p4, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->defDrawableId:I

    .line 251
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->imageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 258
    :goto_0
    return-void

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->imageView:Landroid/widget/ImageView;

    iget v1, p0, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;->defDrawableId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method
