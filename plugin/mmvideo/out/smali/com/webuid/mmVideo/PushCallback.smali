.class public Lcom/webuid/mmVideo/PushCallback;
.super Ljava/lang/Object;
.source "PushCallback.java"

# interfaces
.implements Lorg/eclipse/paho/client/mqttv3/MqttCallback;


# instance fields
.field private context:Landroid/content/ContextWrapper;


# direct methods
.method public constructor <init>(Landroid/content/ContextWrapper;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/webuid/mmVideo/PushCallback;->context:Landroid/content/ContextWrapper;

    .line 22
    return-void
.end method


# virtual methods
.method public connectionLost(Ljava/lang/Throwable;)V
    .locals 0
    .parameter "cause"

    .prologue
    .line 27
    return-void
.end method

.method public deliveryComplete(Lorg/eclipse/paho/client/mqttv3/MqttDeliveryToken;)V
    .locals 0
    .parameter "token"

    .prologue
    .line 52
    return-void
.end method

.method public messageArrived(Lorg/eclipse/paho/client/mqttv3/MqttTopic;Lorg/eclipse/paho/client/mqttv3/MqttMessage;)V
    .locals 9
    .parameter "topic"
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 33
    iget-object v4, p0, Lcom/webuid/mmVideo/PushCallback;->context:Landroid/content/ContextWrapper;

    const-string v5, "notification"

    invoke-virtual {v4, v5}, Landroid/content/ContextWrapper;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 32
    check-cast v3, Landroid/app/NotificationManager;

    .line 35
    .local v3, notificationManager:Landroid/app/NotificationManager;
    new-instance v2, Landroid/app/Notification;

    const v4, 0x7f020026

    .line 36
    new-instance v5, Ljava/lang/String;

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getPayload()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 35
    invoke-direct {v2, v4, v5, v6, v7}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 39
    .local v2, notification:Landroid/app/Notification;
    iget v4, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x10

    iput v4, v2, Landroid/app/Notification;->flags:I

    .line 41
    new-instance v1, Landroid/content/Intent;

    iget-object v4, p0, Lcom/webuid/mmVideo/PushCallback;->context:Landroid/content/ContextWrapper;

    const-class v5, Lcom/webuid/mmVideo/MainActivity;

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    .local v1, intent:Landroid/content/Intent;
    iget-object v4, p0, Lcom/webuid/mmVideo/PushCallback;->context:Landroid/content/ContextWrapper;

    invoke-static {v4, v8, v1, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 43
    .local v0, activity:Landroid/app/PendingIntent;
    iget-object v4, p0, Lcom/webuid/mmVideo/PushCallback;->context:Landroid/content/ContextWrapper;

    const-string v5, "\u7f8e\u5973\u89c6\u9891\u79c0"

    new-instance v6, Ljava/lang/String;

    invoke-virtual {p2}, Lorg/eclipse/paho/client/mqttv3/MqttMessage;->getPayload()[B

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v4, v5, v6, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 45
    iget v4, v2, Landroid/app/Notification;->number:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v2, Landroid/app/Notification;->number:I

    .line 46
    invoke-virtual {v3, v8, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 47
    return-void
.end method
