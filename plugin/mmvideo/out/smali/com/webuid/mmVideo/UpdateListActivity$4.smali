.class Lcom/webuid/mmVideo/UpdateListActivity$4;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/UpdateListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/UpdateListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/UpdateListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$4;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$4;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    #calls: Lcom/webuid/mmVideo/UpdateListActivity;->setMainView()V
    invoke-static {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->access$5(Lcom/webuid/mmVideo/UpdateListActivity;)V

    .line 114
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$4;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->getListFromCache()V

    .line 115
    return-void
.end method
