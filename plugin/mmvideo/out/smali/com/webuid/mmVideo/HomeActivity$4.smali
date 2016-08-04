.class Lcom/webuid/mmVideo/HomeActivity$4;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/HomeActivity;->checkVersion()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/HomeActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/HomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/HomeActivity$4;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 199
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity$4;->this$0:Lcom/webuid/mmVideo/HomeActivity;

    #calls: Lcom/webuid/mmVideo/HomeActivity;->startUpdateService()V
    invoke-static {v0}, Lcom/webuid/mmVideo/HomeActivity;->access$1(Lcom/webuid/mmVideo/HomeActivity;)V

    .line 200
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 201
    return-void
.end method
