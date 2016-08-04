.class Lcom/webuid/mmVideo/FavListActivity$2;
.super Ljava/lang/Object;
.source "FavListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/FavListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/FavListActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/FavListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/FavListActivity$2;->this$0:Lcom/webuid/mmVideo/FavListActivity;

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 96
    iget-object v0, p0, Lcom/webuid/mmVideo/FavListActivity$2;->this$0:Lcom/webuid/mmVideo/FavListActivity;

    invoke-virtual {v0}, Lcom/webuid/mmVideo/FavListActivity;->finish()V

    .line 97
    return-void
.end method
