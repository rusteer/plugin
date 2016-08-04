.class Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;
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
    name = "ImageQueueManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/ImageManager;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/ImageManager;)V
    .locals 0
    .parameter

    .prologue
    .line 195
    iput-object p1, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/webuid/mmVideo/ImageManager;Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 195
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;-><init>(Lcom/webuid/mmVideo/ImageManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 202
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Stack;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 203
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v6

    monitor-enter v6
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :try_start_1
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    .line 203
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 209
    :cond_1
    :try_start_2
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Stack;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 212
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v6

    monitor-enter v6
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 213
    :try_start_3
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageQueue:Lcom/webuid/mmVideo/ImageManager$ImageQueue;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$0(Lcom/webuid/mmVideo/ImageManager;)Lcom/webuid/mmVideo/ImageManager$ImageQueue;

    move-result-object v5

    #getter for: Lcom/webuid/mmVideo/ImageManager$ImageQueue;->imageRefs:Ljava/util/Stack;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager$ImageQueue;->access$1(Lcom/webuid/mmVideo/ImageManager$ImageQueue;)Ljava/util/Stack;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;

    .line 212
    .local v3, imageToLoad:Lcom/webuid/mmVideo/ImageManager$ImageRef;
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 216
    :try_start_4
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    iget-object v6, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->url:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/webuid/mmVideo/ImageManager;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 217
    .local v1, bmp:Landroid/graphics/Bitmap;
    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    #getter for: Lcom/webuid/mmVideo/ImageManager;->imageMap:Ljava/util/HashMap;
    invoke-static {v5}, Lcom/webuid/mmVideo/ImageManager;->access$1(Lcom/webuid/mmVideo/ImageManager;)Ljava/util/HashMap;

    move-result-object v5

    iget-object v6, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->url:Ljava/lang/String;

    new-instance v7, Ljava/lang/ref/SoftReference;

    invoke-direct {v7, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    iget-object v5, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v4

    .line 222
    .local v4, tag:Ljava/lang/Object;
    if-eqz v4, :cond_2

    check-cast v4, Ljava/lang/String;

    .end local v4           #tag:Ljava/lang/Object;
    iget-object v5, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 223
    new-instance v2, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;

    iget-object v5, p0, Lcom/webuid/mmVideo/ImageManager$ImageQueueManager;->this$0:Lcom/webuid/mmVideo/ImageManager;

    .line 224
    iget-object v6, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->imageView:Landroid/widget/ImageView;

    .line 225
    iget v7, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->defDrawableId:I

    .line 223
    invoke-direct {v2, v5, v1, v6, v7}, Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;-><init>(Lcom/webuid/mmVideo/ImageManager;Landroid/graphics/Bitmap;Landroid/widget/ImageView;I)V

    .line 227
    .local v2, bmpDisplayer:Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;
    iget-object v5, v3, Lcom/webuid/mmVideo/ImageManager$ImageRef;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 229
    .local v0, a:Landroid/app/Activity;
    invoke-virtual {v0, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 233
    .end local v0           #a:Landroid/app/Activity;
    .end local v1           #bmp:Landroid/graphics/Bitmap;
    .end local v2           #bmpDisplayer:Lcom/webuid/mmVideo/ImageManager$BitmapDisplayer;
    .end local v3           #imageToLoad:Lcom/webuid/mmVideo/ImageManager$ImageRef;
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 238
    :goto_0
    return-void

    .line 203
    :catchall_0
    move-exception v5

    :try_start_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v5
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_0

    .line 236
    :catch_0
    move-exception v5

    goto :goto_0

    .line 212
    :catchall_1
    move-exception v5

    :try_start_7
    monitor-exit v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v5
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_0
.end method
