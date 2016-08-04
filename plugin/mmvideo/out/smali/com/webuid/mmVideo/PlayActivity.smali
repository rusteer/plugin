.class public Lcom/webuid/mmVideo/PlayActivity;
.super Landroid/app/Activity;
.source "PlayActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;,
        Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;
    }
.end annotation


# instance fields
.field CurrentSound:I

.field MaxSound:I

.field bottomLayout:Landroid/widget/LinearLayout;

.field private currentPosition:I

.field private dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

.field downClick:Landroid/view/View$OnClickListener;

.field private durationTime:Landroid/widget/TextView;

.field private gestureDetector:Landroid/view/GestureDetector;

.field private handler:Landroid/os/Handler;

.field public isPlay:I

.field private loadBar:Landroid/widget/ProgressBar;

.field private loadText:Landroid/widget/TextView;

.field private mAudioManager:Landroid/media/AudioManager;

.field public mHandlerClick:Landroid/os/Handler;

.field public mHandlerClick2:Landroid/os/Handler;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private path:Ljava/lang/String;

.field private playtime:Landroid/widget/TextView;

.field private position:I

.field rightLayout:Landroid/widget/LinearLayout;

.field private seekbar:Landroid/widget/SeekBar;

.field private showControl:I

.field private sound:Landroid/widget/TextView;

.field private soundBar:Landroid/widget/SeekBar;

.field private surfaceHolder:Landroid/view/SurfaceHolder;

.field private surfaceView:Landroid/view/SurfaceView;

.field topLayout:Landroid/widget/RelativeLayout;

.field video_info:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private videofile:Ljava/io/File;

