.class Lcom/webuid/mmVideo/RecommendActivity$4;
.super Ljava/lang/Object;
.source "RecommendActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/RecommendActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/RecommendActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/RecommendActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/RecommendActivity$4;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "arg0"

    .prologue
    .line 115
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$4;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    #calls: Lcom/webuid/mmVideo/RecommendActivity;->setMainView()V
    invoke-static {v0}, Lcom/webuid/mmVideo/RecommendActivity;->access$7(Lcom/webuid/mmVideo/RecommendActivity;)V

    .line 116
    iget-object v0, p0, Lcom/webuid/mmVideo/RecommendActivity$4;->this$0:Lcom/webuid/mmVideo/RecommendActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/RecommendActivity;->getListFromCache()V

    .line 117
    return-void
.end method
