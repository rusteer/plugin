.class Lcom/webuid/mmVideo/PlayActivity$12;
.super Landroid/os/Handler;
.source "PlayActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->init()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 641
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x3

    .line 643
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 644
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 666
    :goto_0
    return-void

    .line 646
    :pswitch_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 647
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I
    invoke-static {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->access$18(Lcom/webuid/mmVideo/PlayActivity;I)V

    .line 649
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$10(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$14(Lcom/webuid/mmVideo/PlayActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 650
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->playtime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$12(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I
    invoke-static {v2}, Lcom/webuid/mmVideo/PlayActivity;->access$14(Lcom/webuid/mmVideo/PlayActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 651
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$11(Lcom/webuid/mmVideo/PlayActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 654
    :pswitch_1
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const-string v2, "audio"

    invoke-virtual {v0, v2}, Lcom/webuid/mmVideo/PlayActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1, v0}, Lcom/webuid/mmVideo/PlayActivity;->access$19(Lcom/webuid/mmVideo/PlayActivity;Landroid/media/AudioManager;)V

    .line 655
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$8(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    iput v1, v0, Lcom/webuid/mmVideo/PlayActivity;->MaxSound:I

    .line 656
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$8(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, v0, Lcom/webuid/mmVideo/PlayActivity;->CurrentSound:I

    .line 658
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$7(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v1, v1, Lcom/webuid/mmVideo/PlayActivity;->CurrentSound:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 659
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$7(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v1, v1, Lcom/webuid/mmVideo/PlayActivity;->MaxSound:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 660
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->sound:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$15(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayActivity;->CurrentSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayActivity;->MaxSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 661
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$12;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$11(Lcom/webuid/mmVideo/PlayActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 644
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
