.class public Lcom/webuid/mmVideo/UpdateManager;
.super Ljava/lang/Object;
.source "UpdateManager.java"


# static fields
.field private static final DOWN_OVER:I = 0x2

.field private static final DOWN_UPDATE:I = 0x1

.field private static final saveFileName:Ljava/lang/String; = "UpdateRelease.apk"

.field private static final savePath:Ljava/lang/String; = "data/mmvideo"


# instance fields
.field private ServerVerCode:I

.field private apkUrl:Ljava/lang/String;

.field private downLoadThread:Ljava/lang/Thread;

.field private downloadDialog:Landroid/app/Dialog;

.field private interceptFlag:Z

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mdownApkRunnable:Ljava/lang/Runnable;

.field private noticeDialog:Landroid/app/Dialog;

.field private progress:I

.field private serverVerName:Ljava/lang/String;

.field private updateMsg:Ljava/lang/String;

.field private versionCode:I

.field private versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "sVerCode"
    .parameter "sVerName"
    .parameter "sVerSource"

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, "\u6709\u6700\u65b0\u7684\u8f6f\u4ef6\u5305\u54e6,\u4eb2\u5feb\u4e0b\u8f7d\u5427~"

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->updateMsg:Ljava/lang/String;

    .line 32
    const-string v0, "-"

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->apkUrl:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/webuid/mmVideo/UpdateManager;->interceptFlag:Z

    .line 50
    new-instance v0, Lcom/webuid/mmVideo/UpdateManager$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/UpdateManager$1;-><init>(Lcom/webuid/mmVideo/UpdateManager;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->mHandler:Landroid/os/Handler;

    .line 133
    new-instance v0, Lcom/webuid/mmVideo/UpdateManager$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/UpdateManager$2;-><init>(Lcom/webuid/mmVideo/UpdateManager;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->mdownApkRunnable:Ljava/lang/Runnable;

    .line 66
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    .line 67
    iput p2, p0, Lcom/webuid/mmVideo/UpdateManager;->ServerVerCode:I

    .line 68
    iput-object p3, p0, Lcom/webuid/mmVideo/UpdateManager;->serverVerName:Ljava/lang/String;

    .line 69
    iput-object p4, p0, Lcom/webuid/mmVideo/UpdateManager;->apkUrl:Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lcom/webuid/mmVideo/UpdateManager;->getCurrentVersion()V

    .line 71
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/UpdateManager;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter

    .prologue
    .line 39
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/UpdateManager;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/webuid/mmVideo/UpdateManager;->progress:I

    return v0
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/UpdateManager;)V
    .locals 0
    .parameter

    .prologue
    .line 202
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateManager;->installApk()V

    return-void
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/UpdateManager;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->apkUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/UpdateManager;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 28
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/UpdateManager;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    iput p1, p0, Lcom/webuid/mmVideo/UpdateManager;->progress:I

    return-void
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/UpdateManager;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 50
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/webuid/mmVideo/UpdateManager;)Z
    .locals 1
    .parameter

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/webuid/mmVideo/UpdateManager;->interceptFlag:Z

    return v0
.end method

.method static synthetic access$8(Lcom/webuid/mmVideo/UpdateManager;)V
    .locals 0
    .parameter

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateManager;->showDownloadDialog()V

    return-void
.end method

