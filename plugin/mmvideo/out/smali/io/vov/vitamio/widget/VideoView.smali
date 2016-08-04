.class public Lio/vov/vitamio/widget/VideoView;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;


# static fields
.field public static final VIDEO_LAYOUT_ORIGIN:I = 0x0

.field public static final VIDEO_LAYOUT_SCALE:I = 0x1

.field public static final VIDEO_LAYOUT_STRETCH:I = 0x2

.field public static final VIDEO_LAYOUT_ZOOM:I = 0x3


# instance fields
.field private A:Landroid/content/Context;

.field private B:Lio/vov/vitamio/VitamioInstaller;

.field private C:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

.field private D:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

.field private E:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

.field private F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

.field private G:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

.field private H:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

.field private I:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

.field private J:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

.field private K:Landroid/view/SurfaceHolder$Callback;

.field private a:Landroid/net/Uri;

.field private b:J

.field private c:I

.field private d:I

.field private e:F

.field private f:I

.field private g:Landroid/view/SurfaceHolder;

.field private h:Lio/vov/vitamio/MediaPlayer;

.field private i:I

.field private j:I

.field private k:F

.field private l:I

.field private m:I

.field private n:Lio/vov/vitamio/widget/MediaController;

.field private o:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

.field private p:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

.field private q:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

.field private r:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

.field private s:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

.field private t:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

.field private u:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

.field private v:I

