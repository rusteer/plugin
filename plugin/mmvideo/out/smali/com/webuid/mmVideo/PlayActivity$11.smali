.class Lcom/webuid/mmVideo/PlayActivity$11;
.super Ljava/lang/Object;
.source "PlayActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayActivity;->setup()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    .line 609
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 5
    .parameter "mp"

    .prologue
    const/16 v4, 0x8

    .line 613
    const-string v0, "setup"

    const-string v1, "onPrepared1"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$10(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 615
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$11(Lcom/webuid/mmVideo/PlayActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 616
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->playtime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$12(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 617
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->durationTime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$13(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 618
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$14(Lcom/webuid/mmVideo/PlayActivity;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 621
    const-string v0, "setup"

    const-string v1, "onPrepared2"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 622
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$11(Lcom/webuid/mmVideo/PlayActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 623
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->sound:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$15(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayActivity;->CurrentSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 624
    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayActivity;->MaxSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 623
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 625
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->loadBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$16(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 626
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->loadText:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$17(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 627
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->topLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->rightLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->bottomLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 628
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 629
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity$11;->this$0:Lcom/webuid/mmVideo/PlayActivity;

    #getter for: Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayActivity;->access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 631
    :cond_0
    return-void
.end method
