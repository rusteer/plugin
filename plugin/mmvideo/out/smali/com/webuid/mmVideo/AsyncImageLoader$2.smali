.class Lcom/webuid/mmVideo/AsyncImageLoader$2;
.super Ljava/lang/Object;
.source "AsyncImageLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/AsyncImageLoader;->loadDrawable(Landroid/content/Context;Ljava/lang/String;Lcom/webuid/mmVideo/AsyncImageLoader$ImageCallback;)Landroid/graphics/drawable/Drawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/AsyncImageLoader;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$handler:Landroid/os/Handler;

.field private final synthetic val$imageUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/AsyncImageLoader;Landroid/content/Context;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->this$0:Lcom/webuid/mmVideo/AsyncImageLoader;

    iput-object p2, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$imageUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$handler:Landroid/os/Handler;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 72
    const-string v2, "async"

    const-string v3, "004"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iget-object v2, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$imageUrl:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/webuid/mmVideo/AsyncImageLoader;->loadImageFromUrl(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 74
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 75
    const-string v2, "async"

    const-string v3, "004 null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :goto_0
    return-void

    .line 77
    :cond_0
    iget-object v2, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->this$0:Lcom/webuid/mmVideo/AsyncImageLoader;

    #getter for: Lcom/webuid/mmVideo/AsyncImageLoader;->imageCache:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/webuid/mmVideo/AsyncImageLoader;->access$0(Lcom/webuid/mmVideo/AsyncImageLoader;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$imageUrl:Ljava/lang/String;

    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    iget-object v2, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$handler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 79
    .local v1, message:Landroid/os/Message;
    const-string v2, "async"

    const-string v3, "005"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    iget-object v2, p0, Lcom/webuid/mmVideo/AsyncImageLoader$2;->val$handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
