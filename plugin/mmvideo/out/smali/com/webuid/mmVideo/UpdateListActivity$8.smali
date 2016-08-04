.class Lcom/webuid/mmVideo/UpdateListActivity$8;
.super Ljava/lang/Object;
.source "UpdateListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/webuid/mmVideo/UpdateListActivity$8;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/webuid/mmVideo/UpdateListActivity$8;->this$0:Lcom/webuid/mmVideo/UpdateListActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/UpdateListActivity;->finish()V

    .line 157
    return-void
.end method