.field private w:J

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 102
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 68
    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 69
    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->e:F

    .line 72
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->f:I

    .line 78
    iput-object v2, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    .line 79
    iput-object v2, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    .line 95
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->x:Z

    .line 96
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->y:Z

    .line 97
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->z:Z

    .line 285
    new-instance v0, Lio/vov/vitamio/widget/d;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/d;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->C:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

    .line 296
    new-instance v0, Lio/vov/vitamio/widget/e;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/e;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->D:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    .line 346
    new-instance v0, Lio/vov/vitamio/widget/f;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/f;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->E:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    .line 358
    new-instance v0, Lio/vov/vitamio/widget/g;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/g;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    .line 385
    new-instance v0, Lio/vov/vitamio/widget/h;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/h;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->G:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    .line 393
    new-instance v0, Lio/vov/vitamio/widget/i;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/i;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->H:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    .line 410
    new-instance v0, Lio/vov/vitamio/widget/j;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/j;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->I:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    .line 419
    new-instance v0, Lio/vov/vitamio/widget/k;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/k;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->J:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    .line 463
    new-instance v0, Lio/vov/vitamio/widget/l;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/l;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->K:Landroid/view/SurfaceHolder$Callback;

    .line 103
    invoke-direct {p0, p1}, Lio/vov/vitamio/widget/VideoView;->a(Landroid/content/Context;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lio/vov/vitamio/widget/VideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 108
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 111
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 68
    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 69
    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->e:F

    .line 72
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->f:I

    .line 78
    iput-object v2, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    .line 79
    iput-object v2, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    .line 95
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->x:Z

    .line 96
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->y:Z

    .line 97
    iput-boolean v1, p0, Lio/vov/vitamio/widget/VideoView;->z:Z

    .line 285
    new-instance v0, Lio/vov/vitamio/widget/d;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/d;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->C:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

    .line 296
    new-instance v0, Lio/vov/vitamio/widget/e;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/e;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->D:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    .line 346
    new-instance v0, Lio/vov/vitamio/widget/f;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/f;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->E:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    .line 358
    new-instance v0, Lio/vov/vitamio/widget/g;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/g;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    .line 385
    new-instance v0, Lio/vov/vitamio/widget/h;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/h;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->G:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    .line 393
    new-instance v0, Lio/vov/vitamio/widget/i;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/i;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->H:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    .line 410
    new-instance v0, Lio/vov/vitamio/widget/j;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/j;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->I:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    .line 419
    new-instance v0, Lio/vov/vitamio/widget/k;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/k;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->J:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    .line 463
    new-instance v0, Lio/vov/vitamio/widget/l;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/l;-><init>(Lio/vov/vitamio/widget/VideoView;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->K:Landroid/view/SurfaceHolder$Callback;

    .line 112
    invoke-direct {p0, p1}, Lio/vov/vitamio/widget/VideoView;->a(Landroid/content/Context;)V

    .line 113
    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 80
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    return v0
.end method

.method private a()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 214
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    if-nez v0, :cond_1

    .line 259
    :cond_0
    :goto_0
    return-void

    .line 217
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.music.musicservicecommand"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 218
    const-string v1, "command"

    const-string v2, "pause"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 221
    invoke-direct {p0, v5}, Lio/vov/vitamio/widget/VideoView;->a(Z)V

    .line 223
    const-wide/16 v0, -0x1

    :try_start_0
    iput-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    .line 224
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->v:I

    .line 225
    new-instance v0, Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    invoke-direct {v0, v1}, Lio/vov/vitamio/MediaPlayer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    .line 226
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->D:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnPreparedListener(Lio/vov/vitamio/MediaPlayer$OnPreparedListener;)V

    .line 227
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->C:Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnVideoSizeChangedListener(Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 228
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->E:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnCompletionListener(Lio/vov/vitamio/MediaPlayer$OnCompletionListener;)V

    .line 229
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnErrorListener(Lio/vov/vitamio/MediaPlayer$OnErrorListener;)V

    .line 230
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->G:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnBufferingUpdateListener(Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;)V

    .line 231
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->H:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnInfoListener(Lio/vov/vitamio/MediaPlayer$OnInfoListener;)V

    .line 232
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->I:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnSeekCompleteListener(Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;)V

    .line 233
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->J:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setOnSubtitleUpdateListener(Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;)V

    .line 234
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    iget-object v2, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Lio/vov/vitamio/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 235
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 236
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lio/vov/vitamio/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 237
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->prepareAsync()V

    .line 238
    const/4 v0, 0x1

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 239
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->b()V
    :try_end_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_0

    .line 240
    :catch_0
    move-exception v0

    .line 241
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->B:Lio/vov/vitamio/VitamioInstaller;

    invoke-virtual {v1, v3, v3, v3}, Lio/vov/vitamio/VitamioInstaller;->showNotCompatibleDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string v1, "openVideo"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 244
    :catch_1
    move-exception v0

    .line 245
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->B:Lio/vov/vitamio/VitamioInstaller;

    invoke-virtual {v1, v3, v3, v3}, Lio/vov/vitamio/VitamioInstaller;->showInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    const-string v1, "openVideo"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 248
    :catch_2
    move-exception v0

    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to open content: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 250
    iput v4, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 251
    iput v4, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 252
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v1, v6, v5}, Lio/vov/vitamio/MediaPlayer$OnErrorListener;->onError(Lio/vov/vitamio/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 254
    :catch_3
    move-exception v0

    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to open content: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 256
    iput v4, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 257
    iput v4, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 258
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->F:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-interface {v0, v1, v6, v5}, Lio/vov/vitamio/MediaPlayer$OnErrorListener;->onError(Lio/vov/vitamio/MediaPlayer;II)Z

    goto/16 :goto_0
.end method

.method private a(Landroid/content/Context;)V
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 160
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    .line 161
    new-instance v0, Lio/vov/vitamio/VitamioInstaller;

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    invoke-direct {v0, v1}, Lio/vov/vitamio/VitamioInstaller;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lio/vov/vitamio/VitamioInstaller;->fillDefaultSources()Lio/vov/vitamio/VitamioInstaller;

    move-result-object v0

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->B:Lio/vov/vitamio/VitamioInstaller;

    .line 163
    :try_start_0
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    invoke-static {v0}, Lio/vov/vitamio/VR;->init(Landroid/content/Context;)V

    .line 164
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    .line 165
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    .line 166
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->K:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 167
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 168
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 169
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/VideoView;->setFocusable(Z)V

    .line 170
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/VideoView;->setFocusableInTouchMode(Z)V

    .line 171
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->requestFocus()Z

    .line 172
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 173
    const/4 v0, 0x0

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 174
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 175
    check-cast p1, Landroid/app/Activity;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V
    :try_end_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 185
    :cond_0
    :goto_0
    return-void

    .line 176
    :catch_0
    move-exception v0

    .line 177
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->B:Lio/vov/vitamio/VitamioInstaller;

    invoke-virtual {v1, v2, v2, v2}, Lio/vov/vitamio/VitamioInstaller;->showNotCompatibleDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-string v1, "VideoView XML"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 179
    :catch_1
    move-exception v0

    .line 180
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->B:Lio/vov/vitamio/VitamioInstaller;

    invoke-virtual {v1, v2, v2, v2}, Lio/vov/vitamio/VitamioInstaller;->showInstallerDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v1, "VideoView XML"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 182
    :catch_2
    move-exception v0

    .line 183
    const-string v1, "initVideoView"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static synthetic a(Lio/vov/vitamio/widget/VideoView;F)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 82
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->k:F

    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 80
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/VideoView;Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 78
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    return-void
.end method

.method private a(Z)V
    .locals 2
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 501
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 502
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->reset()V

    .line 503
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->release()V

    .line 504
    const/4 v0, 0x0

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    .line 505
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 506
    if-eqz p1, :cond_0

    .line 507
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 509
    :cond_0
    return-void
.end method

.method static synthetic b(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 81
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    return v0
.end method

.method private b()V
    .locals 2

    .prologue
    .line 271
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    if-eqz v0, :cond_1

    .line 272
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0, p0}, Lio/vov/vitamio/widget/MediaController;->setMediaPlayer(Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;)V

    .line 273
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 274
    :goto_0
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v1, v0}, Lio/vov/vitamio/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 275
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v1

    invoke-virtual {v0, v1}, Lio/vov/vitamio/widget/MediaController;->setEnabled(Z)V

    .line 277
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 278
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    .line 279
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_0
    const-string v0, "null"

    .line 280
    :goto_1
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v1, v0}, Lio/vov/vitamio/widget/MediaController;->setFileName(Ljava/lang/String;)V

    .line 283
    :cond_1
    return-void

    :cond_2
    move-object v0, p0

    .line 273
    goto :goto_0

    .line 279
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1
.end method

.method static synthetic b(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 81
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    return-void
.end method

.method static synthetic c(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 72
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->f:I

    return v0
.end method

.method private c()V
    .locals 1

    .prologue
    .line 550
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    .line 555
    :goto_0
    return-void

    .line 553
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->show()V

    goto :goto_0
.end method

.method static synthetic c(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 68
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    return-void
.end method

.method static synthetic d(Lio/vov/vitamio/widget/VideoView;)F
    .locals 1
    .parameter

    .prologue
    .line 71
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->e:F

    return v0
.end method

.method static synthetic d(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 69
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    return-void
.end method

.method private d()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 733
    iget-object v1, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v1, :cond_0

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    if-eqz v1, :cond_0

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic e(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnPreparedListener;
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->p:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic e(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 93
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->v:I

    return-void
.end method

.method static synthetic f(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer;
    .locals 1
    .parameter

    .prologue
    .line 79
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    return-object v0
.end method

.method static synthetic f(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 83
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    return-void
.end method

.method static synthetic g(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/widget/MediaController;
    .locals 1
    .parameter

    .prologue
    .line 85
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    return-object v0
.end method

.method static synthetic g(Lio/vov/vitamio/widget/VideoView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 84
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    return-void
.end method

.method static synthetic h(Lio/vov/vitamio/widget/VideoView;)J
    .locals 2
    .parameter

    .prologue
    .line 94
    iget-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->w:J

    return-wide v0
.end method

.method static synthetic i(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 83
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    return v0
.end method

.method static synthetic j(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 84
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    return v0
.end method

.method static synthetic k(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 69
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    return v0
.end method

.method static synthetic l(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
    .locals 1
    .parameter

    .prologue
    .line 86
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->o:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic m(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnErrorListener;
    .locals 1
    .parameter

    .prologue
    .line 88
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->q:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic n(Lio/vov/vitamio/widget/VideoView;)Landroid/content/Context;
    .locals 1
    .parameter

    .prologue
    .line 98
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic o(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;
    .locals 1
    .parameter

    .prologue
    .line 92
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->u:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    return-object v0
.end method

.method static synthetic p(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnInfoListener;
    .locals 1
    .parameter

    .prologue
    .line 91
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->t:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    return-object v0
.end method

.method static synthetic q(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;
    .locals 1
    .parameter

    .prologue
    .line 89
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->r:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    return-object v0
.end method

.method static synthetic r(Lio/vov/vitamio/widget/VideoView;)Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;
    .locals 1
    .parameter

    .prologue
    .line 90
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->s:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    return-object v0
.end method

.method static synthetic s(Lio/vov/vitamio/widget/VideoView;)I
    .locals 1
    .parameter

    .prologue
    .line 68
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    return v0
.end method

.method static synthetic t(Lio/vov/vitamio/widget/VideoView;)Landroid/view/SurfaceHolder;
    .locals 1
    .parameter

    .prologue
    .line 78
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method static synthetic u(Lio/vov/vitamio/widget/VideoView;)V
    .locals 0
    .parameter

    .prologue
    .line 213
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->a()V

    return-void
.end method

.method static synthetic v(Lio/vov/vitamio/widget/VideoView;)V
    .locals 1
    .parameter

    .prologue
    .line 500
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lio/vov/vitamio/widget/VideoView;->a(Z)V

    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 737
    iget-boolean v0, p0, Lio/vov/vitamio/widget/VideoView;->x:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 741
    iget-boolean v0, p0, Lio/vov/vitamio/widget/VideoView;->y:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 745
    iget-boolean v0, p0, Lio/vov/vitamio/widget/VideoView;->z:Z

    return v0
.end method

.method public getAudioTrack()I
    .locals 1

    .prologue
    .line 678
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 679
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getAudioTrack()I

    move-result v0

    .line 680
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getAudioTrackMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 1
    .parameter "encoding"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 672
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 673
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->getAudioTrackMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 674
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 622
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 623
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->v:I

    .line 624
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 603
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 604
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getCurrentPosition()J

    move-result-wide v0

    .line 605
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()J
    .locals 4

    .prologue
    .line 592
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 593
    iget-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 594
    iget-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    .line 599
    :goto_0
    return-wide v0

    .line 595
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getDuration()J

    move-result-wide v0

    iput-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    .line 596
    iget-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    goto :goto_0

    .line 598
    :cond_1
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    .line 599
    iget-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->b:J

    goto :goto_0
.end method

.method public getMetaEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 666
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 667
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getMetaEncoding()Ljava/lang/String;

    move-result-object v0

    .line 668
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSubLocation()I
    .locals 1

    .prologue
    .line 699
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 700
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getSubLocation()I

    move-result v0

    .line 701
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getSubPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 710
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 711
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getSubPath()Ljava/lang/String;

    move-result-object v0

    .line 712
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSubTrack()I
    .locals 1

    .prologue
    .line 721
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 722
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->getSubTrack()I

    move-result v0

    .line 723
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public getSubTrackMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 1
    .parameter "encoding"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 727
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->getSubTrackMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 729
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVideoAspectRatio()F
    .locals 1

    .prologue
    .line 641
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->k:F

    return v0
.end method

.method public getVideoHeight()I
    .locals 1

    .prologue
    .line 637
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    return v0
.end method

.method public getVideoWidth()I
    .locals 1

    .prologue
    .line 633
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    return v0
.end method

.method public isBuffering()Z
    .locals 1

    .prologue
    .line 655
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 656
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isBuffering()Z

    move-result v0

    .line 657
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 618
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v1, 0x1

    .line 527
    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/16 v0, 0x18

    if-eq p1, v0, :cond_1

    const/16 v0, 0x19

    if-eq p1, v0, :cond_1

    const/16 v0, 0x52

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1

    move v0, v1

    .line 528
    :goto_0
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v2

    if-eqz v2, :cond_4

    if-eqz v0, :cond_4

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    if-eqz v0, :cond_4

    .line 529
    const/16 v0, 0x4f

    if-eq p1, v0, :cond_0

    const/16 v0, 0x55

    if-ne p1, v0, :cond_3

    .line 530
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 531
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->pause()V

    .line 532
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->show()V

    .line 546
    :goto_1
    return v1

    .line 527
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 534
    :cond_2
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->start()V

    .line 535
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    goto :goto_1

    .line 538
    :cond_3
    const/16 v0, 0x56

    if-ne p1, v0, :cond_5

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 539
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->pause()V

    .line 540
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->show()V

    .line 546
    :cond_4
    :goto_2
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1

    .line 542
    :cond_5
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->c()V

    goto :goto_2
.end method

.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 117
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    invoke-static {v0, p1}, Lio/vov/vitamio/widget/VideoView;->getDefaultSize(II)I

    move-result v0

    .line 118
    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    invoke-static {v1, p2}, Lio/vov/vitamio/widget/VideoView;->getDefaultSize(II)I

    move-result v1

    .line 119
    invoke-virtual {p0, v0, v1}, Lio/vov/vitamio/widget/VideoView;->setMeasuredDimension(II)V

    .line 120
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter

    .prologue
    .line 513
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    if-eqz v0, :cond_0

    .line 514
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->c()V

    .line 515
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter

    .prologue
    .line 520
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    if-eqz v0, :cond_0

    .line 521
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->c()V

    .line 522
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 566
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 567
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 568
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->pause()V

    .line 569
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 572
    :cond_0
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 573
    return-void
.end method

.method public resume()V
    .locals 2

    .prologue
    .line 584
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->g:Landroid/view/SurfaceHolder;

    if-nez v0, :cond_1

    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    .line 585
    const/4 v0, 0x7

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 589
    :cond_0
    :goto_0
    return-void

    .line 586
    :cond_1
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 587
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->a()V

    goto :goto_0
.end method

.method public seekTo(J)V
    .locals 2
    .parameter "msec"

    .prologue
    .line 609
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 610
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1, p2}, Lio/vov/vitamio/MediaPlayer;->seekTo(J)V

    .line 611
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->w:J

    .line 615
    :goto_0
    return-void

    .line 613
    :cond_0
    iput-wide p1, p0, Lio/vov/vitamio/widget/VideoView;->w:J

    goto :goto_0
.end method

.method public setAudioTrack(I)V
    .locals 1
    .parameter "audioIndex"

    .prologue
    .line 684
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 685
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setAudioTrack(I)V

    .line 686
    :cond_0
    return-void
.end method

.method public setBufferSize(I)V
    .locals 1
    .parameter "bufSize"

    .prologue
    .line 650
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 651
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setBufferSize(I)V

    .line 652
    :cond_0
    return-void
.end method

.method public setMediaController(Lio/vov/vitamio/widget/MediaController;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 264
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    invoke-virtual {v0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    .line 266
    :cond_0
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->n:Lio/vov/vitamio/widget/MediaController;

    .line 267
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->b()V

    .line 268
    return-void
.end method

.method public setMetaEncoding(Ljava/lang/String;)V
    .locals 1
    .parameter "encoding"

    .prologue
    .line 661
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 662
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setMetaEncoding(Ljava/lang/String;)V

    .line 663
    :cond_0
    return-void
.end method

.method public setOnBufferingUpdateListener(Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 448
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->u:Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;

    .line 449
    return-void
.end method

.method public setOnCompletionListener(Lio/vov/vitamio/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 440
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->o:Lio/vov/vitamio/MediaPlayer$OnCompletionListener;

    .line 441
    return-void
.end method

.method public setOnErrorListener(Lio/vov/vitamio/MediaPlayer$OnErrorListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 444
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->q:Lio/vov/vitamio/MediaPlayer$OnErrorListener;

    .line 445
    return-void
.end method

.method public setOnInfoListener(Lio/vov/vitamio/MediaPlayer$OnInfoListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 460
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->t:Lio/vov/vitamio/MediaPlayer$OnInfoListener;

    .line 461
    return-void
.end method

.method public setOnPreparedListener(Lio/vov/vitamio/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 436
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->p:Lio/vov/vitamio/MediaPlayer$OnPreparedListener;

    .line 437
    return-void
.end method

.method public setOnSeekCompleteListener(Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 452
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->r:Lio/vov/vitamio/MediaPlayer$OnSeekCompleteListener;

    .line 453
    return-void
.end method

.method public setOnSubtitleUpdateListener(Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 456
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->s:Lio/vov/vitamio/MediaPlayer$OnSubtitleUpdateListener;

    .line 457
    return-void
.end method

.method public setSubEncoding(Ljava/lang/String;)V
    .locals 1
    .parameter "encoding"

    .prologue
    .line 694
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 695
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setSubEncoding(Ljava/lang/String;)V

    .line 696
    :cond_0
    return-void
.end method

.method public setSubPath(Ljava/lang/String;)V
    .locals 1
    .parameter "subPath"

    .prologue
    .line 705
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 706
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setSubPath(Ljava/lang/String;)V

    .line 707
    :cond_0
    return-void
.end method

.method public setSubShown(Z)V
    .locals 1
    .parameter "shown"

    .prologue
    .line 689
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 690
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setSubShown(Z)V

    .line 691
    :cond_0
    return-void
.end method

.method public setSubTrack(I)V
    .locals 1
    .parameter "trackId"

    .prologue
    .line 716
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 717
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setSubTrack(I)V

    .line 718
    :cond_0
    return-void
.end method

.method public setVideoLayout(IF)V
    .locals 11
    .parameter "layout"
    .parameter "aspectRatio"

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 134
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 135
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->A:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 136
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 137
    int-to-float v0, v2

    int-to-float v1, v3

    div-float v8, v0, v1

    .line 138
    const v0, 0x3c23d70a

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_0

    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->k:F

    .line 139
    :goto_0
    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    .line 140
    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    .line 141
    if-nez p1, :cond_1

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    if-ge v1, v2, :cond_1

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    if-ge v1, v3, :cond_1

    .line 142
    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 143
    iget v0, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    move-object v1, v4

    .line 150
    :goto_1
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 152
    :goto_2
    invoke-virtual {p0, v4}, Lio/vov/vitamio/widget/VideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget v1, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    iget v5, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    invoke-interface {v0, v1, v5}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 154
    const-string v0, "VIDEO: %dx%dx%f, Surface: %dx%d, LP: %dx%d, Window: %dx%dx%f"

    const/16 v1, 0xa

    new-array v1, v1, [Ljava/lang/Object;

    iget v5, p0, Lio/vov/vitamio/widget/VideoView;->i:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v7

    iget v5, p0, Lio/vov/vitamio/widget/VideoView;->j:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v6

    iget v5, p0, Lio/vov/vitamio/widget/VideoView;->k:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v1, v9

    iget v5, p0, Lio/vov/vitamio/widget/VideoView;->l:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v10

    const/4 v5, 0x4

    iget v6, p0, Lio/vov/vitamio/widget/VideoView;->m:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v5

    const/4 v5, 0x5

    iget v6, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v5

    const/4 v5, 0x6

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v5

    const/4 v4, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const/16 v2, 0x8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x9

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    iput p1, p0, Lio/vov/vitamio/widget/VideoView;->f:I

    .line 156
    iput p2, p0, Lio/vov/vitamio/widget/VideoView;->e:F

    .line 157
    return-void

    :cond_0
    move v0, p2

    .line 138
    goto/16 :goto_0

    .line 144
    :cond_1
    if-ne p1, v10, :cond_4

    .line 145
    cmpl-float v1, v8, v0

    if-lez v1, :cond_2

    move v1, v2

    :goto_3
    iput v1, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 146
    cmpg-float v1, v8, v0

    if-gez v1, :cond_3

    move v0, v3

    :goto_4
    iput v0, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto/16 :goto_2

    .line 145
    :cond_2
    int-to-float v1, v3

    mul-float/2addr v1, v0

    float-to-int v1, v1

    goto :goto_3

    .line 146
    :cond_3
    int-to-float v1, v2

    div-float v0, v1, v0

    float-to-int v0, v0

    goto :goto_4

    .line 148
    :cond_4
    if-ne p1, v9, :cond_7

    move v5, v6

    .line 149
    :goto_5
    if-nez v5, :cond_5

    cmpg-float v1, v8, v0

    if-gez v1, :cond_8

    :cond_5
    move v1, v2

    :goto_6
    iput v1, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 150
    if-nez v5, :cond_6

    cmpl-float v1, v8, v0

    if-lez v1, :cond_9

    :cond_6
    move v0, v3

    move-object v1, v4

    goto/16 :goto_1

    :cond_7
    move v5, v7

    .line 148
    goto :goto_5

    .line 149
    :cond_8
    int-to-float v1, v3

    mul-float/2addr v1, v0

    float-to-int v1, v1

    goto :goto_6

    .line 150
    :cond_9
    int-to-float v1, v2

    div-float v0, v1, v0

    float-to-int v0, v0

    move-object v1, v4

    goto/16 :goto_1
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 192
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 193
    return-void
.end method

.method public setVideoQuality(I)V
    .locals 1
    .parameter "quality"

    .prologue
    .line 645
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 646
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1}, Lio/vov/vitamio/MediaPlayer;->setVideoQuality(I)V

    .line 647
    :cond_0
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 2
    .parameter "uri"

    .prologue
    .line 196
    iput-object p1, p0, Lio/vov/vitamio/widget/VideoView;->a:Landroid/net/Uri;

    .line 197
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/vov/vitamio/widget/VideoView;->w:J

    .line 198
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->a()V

    .line 199
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->requestLayout()V

    .line 200
    invoke-virtual {p0}, Lio/vov/vitamio/widget/VideoView;->invalidate()V

    .line 201
    return-void
.end method

.method public setVolume(FF)V
    .locals 1
    .parameter "leftVolume"
    .parameter "rightVolume"

    .prologue
    .line 628
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 629
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0, p1, p2}, Lio/vov/vitamio/MediaPlayer;->setVolume(FF)V

    .line 630
    :cond_0
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 558
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->start()V

    .line 560
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 562
    :cond_0
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 563
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 204
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->stop()V

    .line 206
    iget-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->release()V

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lio/vov/vitamio/widget/VideoView;->h:Lio/vov/vitamio/MediaPlayer;

    .line 208
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 209
    iput v1, p0, Lio/vov/vitamio/widget/VideoView;->d:I

    .line 211
    :cond_0
    return-void
.end method

.method public suspend()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 576
    invoke-direct {p0}, Lio/vov/vitamio/widget/VideoView;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 577
    invoke-direct {p0, v1}, Lio/vov/vitamio/widget/VideoView;->a(Z)V

    .line 578
    const/16 v0, 0x8

    iput v0, p0, Lio/vov/vitamio/widget/VideoView;->c:I

    .line 579
    const-string v0, "Unable to suspend video. Release MediaPlayer."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 581
    :cond_0
    return-void
.end method
