.class final Lio/vov/vitamio/widget/g$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/vov/vitamio/widget/g;->onError(Lio/vov/vitamio/MediaPlayer;II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic a:Lio/vov/vitamio/widget/g;


# direct methods
.method constructor <init>(Lio/vov/vitamio/widget/g;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lio/vov/vitamio/widget/g$1;->a:Lio/vov/vitamio/widget/g;

    .line 374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 376
    iget-object v0, p0, Lio/vov/vitamio/widget/g$1;->a:Lio/vov/vitamio/widget/g;

    invoke-static {v0}, Lio/vov/vitamio/widget/g;->a(Lio/vov/vitamio/widget/g;)Lio/vov/vitamio/widget/VideoView;

    move-result-object v0

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->l(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 377
    iget-object v0, p0, Lio/vov/vitamio/widget/g$1;->a:Lio/vov/vitamio/widget/g;

    invoke-static {v0}, Lio/vov/vitamio/widget/g;->a(Lio/vov/vitamio/widget/g;)Lio/vov/vitamio/widget/VideoView;

    move-result-object v0

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->l(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/widget/g$1;->a:Lio/vov/vitamio/widget/g;

    invoke-static {v1}, Lio/vov/vitamio/widget/g;->a(Lio/vov/vitamio/widget/g;)Lio/vov/vitamio/widget/VideoView;

    move-result-object v1

    invoke-static {v1}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/vov/vitamio/MediaPlayer$OnCompletionListener;->onCompletion(Lio/vov/vitamio/MediaPlayer;)V

    .line 378
    :cond_0
    return-void
.end method
