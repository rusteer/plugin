.class Lcom/webuid/mmVideo/update/MmUpdateService$2;
.super Ljava/lang/Object;
.source "MmUpdateService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/update/MmUpdateService;->createThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

.field private final synthetic val$handler:Landroid/os/Handler;

.field private final synthetic val$message:Landroid/os/Message;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/update/MmUpdateService;Landroid/os/Message;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    iput-object p2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$message:Landroid/os/Message;

    iput-object p3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$handler:Landroid/os/Handler;

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 110
    :try_start_0
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    invoke-static {}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$7()Ljava/lang/String;

    move-result-object v4

    .line 111
    sget-object v5, Lcom/webuid/mmVideo/update/FileUtil;->updateFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    .line 110
    invoke-virtual {v3, v4, v5}, Lcom/webuid/mmVideo/update/MmUpdateService;->downloadUpdateFile(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    .line 112
    .local v0, downloadSize:J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-lez v3, :cond_0

    .line 114
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$message:Landroid/os/Message;

    const/4 v4, 0x1

    iput v4, v3, Landroid/os/Message;->what:I

    .line 115
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$handler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$message:Landroid/os/Message;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .end local v0           #downloadSize:J
    :cond_0
    :goto_0
    return-void

    .line 118
    :catch_0
    move-exception v2

    .line 119
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 120
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$message:Landroid/os/Message;

    const/4 v4, 0x0

    iput v4, v3, Landroid/os/Message;->what:I

    .line 121
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$handler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/webuid/mmVideo/update/MmUpdateService$2;->val$message:Landroid/os/Message;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
