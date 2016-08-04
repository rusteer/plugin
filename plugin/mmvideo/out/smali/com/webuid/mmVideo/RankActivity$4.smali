.class Lcom/webuid/mmVideo/RankActivity$4;
.super Ljava/lang/Object;
.source "RankActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/RankActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RankActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RankActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RankActivity$4;->this$0:Lcom/webuid/mmVideo/RankActivity;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 89
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$4;->this$0:Lcom/webuid/mmVideo/RankActivity;

    #calls: Lcom/webuid/mmVideo/RankActivity;->setMainView()V
    invoke-static {v0}, Lcom/webuid/mmVideo/RankActivity;->access$5(Lcom/webuid/mmVideo/RankActivity;)V

    .line 90
    iget-object v0, p0, Lcom/webuid/mmVideo/RankActivity$4;->this$0:Lcom/webuid/mmVideo/RankActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RankActivity;->getListFromCache()V

    .line 91
    return-void
.end method
