.class Lcom/webuid/mmVideo/SoftListActivity$4;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/SoftListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/SoftListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/SoftListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$4;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 110
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$4;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    #calls: Lcom/webuid/mmVideo/SoftListActivity;->setMainView()V
    invoke-static {v0}, Lcom/webuid/mmVideo/SoftListActivity;->access$5(Lcom/webuid/mmVideo/SoftListActivity;)V

    .line 111
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$4;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/SoftListActivity;->getListFromCache()V

    .line 112
    return-void
.end method
