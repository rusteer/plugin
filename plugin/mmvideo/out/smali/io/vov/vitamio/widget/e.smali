.class final Lio/vov/vitamio/widget/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/vov/vitamio/MediaPlayer$OnPreparedListener;


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
    iput-object p1, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPrepared(Lio/vov/vitamio/MediaPlayer;)V
    .locals 9
    .parameter "mp"

    .prologue
    const/4 v8, 0x0

    const-wide/16 v6, 0x0

    const/4 v5, 0x3

    .line 298
    const-string v0, "onPrepared"

    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 299
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lio/vov/vitamio/widget/VideoView;->c(Lio/vov/vitamio/widget/VideoView;I)V

    .line 300
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, v5}, Lio/vov/vitamio/widget/VideoView;->d(Lio/vov/vitamio/widget/VideoView;I)V

    .line 316
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->e(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->e(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v1}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/vov/vitamio/MediaPlayer$OnPreparedListener;->onPrepared(Lio/vov/vitamio/MediaPlayer;)V

    .line 318
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 319
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lio/vov/vitamio/widget/MediaController;->setEnabled(Z)V

    .line 320
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {p1}, Lio/vov/vitamio/MediaPlayer;->getVideoWidth()I

    move-result v1

    invoke-static {v0, v1}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;I)V

    .line 321
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {p1}, Lio/vov/vitamio/MediaPlayer;->getVideoHeight()I

    move-result v1

    invoke-static {v0, v1}, Lio/vov/vitamio/widget/VideoView;->b(Lio/vov/vitamio/widget/VideoView;I)V

    .line 322
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {p1}, Lio/vov/vitamio/MediaPlayer;->getVideoAspectRatio()F

    move-result v1

    invoke-static {v0, v1}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;F)V

    .line 324
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->h(Lio/vov/vitamio/widget/VideoView;)J

    move-result-wide v0

    .line 326
    cmp-long v2, v0, v6

    if-eqz v2, :cond_2

    .line 327
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v2, v0, v1}, Lio/vov/vitamio/widget/VideoView;->seekTo(J)V

    .line 328
    :cond_2
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;)I

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->b(Lio/vov/vitamio/widget/VideoView;)I

    move-result v2

    if-eqz v2, :cond_6

    .line 329
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    iget-object v3, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v3}, Lio/vov/vitamio/widget/VideoView;->c(Lio/vov/vitamio/widget/VideoView;)I

    move-result v3

    iget-object v4, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v4}, Lio/vov/vitamio/widget/VideoView;->d(Lio/vov/vitamio/widget/VideoView;)F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lio/vov/vitamio/widget/VideoView;->setVideoLayout(IF)V

    .line 330
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->i(Lio/vov/vitamio/widget/VideoView;)I

    move-result v2

    iget-object v3, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v3}, Lio/vov/vitamio/widget/VideoView;->a(Lio/vov/vitamio/widget/VideoView;)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->j(Lio/vov/vitamio/widget/VideoView;)I

    move-result v2

    iget-object v3, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v3}, Lio/vov/vitamio/widget/VideoView;->b(Lio/vov/vitamio/widget/VideoView;)I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 331
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->k(Lio/vov/vitamio/widget/VideoView;)I

    move-result v2

    if-ne v2, v5, :cond_4

    .line 332
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->start()V

    .line 333
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 334
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->show()V

    .line 343
    :cond_3
    :goto_0
    return-void

    .line 335
    :cond_4
    iget-object v2, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v2}, Lio/vov/vitamio/widget/VideoView;->isPlaying()Z

    move-result v2

    if-nez v2, :cond_3

    cmp-long v0, v0, v6

    if-nez v0, :cond_5

    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->getCurrentPosition()J

    move-result-wide v0

    cmp-long v0, v0, v6

    if-lez v0, :cond_3

    .line 336
    :cond_5
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 337
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0, v8}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    goto :goto_0

    .line 340
    :cond_6
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->k(Lio/vov/vitamio/widget/VideoView;)I

    move-result v0

    if-ne v0, v5, :cond_3

    .line 341
    iget-object v0, p0, Lio/vov/vitamio/widget/e;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->start()V

    goto :goto_0
.end method