.method static synthetic access$9(Lcom/webuid/mmVideo/UpdateManager;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/webuid/mmVideo/UpdateManager;->interceptFlag:Z

    return-void
.end method

.method private downloadApk()V
    .locals 2

    .prologue
    .line 193
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->mdownApkRunnable:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->downLoadThread:Ljava/lang/Thread;

    .line 194
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->downLoadThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 195
    return-void
.end method

.method private installApk()V
    .locals 7

    .prologue
    .line 204
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v4

    .line 205
    .local v4, sdState:Ljava/lang/String;
    const-string v5, "mounted"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 206
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 207
    .local v3, sdDir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v5, "data/mmvideo"

    invoke-direct {v1, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 211
    .end local v3           #sdDir:Ljava/io/File;
    .local v1, cacheDir:Ljava/io/File;
    :goto_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 212
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 214
    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v5, "UpdateRelease.apk"

    invoke-direct {v0, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 215
    .local v0, ApkFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 221
    :goto_1
    return-void

    .line 209
    .end local v0           #ApkFile:Ljava/io/File;
    .end local v1           #cacheDir:Ljava/io/File;
    :cond_1
    iget-object v5, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    .restart local v1       #cacheDir:Ljava/io/File;
    goto :goto_0

    .line 218
    .restart local v0       #ApkFile:Ljava/io/File;
    :cond_2
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 219
    .local v2, i:Landroid/content/Intent;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "file://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const-string v6, "application/vnd.android.package-archive"

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 220
    iget-object v5, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method private showDownloadDialog()V
    .locals 5

    .prologue
    .line 115
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 116
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const-string v3, "\u8f6f\u4ef6\u7248\u672c\u66f4\u65b0"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 117
    iget-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 118
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v3, 0x7f030023

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 119
    .local v2, v:Landroid/view/View;
    const v3, 0x7f060056

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->mProgress:Landroid/widget/ProgressBar;

    .line 120
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 121
    const-string v3, "\u53d6\u6d88"

    new-instance v4, Lcom/webuid/mmVideo/UpdateManager$5;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/UpdateManager$5;-><init>(Lcom/webuid/mmVideo/UpdateManager;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 128
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->downloadDialog:Landroid/app/Dialog;

    .line 129
    iget-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->downloadDialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->show()V

    .line 130
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateManager;->downloadApk()V

    .line 131
    return-void
.end method

.method private showNoticeDialog()V
    .locals 3

    .prologue
    .line 83
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 84
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const-string v1, "\u8f6f\u4ef6\u66f4\u65b0"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 85
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->updateMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 86
    const-string v1, "\u66f4\u65b0"

    new-instance v2, Lcom/webuid/mmVideo/UpdateManager$3;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/UpdateManager$3;-><init>(Lcom/webuid/mmVideo/UpdateManager;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 93
    const-string v1, "\u6682\u4e0d\u66f4\u65b0"

    new-instance v2, Lcom/webuid/mmVideo/UpdateManager$4;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/UpdateManager$4;-><init>(Lcom/webuid/mmVideo/UpdateManager;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 99
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->noticeDialog:Landroid/app/Dialog;

    .line 100
    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->noticeDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 101
    return-void
.end method


# virtual methods
.method public checkUpdateInfo()V
    .locals 3

    .prologue
    .line 75
    const-string v0, "update"

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/UpdateManager;->serverVerName:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/webuid/mmVideo/UpdateManager;->versionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget v0, p0, Lcom/webuid/mmVideo/UpdateManager;->ServerVerCode:I

    iget v1, p0, Lcom/webuid/mmVideo/UpdateManager;->versionCode:I

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/webuid/mmVideo/UpdateManager;->versionCode:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->apkUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u5f53\u524d\u7248\u672c:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\u68c0\u6d4b\u5230\u65b0\u7248\u672c:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/UpdateManager;->serverVerName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\u8bf7\u5c3d\u5feb\u66f4\u65b0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/UpdateManager;->updateMsg:Ljava/lang/String;

    .line 78
    invoke-direct {p0}, Lcom/webuid/mmVideo/UpdateManager;->showNoticeDialog()V

    .line 80
    :cond_0
    return-void
.end method

.method public getCurrentVersion()V
    .locals 5

    .prologue
    .line 105
    :try_start_0
    iget-object v2, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 106
    iget-object v3, p0, Lcom/webuid/mmVideo/UpdateManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    .line 105
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 107
    .local v1, info:Landroid/content/pm/PackageInfo;
    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    iput v2, p0, Lcom/webuid/mmVideo/UpdateManager;->versionCode:I

    .line 108
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v2, p0, Lcom/webuid/mmVideo/UpdateManager;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .end local v1           #info:Landroid/content/pm/PackageInfo;
    :goto_0
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method
