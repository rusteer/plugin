.class Lcom/webuid/mmVideo/ShareActivity$3;
.super Ljava/lang/Object;
.source "ShareActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/ShareActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/ShareActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/ShareActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/ShareActivity$3;->this$0:Lcom/webuid/mmVideo/ShareActivity;

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 106
    iget-object v0, p0, Lcom/webuid/mmVideo/ShareActivity$3;->this$0:Lcom/webuid/mmVideo/ShareActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/ShareActivity;->finish()V

    .line 107
    return-void
.end method
