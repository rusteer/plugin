.class final Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/PlayActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ButtonClickListener"
.end annotation


# instance fields
.field private pause:Z

.field final synthetic this$0:Lcom/webuid/mmVideo/PlayActivity;


# direct methods
.method private constructor <init>(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 409
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/webuid/mmVideo/PlayActivity;Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 409
    invoke-direct {p0, p1}, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 413
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const v2, 0x7f060049

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 415
    .local v0, playbutton:Landroid/widget/ImageButton;
    const-string v1, "View v"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 478
    :cond_0
    :goto_0
    return-void

    .line 418
    :pswitch_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$0(Lcom/webuid/mmVideo/PlayActivity;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 421
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 422
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->pause()V

    .line 423
    iput-boolean v4, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    .line 424
    const v1, 0x7f020017

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    goto :goto_0

    .line 426
    :cond_1
    iget-boolean v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    if-eqz v1, :cond_0

    .line 427
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 428
    iput-boolean v3, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    .line 429
    const v1, 0x7f020016

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    goto :goto_0

    .line 443
    :pswitch_1
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 444
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->pause()V

    .line 445
    iput-boolean v4, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    goto :goto_0

    .line 447
    :cond_2
    iget-boolean v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    if-eqz v1, :cond_0

    .line 448
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 449
    iput-boolean v3, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->pause:Z

    goto :goto_0

    .line 455
    :pswitch_2
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 456
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto :goto_0

    .line 461
    :cond_3
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #calls: Lcom/webuid/mmVideo/PlayActivity;->play()V
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$2(Lcom/webuid/mmVideo/PlayActivity;)V

    goto/16 :goto_0

    .line 466
    :pswitch_3
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 467
    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 469
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 470
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 471
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    const/4 v2, 0x0

    #setter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->access$4(Lcom/webuid/mmVideo/PlayActivity;Landroid/media/MediaPlayer;)V

    goto/16 :goto_0

    .line 416
    :pswitch_data_0
    .packed-switch 0x7f060048
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
