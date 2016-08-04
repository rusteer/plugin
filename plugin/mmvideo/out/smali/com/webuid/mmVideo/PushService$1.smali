.class Lcom/webuid/mmVideo/PushService$1;
.super Landroid/content/BroadcastReceiver;
.source "PushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PushService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PushService;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PushService;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    .line 387
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 391
    const-string v2, "networkInfo"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/NetworkInfo;

    .line 394
    .local v1, info:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    .line 396
    .local v0, hasConnectivity:Z
    :goto_0
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Connectivity changed: connected="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/webuid/mmVideo/PushService;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/webuid/mmVideo/PushService;->access$0(Lcom/webuid/mmVideo/PushService;Ljava/lang/String;)V

    .line 398
    if-eqz v0, :cond_2

    .line 399
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    #calls: Lcom/webuid/mmVideo/PushService;->reconnectIfNecessary()V
    invoke-static {v2}, Lcom/webuid/mmVideo/PushService;->access$1(Lcom/webuid/mmVideo/PushService;)V

    .line 406
    :cond_0
    :goto_1
    return-void

    .line 394
    .end local v0           #hasConnectivity:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 400
    .restart local v0       #hasConnectivity:Z
    :cond_2
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    #getter for: Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    invoke-static {v2}, Lcom/webuid/mmVideo/PushService;->access$2(Lcom/webuid/mmVideo/PushService;)Lcom/webuid/mmVideo/PushService$MQTTConnection;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 402
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    #getter for: Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    invoke-static {v2}, Lcom/webuid/mmVideo/PushService;->access$2(Lcom/webuid/mmVideo/PushService;)Lcom/webuid/mmVideo/PushService$MQTTConnection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/webuid/mmVideo/PushService$MQTTConnection;->disconnect()V

    .line 403
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    invoke-virtual {v2}, Lcom/webuid/mmVideo/PushService;->cancelReconnect()V

    .line 404
    iget-object v2, p0, Lcom/webuid/mmVideo/PushService$1;->this$0:Lcom/webuid/mmVideo/PushService;

    const/4 v3, 0x0

    #setter for: Lcom/webuid/mmVideo/PushService;->mConnection:Lcom/webuid/mmVideo/PushService$MQTTConnection;
    invoke-static {v2, v3}, Lcom/webuid/mmVideo/PushService;->access$3(Lcom/webuid/mmVideo/PushService;Lcom/webuid/mmVideo/PushService$MQTTConnection;)V

    goto :goto_1
.end method
