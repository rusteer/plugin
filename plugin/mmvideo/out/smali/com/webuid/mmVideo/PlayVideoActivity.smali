.class public Lcom/webuid/mmVideo/PlayVideoActivity;
.super Landroid/app/Activity;
.source "PlayVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;
    }
.end annotation


# instance fields
.field CurrentSound:I

.field MaxSound:I

.field private currentPosition:I

.field private durationTime:Landroid/widget/TextView;

.field private handler:Landroid/os/Handler;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private path:Ljava/lang/String;

.field private playtime:Landroid/widget/TextView;

.field private position:I

.field private seekbar:Landroid/widget/SeekBar;

.field private sound:Landroid/widget/TextView;

.field private soundBar:Landroid/widget/SeekBar;

.field private surfaceView:Landroid/view/SurfaceView;

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

.field private videofile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 31
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 32
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->playtime:Landroid/widget/TextView;

    .line 33
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->durationTime:Landroid/widget/TextView;

    .line 35
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;

    .line 36
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->soundBar:Landroid/widget/SeekBar;

    .line 40
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;

    .line 43
    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->video_info:Ljava/util/HashMap;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->path:Ljava/lang/String;

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/PlayVideoActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->play()V

    return-void
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter

    .prologue
    .line 39
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$10(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 34
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->sound:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$11(Lcom/webuid/mmVideo/PlayVideoActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    iput p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I

    return-void
.end method

.method static synthetic access$12(Lcom/webuid/mmVideo/PlayVideoActivity;Landroid/media/AudioManager;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 31
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;

    return-void
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/PlayVideoActivity;Landroid/media/MediaPlayer;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 39
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    return-void
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/SeekBar;
    .locals 1
    .parameter

    .prologue
    .line 36
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->soundBar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/media/AudioManager;
    .locals 1
    .parameter

    .prologue
    .line 31
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/SeekBar;
    .locals 1
    .parameter

    .prologue
    .line 35
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 40
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$7(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->playtime:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$8(Lcom/webuid/mmVideo/PlayVideoActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 33
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->durationTime:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$9(Lcom/webuid/mmVideo/PlayVideoActivity;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->currentPosition:I

    return v0
.end method

.method private doCleanUp()V
    .locals 0

    .prologue
    .line 225
    return-void
.end method

.method private init()V
    .locals 1

    .prologue
    .line 266
    new-instance v0, Lcom/webuid/mmVideo/PlayVideoActivity$4;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayVideoActivity$4;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->handler:Landroid/os/Handler;

    .line 291
    return-void
.end method

.method private play()V
    .locals 3

    .prologue
    .line 187
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 188
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 189
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 190
    const-string v1, "path"

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->path:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 192
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->setup()V

    .line 193
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "play is wrong"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 216
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 218
    :cond_0
    return-void
.end method

.method private setup()V
    .locals 3

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->init()V

    .line 243
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 244
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/webuid/mmVideo/PlayVideoActivity$3;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/PlayVideoActivity$3;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :goto_0
    return-void

    .line 259
    :catch_0
    move-exception v0

    .line 260
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "wrong"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const v6, 0x7f030021

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->setContentView(I)V

    .line 51
    invoke-virtual {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 52
    .local v0, bundle:Landroid/os/Bundle;
    const-string v6, "video_info"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->video_info:Ljava/util/HashMap;

    .line 53
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->video_info:Ljava/util/HashMap;

    const-string v7, "path"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->path:Ljava/lang/String;

    .line 55
    new-instance v6, Landroid/media/MediaPlayer;

    invoke-direct {v6}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 56
    const v6, 0x7f060046

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->playtime:Landroid/widget/TextView;

    .line 57
    const v6, 0x7f060047

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->durationTime:Landroid/widget/TextView;

    .line 58
    const v6, 0x7f06004d

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->sound:Landroid/widget/TextView;

    .line 59
    const v6, 0x7f06003f

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/SurfaceView;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->surfaceView:Landroid/view/SurfaceView;

    .line 60
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v6}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v6

    const/4 v7, 0x3

    invoke-interface {v6, v7}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 61
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v6}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v6

    const/16 v7, 0x140

    const/16 v8, 0xf0

    invoke-interface {v6, v7, v8}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 62
    const v6, 0x7f060045

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/SeekBar;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;

    .line 63
    new-instance v1, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;

    const/4 v6, 0x0

    invoke-direct {v1, p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;)V

    .line 64
    .local v1, listener:Lcom/webuid/mmVideo/PlayVideoActivity$ButtonClickListener;
    const v6, 0x7f060049

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    .line 65
    .local v3, playbutton:Landroid/widget/ImageButton;
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Landroid/widget/ImageButton;->setAlpha(I)V

    .line 66
    const v6, 0x7f060048

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    .line 67
    .local v2, pausebutton:Landroid/widget/ImageButton;
    const v6, 0x7f06004a

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageButton;

    .line 68
    .local v4, resetbutton:Landroid/widget/ImageButton;
    const v6, 0x7f06004b

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageButton;

    .line 69
    .local v5, stopbutton:Landroid/widget/ImageButton;
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    invoke-virtual {v2, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    invoke-virtual {v4, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    invoke-virtual {v5, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->seekbar:Landroid/widget/SeekBar;

    new-instance v7, Lcom/webuid/mmVideo/PlayVideoActivity$1;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/PlayVideoActivity$1;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 87
    const v6, 0x7f06004c

    invoke-virtual {p0, v6}, Lcom/webuid/mmVideo/PlayVideoActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/SeekBar;

    iput-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->soundBar:Landroid/widget/SeekBar;

    .line 88
    iget-object v6, p0, Lcom/webuid/mmVideo/PlayVideoActivity;->soundBar:Landroid/widget/SeekBar;

    new-instance v7, Lcom/webuid/mmVideo/PlayVideoActivity$2;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/PlayVideoActivity$2;-><init>(Lcom/webuid/mmVideo/PlayVideoActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 110
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 208
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 209
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->releaseMediaPlayer()V

    .line 210
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->doCleanUp()V

    .line 211
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 201
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 202
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->releaseMediaPlayer()V

    .line 203
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayVideoActivity;->doCleanUp()V

    .line 204
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 119
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 120
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "outState"

    .prologue
    .line 128
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 129
    return-void
.end method

.method public toFotmat(I)Ljava/lang/String;
    .locals 4
    .parameter "num"

    .prologue
    .line 237
    const-string v0, "%02d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toTime(I)Ljava/lang/String;
    .locals 6
    .parameter "time"

    .prologue
    .line 229
    div-int/lit16 p1, p1, 0x3e8

    .line 230
    div-int/lit8 v0, p1, 0x3c

    .line 232
    .local v0, minute:I
    rem-int/lit8 v1, p1, 0x3c

    .line 233
    .local v1, second:I
    const-string v2, "%02d:%02d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
