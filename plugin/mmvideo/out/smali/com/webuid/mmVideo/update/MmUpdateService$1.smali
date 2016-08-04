.class Lcom/webuid/mmVideo/update/MmUpdateService$1;
.super Landroid/os/Handler;
.source "MmUpdateService.java"


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


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/update/MmUpdateService;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    .line 75
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    .line 78
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 97
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->updateIntent:Landroid/content/Intent;
    invoke-static {v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$6(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->stopService(Landroid/content/Intent;)Z

    .line 100
    :goto_0
    return-void

    .line 81
    :pswitch_0
    sget-object v2, Lcom/webuid/mmVideo/update/FileUtil;->updateFile:Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 82
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 84
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "application/vnd.android.package-archive"

    .line 83
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    .line 86
    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    .line 85
    invoke-static {v3, v4, v0, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    #setter for: Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;
    invoke-static {v2, v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$0(Lcom/webuid/mmVideo/update/MmUpdateService;Landroid/app/PendingIntent;)V

    .line 87
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;
    invoke-static {v2}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$1(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/Notification;

    move-result-object v2

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    .line 88
    iget-object v4, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;
    invoke-static {v4}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$2(Lcom/webuid/mmVideo/update/MmUpdateService;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4e0b\u8f7d\u6210\u529f\uff0c\u70b9\u51fb\u5b89\u88c5"

    iget-object v6, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;
    invoke-static {v6}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$3(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/PendingIntent;

    move-result-object v6

    .line 87
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 89
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$4(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/NotificationManager;

    move-result-object v2

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->notification_id:I
    invoke-static {v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$5(Lcom/webuid/mmVideo/update/MmUpdateService;)I

    move-result v3

    iget-object v4, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;
    invoke-static {v4}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$1(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 90
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->updateIntent:Landroid/content/Intent;
    invoke-static {v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$6(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/update/MmUpdateService;->stopService(Landroid/content/Intent;)Z

    goto :goto_0

    .line 93
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #uri:Landroid/net/Uri;
    :pswitch_1
    iget-object v2, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->notification:Landroid/app/Notification;
    invoke-static {v2}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$1(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/Notification;

    move-result-object v2

    iget-object v3, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    .line 94
    iget-object v4, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->app_name:Ljava/lang/String;
    invoke-static {v4}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$2(Lcom/webuid/mmVideo/update/MmUpdateService;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\u4e0b\u8f7d\u5931\u8d25"

    iget-object v6, p0, Lcom/webuid/mmVideo/update/MmUpdateService$1;->this$0:Lcom/webuid/mmVideo/update/MmUpdateService;

    #getter for: Lcom/webuid/mmVideo/update/MmUpdateService;->pendingIntent:Landroid/app/PendingIntent;
    invoke-static {v6}, Lcom/webuid/mmVideo/update/MmUpdateService;->access$3(Lcom/webuid/mmVideo/update/MmUpdateService;)Landroid/app/PendingIntent;

    move-result-object v6

    .line 93
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    goto :goto_0

    .line 78
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
