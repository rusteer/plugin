.class final Lio/vov/vitamio/MediaPlayer$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/vov/vitamio/MediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private a:Lio/vov/vitamio/MediaPlayer;

.field private b:Landroid/os/Bundle;

.field private synthetic c:Lio/vov/vitamio/MediaPlayer;


# direct methods
.method public constructor <init>(Lio/vov/vitamio/MediaPlayer;Lio/vov/vitamio/MediaPlayer;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 422
    iput-object p1, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    .line 420
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 421
    iput-object p2, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 426
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 479
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unknown message type "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/vov/a/b;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 480
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 428
    :sswitch_1
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnPreparedListener:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$0(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 429
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnPreparedListener:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$0(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v1}, Lio/vov/vitamio/MediaPlayer$OnPreparedListener;->onPrepared(Lio/vov/vitamio/MediaPlayer;)V

    goto :goto_0

    .line 432
    :sswitch_2
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnCompletionListener:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$1(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 433
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnCompletionListener:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$1(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v2, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v2}, Lio/vov/vitamio/MediaPlayer$OnCompletionListener;->onCompletion(Lio/vov/vitamio/MediaPlayer;)V

    .line 434
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #calls: Lio/vov/vitamio/MediaPlayer;->stayAwake(Z)V
    invoke-static {v0, v1}, Lio/vov/vitamio/MediaPlayer;->access$2(Lio/vov/vitamio/MediaPlayer;Z)V

    goto :goto_0

    .line 437
    :sswitch_3
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnBufferingUpdateListener:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$3(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnBufferingUpdateListener:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$3(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v1, v2}, Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;->onBufferingUpdate(Lio/vov/vitamio/MediaPlayer;I)V

    goto :goto_0

    .line 441
    :sswitch_4
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 442
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #calls: Lio/vov/vitamio/MediaPlayer;->stayAwake(Z)V
    invoke-static {v0, v4}, Lio/vov/vitamio/MediaPlayer;->access$2(Lio/vov/vitamio/MediaPlayer;Z)V

    .line 443
    :cond_2
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSeekCompleteListener:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$4(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 444
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSeekCompleteListener:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$4(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v1}, Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;->onSeekComplete(Lio/vov/vitamio/MediaPlayer;)V

    goto :goto_0

    .line 447
    :sswitch_5
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnVideoSizeChangedListener:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$5(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 448
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnVideoSizeChangedListener:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$5(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2, v3}, Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;->onVideoSizeChanged(Lio/vov/vitamio/MediaPlayer;II)V

    goto :goto_0

    .line 451
    :sswitch_6
    const-string v0, "Error (%d, %d)"

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Lio/vov/a/b;->c(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 453
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnErrorListener:Lio/vov/vitamio/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$6(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 454
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnErrorListener:Lio/vov/vitamio/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$6(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v2, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    iget v3, p1, Landroid/os/Message;->arg1:I

    iget v4, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v2, v3, v4}, Lio/vov/vitamio/MediaPlayer$OnErrorListener;->onError(Lio/vov/vitamio/MediaPlayer;II)Z

    move-result v0

    .line 455
    :goto_1
    iget-object v2, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnCompletionListener:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
    invoke-static {v2}, Lio/vov/vitamio/MediaPlayer;->access$1(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v2

    if-eqz v2, :cond_3

    if-nez v0, :cond_3

    .line 456
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnCompletionListener:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$1(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v2, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v2}, Lio/vov/vitamio/MediaPlayer$OnCompletionListener;->onCompletion(Lio/vov/vitamio/MediaPlayer;)V

    .line 457
    :cond_3
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #calls: Lio/vov/vitamio/MediaPlayer;->stayAwake(Z)V
    invoke-static {v0, v1}, Lio/vov/vitamio/MediaPlayer;->access$2(Lio/vov/vitamio/MediaPlayer;Z)V

    goto/16 :goto_0

    .line 460
    :sswitch_7
    const-string v0, "Info (%d, %d)"

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v4

    invoke-static {v0, v2}, Lio/vov/a/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 461
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnInfoListener:Lio/vov/vitamio/MediaPlayer$OnInfoListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$7(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 462
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnInfoListener:Lio/vov/vitamio/MediaPlayer$OnInfoListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$7(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->a:Lio/vov/vitamio/MediaPlayer;

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2, v3}, Lio/vov/vitamio/MediaPlayer$OnInfoListener;->onInfo(Lio/vov/vitamio/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 465
    :sswitch_8
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    .line 466
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    const-string v2, "sub_type"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 467
    const-string v0, "Subtitle : %s"

    new-array v2, v4, [Ljava/lang/Object;

    iget-object v3, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    const-string v4, "sub_string"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Lio/vov/a/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 468
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSubtitleUpdateListener:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$8(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 469
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSubtitleUpdateListener:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$8(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    const-string v2, "sub_string"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;->onSubtitleUpdate(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 470
    :cond_4
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    const-string v2, "sub_type"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v4, :cond_0

    .line 471
    const-string v0, "Subtitle : bitmap"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/vov/a/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 472
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSubtitleUpdateListener:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$8(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 473
    iget-object v0, p0, Lio/vov/vitamio/MediaPlayer$a;->c:Lio/vov/vitamio/MediaPlayer;

    #getter for: Lio/vov/vitamio/MediaPlayer;->mOnSubtitleUpdateListener:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;
    invoke-static {v0}, Lio/vov/vitamio/MediaPlayer;->access$8(Lio/vov/vitamio/MediaPlayer;)Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/MediaPlayer$a;->b:Landroid/os/Bundle;

    const-string v2, "sub_bytes"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2, v3}, Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;->onSubtitleUpdate([BII)V

    goto/16 :goto_0

    :cond_5
    move v0, v1

    goto/16 :goto_1

    .line 426
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x64 -> :sswitch_6
        0xc8 -> :sswitch_7
        0x3e8 -> :sswitch_8
    .end sparse-switch
.end method