.field wakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 67
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 68
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->playtime:Landroid/widget/TextView;

    .line 69
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->durationTime:Landroid/widget/TextView;

    .line 71
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;

    .line 72
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;

    .line 74
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 77
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;

    .line 80
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    .line 89
    iput v2, p0, Lcom/webuid/mmVideo/PlayActivity;->showControl:I

    .line 90
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->gestureDetector:Landroid/view/GestureDetector;

    .line 91
    iput v2, p0, Lcom/webuid/mmVideo/PlayActivity;->isPlay:I

    .line 92
    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 284
    new-instance v0, Lcom/webuid/mmVideo/PlayActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayActivity$1;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->downClick:Landroid/view/View$OnClickListener;

    .line 343
    new-instance v0, Lcom/webuid/mmVideo/PlayActivity$2;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayActivity$2;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mHandlerClick:Landroid/os/Handler;

    .line 363
    new-instance v0, Lcom/webuid/mmVideo/PlayActivity$3;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayActivity$3;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mHandlerClick2:Landroid/os/Handler;

    .line 66
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/PlayActivity;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 81
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/PlayActivity;)Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1
    .parameter

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$10(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;
    .locals 1
    .parameter

    .prologue
    .line 71
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$11(Lcom/webuid/mmVideo/PlayActivity;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 77
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$12(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 68
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->playtime:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$13(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 69
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->durationTime:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$14(Lcom/webuid/mmVideo/PlayActivity;)I
    .locals 1
    .parameter

    .prologue
    .line 79
    iget v0, p0, Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I

    return v0
.end method

.method static synthetic access$15(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 70
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->sound:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$16(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter

    .prologue
    .line 84
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->loadBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$17(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 85
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->loadText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$18(Lcom/webuid/mmVideo/PlayActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 79
    iput p1, p0, Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I

    return-void
.end method

.method static synthetic access$19(Lcom/webuid/mmVideo/PlayActivity;Landroid/media/AudioManager;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 67
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;

    return-void
.end method

.method static synthetic access$2(Lcom/webuid/mmVideo/PlayActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 482
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->play()V

    return-void
.end method

.method static synthetic access$3(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter

    .prologue
    .line 76
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$4(Lcom/webuid/mmVideo/PlayActivity;Landroid/media/MediaPlayer;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 76
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    return-void
.end method

.method static synthetic access$5(Lcom/webuid/mmVideo/PlayActivity;)I
    .locals 1
    .parameter

    .prologue
    .line 89
    iget v0, p0, Lcom/webuid/mmVideo/PlayActivity;->showControl:I

    return v0
.end method

.method static synthetic access$6(Lcom/webuid/mmVideo/PlayActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 89
    iput p1, p0, Lcom/webuid/mmVideo/PlayActivity;->showControl:I

    return-void
.end method

.method static synthetic access$7(Lcom/webuid/mmVideo/PlayActivity;)Landroid/widget/SeekBar;
    .locals 1
    .parameter

    .prologue
    .line 72
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$8(Lcom/webuid/mmVideo/PlayActivity;)Landroid/media/AudioManager;
    .locals 1
    .parameter

    .prologue
    .line 67
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$9(Lcom/webuid/mmVideo/PlayActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 81
    iput-object p1, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    return-void
.end method

.method private doCleanUp()V
    .locals 0

    .prologue
    .line 585
    return-void
.end method

.method private getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    .locals 1

    .prologue
    .line 554
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-nez v0, :cond_0

    .line 555
    const-class v0, Lcom/webuid/mmVideo/dao/DataHelper;

    invoke-static {p0, v0}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/webuid/mmVideo/dao/DataHelper;

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 557
    :cond_0
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    return-object v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 641
    new-instance v0, Lcom/webuid/mmVideo/PlayActivity$12;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/PlayActivity$12;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->handler:Landroid/os/Handler;

    .line 668
    return-void
.end method

.method private play()V
    .locals 3

    .prologue
    .line 484
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->surfaceView:Landroid/view/SurfaceView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 485
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 486
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 487
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 488
    const-string v1, "play"

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 493
    const-string v1, "play"

    const-string v2, "setup"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->setup()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 498
    :goto_0
    return-void

    .line 495
    :catch_0
    move-exception v0

    .line 496
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "play is wrong"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .prologue
    .line 573
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 574
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 575
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 576
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 578
    :cond_0
    return-void
.end method

.method private setPlayList()V
    .locals 12

    .prologue
    .line 329
    new-instance v9, Lcom/webuid/mmVideo/service/PlayVideoService;

    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/webuid/mmVideo/dao/DataHelper;->getPlayVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    invoke-direct {v9, v1}, Lcom/webuid/mmVideo/service/PlayVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 330
    .local v9, pvService:Lcom/webuid/mmVideo/service/PlayVideoService;
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 332
    .local v8, obj:Ljava/lang/Object;
    instance-of v1, v8, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 333
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 337
    .end local v8           #obj:Ljava/lang/Object;
    .local v10, xid:I
    :goto_0
    new-instance v0, Lcom/webuid/mmVideo/entity/PlayVideo;

    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v3, "url"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 338
    iget-object v3, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v4, "title"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v5, "source"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 339
    iget-object v5, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v6, "size"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v7, "length"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    const-string v11, "star"

    invoke-virtual {v7, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 337
    invoke-direct/range {v0 .. v7}, Lcom/webuid/mmVideo/entity/PlayVideo;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .local v0, theVideo:Lcom/webuid/mmVideo/entity/PlayVideo;
    invoke-virtual {v9, v0}, Lcom/webuid/mmVideo/service/PlayVideoService;->insert(Lcom/webuid/mmVideo/entity/PlayVideo;)Ljava/lang/String;

    .line 341
    return-void

    .line 335
    .end local v0           #theVideo:Lcom/webuid/mmVideo/entity/PlayVideo;
    .end local v10           #xid:I
    .restart local v8       #obj:Ljava/lang/Object;
    :cond_0
    check-cast v8, Ljava/lang/Integer;

    .end local v8           #obj:Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .restart local v10       #xid:I
    goto :goto_0
.end method

.method private setup()V
    .locals 3

    .prologue
    .line 601
    const-string v1, "setup"

    const-string v2, "init"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->init()V

    .line 603
    const-string v1, "setup"

    const-string v2, "init end"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    :try_start_0
    const-string v1, "setup"

    const-string v2, "prepare"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 608
    const-string v1, "setup"

    const-string v2, "prepare2"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/webuid/mmVideo/PlayActivity$11;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/PlayActivity$11;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 633
    const-string v1, "setup"

    const-string v2, "ok"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 637
    :goto_0
    return-void

    .line 634
    :catch_0
    move-exception v0

    .line 635
    .local v0, e:Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "wrong"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 19
    .parameter "savedInstanceState"

    .prologue
    .line 96
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 97
    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->requestWindowFeature(I)Z

    .line 98
    invoke-virtual/range {p0 .. p0}, Lcom/webuid/mmVideo/PlayActivity;->getWindow()Landroid/view/Window;

    move-result-object v16

    const/16 v17, 0x400

    .line 99
    const/16 v18, 0x400

    .line 98
    invoke-virtual/range {v16 .. v18}, Landroid/view/Window;->setFlags(II)V

    .line 101
    const v16, 0x7f030022

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->setContentView(I)V

    .line 103
    invoke-virtual/range {p0 .. p0}, Lcom/webuid/mmVideo/PlayActivity;->getIntent()Landroid/content/Intent;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    .line 104
    .local v9, bundle:Landroid/os/Bundle;
    const-string v16, "video_info"

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v16

    check-cast v16, Ljava/util/HashMap;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    .line 105
    invoke-direct/range {p0 .. p0}, Lcom/webuid/mmVideo/PlayActivity;->setPlayList()V

    .line 106
    const v16, 0x7f060050

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 107
    .local v14, videoName:Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    move-object/from16 v16, v0

    const-string v17, "title"

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    new-instance v16, Landroid/view/GestureDetector;

    new-instance v17, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/webuid/mmVideo/PlayActivity$TouchGestureListener;-><init>(Lcom/webuid/mmVideo/PlayActivity;Landroid/content/Context;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->gestureDetector:Landroid/view/GestureDetector;

    .line 110
    const v16, 0x7f06004e

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->topLayout:Landroid/widget/RelativeLayout;

    .line 111
    const v16, 0x7f060052

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/LinearLayout;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->rightLayout:Landroid/widget/LinearLayout;

    .line 112
    const v16, 0x7f060051

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/LinearLayout;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->bottomLayout:Landroid/widget/LinearLayout;

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->topLayout:Landroid/widget/RelativeLayout;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->rightLayout:Landroid/widget/LinearLayout;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/LinearLayout;->setVisibility(I)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->bottomLayout:Landroid/widget/LinearLayout;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 115
    new-instance v11, Landroid/util/DisplayMetrics;

    invoke-direct {v11}, Landroid/util/DisplayMetrics;-><init>()V

    .line 116
    .local v11, metric:Landroid/util/DisplayMetrics;
    invoke-virtual/range {p0 .. p0}, Lcom/webuid/mmVideo/PlayActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 117
    iget v15, v11, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 129
    .local v15, width:I
    new-instance v16, Landroid/media/MediaPlayer;

    invoke-direct/range {v16 .. v16}, Landroid/media/MediaPlayer;-><init>()V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 131
    const v16, 0x7f060046

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->playtime:Landroid/widget/TextView;

    .line 132
    const v16, 0x7f060047

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->durationTime:Landroid/widget/TextView;

    .line 133
    const v16, 0x7f06004d

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->sound:Landroid/widget/TextView;

    .line 134
    const v16, 0x7f06003f

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/view/SurfaceView;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->surfaceView:Landroid/view/SurfaceView;

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceView:Landroid/view/SurfaceView;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Landroid/view/SurfaceView;->setKeepScreenOn(Z)V

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceView:Landroid/view/SurfaceView;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 137
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    move-object/from16 v16, v0

    const/16 v17, 0x3

    invoke-interface/range {v16 .. v17}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    move-object/from16 v16, v0

    const/16 v17, 0x140

    const/16 v18, 0xf0

    invoke-interface/range {v16 .. v18}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 143
    const v16, 0x7f060045

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/SeekBar;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;

    .line 144
    new-instance v10, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v10, v0, v1}, Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;-><init>(Lcom/webuid/mmVideo/PlayActivity;Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;)V

    .line 145
    .local v10, listener:Lcom/webuid/mmVideo/PlayActivity$ButtonClickListener;
    const v16, 0x7f060049

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ImageButton;

    .line 146
    .local v12, playbutton:Landroid/widget/ImageButton;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/ImageButton;->setAlpha(I)V

    .line 148
    invoke-virtual {v12, v10}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->seekbar:Landroid/widget/SeekBar;

    move-object/from16 v16, v0

    new-instance v17, Lcom/webuid/mmVideo/PlayActivity$4;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$4;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    invoke-virtual/range {v16 .. v17}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 164
    const v16, 0x7f06004c

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/SeekBar;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;

    .line 165
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->soundBar:Landroid/widget/SeekBar;

    move-object/from16 v16, v0

    new-instance v17, Lcom/webuid/mmVideo/PlayActivity$5;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$5;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    invoke-virtual/range {v16 .. v17}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->surfaceView:Landroid/view/SurfaceView;

    move-object/from16 v16, v0

    const/16 v17, 0x8

    invoke-virtual/range {v16 .. v17}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 188
    const v16, 0x7f060054

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/ProgressBar;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->loadBar:Landroid/widget/ProgressBar;

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->loadBar:Landroid/widget/ProgressBar;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 190
    const v16, 0x7f060055

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/TextView;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->loadText:Landroid/widget/TextView;

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->loadText:Landroid/widget/TextView;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Landroid/widget/TextView;->setVisibility(I)V

    .line 194
    new-instance v3, Ljava/lang/Thread;

    new-instance v16, Lcom/webuid/mmVideo/PlayActivity$6;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$6;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 222
    .local v3, background:Ljava/lang/Thread;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    move-object/from16 v16, v0

    const-string v17, "local_file"

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->video_info:Ljava/util/HashMap;

    move-object/from16 v16, v0

    const-string v17, "local_file"

    invoke-virtual/range {v16 .. v17}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    .line 224
    const v16, 0x7f060049

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/ImageButton;

    .line 226
    .local v13, playbutton2:Landroid/widget/ImageButton;
    const v16, 0x7f020016

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 227
    invoke-direct/range {p0 .. p0}, Lcom/webuid/mmVideo/PlayActivity;->play()V

    .line 235
    .end local v13           #playbutton2:Landroid/widget/ImageButton;
    :goto_0
    new-instance v4, Ljava/lang/Thread;

    new-instance v16, Lcom/webuid/mmVideo/PlayActivity$7;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$7;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 249
    .local v4, background2:Ljava/lang/Thread;
    const v16, 0x7f060040

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageButton;

    .line 250
    .local v6, btnDown:Landroid/widget/ImageButton;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/webuid/mmVideo/PlayActivity;->downClick:Landroid/view/View$OnClickListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    const v16, 0x7f060042

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageButton;

    .line 253
    .local v7, btnFav:Landroid/widget/ImageButton;
    new-instance v16, Lcom/webuid/mmVideo/PlayActivity$8;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$8;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 263
    const v16, 0x7f060053

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageButton;

    .line 264
    .local v5, btnBack:Landroid/widget/ImageButton;
    new-instance v16, Lcom/webuid/mmVideo/PlayActivity$9;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$9;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    const v16, 0x7f06004f

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/webuid/mmVideo/PlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageButton;

    .line 274
    .local v8, btnTopBack:Landroid/widget/ImageButton;
    new-instance v16, Lcom/webuid/mmVideo/PlayActivity$10;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/webuid/mmVideo/PlayActivity$10;-><init>(Lcom/webuid/mmVideo/PlayActivity;)V

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    return-void

    .line 229
    .end local v4           #background2:Ljava/lang/Thread;
    .end local v5           #btnBack:Landroid/widget/ImageButton;
    .end local v6           #btnDown:Landroid/widget/ImageButton;
    .end local v7           #btnFav:Landroid/widget/ImageButton;
    .end local v8           #btnTopBack:Landroid/widget/ImageButton;
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 541
    const-string v0, "Play"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 543
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->releaseMediaPlayer()V

    .line 544
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->doCleanUp()V

    .line 545
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 546
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 547
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 549
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 522
    const-string v0, "Play"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 524
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 525
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/webuid/mmVideo/PlayActivity;->currentPosition:I

    .line 526
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 527
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 528
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 530
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/webuid/mmVideo/PlayActivity;->isPlay:I

    .line 533
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_1

    .line 534
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 536
    :cond_1
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 537
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 395
    invoke-super {p0, p1}, Landroid/app/Activity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 396
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 503
    const-string v0, "Play"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 505
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/PlayActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const v1, 0x2000000a

    const-string v2, "PlayActivity"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 506
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 508
    iget v0, p0, Lcom/webuid/mmVideo/PlayActivity;->isPlay:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 509
    const-string v0, "Play"

    const-string v1, "onResume-isPlay"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 511
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->play()V

    .line 517
    :cond_0
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 518
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .parameter "outState"

    .prologue
    .line 404
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 405
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 562
    const-string v0, "Play"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 564
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->releaseMediaPlayer()V

    .line 565
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->doCleanUp()V

    .line 566
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    if-eqz v0, :cond_0

    .line 567
    invoke-static {}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->releaseHelper()V

    .line 568
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->dataHelper:Lcom/webuid/mmVideo/dao/DataHelper;

    .line 570
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 708
    iget-object v0, p0, Lcom/webuid/mmVideo/PlayActivity;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 675
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .parameter "holder"

    .prologue
    .line 680
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 681
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 682
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->surfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 684
    :try_start_0
    iget-object v1, p0, Lcom/webuid/mmVideo/PlayActivity;->mediaPlayer:Landroid/media/MediaPlayer;

    iget-object v2, p0, Lcom/webuid/mmVideo/PlayActivity;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 695
    :goto_0
    invoke-direct {p0}, Lcom/webuid/mmVideo/PlayActivity;->setup()V

    .line 697
    return-void

    .line 685
    :catch_0
    move-exception v0

    .line 687
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter "holder"

    .prologue
    .line 703
    return-void
.end method

.method public toFotmat(I)Ljava/lang/String;
    .locals 4
    .parameter "num"

    .prologue
    .line 597
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
    .line 589
    div-int/lit16 p1, p1, 0x3e8

    .line 590
    div-int/lit8 v0, p1, 0x3c

    .line 592
    .local v0, minute:I
    rem-int/lit8 v1, p1, 0x3c

    .line 593
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
