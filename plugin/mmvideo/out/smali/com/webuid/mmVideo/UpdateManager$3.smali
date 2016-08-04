.class Lcom/webuid/mmVideo/UpdateManager$3;
.super Ljava/lang/Object;
.source "UpdateManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateManager;->showNoticeDialog()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateManager$3;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 89
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 90
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateManager$3;->this$0:Lcom/webuid/mmVideo/UpdateManager;

    #calls: Lcom/webuid/mmVideo/UpdateManager;->showDownloadDialog()V
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateManager;->access$8(Lcom/webuid/mmVideo/UpdateManager;)V

    .line 91
    return-void
.end method
