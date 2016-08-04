.class public Lcom/webuid/mmVideo/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/MainActivity$GetDataTask;
    }
.end annotation


# static fields
.field public static final SERVICE_CLASSNAME:Ljava/lang/String; = "com.webuid.mmVideo.MmVideoService"


# instance fields
.field private mDeviceID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/MainActivity;)Z
    .locals 1
    .parameter

    .prologue
    .line 117
    invoke-direct {p0}, Lcom/webuid/mmVideo/MainActivity;->serviceIsRunning()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/MainActivity;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/webuid/mmVideo/MainActivity;->startBlackIceService()V

    return-void
.end method

.method private serviceIsRunning()Z
    .locals 5

    .prologue
    .line 118
    const-string v2, "activity"

    invoke-virtual {p0, v2}, Lcom/webuid/mmVideo/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 119
    .local v0, manager:Landroid/app/ActivityManager;
    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 124
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 119
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 120
    .local v1, service:Landroid/app/ActivityManager$RunningServiceInfo;
    const-string v3, "com.webuid.mmVideo.MmVideoService"

    iget-object v4, v1, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 121
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private startBlackIceService()V
    .locals 3

    .prologue
    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MM/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/webuid/mmVideo/MmVideoService;->TOPIC:Ljava/lang/String;

    .line 105
    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    sput-object v1, Lcom/webuid/mmVideo/MmVideoService;->clientId:Ljava/lang/String;

    .line 106
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/MmVideoService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 107
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 109
    return-void
.end method

.method private stopBlackIceService()V
    .locals 2

    .prologue
    .line 113
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/MmVideoService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 114
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/MainActivity;->stopService(Landroid/content/Intent;)Z

    .line 115
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/16 v5, 0x400

    .line 38
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    const v4, 0x7f03001e

    invoke-virtual {p0, v4}, Lcom/webuid/mmVideo/MainActivity;->setContentView(I)V

    .line 40
    invoke-virtual {p0}, Lcom/webuid/mmVideo/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 43
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v4

    const-string v5, "device_token"

    invoke-virtual {v4, v5}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 44
    .local v0, duid:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 45
    iput-object v0, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    .line 65
    :goto_0
    invoke-direct {p0}, Lcom/webuid/mmVideo/MainActivity;->serviceIsRunning()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 66
    const-string v4, "-ser1"

    iget-object v5, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :goto_1
    new-instance v3, Ljava/util/Timer;

    invoke-direct {v3}, Ljava/util/Timer;-><init>()V

    .line 74
    .local v3, timer:Ljava/util/Timer;
    new-instance v2, Lcom/webuid/mmVideo/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/MainActivity$1;-><init>(Lcom/webuid/mmVideo/MainActivity;)V

    .line 83
    .local v2, task:Ljava/util/TimerTask;
    const-wide/16 v4, 0x7d0

    invoke-virtual {v3, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 84
    return-void

    .line 47
    .end local v2           #task:Ljava/util/TimerTask;
    .end local v3           #timer:Ljava/util/Timer;
    :cond_0
    new-instance v1, Lcom/webuid/mmVideo/DeviceUuidFactory;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/DeviceUuidFactory;-><init>(Landroid/content/Context;)V

    .line 48
    .local v1, dviceU:Lcom/webuid/mmVideo/DeviceUuidFactory;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v4

    invoke-virtual {v1}, Lcom/webuid/mmVideo/DeviceUuidFactory;->getDeviceUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    goto :goto_0

    .line 68
    .end local v1           #dviceU:Lcom/webuid/mmVideo/DeviceUuidFactory;
    :cond_1
    const-string v4, "-ser2"

    iget-object v5, p0, Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-direct {p0}, Lcom/webuid/mmVideo/MainActivity;->startBlackIceService()V

    goto :goto_1
.end method
