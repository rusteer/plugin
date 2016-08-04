.class Lcom/webuid/mmVideo/MainActivity$1;
.super Ljava/util/TimerTask;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/MainActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/MainActivity$1;->this$0:Lcom/webuid/mmVideo/MainActivity;

    .line 74
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 77
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$1;->this$0:Lcom/webuid/mmVideo/MainActivity;

    const-class v2, Lcom/webuid/mmVideo/HomeActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 78
    .local v0, it:Landroid/content/Intent;
    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$1;->this$0:Lcom/webuid/mmVideo/MainActivity;

    invoke-virtual {v1, v0}, Lcom/webuid/mmVideo/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 79
    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$1;->this$0:Lcom/webuid/mmVideo/MainActivity;

    const/high16 v2, 0x7f04

    const v3, 0x7f040001

    invoke-virtual {v1, v2, v3}, Lcom/webuid/mmVideo/MainActivity;->overridePendingTransition(II)V

    .line 80
    iget-object v1, p0, Lcom/webuid/mmVideo/MainActivity$1;->this$0:Lcom/webuid/mmVideo/MainActivity;

    invoke-virtual {v1}, Lcom/webuid/mmVideo/MainActivity;->finish()V

    .line 81
    return-void
.end method
