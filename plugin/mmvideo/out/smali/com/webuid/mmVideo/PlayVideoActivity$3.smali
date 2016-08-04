.class Lcom/webuid/mmVideo/PlayVideoActivity$3;
.super Ljava/lang/Object;
.source "PlayVideoActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/webuid/mmVideo/PlayVideoActivity;->setup()V
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
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 4
    .parameter "mp"

    .prologue
    .line 248
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$5(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 249
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$6(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 250
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->playtime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$7(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayVideoActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->durationTime:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$8(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/webuid/mmVideo/PlayVideoActivity;->toTime(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$9(Lcom/webuid/mmVideo/PlayVideoActivity;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 254
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$6(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 255
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    #getter for: Lcom/webuid/mmVideo/PlayVideoActivity;->sound:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/webuid/mmVideo/PlayVideoActivity;->access$10(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayVideoActivity;->CurrentSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayVideoActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget-object v3, p0, Lcom/webuid/mmVideo/PlayVideoActivity$3;->this$0:Lcom/webuid/mmVideo/PlayVideoActivity;

    iget v3, v3, Lcom/webuid/mmVideo/PlayVideoActivity;->MaxSound:I

    invoke-virtual {v2, v3}, Lcom/webuid/mmVideo/PlayVideoActivity;->toFotmat(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    return-void
.end method
