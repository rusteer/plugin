.class public Lcom/webuid/mmVideo/update/MyApplication;
.super Landroid/app/Application;
.source "MyApplication.java"


# static fields
.field public static downloadDir:Ljava/lang/String;

.field public static localVersion:I

.field public static serverVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput v0, Lcom/webuid/mmVideo/update/MyApplication;->localVersion:I

    .line 20
    const/4 v0, 0x2

    sput v0, Lcom/webuid/mmVideo/update/MyApplication;->serverVersion:I

    .line 22
    const-string v0, "jj/"

    sput-object v0, Lcom/webuid/mmVideo/update/MyApplication;->downloadDir:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 5

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 28
    :try_start_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/update/MyApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/webuid/mmVideo/update/MyApplication;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 30
    .local v1, packageInfo:Landroid/content/pm/PackageInfo;
    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    sput v2, Lcom/webuid/mmVideo/update/MyApplication;->localVersion:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .end local v1           #packageInfo:Landroid/content/pm/PackageInfo;
    :goto_0
    return-void

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method
