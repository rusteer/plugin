.class Lcom/webuid/mmVideo/PlayActivity$6;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$6;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 217
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 218
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 219
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$6;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/PlayActivity;->mHandlerClick:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 220
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 197
    new-instance v0, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v5, "/index.php?s=/Service/Index"

    invoke-direct {v0, v5}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 199
    .local v0, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 200
    .local v3, regdata:Lorg/json/JSONObject;
    const-string v5, "id"

    iget-object v6, p0, Lcom/webuid/mmVideo/PlayActivity$6;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v6, v6, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v7, "id"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 201
    const-string v5, "regdata.toString()"

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    const-string v5, "getPlayUrl"

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 203
    .local v4, result:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-le v5, v6, :cond_0

    .line 204
    const-string v5, "play result:"

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 206
    .local v1, dict:Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/webuid/mmVideo/PlayActivity$6;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v6, "source"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;
    invoke-static {v5, v6}, Lcom/webuid/mmVideo/PlayActivity;->access$9(Lcom/webuid/mmVideo/PlayActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    .end local v1           #dict:Lorg/json/JSONObject;
    .end local v3           #regdata:Lorg/json/JSONObject;
    .end local v4           #result:Ljava/lang/String;
    :cond_0
    :goto_0
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/webuid/mmVideo/PlayActivity$6;->sendMessage(I)V

    .line 215
    return-void

    .line 210
    :catch_0
    move-exception v2

    .line 212
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 208
    .end local v2           #e:Lorg/json/JSONException;
    :catch_1
    move-exception v5

    goto :goto_0
.end method
