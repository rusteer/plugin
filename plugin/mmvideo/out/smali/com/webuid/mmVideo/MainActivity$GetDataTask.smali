.class Lcom/webuid/mmVideo/MainActivity$GetDataTask;
.super Landroid/os/AsyncTask;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetDataTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/MainActivity;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 86
    iput-object p1, p0, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/MainActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->doInBackground([Ljava/lang/Void;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)[Ljava/lang/String;
    .locals 1
    .parameter "params"

    .prologue
    .line 89
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->onPostExecute([Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute([Ljava/lang/String;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 94
    iget-object v0, p0, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/MainActivity;

    #calls: Lcom/webuid/mmVideo/MainActivity;->serviceIsRunning()Z
    invoke-static {v0}, Lcom/webuid/mmVideo/MainActivity;->access$0(Lcom/webuid/mmVideo/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    const-string v0, "-ser1"

    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/MainActivity;

    #getter for: Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;
    invoke-static {v1}, Lcom/webuid/mmVideo/MainActivity;->access$1(Lcom/webuid/mmVideo/MainActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :goto_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 101
    return-void

    .line 97
    :cond_0
    const-string v0, "-ser2"

    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/MainActivity;

    #getter for: Lcom/webuid/mmVideo/MainActivity;->mDeviceID:Ljava/lang/String;
    invoke-static {v1}, Lcom/webuid/mmVideo/MainActivity;->access$1(Lcom/webuid/mmVideo/MainActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v0, p0, Lcom/webuid/mmVideo/MainActivity$GetDataTask;->this$0:Lcom/webuid/mmVideo/MainActivity;

    #calls: Lcom/webuid/mmVideo/MainActivity;->startBlackIceService()V
    invoke-static {v0}, Lcom/webuid/mmVideo/MainActivity;->access$2(Lcom/webuid/mmVideo/MainActivity;)V

    goto :goto_0
.end method
