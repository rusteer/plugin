.class Lcom/webuid/mmVideo/PlayerActivity$2;
.super Ljava/lang/Object;
.source "PlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayerActivity;->playVideo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayerActivity$2;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 76
    new-instance v0, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v6, "/index.php?s=/Service/Index"

    invoke-direct {v0, v6}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 78
    .local v0, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .local v4, regdata:Lorg/json/JSONObject;
    const-string v7, "id"

    iget-object v6, p0, Lcom/webuid/mmVideo/PlayerActivity$2;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    iget-object v6, v6, Lcom/webuid/mmVideo/PlayerActivity;->video_info:Ljava/util/HashMap;

    const-string v8, "id"

    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v6, "regdata.toString()"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const-string v6, "getPlayUrl"

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 82
    .local v5, result:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x4

    if-le v6, v7, :cond_0

    .line 83
    const-string v6, "play result:"

    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 85
    .local v1, dict:Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayerActivity$2;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    const-string v7, "source"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    #setter for: Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;
    invoke-static {v6, v7}, Lcom/webuid/mmVideo/PlayerActivity;->access$2(Lcom/webuid/mmVideo/PlayerActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .end local v1           #dict:Lorg/json/JSONObject;
    .end local v4           #regdata:Lorg/json/JSONObject;
    .end local v5           #result:Ljava/lang/String;
    :cond_0
    :goto_0
    const-string v6, "currentThread"

    const-string v7, "currentThread"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 95
    .local v3, message:Landroid/os/Message;
    const/4 v6, 0x1

    iput v6, v3, Landroid/os/Message;->what:I

    .line 96
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayerActivity$2;->this$0:Lcom/webuid/mmVideo/PlayerActivity;

    iget-object v6, v6, Lcom/webuid/mmVideo/PlayerActivity;->mHandlerClick:Landroid/os/Handler;

    invoke-virtual {v6, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 98
    return-void

    .line 89
    .end local v3           #message:Landroid/os/Message;
    :catch_0
    move-exception v2

    .line 91
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 87
    .end local v2           #e:Lorg/json/JSONException;
    :catch_1
    move-exception v6

    goto :goto_0
.end method
