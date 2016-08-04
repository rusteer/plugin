.class Lcom/webuid/mmVideo/PlayActivity$7;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$7;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sendMessage(I)V
    .locals 2
    .parameter "what"

    .prologue
    .line 241
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 242
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 243
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$7;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, v1, Lcom/webuid/mmVideo/PlayActivity;->mHandlerClick2:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 244
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/webuid/mmVideo/PlayActivity$7;->sendMessage(I)V

    .line 239
    return-void
.end method
