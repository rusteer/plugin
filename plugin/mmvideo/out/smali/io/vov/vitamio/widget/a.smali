.class final Lio/vov/vitamio/widget/a;
.super Landroid/os/Handler;
.source "SourceFile"


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
    iput-object p1, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    .line 231
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const-wide/16 v3, 0x3e8

    .line 235
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 237
    :pswitch_0
    iget-object v0, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    goto :goto_0

    .line 240
    :pswitch_1
    iget-object v0, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->a(Lio/vov/vitamio/widget/MediaController;)J

    move-result-wide v0

    .line 241
    iget-object v2, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v2}, Lio/vov/vitamio/widget/MediaController;->b(Lio/vov/vitamio/widget/MediaController;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v2}, Lio/vov/vitamio/widget/MediaController;->c(Lio/vov/vitamio/widget/MediaController;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 242
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lio/vov/vitamio/widget/a;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 243
    rem-long/2addr v0, v3

    sub-long v0, v3, v0

    invoke-virtual {p0, p1, v0, v1}, Lio/vov/vitamio/widget/a;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 244
    iget-object v0, p0, Lio/vov/vitamio/widget/a;->a:Lio/vov/vitamio/widget/MediaController;

    invoke-static {v0}, Lio/vov/vitamio/widget/MediaController;->d(Lio/vov/vitamio/widget/MediaController;)V

    goto :goto_0

    .line 235
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
