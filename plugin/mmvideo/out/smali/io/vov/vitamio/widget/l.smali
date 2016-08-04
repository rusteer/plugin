.class final Lio/vov/vitamio/widget/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/vov/vitamio/widget/VideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic a:Lio/vov/vitamio/widget/VideoView;


# direct methods
.method constructor <init>(Lio/vov/vitamio/widget/VideoView;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    .line 463
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4
    .parameter
    .parameter
    .parameter "w"
    .parameter "h"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 465
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, p3}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;I)V

    .line 466
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, p4}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;I)V

    .line 467
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->k(Lio/vov/vitamio/widget/VideoView;)I

    move-result v0

    const/4 v3, 0x3

    if-ne v0, v3, :cond_3

    move v0, v1

    .line 468
    :goto_0
    iget-object v3, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v3}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;)I

    move-result v3

    if-ne v3, p3, :cond_4

    iget-object v3, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v3}, Lio/vov/vitamio/widget/VideoView;->b(Lio/vov/vitamio/widget/VideoView;)I

    move-result v3

    if-ne v3, p4, :cond_4

    .line 469
    :goto_1
    iget-object v2, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v2

    if-eqz v2, :cond_2

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 470
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->h(Lio/vov/vitamio/widget/VideoView;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    iget-object v1, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v1}, Lio/vov/vitamio/widget/VideoView;->h(Lio/vov/vitamio/widget/VideoView;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/vov/vitamio/widget/VideoView;->seekTo(J)V

    .line 472
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->start()V

    .line 473
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 474
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 475
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    .line 476
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->show()V

    .line 479
    :cond_2
    return-void

    :cond_3
    move v0, v2

    .line 467
    goto :goto_0

    :cond_4
    move v1, v2

    .line 468
    goto :goto_1
.end method

.method public final surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 482
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, p1}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;Landroid/view/SurfaceHolder;)V

    .line 483
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->s(Lio/vov/vitamio/widget/VideoView;)I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->k(Lio/vov/vitamio/widget/VideoView;)I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    .line 484
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v1}, Lio/vov/vitamio/widget/VideoView;->t(Lio/vov/vitamio/widget/VideoView;)Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 485
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->resume()V

    .line 489
    :goto_0
    return-void

    .line 487
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->u(Lio/vov/vitamio/widget/VideoView;)V

    goto :goto_0
.end method

.method public final surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter

    .prologue
    .line 492
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;Landroid/view/SurfaceHolder;)V

    .line 493
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    .line 495
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->s(Lio/vov/vitamio/widget/VideoView;)I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    .line 496
    iget-object v0, p0, Lio/vov/vitamio/widget/l;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->v(Lio/vov/vitamio/widget/VideoView;)V

    .line 497
    :cond_1
    return-void
.end method
