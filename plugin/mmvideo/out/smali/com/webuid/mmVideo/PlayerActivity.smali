.class public Lcom/webuid/mmVideo/PlayerActivity;
.super Landroid/app/Activity;
.source "PlayerActivity.java"

# interfaces
.implements Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;
.implements Lio/vov/vitamio/MediaPlayer$OnCompletionListener;
.implements Lio/vov/vitamio/MediaPlayer$OnPreparedListener;
.implements Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaPlayer"


# instance fields
.field private holder:Landroid/view/SurfaceHolder;

.field public mHandlerClick:Landroid/os/Handler;

.field private mIsVideoReadyToBePlayed:Z

.field private mIsVideoSizeKnown:Z

.field private mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

.field private mPreview:Landroid/view/SurfaceView;

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private path:Ljava/lang/String;

.field video_info:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->video_info:Ljava/util/HashMap;

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;

    .line 39
    iput-boolean v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoSizeKnown:Z

    .line 40
    iput-boolean v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoReadyToBePlayed:Z

    .line 121
    new-instance v0, Lcom/webuid/mmVideo/PlayerActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayerActivity$1;-><init>(Lcom/webuid/mmVideo/PlayerActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mHandlerClick:Landroid/os/Handler;

    .line 28
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/PlayerActivity;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 37
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/PlayerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->playVideoNow()V

    return-void
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/PlayerActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 37
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;

    return-void
.end method

.method private check()Z
    .locals 6

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PlayerActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 205
    .local v2, pm:Landroid/content/pm/PackageManager;
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v1

    .line 206
    .local v1, infoList:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 211
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 206
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .line 207
    .local v0, info:Landroid/content/pm/PackageInfo;
    const-string v4, "com.adobe.flashplayer"

    iget-object v5, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 208
    const/4 v3, 0x1

    goto :goto_0
.end method

.method private doCleanUp()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 190
    iput v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoWidth:I

    .line 191
    iput v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoHeight:I

    .line 192
    iput-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoReadyToBePlayed:Z

    .line 193
    iput-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoSizeKnown:Z

    .line 194
    return-void
.end method

.method private playVideo()V
    .locals 2

    .prologue
    .line 73
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/webuid/mmVideo/PlayerActivity$2;

    invoke-direct {v1, p0}, Lcom/webuid/mmVideo/PlayerActivity$2;-><init>(Lcom/webuid/mmVideo/PlayerActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 100
    .local v0, background:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 102
    return-void
.end method

.method private playVideoNow()V
    .locals 4

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->doCleanUp()V

    .line 106
    :try_start_0
    const-string v1, "path"

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    new-instance v1, Lio/vov/vitamio/MediaPlayer;

    invoke-direct {v1, p0}, Lio/vov/vitamio/MediaPlayer;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    .line 108
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayerActivity;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lio/vov/vitamio/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 109
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayerActivity;->holder:Landroid/view/SurfaceHolder;

    invoke-virtual {v1, v2}, Lio/vov/vitamio/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 110
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v1}, Lio/vov/vitamio/MediaPlayer;->prepareAsync()V

    .line 111
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lio/vov/vitamio/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 112
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v1, p0}, Lio/vov/vitamio/MediaPlayer;->setOnBufferingUpdateListener(Lio/vov/vitamio/MediaPlayer$OnBufferingUpdateListener;)V

    .line 113
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v1, p0}, Lio/vov/vitamio/MediaPlayer;->setOnCompletionListener(Lio/vov/vitamio/MediaPlayer$OnCompletionListener;)V

    .line 114
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v1, p0}, Lio/vov/vitamio/MediaPlayer;->setOnPreparedListener(Lio/vov/vitamio/MediaPlayer$OnPreparedListener;)V

    .line 115
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v1, p0}, Lio/vov/vitamio/MediaPlayer;->setOnVideoSizeChangedListener(Lio/vov/vitamio/MediaPlayer$OnVideoSizeChangedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "MediaPlayer"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->release()V

    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    .line 187
    :cond_0
    return-void
.end method

.method private startVideoPlayback()V
    .locals 3

    .prologue
    .line 197
    const-string v0, "MediaPlayer"

    const-string v1, "startVideoPlayback"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->holder:Landroid/view/SurfaceHolder;

    iget v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoWidth:I

    iget v2, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoHeight:I

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 199
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->start()V

    .line 200
    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Lio/vov/vitamio/MediaPlayer;I)V
    .locals 3
    .parameter "arg0"
    .parameter "percent"

    .prologue
    .line 137
    const-string v0, "MediaPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onBufferingUpdate percent:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void
.end method

.method public onCompletion(Lio/vov/vitamio/MediaPlayer;)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 142
    const-string v0, "MediaPlayer"

    const-string v1, "onCompletion called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mMediaPlayer:Lio/vov/vitamio/MediaPlayer;

    invoke-virtual {v0}, Lio/vov/vitamio/MediaPlayer;->release()V

    .line 144
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const v1, 0x7f03000c

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PlayerActivity;->setContentView(I)V

    .line 47
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 48
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "video_info"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->video_info:Ljava/util/HashMap;

    .line 53
    const v1, 0x7f06001f

    invoke-virtual {p0, v1}, Lcom/webuid/mmVideo/PlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    iput-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mPreview:Landroid/view/SurfaceView;

    .line 54
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->mPreview:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    iput-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->holder:Landroid/view/SurfaceHolder;

    .line 55
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayerActivity;->holder:Landroid/view/SurfaceHolder;

    invoke-interface {v1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 56
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 177
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 178
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->releaseMediaPlayer()V

    .line 179
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->doCleanUp()V

    .line 180
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 170
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 171
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->releaseMediaPlayer()V

    .line 172
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->doCleanUp()V

    .line 173
    return-void
.end method

.method public onPrepared(Lio/vov/vitamio/MediaPlayer;)V
    .locals 2
    .parameter "mediaplayer"

    .prologue
    .line 161
    const-string v0, "MediaPlayer"

    const-string v1, "onPrepared called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoReadyToBePlayed:Z

    .line 163
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoReadyToBePlayed:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoSizeKnown:Z

    if-eqz v0, :cond_0

    .line 164
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->startVideoPlayback()V

    .line 166
    :cond_0
    return-void
.end method

.method public onVideoSizeChanged(Lio/vov/vitamio/MediaPlayer;II)V
    .locals 3
    .parameter "mp"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 147
    const-string v0, "MediaPlayer"

    const-string v1, "onVideoSizeChanged called"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    if-eqz p2, :cond_0

    if-nez p3, :cond_2

    .line 149
    :cond_0
    const-string v0, "MediaPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid video width("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") or height("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_1
    :goto_0
    return-void

    .line 152
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoSizeKnown:Z

    .line 153
    iput p2, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoWidth:I

    .line 154
    iput p3, p0, Lcom/webuid/mmVideo/PlayerActivity;->mVideoHeight:I

    .line 155
    iget-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoReadyToBePlayed:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/webuid/mmVideo/PlayerActivity;->mIsVideoSizeKnown:Z

    if-eqz v0, :cond_1

    .line 156
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->startVideoPlayback()V

    goto :goto_0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .parameter "surfaceholder"
    .parameter "i"
    .parameter "j"
    .parameter "k"

    .prologue
    .line 59
    const-string v0, "MediaPlayer"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "surfaceChanged called"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 67
    const-string v0, "MediaPlayer"

    const-string v1, "surfaceCreated called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayerActivity;->playVideo()V

    .line 69
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "surfaceholder"

    .prologue
    .line 63
    const-string v0, "MediaPlayer"

    const-string v1, "surfaceDestroyed called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    return-void
.end method
