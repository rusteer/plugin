.class final Lio/vov/vitamio/widget/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/vov/vitamio/MediaPlayer$OnErrorListener;


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
    iput-object p1, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    .line 358
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/g;)Lio/vov/vitamio/widget/VideoView;
    .locals 1
    .parameter

    .prologue
    .line 358
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    return-object v0
.end method


# virtual methods
.method public final onError(Lio/vov/vitamio/MediaPlayer;II)Z
    .locals 6
    .parameter
    .parameter "framework_err"
    .parameter "impl_err"

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x1

    .line 360
    const-string v0, "Error: %d, %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 361
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, v4}, Lio/vov/vitamio/widget/VideoView;->c(Lio/vov/vitamio/widget/VideoView;I)V

    .line 362
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0, v4}, Lio/vov/vitamio/widget/VideoView;->d(Lio/vov/vitamio/widget/VideoView;I)V

    .line 363
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    .line 366
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->m(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 367
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v0}, Lio/vov/vitamio/widget/VideoView;->m(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v1}, Lio/vov/vitamio/widget/VideoView;->f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Lio/vov/vitamio/MediaPlayer$OnErrorListener;->onError(Lio/vov/vitamio/MediaPlayer;II)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 381
    :cond_1
    :goto_0
    return v3

    .line 371
    :cond_2
    iget-object v0, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/VideoView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 372
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_3

    sget v0, Lio/vov/vitamio/VR$string;->VideoView_error_text_invalid_progressive_playback:I

    invoke-static {v0}, Lio/vov/vitamio/VR;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 374
    :goto_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lio/vov/vitamio/widget/g;->a:Lio/vov/vitamio/widget/VideoView;

    invoke-static {v2}, Lio/vov/vitamio/widget/VideoView;->n(Lio/vov/vitamio/widget/VideoView;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v2, Lio/vov/vitamio/VR$string;->VideoView_error_title:I

    invoke-static {v2}, Lio/vov/vitamio/VR;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lio/vov/vitamio/VR$string;->VideoView_error_button:I

    invoke-static {v1}, Lio/vov/vitamio/VR;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lio/vov/vitamio/widget/g$1;

    invoke-direct {v2, p0}, Lio/vov/vitamio/widget/g$1;-><init>(Lio/vov/vitamio/widget/g;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 379
    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 372
    :cond_3
    sget v0, Lio/vov/vitamio/VR$string;->VideoView_error_text_unknown:I

    invoke-static {v0}, Lio/vov/vitamio/VR;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method
