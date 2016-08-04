.class final Lio/vov/vitamio/widget/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/vov/vitamio/widget/MediaController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic a:Lio/vov/vitamio/widget/MediaController;


# direct methods
.method constructor <init>(Lio/vov/vitamio/widget/MediaController;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4
    .parameter
    .parameter "progress"
    .parameter "fromuser"

    .prologue
    .line 350
    if-nez p3, :cond_1

    .line 361
    :cond_0
    :goto_0
    return-void

    .line 353
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->i(Lio/vov/vitamio/widget/MediaController;)Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    move-result-object v0

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->getDuration()J

    move-result-wide v0

    .line 354
    int-to-long v2, p2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    .line 355
    invoke-static {v0, v1}, Lio/vov/a/c;->a(J)Ljava/lang/String;

    move-result-object v2

    .line 356
    iget-object v3, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v3}, Lio/vov/vitamio/widget/MediaController;->i(Lio/vov/vitamio/widget/MediaController;)Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    move-result-object v3

    invoke-interface {v3, v0, v1}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->seekTo(J)V

    .line 357
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->j(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 358
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->j(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 359
    :cond_2
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 339
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0, v2}, Lio/vov/vitamio/widget/MediaController;->a(Lio/vov/vitamio/widget/MediaController;Z)V

    .line 340
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    const v1, 0x36ee80

    invoke-virtual {v0, v1}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 341
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->f(Lio/vov/vitamio/widget/MediaController;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 342
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->g(Lio/vov/vitamio/widget/MediaController;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 343
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 345
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 347
    :cond_0
    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4
    .parameter

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 364
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 368
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    const/16 v1, 0xbb8

    invoke-virtual {v0, v1}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 369
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->f(Lio/vov/vitamio/widget/MediaController;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 370
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->g(Lio/vov/vitamio/widget/MediaController;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    .line 371
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0, v2}, Lio/vov/vitamio/widget/MediaController;->a(Lio/vov/vitamio/widget/MediaController;Z)V

    .line 372
    iget-object v0, p0, Lio/vov/vitamio/widget/c;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->f(Lio/vov/vitamio/widget/MediaController;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 373
    return-void
.end method
