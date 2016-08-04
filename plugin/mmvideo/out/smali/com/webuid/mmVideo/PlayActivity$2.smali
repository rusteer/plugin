.class Lcom/webuid/mmVideo/PlayActivity$2;
.super Landroid/os/Handler;
.source "PlayActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayActivity;
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$2;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 343
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 346
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 359
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 360
    return-void

    .line 350
    :pswitch_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$2;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const v2, 0x7f060049

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 352
    .local v0, playbutton:Landroid/widget/ImageButton;
    const v1, 0x7f020016

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 353
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$2;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #calls: Lcom/webuid/mmVideo/PlayActivity;->play()V
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$2(Lcom/webuid/mmVideo/PlayActivity;)V

    goto :goto_0

    .line 346
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
