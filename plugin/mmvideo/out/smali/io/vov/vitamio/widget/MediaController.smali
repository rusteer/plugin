.class public Lio/vov/vitamio/widget/MediaController;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;
    }
.end annotation


# instance fields
.field private a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

.field private b:Landroid/content/Context;

.field private c:Landroid/widget/PopupWindow;

.field private d:Landroid/view/View;

.field private e:Landroid/view/View;

.field private f:Landroid/widget/ProgressBar;

.field private g:Landroid/widget/TextView;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/TextView;

.field private k:Ljava/lang/String;

.field private l:J

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Landroid/widget/ImageButton;

.field private q:Landroid/media/AudioManager;

.field private r:Landroid/os/Handler;

.field private s:Landroid/view/View$OnClickListener;

.field private t:Landroid/widget/SeekBar$OnSeekBarChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 75
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 62
    iput-boolean v2, p0, Lio/vov/vitamio/widget/MediaController;->o:Z

    .line 231
    new-instance v0, Lio/vov/vitamio/widget/a;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/a;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    .line 312
    new-instance v0, Lio/vov/vitamio/widget/b;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/b;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->s:Landroid/view/View$OnClickListener;

    .line 337
    new-instance v0, Lio/vov/vitamio/widget/c;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/c;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->t:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 76
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->o:Z

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lio/vov/vitamio/widget/MediaController;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 78
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->o:Z

    .line 231
    new-instance v0, Lio/vov/vitamio/widget/a;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/a;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    .line 312
    new-instance v0, Lio/vov/vitamio/widget/b;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/b;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->s:Landroid/view/View$OnClickListener;

    .line 337
    new-instance v0, Lio/vov/vitamio/widget/c;

    invoke-direct {v0, p0}, Lio/vov/vitamio/widget/c;-><init>(Lio/vov/vitamio/widget/MediaController;)V

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->t:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 69
    iput-object p0, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->o:Z

    .line 71
    invoke-direct {p0, p1}, Lio/vov/vitamio/widget/MediaController;->a(Landroid/content/Context;)Z

    .line 72
    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/MediaController;)J
    .locals 7
    .parameter

    .prologue
    const-wide/16 v2, 0x0

    .line 251
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->n:Z

    if-eqz v0, :cond_2

    :cond_0
    move-wide v0, v2

    :cond_1
    :goto_0
    return-wide v0

    :cond_2
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->getCurrentPosition()J

    move-result-wide v0

    iget-object v4, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v4}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->getDuration()J

    move-result-wide v4

    iget-object v6, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    if-eqz v6, :cond_4

    cmp-long v2, v4, v2

    if-lez v2, :cond_3

    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, v0

    div-long/2addr v2, v4

    iget-object v6, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    long-to-int v2, v2

    invoke-virtual {v6, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_3
    iget-object v2, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v2}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->getBufferPercentage()I

    move-result v2

    iget-object v3, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    mul-int/lit8 v2, v2, 0xa

    invoke-virtual {v3, v2}, Landroid/widget/ProgressBar;->setSecondaryProgress(I)V

    :cond_4
    iget-object v2, p0, Lio/vov/vitamio/widget/MediaController;->g:Landroid/widget/TextView;

    if-eqz v2, :cond_5

    iget-wide v2, p0, Lio/vov/vitamio/widget/MediaController;->l:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_5

    iput-wide v4, p0, Lio/vov/vitamio/widget/MediaController;->l:J

    iget-object v2, p0, Lio/vov/vitamio/widget/MediaController;->g:Landroid/widget/TextView;

    iget-wide v3, p0, Lio/vov/vitamio/widget/MediaController;->l:J

    invoke-static {v3, v4}, Lio/vov/a/c;->a(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    iget-object v2, p0, Lio/vov/vitamio/widget/MediaController;->h:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lio/vov/vitamio/widget/MediaController;->h:Landroid/widget/TextView;

    invoke-static {v0, v1}, Lio/vov/a/c;->a(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private a()V
    .locals 2

    .prologue
    .line 181
    :try_start_0
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->canPause()Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/IncompatibleClassChangeError; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private a(Landroid/view/View;)V
    .locals 2
    .parameter

    .prologue
    .line 138
    sget v0, Lio/vov/vitamio/VR$id;->pause:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    .line 139
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->requestFocus()Z

    .line 141
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->s:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    :cond_0
    sget v0, Lio/vov/vitamio/VR$id;->mediacontroller_progress:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    .line 145
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_2

    .line 146
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    instance-of v0, v0, Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 147
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    check-cast v0, Landroid/widget/SeekBar;

    .line 148
    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->t:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 149
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 151
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 154
    :cond_2
    sget v0, Lio/vov/vitamio/VR$id;->time:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->g:Landroid/widget/TextView;

    .line 155
    sget v0, Lio/vov/vitamio/VR$id;->time_current:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->h:Landroid/widget/TextView;

    .line 156
    sget v0, Lio/vov/vitamio/VR$id;->file_name:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->i:Landroid/widget/TextView;

    .line 157
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->i:Landroid/widget/TextView;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    return-void
.end method

.method static synthetic a(Lio/vov/vitamio/widget/MediaController;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 58
    iput-boolean p1, p0, Lio/vov/vitamio/widget/MediaController;->n:Z

    return-void
.end method

.method private a(Landroid/content/Context;)Z
    .locals 2
    .parameter

    .prologue
    .line 81
    iput-object p1, p0, Lio/vov/vitamio/widget/MediaController;->b:Landroid/content/Context;

    .line 83
    :try_start_0
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->b:Landroid/content/Context;

    invoke-static {v0}, Lio/vov/vitamio/VR;->init(Landroid/content/Context;)V

    .line 84
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->b:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lio/vov/vitamio/widget/MediaController;->q:Landroid/media/AudioManager;
    :try_end_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotCompatibleException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lio/vov/vitamio/VitamioInstaller$VitamioNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 85
    const/4 v0, 0x1

    .line 93
    :goto_0
    return v0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    const-string v1, "initController"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 88
    :catch_1
    move-exception v0

    .line 89
    const-string v1, "initController"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 90
    :catch_2
    move-exception v0

    .line 91
    const-string v1, "initController"

    invoke-static {v1, v0}, Lio/vov/a/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private b()V
    .locals 2

    .prologue
    .line 320
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-nez v0, :cond_1

    .line 327
    :cond_0
    :goto_0
    return-void

    .line 323
    :cond_1
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 324
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    sget v1, Lio/vov/vitamio/VR$drawable;->pause_button:I

    invoke-static {v1}, Lio/vov/vitamio/VR;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 326
    :cond_2
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    sget v1, Lio/vov/vitamio/VR$drawable;->play_button:I

    invoke-static {v1}, Lio/vov/vitamio/VR;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method static synthetic b(Lio/vov/vitamio/widget/MediaController;)Z
    .locals 1
    .parameter

    .prologue
    .line 58
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->n:Z

    return v0
.end method

.method private c()V
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->pause()V

    .line 334
    :goto_0
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->b()V

    .line 335
    return-void

    .line 333
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v0}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->start()V

    goto :goto_0
.end method

.method static synthetic c(Lio/vov/vitamio/widget/MediaController;)Z
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    return v0
.end method

.method static synthetic d(Lio/vov/vitamio/widget/MediaController;)V
    .locals 0
    .parameter

    .prologue
    .line 319
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->b()V

    return-void
.end method

.method static synthetic e(Lio/vov/vitamio/widget/MediaController;)V
    .locals 0
    .parameter

    .prologue
    .line 329
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->c()V

    return-void
.end method

.method static synthetic f(Lio/vov/vitamio/widget/MediaController;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 231
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic g(Lio/vov/vitamio/widget/MediaController;)Landroid/media/AudioManager;
    .locals 1
    .parameter

    .prologue
    .line 65
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->q:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic h(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 54
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->j:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic i(Lio/vov/vitamio/widget/MediaController;)Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;
    .locals 1
    .parameter

    .prologue
    .line 46
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    return-object v0
.end method

.method static synthetic j(Lio/vov/vitamio/widget/MediaController;)Landroid/widget/TextView;
    .locals 1
    .parameter

    .prologue
    .line 52
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->h:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    const/16 v3, 0xbb8

    const/4 v0, 0x1

    .line 290
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .line 291
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    if-nez v2, :cond_2

    const/16 v2, 0x4f

    if-eq v1, v2, :cond_0

    const/16 v2, 0x55

    if-eq v1, v2, :cond_0

    const/16 v2, 0x3e

    if-ne v1, v2, :cond_2

    .line 292
    :cond_0
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->c()V

    .line 293
    invoke-virtual {p0, v3}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 294
    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-eqz v1, :cond_1

    .line 295
    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->requestFocus()Z

    .line 309
    :cond_1
    :goto_0
    return v0

    .line 297
    :cond_2
    const/16 v2, 0x56

    if-ne v1, v2, :cond_3

    .line 298
    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v1}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 299
    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    invoke-interface {v1}, Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;->pause()V

    .line 300
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->b()V

    goto :goto_0

    .line 303
    :cond_3
    const/4 v2, 0x4

    if-eq v1, v2, :cond_4

    const/16 v2, 0x52

    if-ne v1, v2, :cond_5

    .line 304
    :cond_4
    invoke-virtual {p0}, Lio/vov/vitamio/widget/MediaController;->hide()V

    goto :goto_0

    .line 307
    :cond_5
    invoke-virtual {p0, v3}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 309
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public hide()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 217
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->d:Landroid/view/View;

    if-nez v0, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    if-eqz v0, :cond_0

    .line 222
    :try_start_0
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 223
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :goto_1
    iput-boolean v2, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    goto :goto_0

    .line 225
    :catch_0
    move-exception v0

    const-string v0, "MediaController already removed"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lio/vov/a/b;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    .line 213
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    return v0
.end method

.method public onFinishInflate()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    invoke-direct {p0, v0}, Lio/vov/vitamio/widget/MediaController;->a(Landroid/view/View;)V

    .line 100
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter

    .prologue
    .line 278
    const/16 v0, 0xbb8

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 279
    const/4 v0, 0x1

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter

    .prologue
    .line 284
    const/16 v0, 0xbb8

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 285
    const/4 v0, 0x0

    return v0
.end method

.method public setAnchorView(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 117
    iput-object p1, p0, Lio/vov/vitamio/widget/MediaController;->d:Landroid/view/View;

    .line 118
    invoke-virtual {p0}, Lio/vov/vitamio/widget/MediaController;->removeAllViews()V

    .line 119
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    sget v1, Lio/vov/vitamio/VR$layout;->media_controller:I

    invoke-static {v1, p0}, Lio/vov/vitamio/VR;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    invoke-direct {p0, v1}, Lio/vov/vitamio/widget/MediaController;->a(Landroid/view/View;)V

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->e:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 120
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 121
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 122
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 378
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 381
    :cond_0
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1

    .line 382
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->f:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setEnabled(Z)V

    .line 383
    :cond_1
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->a()V

    .line 384
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 385
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 170
    iput-object p1, p0, Lio/vov/vitamio/widget/MediaController;->k:Ljava/lang/String;

    .line 171
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->i:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->i:Landroid/widget/TextView;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    :cond_0
    return-void
.end method

.method public setInfoView(Landroid/widget/TextView;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 176
    iput-object p1, p0, Lio/vov/vitamio/widget/MediaController;->j:Landroid/widget/TextView;

    .line 177
    return-void
.end method

.method public setMediaPlayer(Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;)V
    .locals 0
    .parameter "player"

    .prologue
    .line 161
    iput-object p1, p0, Lio/vov/vitamio/widget/MediaController;->a:Lio/vov/vitamio/widget/MediaController$MediaPlayerControl;

    .line 162
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->b()V

    .line 163
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 166
    const/16 v0, 0xbb8

    invoke-virtual {p0, v0}, Lio/vov/vitamio/widget/MediaController;->show(I)V

    .line 167
    return-void
.end method

.method public show(I)V
    .locals 5
    .parameter "timeout"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 195
    iget-boolean v0, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->d:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->p:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->requestFocus()Z

    .line 198
    :cond_0
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->a()V

    .line 200
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->c:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->d:Landroid/view/View;

    const/16 v2, 0x50

    invoke-virtual {v0, v1, v2, v4, v4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 201
    iput-boolean v3, p0, Lio/vov/vitamio/widget/MediaController;->m:Z

    .line 203
    :cond_1
    invoke-direct {p0}, Lio/vov/vitamio/widget/MediaController;->b()V

    .line 204
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 206
    if-eqz p1, :cond_2

    .line 207
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 208
    iget-object v0, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    iget-object v1, p0, Lio/vov/vitamio/widget/MediaController;->r:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 210
    :cond_2
    return-void
.end method
