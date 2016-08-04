.class Lcom/webuid/mmVideo/UpdateManager$5;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateManager;->showDownloadDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateManager;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateManager;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateManager$5;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 124
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 125
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager$5;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    const/4 v1, 0x1

    #setter for: Lcom/webuid/mmVideo/UpdateManager;->interceptFlag:Z
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/UpdateManager;->access$9(Lcom/webuid/mmVideo/UpdateManager;Z)V

    .line 126
    return-void
.end method
