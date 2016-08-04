.class Lcom/webuid/mmVideo/SoftListActivity$8;
.super Ljava/lang/Object;
.source "SoftListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/webuid/mmVideo/SoftListActivity$8;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 151
    iget-object v0, p0, Lcom/webuid/mmVideo/SoftListActivity$8;->this$0:Lcom/webuid/mmVideo/SoftListActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/SoftListActivity;->finish()V

    .line 152
    return-void
.end method
