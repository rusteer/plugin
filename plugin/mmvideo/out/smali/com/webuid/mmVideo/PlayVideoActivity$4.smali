.class Lcom/webuid/mmVideo/PlayVideoActivity$4;
.super Landroid/os/Handler;
.source "PlayVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayVideoActivity;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/webuid/mmVideo/PlayVideoActivity;


# direct methods
.method constructor <init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    .line 266
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x3

    .line 268
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 269
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 289
    :goto_0
    return-void

    .line 271
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    #setter for: Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$11(Lcom/webuid/mmVideo/PlayVideoActivity;I)V

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$5(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$9(Lcom/webuid/mmVideo/PlayVideoActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 275
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->playtime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$7(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I
    invoke-static {v2}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$9(Lcom/webuid/mmVideo/PlayVideoActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayVideoActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 276
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$6(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 279
    :pswitch_1
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    const-string v2, "audio"

    invoke-virtual {v0, v2}, Lcom/webuid/mmVideo/PlayVideoActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    #setter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1, v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$12(Lcom/webuid/mmVideo/PlayVideoActivity;Landroid/media/AudioManager;)V

    .line 280
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$4(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    iput v1, v0, Lcom/webuid/mmVideo/PlayVideoActivity;->MaxSound:I

    .line 281
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$4(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, v0, Lcom/webuid/mmVideo/PlayVideoActivity;->CurrentSound:I

    .line 282
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->sound:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$10(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayVideoActivity;->CurrentSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayVideoActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayVideoActivity;->MaxSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayVideoActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$4;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$6(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 269
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
